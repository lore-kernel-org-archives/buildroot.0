From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 3 Jan 2019 14:23:18 -0600
Subject: [Buildroot] [External] [PATCH v5] support/scripts/pkg-stats:
 add latest upstream version information
In-Reply-To: <CANQCQpZHYrkUVrYUxqANd9xzicMz-9apDWYeUWYmHLqG6YA8wg@mail.gmail.com>
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
 <CANQCQpZHYrkUVrYUxqANd9xzicMz-9apDWYeUWYmHLqG6YA8wg@mail.gmail.com>
Message-ID: <CANQCQpb9UqOWSYKwSGP-8ZSwGxTJEkEEzB1ReZ3yJEDe-ykKNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
(sending this one again for patchwork to see it, my email issue should be fixed)

On Thu, Jan 3, 2019 at 1:31 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Thomas,
>
> (Sorry about the urls which got reformatted below....)
>
> On Thu, Jan 3, 2019 at 2:38 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > This commit adds fetching the latest upstream version of each package
> > from release-monitoring.org.
> >
> > The fetching process first tries to use the package mappings of the
> > "Buildroot" distribution [1]. This mapping mechanism allows to tell
> > release-monitoring.org what is the name of a package in a given
> > distribution/build-system. For example, the package xutil_util-macros
> > in Buildroot is named xorg-util-macros on release-monitoring.org. This
> > mapping can be seen in the section "Mappings" of
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__release-2Dmonitoring.org_project_15037_&d=DwIDAg&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=D29WCvvKfHr85bUA0S0PaBzfYjT7AD5mrqPNN2yGQic&s=MAudgohIjdSwVSLqKKEn3eTk1ZdF8EZZjy91fRk2RK8&e=.
> >
> > If there is no mapping, then it does a regular search, and within the
> > search results, looks for a package whose name matches the Buildroot
> > name.
> >
> > Even though fetching from release-monitoring.org is a bit slow, using
> > multiprocessing.Pool has proven to not be reliable, with some requests
> > ending up with an exception. So we keep a serialized approach, but
> > with a single HTTPSConnectionPool() for all queries. Long term, we
> > hope to be able to use a database dump of release-monitoring.org
> > instead.
> >
> > From an output point of view, the latest version column:
> >
> >  - Is green when the version in Buildroot matches the latest upstream
> >    version
> >
> >  - Is orange when the latest upstream version is unknown because the
> >    package was not found on release-monitoring.org
> >
> >  - Is red when the version in Buildroot doesn't match the latest
> >    upstream version. Note that we are not doing anything smart here:
> >    we are just testing if the strings are equal or not.
> >
> >  - The cell contains the link to the project on release-monitoring.org
> >    if found.
> >
> >  - The cell indicates if the match was done using a distro mapping, or
> >    through a regular search.
> >
> > [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__release-2Dmonitoring.org_distro_Buildroot_&d=DwIDAg&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=D29WCvvKfHr85bUA0S0PaBzfYjT7AD5mrqPNN2yGQic&s=JVlzNLvfXxrlF8HcMalzbDFkuA30zKVTfxaRyA7AVkY&e=
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> > Changes since v4:
> > - Don't use multiprocessing.Pool(), stick to a serialized approach,
> >   which is more reliable.
> > - Handle errors/exceptions properly.
> > - Improve the layout of the resulting table column.
> >
> > Changes since v3:
> > - Use Pool(), like is done for the upstream URL checking added by Matt
> >   Weber
> > - Use the requests Python module instead of the urllib2 Python module,
> >   so that we use the same module as the one used for the upstream URL
> >   checking
> > - Adjusted to work with the latest pkg-stats code
> >
> > Changes since v2:
> > - Use the "timeout" argument of urllib2.urlopen() in order to make
> >   sure that the requests terminate at some point, even if
> >   release-monitoring.org is stuck.
> > - Move a lot of the logic as methods of the Package() class.
> >
> > Changes since v1:
> > - Fix flake8 warnings
> > - Add missing newline in HTML
> > ---
> >  support/scripts/pkg-stats | 137 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 137 insertions(+)
> >
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index d0b06b1e74..d32087cda1 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -25,11 +25,19 @@ import re
> >  import subprocess
> >  import sys
> >  import requests  # URL checking
> > +import json
> > +import certifi
> > +from urllib3 import HTTPSConnectionPool
> >  from multiprocessing import Pool
> >
> >  INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
> >  URL_RE = re.compile("\s*https?://\S*\s*$")
> > +RELEASE_MONITORING_API = "https://urldefense.proofpoint.com/v2/url?u=http-3A__release-2Dmonitoring.org_api&d=DwIDAg&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=D29WCvvKfHr85bUA0S0PaBzfYjT7AD5mrqPNN2yGQic&s=8CezxghNio2dEk11Egejv806bc2Bt4Vc2IeP_l28tfM&e="
>
> This variable isn't  used in the new approach
>
> >
> > +RM_API_STATUS_ERROR = 1
> > +RM_API_STATUS_FOUND_BY_DISTRO = 2
> > +RM_API_STATUS_FOUND_BY_PATTERN = 3
> > +RM_API_STATUS_NOT_FOUND = 4
> >
> >  class Package:
> >      all_licenses = list()
> > @@ -49,6 +57,7 @@ class Package:
> >          self.url = None
> >          self.url_status = None
> >          self.url_worker = None
> > +        self.latest_version = None
> >
> >      def pkgvar(self):
> >          return self.name.upper().replace("-", "_")
> > @@ -297,6 +306,66 @@ def check_package_urls(packages):
> >      for pkg in packages:
> >          pkg.url_status = pkg.url_worker.get(timeout=3600)
> >
> > +def release_monitoring_get_latest_version_by_distro(pool, name):
> > +    try:
> > +        req = pool.request('GET', "/api/project/Buildroot/%s" % name)
> > +    except:
> > +        return (RM_API_STATUS_ERROR, None, None)
> > +
> > +    if req.status != 200:
> > +        return (RM_API_STATUS_NOT_FOUND, None, None)
> > +
> > +    data = json.loads(req.data)
> > +
> > +    if len(data['versions']) > 0:
> > +        return (RM_API_STATUS_FOUND_BY_DISTRO, data['versions'][0], data['id'])
> > +    else:
> > +        return (RM_API_STATUS_FOUND_BY_DISTRO, None, data['id'])
> > +
> > +def release_monitoring_get_latest_version_by_guess(pool, name):
> > +    try:
> > +        req = pool.request('GET', "/api/projects/?pattern=%s" % name)
> > +    except:
> > +        print("Exception release_monitoring_get_latest_version_by_guess for '%s': %s" % (name, err))
> > +        return (RM_API_STATUS_ERROR, None, None)
> > +
> > +    if req.status != 200:
> > +        return (RM_API_STATUS_NOT_FOUND, None, None)
> > +
> > +    data = json.loads(req.data)
> > +
> > +    for p in data['projects']:
> > +        if p['name'] == name and len(p['versions']) > 0:
> > +            return (RM_API_STATUS_FOUND_BY_PATTERN, p['versions'][0], p['id'])
> > +
> > +    return (RM_API_STATUS_NOT_FOUND, None, None)
> > +
> > +def check_package_latest_version(packages):
> > +    """
> > +    Fills in the .latest_version field of all Package objects
> > +
> > +    This field has a special format:
> > +      (status, version, id)
> > +    with:
> > +    - status: one of RM_API_STATUS_ERROR,
> > +      RM_API_STATUS_FOUND_BY_DISTRO, RM_API_STATUS_FOUND_BY_PATTERN,
> > +      RM_API_STATUS_NOT_FOUND
> > +    - version: string containing the latest version known by
> > +      release-monitoring.org for this package
> > +    - id: string containing the id of the project corresponding to this
> > +      package, as known by release-monitoring.org
> > +    """
> > +    pool = HTTPSConnectionPool('release-monitoring.org', port=443,
> > +                               cert_reqs='CERT_REQUIRED', ca_certs=certifi.where())
>
> Suggest adding a timeout value  (timeout=#).  I had used 30 sec for
> the url checker logic but with this being serial with one main site,
> maybe shorter would be better?
>
> I still can't get the proxy and certificate stuff to work right to
> fully test this patchset at work.  It should work fine with a "normal"
> internet connection.
>
> Functionally I can say I have reviewed the patchset with those minor
> suggestions above.
> Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
