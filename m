From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 21 Apr 2021 16:09:55 -0500
Subject: [Buildroot] [PATCH v2 2/2] support/scripts/pkg-stats: add CPE
 searching links
In-Reply-To: <20210421012009.4494-2-matthew.weber@rockwellcollins.com>
References: <20210421012009.4494-1-matthew.weber@rockwellcollins.com>
 <20210421012009.4494-2-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpZnVJ3Jj8Fp2k0xHqT0daPTettE7W5VU0rs4oBs7VCGtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 20, 2021 at 8:20 PM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> For cases of a CPE having a unknown version or when there hasn't
> been a CPE verified, proposed a search criteria to help the
> user research an update.
>
> (libcurl has NIST dict entries but not this version)
>   cpe:2.3:a:haxx:libcurl:7.76.1:*:*:*:*:*:*:*
>   CPE identifier unknown in CPE database (Search)
>
> (jitterentropy-library package doesn't have any NIST dict entries)
>   no verified CPE identifier (Search)
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> v2 - new patch
> ---
>  support/scripts/pkg-stats | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 6f3ddc561f..bc83ca5888 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -921,7 +921,13 @@ def dump_html_pkg(f, pkg):
>      if pkg.cpeid:
>          f.write("  <code>%s</code>\n" % pkg.cpeid)
>      if not pkg.is_status_ok("cpe"):
> -        f.write("  %s%s\n" % ("<br/>" if pkg.cpeid else "", pkg.status['cpe'][1]))
> +        if pkg.cpeid:
> +            f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" % \
> +                (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:4])))

Got a bug. this should be 0:5 not 0:4

Regards,
Matt
