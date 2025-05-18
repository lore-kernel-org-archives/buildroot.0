Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886D4C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 587FF40C65;
	Sun, 18 May 2025 12:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlUR3EfAeiJu; Sun, 18 May 2025 12:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F3240C32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F3240C32;
	Sun, 18 May 2025 12:17:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D786C1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEC4140C27
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pS0u-UWrFJd3 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:16:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E975140D7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E975140D7C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E23E786879; Sun, 18 May 2025 12:16:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14aa0f5ec143eeb8a96160b5538945eedd801da1
X-Git-Newrev: 1c1ee69fa7ba55b3eefa5d5a326abb0c13220aae
X-Patchwork-Hint: ignore
Message-Id: <20250518121639.E23E786879@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sox: add fix for CVE-2021-40426
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c1ee69fa7ba55b3eefa5d5a326abb0c13220aae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch comes from Debian. The CVEs are not reported by pkg-stats
because the NVD database has associated it to the
libsox_project:libsox vendor/product CPE. This has been reported to
NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../sox/0008-phere-avoid-integer-underflow.patch   | 42 ++++++++++++++++++++++
 package/sox/sox.mk                                 |  5 +++
 2 files changed, 47 insertions(+)

diff --git a/package/sox/0008-phere-avoid-integer-underflow.patch b/package/sox/0008-phere-avoid-integer-underflow.patch
new file mode 100644
index 0000000000..7c59896660
--- /dev/null
+++ b/package/sox/0008-phere-avoid-integer-underflow.patch
@@ -0,0 +1,42 @@
+From c49c81a3c4409e7c1979ec8cb341fb0c57220616 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 22:48:05 +0200
+Subject: [PATCH] phere: avoid integer underflow
+
+Link: https://talosintelligence.com/vulnerability_reports/TALOS-2021-1434
+Bug: https://sourceforge.net/p/sox/bugs/362/
+Bug-Debian: https://bugs.debian.org/1012138
+
+Upstream: https://sourceforge.net/p/sox/bugs/362/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/sphere.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/sphere.c b/src/sphere.c
+index a3fd1c64..9544d160 100644
+--- a/src/sphere.c
++++ b/src/sphere.c
+@@ -63,7 +63,8 @@ static int start_read(sox_format_t * ft)
+     return (SOX_EOF);
+   }
+ 
+-  header_size -= (strlen(buf) + 1);
++  bytes_read = strlen(buf);
++  header_size -= bytes_read >= header_size ? header_size : bytes_read + 1;
+ 
+   while (strncmp(buf, "end_head", (size_t)8) != 0) {
+     if (strncmp(buf, "sample_n_bytes", (size_t)14) == 0)
+@@ -105,7 +106,8 @@ static int start_read(sox_format_t * ft)
+       return (SOX_EOF);
+     }
+ 
+-    header_size -= (strlen(buf) + 1);
++    bytes_read = strlen(buf);
++    header_size -= bytes_read >= header_size ? header_size : bytes_read + 1;
+   }
+ 
+   if (!bytes_per_sample)
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 6ce9ed3508..384d012763 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -69,6 +69,11 @@ SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
 # due to the change of CPE ID to sox_project:sox in the NVD database
 SOX_IGNORE_CVES += CVE-2021-23159 CVE-2021-23172 CVE-2023-34318
 
+# 0008-phere-avoid-integer-underflow.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to libsox_project:libsox in the NVD database
+SOX_IGNORE_CVES += CVE-2021-40426
+
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
