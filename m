From: Matthew Weber <matthew.weber@collins.com>
Date: Thu, 7 Jan 2021 13:37:59 -0600
Subject: [Buildroot] [PATCH 07/10] support/scripts/pkg-stats: check CPE
 existence in CPE dictionnary
In-Reply-To: <20210107133948.2997849-8-thomas.petazzoni@bootlin.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
 <20210107133948.2997849-8-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpb1HyQ=LmJNm5J2jAmNJuJuKE+_RteKAMucQMAanb-MUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gregory/Thomas,

On Thu, Jan 7, 2021 at 7:40 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> This commit extends pkg-stats to leverage the recently introduced
> CPEDB class to verify that the CPEs provided by Buildroot packages are
> indeed known in the official CPE dictionnary provided by NVD.
>
> Co-Developed-by: Gr?gory Clement <gregory.clement@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 854ece389d..2c82dc96ad 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -33,7 +33,7 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
>  sys.path.append(os.path.join(brpath, "utils"))
>  from getdeveloperlib import parse_developers  # noqa: E402
>  import cve as cvecheck  # noqa: E402
> -
> +from cpedb import CPEDB  # noqa: E402
>
>  INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
>  URL_RE = re.compile(r"\s*https?://\S*\s*$")
> @@ -226,7 +226,8 @@ class Package:
>
>          if var in self.all_cpeids:
>              self.cpeid = self.all_cpeids[var]
> -            self.status['cpe'] = ("ok", "verified CPE identifier")
> +            # Set a preliminary status, it might be overridden by check_package_cpes()
> +            self.status['cpe'] = ("warning", "not checked against CPE dictionnary")
>          else:
>              self.status['cpe'] = ("error", "no verified CPE identifier")
>
> @@ -601,6 +602,18 @@ def check_package_cves(nvd_path, packages):
>                  pkg.status['cve'] = ("ok", "not affected by CVEs")
>
>
> +def check_package_cpes(nvd_path, packages):
> +    cpedb = CPEDB(nvd_path)
> +    cpedb.get_xml_dict()
> +    for p in packages:
> +        if not p.cpeid:
> +            continue
> +        if cpedb.find(p.cpeid):
> +            p.status['cpe'] = ("ok", "verified CPE identifier")
> +        else:
> +            p.status['cpe'] = ("error", "CPE identifier unknown in CPE database")

I noticed in the pkgstats output that busybox which has an exact match
was coming up as the following.

cpe:2.3:a:busybox:busybox:1.32.0:*:*:*:*:*:*:*
CPE identifier unknown in CPE database
