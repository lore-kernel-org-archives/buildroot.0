From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jul 2016 17:15:16 -0700
Subject: [Buildroot] [PATCH v4] iperf: fix "speed" display in csv report
In-Reply-To: <1469750949-64127-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469750949-64127-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <29C3A859-14A0-4507-A116-D270E6A0BAC9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jul 28, 2016, at 5:09 PM, Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> 
> Some parameters displayed in the CSV reports are declared
> as uint64_t, but the printf format doesn't reflect this.
> 
> Submitted bug: https://sourceforge.net/p/iperf/bugs/66/
> 
> Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> 
> v1 -> v2
> [Matt W
> - Fixed Atul's signed off line
> 
> v2 -> v3
> [Khem
> - Use c99 standard PRIu64
> 
> v3 -> v4
> [Khem
> - Fix bad patch, was reversed

Looks good now

Reviewed-by: Khem Raj <raj.khem@gmail.com>


> ---
> .../0001-fix-speed-display-in-csv-report.patch     | 39 ++++++++++++++++++++++
> 1 file changed, 39 insertions(+)
> create mode 100644 package/iperf/0001-fix-speed-display-in-csv-report.patch
> 
> diff --git a/package/iperf/0001-fix-speed-display-in-csv-report.patch b/package/iperf/0001-fix-speed-display-in-csv-report.patch
> new file mode 100644
> index 0000000..b06c709
> --- /dev/null
> +++ b/package/iperf/0001-fix-speed-display-in-csv-report.patch
> @@ -0,0 +1,39 @@
> +From f035e70b72d4285dcdbd393e680777a927cb9da4 Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Thu, 28 Jul 2016 19:04:01 -0500
> +Subject: [PATCH] perf: fix "speed" display in csv report
> +
> +Some parameters displayed in the CSV reports are declared
> +as uint64_t, but the printf format doesn't reflect this.
> +
> +Submitted bug: https://sourceforge.net/p/iperf/bugs/66/
> +
> +Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
> +Signed-off-by: Atul Singh <atul.singh.mandla@gmail.com>
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +---
> + src/Locale.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Locale.c b/src/Locale.c
> +index b5d42b1..7b924fa 100644
> +--- a/src/Locale.c
> ++++ b/src/Locale.c
> +@@ -260,11 +260,12 @@ const char reportCSV_bw_format[] =
> + const char reportCSV_bw_jitter_loss_format[] =
> + "%s,%s,%d,%.1f-%.1f,%I64d,%I64d,%.3f,%d,%d,%.3f,%d\n";
> + #else
> ++#include "inttypes.h"
> + const char reportCSV_bw_format[] =
> +-"%s,%s,%d,%.1f-%.1f,%d,%d\n";
> ++"%s,%s,%d,%.1f-%.1f,%" PRId64 ",%" PRId64 "\n";
> +
> + const char reportCSV_bw_jitter_loss_format[] =
> +-"%s,%s,%d,%.1f-%.1f,%d,%d,%.3f,%d,%d,%.3f,%d\n";
> ++"%s,%s,%d,%.1f-%.1f,%" PRId64 ",%" PRId64 ",%.3f,%d,%d,%.3f,%d\n";
> + #endif //WIN32
> + #endif //HAVE_QUAD_SUPPORT
> + /* -------------------------------------------------------------------
> +--
> +1.9.1
> +
> --
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160728/5e776aa7/attachment.asc>
