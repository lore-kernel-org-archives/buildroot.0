From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Jul 2020 11:00:22 +0200
Subject: [Buildroot] [PATCH 7/9] support/script/pkg-stats: Manage the
 CVEs that need to be check
In-Reply-To: <20200708164006.859021-8-gregory.clement@bootlin.com>
References: <20200708164006.859021-1-gregory.clement@bootlin.com>
 <20200708164006.859021-8-gregory.clement@bootlin.com>
Message-ID: <20200709110022.0e79ff9b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Jul 2020 18:40:04 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 883a5bd2be..e033e15e07 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -106,9 +106,11 @@ class Package:
>          self.patch_files = []
>          self.warnings = 0
>          self.current_version = None
> +        self.unknown_cve = False

Is this used in your patch ? I don't see it used anywhere.

>          self.url = None
>          self.url_worker = None
>          self.cves = list()
> +        self.cves_to_check = list()
>          self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
>          self.status = {}
>  
> @@ -504,7 +506,12 @@ def check_package_cves(nvd_path, packages):
>          for pkg_name in cve.pkg_names:
>              if pkg_name in packages:
>                  pkg = packages[pkg_name]
> -                if cve.affects(pkg.name, pkg.current_version, pkg.cve_ignored_list()):
> +                affected = cve.affects(pkg.name, pkg.current_version, pkg.cve_ignored_list())
> +                print(affected)

This is a debug message, probably not meant to be in your final patch.

> +                if (affected == 'Unknown'):
> +                    pkg.cves_to_check.append(cve.identifier)

So this handling of the "Unknown" return value from cve.affects()
should be done together with the change in cve.affects() I guess.

> +                elif affected == True:
> +                    print(cve.identifier)

Again another print, should it really be here ?

>                      pkg.cves.append(cve.identifier)
>  
>  def calculate_stats(packages):
> @@ -544,8 +551,11 @@ def calculate_stats(packages):
>              stats["version-not-uptodate"] += 1
>          stats["patches"] += pkg.patch_count
>          stats["total-cves"] += len(pkg.cves)
> +        stats["total-cves-to-check"] += len(pkg.cves_to_check)
>          if len(pkg.cves) != 0:
>              stats["pkg-cves"] += 1
> +        if len(pkg.cves_to_check) != 0:
> +            stats["pkg-cves_to_check"] += 1
>      return stats
>  
>  
> @@ -763,11 +773,22 @@ def dump_html_pkg(f, pkg):
>          td_class.append("correct")
>      else:
>          td_class.append("wrong")
> -    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
> +        f.write("  <td class=\"%s\">\n" % " ".join(td_class))

Spurious change here.

>      for cve in pkg.cves:
>          f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
>      f.write("  </td>\n")
>  
> +    # CVEs to check
> +    td_class = ["centered"]
> +    if len(pkg.cves_to_check) == 0:
> +        td_class.append("correct")
> +    else:
> +        td_class.append("wrong")
> +        f.write("  <td class=\"%s\">\n" % " ".join(td_class))

so you're opening the <td> only in the else case

> +    for cve in pkg.cves_to_check:
> +        f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
> +    f.write("  </td>\n")

but closing it in both cases. Doesn't look good.

Also, if you're adding a column, you need to update the column header
as well, to give a title to this column.

> +

So you've added that to the HTML output. Has the JSON output also been
updated? Or perhaps it just works due to how the JSON output is
generated?

>      f.write(" </tr>\n")
>  
>  
> @@ -786,6 +807,7 @@ def dump_html_all_pkgs(f, packages):
>  <td class=\"centered\">Warnings</td>
>  <td class=\"centered\">Upstream URL</td>
>  <td class=\"centered\">CVEs</td>
> +<td class=\"centered\">CVEs to check</td>
>  </tr>
>  """)
>      for pkg in sorted(packages):
> @@ -824,10 +846,14 @@ def dump_html_stats(f, stats):
>              stats["version-not-uptodate"])
>      f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>\n" %
>              stats["version-unknown"])
> -    f.write("<tr><td>Packages affected by CVEs</td><td>%s</td></tr>\n" %
> +    f.write("<tr><td>Packages might affected by CVEs, where version needed to be checked</td><td>%s</td></tr>\n" %

"Packages might affected by CVEs" is not correct English I believe.
"Packages that might be affected by CVEs" sounds better.

"needed" -> "needs"

>              stats["pkg-cves"])
> -    f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
> +    f.write("<tr><td>Total number of CVEs that might affect all packages, where version needed to be checked</td><td>%s</td></tr>\n" %

version needed -> version needs

>              stats["total-cves"])
> +    f.write("<tr><td>Packages affected by CVEs</td><td>%s</td></tr>\n" %
> +            stats["pkg-cves_to_check"])
> +    f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
> +            stats["total-cves_to_check"])
>      f.write("</table>\n")
>  
>  

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
