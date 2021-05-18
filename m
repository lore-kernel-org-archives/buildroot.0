From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 22:16:49 +0200
Subject: [Buildroot] [PATCH 3/3] support/scripts/pkg-stats: clarify when
 a CVE/CPE should report as N/A
In-Reply-To: <20210518182155.47055-3-matthew.weber@collins.com>
References: <20210518182155.47055-1-matthew.weber@collins.com>
 <20210518182155.47055-3-matthew.weber@collins.com>
Message-ID: <20210518201649.GY2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-05-18 13:21 -0500, Matthew Weber via buildroot spake thusly:
>  - If a package doesn't have any versioning, ignore and state that
>  - If a package is virtual, CVE=ignore and CPE state virtual
>  - For any of these NA cases, don't provide search link
> 
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>

Honestly, I get quickly lost in the coe of pkg-stats...

However, with this series applied, the cells for CVE and CPE for virtual
packages are not green, suggesting this is abnormal. However, this is
perfectly fine :the re are no CVE and no CPE for virtual packages, so
they should be green.

I managed to do that by adding the following on-top of this third patch:

    diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
    index 3aaf1169cb..d06778ab05 100755
    --- a/support/scripts/pkg-stats
    +++ b/support/scripts/pkg-stats
    @@ -910,6 +910,8 @@ def dump_html_pkg(f, pkg):
         td_class = ["centered"]
         if pkg.is_status_ok("cve"):
             td_class.append("cve-ok")
    +    elif pkg.is_status_na("cve") and not pkg.is_actual_package:
    +        td_class.append("cve-ok")
         elif pkg.is_status_error("cve"):
             td_class.append("cve-nok")
         else:
    @@ -937,6 +939,8 @@ def dump_html_pkg(f, pkg):
         td_class = ["left"]
         if pkg.is_status_ok("cpe"):
             td_class.append("cpe-ok")
    +    elif pkg.is_status_na("cpe") and not pkg.is_actual_package:
    +        td_class.append("cpe-ok")
         elif pkg.is_status_error("cpe"):
             td_class.append("cpe-nok")
         else:

But I am not usre this is the best solution... So, I've not applied
patches 2 and 3 in the series. Could you please respin with the above
(if it's OK for you, or with a better solution), please?

Additionally, as a further refinement, packages that have no version,
like urandom-scripts, makedevs, etc... are usually bundled with
Buildroot. Do you think for those we should:

 1. declare 'buildroot' to NVD, as the 'buildroot_project' vendor and
    the 'buildroot' product, as well as 'makedevs', 'urandom-scripts' et
    al. as products,

 2. add "MAKEDEVS_CPE_VENDOR = buildroot_project" to each of those
    bundled packages.

Thoughts?

Regards,
Yann E. MORIN.

> ---
>  support/scripts/pkg-stats | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index ca55a301de..3aaf1169cb 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -229,7 +229,10 @@ class Package:
>          """
>          var = self.pkgvar()
>          if not self.is_actual_package:
> -            self.status['cpe'] = ("na", "no valid package infra")
> +            self.status['cpe'] = ("na", "N/A - virtual pkg")
> +            return
> +        if not self.current_version:
> +            self.status['cpe'] = ("na", "no version information available")
>              return
>  
>          if var in self.all_cpeids:
> @@ -587,7 +590,7 @@ def check_package_cves(nvd_path, packages):
>      cpe_product_pkgs = defaultdict(list)
>      for pkg in packages:
>          if not pkg.is_actual_package:
> -            pkg.status['cve'] = ("na", "no valid package infra")
> +            pkg.status['cve'] = ("na", "N/A")
>              continue
>          if not pkg.current_version:
>              pkg.status['cve'] = ("na", "no version information available")
> @@ -942,12 +945,15 @@ def dump_html_pkg(f, pkg):
>      if pkg.cpeid:
>          f.write("  <code>%s</code>\n" % pkg.cpeid)
>      if not pkg.is_status_ok("cpe"):
> -        if pkg.cpeid:
> -            f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
> -                    (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
> +        if pkg.is_actual_package and pkg.current_version:
> +            if pkg.cpeid:
> +                f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
> +                        (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
> +            else:
> +                f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
> +                        (pkg.status['cpe'][1], pkg.name))
>          else:
> -            f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %
> -                    (pkg.status['cpe'][1], pkg.name))
> +            f.write("  %s\n" % pkg.status['cpe'][1])
>  
>      f.write("  </td>\n")
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
