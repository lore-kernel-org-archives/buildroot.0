From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jul 2016 16:49:55 -0700
Subject: [Buildroot] [PATCH v3] iperf: fix "speed" display in csv report
In-Reply-To: <1469749427-59937-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469749427-59937-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5AFFD809-A315-4C03-8436-F4A2900E6FB8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jul 28, 2016, at 4:43 PM, Matt Weber <matthew.weber@rockwellcollins.com> wrote:
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
> ---
> .../0001-fix-speed-display-in-csv-report.patch     | 39 ++++++++++++++++++++++
> 1 file changed, 39 insertions(+)
> create mode 100644 package/iperf/0001-fix-speed-display-in-csv-report.patch
> 
> diff --git a/package/iperf/0001-fix-speed-display-in-csv-report.patch b/package/iperf/0001-fix-speed-display-in-csv-report.patch
> new file mode 100644
> index 0000000..ea5ae99
> --- /dev/null
> +++ b/package/iperf/0001-fix-speed-display-in-csv-report.patch
> @@ -0,0 +1,39 @@
> +From b419a07ad1682b502c922330d31de118862254ad Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Thu, 28 Jul 2016 18:35:25 -0500
> +Subject: [PATCH] iperf: fix "speed" display in CSV report
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
> + src/Locale.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/Locale.c b/src/Locale.c
> +index 9f81bb4..dbcd4d4 100644
> +--- a/src/Locale.c
> ++++ b/src/Locale.c
> +@@ -260,12 +260,11 @@ const char reportCSV_bw_format[] =
> + const char reportCSV_bw_jitter_loss_format[] =
> + "%s,%s,%d,%.1f-%.1f,%I64d,%I64d,%.3f,%d,%d,%.3f,%d\n";
> + #else
> +-#include "inttypes.h"
> + const char reportCSV_bw_format[] =
> +-"%s,%s,%d,%.1f-%.1f,%" PRId64 ",%" PRId64 "\n";
> ++"%s,%s,%d,%.1f-%.1f,%d,%d\n?;

is this patch reverted ?

> +
> + const char reportCSV_bw_jitter_loss_format[] =
> +-"%s,%s,%d,%.1f-%.1f,%" PRId64 ",%" PRId64 ",%.3f,%d,%d,%.3f,%d\n";
> ++"%s,%s,%d,%.1f-%.1f,%d,%d,%.3f,%d,%d,%.3f,%d\n";
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160728/6a8d9de9/attachment.asc>
