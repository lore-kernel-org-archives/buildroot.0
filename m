From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jul 2016 10:46:44 -0700
Subject: [Buildroot] [PATCH v2] iperf: fix "speed" display in CSV report
In-Reply-To: <1469725165-18180-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469725165-18180-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <037EF233-5A06-45DC-A231-55ED9B186CD9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jul 28, 2016, at 9:59 AM, Matt Weber <matthew.weber@rockwellcollins.com> wrote:
> 
> From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> 
> Some parameters displayed in the CSV reports are declared
> as uint64_t, but the printf format doesn't reflect this.
> 
> Submitted bug: https://sourceforge.net/p/iperf/bugs/66/
> 
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
> ---
> 
> v1 -> v2
> [Matt W
> - Fixed Atul's signed off line
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> .../0001-fix-speed-display-in-csv-report.patch     | 36 ++++++++++++++++++++++
> 1 file changed, 36 insertions(+)
> create mode 100644 package/iperf/0001-fix-speed-display-in-csv-report.patch
> 
> diff --git a/package/iperf/0001-fix-speed-display-in-csv-report.patch b/package/iperf/0001-fix-speed-display-in-csv-report.patch
> new file mode 100644
> index 0000000..27d89bf
> --- /dev/null
> +++ b/package/iperf/0001-fix-speed-display-in-csv-report.patch
> @@ -0,0 +1,36 @@
> +From 36c098a4fec0fdcb7c3df4909322f88b07bd6b01 Mon Sep 17 00:00:00 2001
> +From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> +Date: Wed, 27 Jul 2016 07:36:34 -0500
> +Subject: [PATCH] iperf: Fix "speed" display in CSV report
> +
> +Some parameters displayed in the CSV reports are declared
> +as uint64_t, but the printf format doesn't reflect this.
> +
> +Bugtracker: https://sourceforge.net/p/iperf/bugs/66/
> +
> +Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> +
> +---
> + src/Locale.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Locale.c b/src/Locale.c
> +index b5d42b1..d80a77a 100644
> +--- a/src/Locale.c
> ++++ b/src/Locale.c
> +@@ -261,10 +261,10 @@ const char reportCSV_bw_jitter_loss_format[] =
> + "%s,%s,%d,%.1f-%.1f,%I64d,%I64d,%.3f,%d,%d,%.3f,%d\n";
> + #else
> + const char reportCSV_bw_format[] =
> +-"%s,%s,%d,%.1f-%.1f,%d,%d\n";
> ++"%s,%s,%d,%.1f-%.1f,%lld,%lld\n?;

c99 says if you are printing uint64_t then its portable to use PRIu64 e.g.

uint64_t a_int64
printf("%" PRId64 "\n?, a_int64);


> +
> + const char reportCSV_bw_jitter_loss_format[] =
> +-"%s,%s,%d,%.1f-%.1f,%d,%d,%.3f,%d,%d,%.3f,%d\n";
> ++"%s,%s,%d,%.1f-%.1f,%lld,%lld,%.3f,%d,%d,%.3f,%d\n";
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160728/1240c424/attachment.asc>
