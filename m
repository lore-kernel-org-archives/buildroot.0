From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Mar 2018 21:58:24 +0100
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
In-Reply-To: <5a961c197f405_484fb72dfc147d@ultri3.mail>
References: <20180221221342.15683-5-thomas.petazzoni@bootlin.com>
 <5a961c197f405_484fb72dfc147d@ultri3.mail>
Message-ID: <20180321215824.45a5b5bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Wed, 28 Feb 2018 00:03:53 -0300, Ricardo Martincoski wrote:

> But that would require:
> The projects in the Buildroot distro to be named exactly as the buildroot
> package, i.e. samba4, not samba. Or of course implementing the search by
> similarity with regexp.
> 
> And be aware: it produces few different guesses (some better, some worst).
> 
> Here the sample code without Queue/threading:
>     cache_latest_version_by_distro()
>     cache_latest_version_by_guess()
> 
>     for pkg in packages:
>         pkg.latest_version = get_latest_version(pkg.name)
>         print " [%04d] %s => %s" % (packages.index(pkg), pkg.name, str(pkg.latest_version))
> 
> 
> distro_list = None
> guess_list = None
> 
> 
> def cache_latest_version_by_distro():
>     global distro_list
>     req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects", "?distro=Buildroot"))
>     f = urllib2.urlopen(req)
>     distro_list = json.loads(f.read())
> 
> 
> def cache_latest_version_by_guess():
>     global guess_list
>     req = urllib2.Request(os.path.join(RELEASE_MONITORING_API, "projects"))
>     f = urllib2.urlopen(req)
>     guess_list = json.loads(f.read())
> 
> 
> def get_latest_version(package):
>     # We first try by using the "Buildroot" distribution on
>     # release-monitoring.org, if it has a mapping for the current
>     # package name.
>     for data in distro_list["projects"]:
>         if data["name"] != package:
>             continue
>         if len(data['versions']) > 0:
>             return (True, data['versions'][0], data['id'])
>         else:
>             return (True, None, data['id'])
>     # If that fails because there is no mapping, we try to search
>     # in all packages for a package of this name.
>     for p in guess_list['projects']:
>         if p['name'] == package and len(p['versions']) > 0:
>             return (False, p['versions'][0], p['id'])
>     return (False, None, None)

I looked more closely into this, and unfortunately, it doesn't work.
Indeed, the data returned by the URL:

  RELEASE_MONITORING_API/projects/?distro=Buildroot

does not take into account the mapping between Buildroot package names
and release-monitoring.org package names, it only contains the
release-monitoring.org package names.

For example, we have a mapping samba4 -> samba, that allows
https://release-monitoring.org/api/project/Buildroot/samba4 to return
the expected result. But you won't find anything named "samba4" in
https://release-monitoring.org/api/projects/?distro=Buildroot. This
makes the entire concept of distro mapping useless.

Therefore, your proposal cannot work with the data that we can
currently download from release-monitoring.org. I have asked on the
#fedora-apps IRC channel about this.

Perhaps we could go with my v2 version on this aspect (i.e make HTTP
requests for each package), and change that later on if a better
solution is found ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
