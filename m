From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 05 Nov 2020 15:55:56 +0100
Subject: [Buildroot] [PATCH 09/10] support/scripts/{pkg-stats, cve.py,
 cve-checker}: support CPE ID based matching
In-Reply-To: <20201104145145.1316167-10-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-10-thomas.petazzoni@bootlin.com>
Message-ID: <87d00r97k3.fsf@BL-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> -    def affects(self, name, version, cve_ignore_list):
> +    def affects(self, name, version, cve_ignore_list, cpeid=None):
>          """
>          True if the Buildroot Package object passed as argument is affected
>          by this CVE.
> @@ -199,8 +220,12 @@ class CVE:
>              print("Cannot parse package '%s' version '%s'" % (name, version))
>              pkg_version = None
>  
> +        # if we don't have a cpeid, build one based on name and version
> +        if not cpeid:
> +            cpeid = "cpe:2.3:*:*:%s:%s:*:*:*:*:*:*:*" % (name, version)
> +
>          for cpe in self.each_cpe():
> -            if cpe['product'] != name:
> +            if not cpe_matches(cpe['id'], cpeid):
>                  continue

Here you compare the full cpeid including the version to the cpeid
associated to the CVE. But if the CVE is about a range of version (using
versionStartIncluding for instance), then this test may file was
actually the package would be affected because the version is inside the
range of version affected.

Or maybe I missed something in this case could you point me where I am
wrong ?

Gregory

>              if not cpe['v_start'] and not cpe['v_end']:
>                  return self.CVE_AFFECTS
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 0a48cf9581..f357cbe1b6 100755

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
