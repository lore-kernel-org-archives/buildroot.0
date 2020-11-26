From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Nov 2020 16:32:28 +0100
Subject: [Buildroot] [PATCH 01/10] support/scripts/cve.py: properly
 match CPEs with version '*'
In-Reply-To: <20201104145145.1316167-2-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-2-thomas.petazzoni@bootlin.com>
Message-ID: <20201126163228.56250d23@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Nov 2020 15:51:35 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Currently, when the version encoded in a CPE is '-', we assume all
> versions are affected, but when it's '*' with no further range
> information, we assume no version is affected.
> 
> This doesn't make sense, so instead, we handle '*' and '-' in the same
> way. If there's no version information available in the CVE CPE ID, we
> assume all versions are affected.
> 
> This increases quite a bit the number of CVEs and package affected:
> 
> -    "total-cves": 302,
> -    "pkg-cves": 100,
> +    "total-cves": 597,
> +    "pkg-cves": 135,
> 
> For example, CVE-2007-4476 has a CPE ID of:
> 
>     cpe:2.3:a:gnu:tar:*:*:*:*:*:*:*:*
> 
> So it should be taken into account. In this specific case, it is
> combined with an AND with CPE ID
> cpe:2.3:o:suse:suse_linux:10:*:enterprise_server:*:*:*:*:* but since
> we don't support this kind of matching, we'd better be on the safe
> side, and report this CVE as affecting tar, do an analysis of the CVE
> impact, and document it in TAR_IGNORE_CVES.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/cve.py | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Since Matt gave his Reviewed-by, and it's a fairly simple patch
touching just pkg-stats/CVE, I've applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
