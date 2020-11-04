From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 4 Nov 2020 11:20:19 -0600
Subject: [Buildroot] [PATCH 07/10] support/scripts/cve-checker: show CPE
 ID in results
In-Reply-To: <20201104145145.1316167-8-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-8-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpbcP4P=2WiLSuFTBHS=teA5nK0RU65wHnqey9gWMG=QNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas / Greg,

On Wed, Nov 4, 2020 at 8:52 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> From: Gregory CLEMENT <gregory.clement@bootlin.com>
>
> This commit improves the cve-checker script to show the CPE ID of
> packages, if available. For now, it doesn't use CPE IDs to match CVEs.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/cve-checker | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
> index ff110fc17c..421202d049 100755
> --- a/support/scripts/cve-checker
> +++ b/support/scripts/cve-checker
> @@ -26,9 +26,10 @@ import cve as cvecheck
>
>
>  class Package:
> -    def __init__(self, name, version, ignored_cves):
> +    def __init__(self, name, version, cpeid, ignored_cves):
>          self.name = name
>          self.version = version
> +        self.cpeid = cpeid
>          self.cves = list()
>          self.ignored_cves = ignored_cves
>
> @@ -106,6 +107,19 @@ def dump_html_pkg(f, pkg):
>          f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
>      f.write("  </td>\n")
>
> +    # CPE ID
> +    td_class = ["left"]
> +    if pkg.cpeid:
> +        td_class.append("correct")
> +    else:
> +        td_class.append("wrong")
> +    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
> +    if pkg.cpeid:
> +        f.write("  <code>%s</code>\n" % pkg.cpeid)
> +    else:
> +        f.write("  N/A\n")
> +    f.write("  </td>\n")
> +


Similar question as in the pkgstats about including host package CPE
IDs in the listing.
