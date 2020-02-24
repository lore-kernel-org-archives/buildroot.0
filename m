From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 24 Feb 2020 08:28:06 +0100
Subject: [Buildroot] [PATCH v3 11/12] support/scripts/pkg-stats:
 initialize all package status checks
In-Reply-To: <f7d4f63e-19ad-96b3-5b8f-a2b4391cd77d@railnova.eu>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-12-heiko.thiery@gmail.com>
 <f7d4f63e-19ad-96b3-5b8f-a2b4391cd77d@railnova.eu>
Message-ID: <CAEyMn7ZT8wHap4gUyMTLbtbHFG8gxJKSdof-+Btss9xfoSa6aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Titouan,

Am So., 23. Feb. 2020 um 15:09 Uhr schrieb Titouan Christophe
<titouan.christophe@railnova.eu>:
>
> Heiko, all,
>
> On 2/22/20 9:57 AM, Heiko Thiery wrote:
> > Also the list of status checks is added to the json output.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com> > ---
> >   support/scripts/pkg-stats | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index be3b6d7e71..ed22f6b650 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -87,6 +87,11 @@ class Package:
> >       all_license_files = dict()
> >       all_versions = dict()
> >       all_ignored_cves = dict()
> > +    # This is the list of all possible checks. Add new checks to this list so
> > +    # a tool that post-processeds the json output knows the checks before
> > +    # iterating over the packages.
> > +    status_checks = ['cve', 'developers', 'hash', 'hash-license', 'license',
> > +                     'license-files', 'patches', 'pkg-check', 'url', 'version']
> >
> >       def __init__(self, name, path):
> >           self.name = name
> > @@ -103,7 +108,15 @@ class Package:
> >           self.url_worker = None
> >           self.cves = list()
> >           self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
> > +        self.init_check_status()
> > +
> > +    def init_check_status(self):
> > +        """
> > +        Set the status of all check to 'na'.
> > +        """
> >           self.status = {}
> > +        for check in self.status_checks:
> > +            self.status[check] = ("na", "no status check done")
>
> In my opinion, it would be better to leave this dictionary empty at
> initialization.
>
> Because we know the list of status checks that have been run (from the
> 'package_status_checks' list you introduce below), we can tell that a
> particular status check has not been done if its name is missing from
> the status dictionary. This would make the outputted json a tad smaller.
>

No problem. As for the cve check this can lead to wrong status.

> >
> >       def pkgvar(self):
> >           return self.name.upper().replace("-", "_")
> > @@ -975,6 +988,7 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
> >       final = {'packages': pkgs,
> >                'stats': statistics,
> >                'defconfigs': defconfigs,
> > +             'package_status_checks': Package.status_checks,
> >                'commit': commit,
> >                'date': str(date)}
> >
> >

Thank you,
Heiko
