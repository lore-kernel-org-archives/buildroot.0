Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE76C5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4DF260C06;
	Wed,  4 Jun 2025 18:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqKha5rWBMr3; Wed,  4 Jun 2025 18:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 062D461517
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 062D461517;
	Wed,  4 Jun 2025 18:28:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F93EDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FC124008B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHGWNl1ADhVr for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B9CA400FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B9CA400FC
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29F40876CD; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:27:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 956024af8e81be69dd0495304e0e1901e365bddb
X-Git-Newrev: 2a5f036192bbd8dd29a61f014a355f4baa53b0c4
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.29F40876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sox: add fix for
 CVE-2021-3643 CVE-2021-23210
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a5f036192bbd8dd29a61f014a355f4baa53b0c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fix is included in Debian's sox package. The CVE is not reported
by pkg-stats because the NVD database has associated it to the
sox_project:sox vendor/product CPE. This has been reported to NVD:

  https://lore.kernel.org/buildroot/20250517220322.4da9bdb3@windsurf/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b93b80245d9aa8853d6590ca1d2bbd02b1550a54)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...dth-should-never-be-0-to-avoid-division-b.patch | 34 ++++++++++++++++++++++
 package/sox/sox.mk                                 |  5 ++++
 2 files changed, 39 insertions(+)

diff --git a/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
new file mode 100644
index 0000000000..94298b7ae5
--- /dev/null
+++ b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
@@ -0,0 +1,34 @@
+From ad8ecfbdd9ff184b60600a115247a6aa947d0215 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sat, 17 May 2025 22:10:00 +0200
+Subject: [PATCH] voc: word width should never be 0 to avoid division by zero
+
+Bug: https://sourceforge.net/p/sox/bugs/351/
+Bug-Debian: https://bugs.debian.org/1010374
+
+This patch fixes both CVE-2021-3643 and CVE-2021-23210.
+
+Upstream: https://sourceforge.net/p/sox/bugs/351/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/voc.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/voc.c b/src/voc.c
+index a75639e9..0ca07f94 100644
+--- a/src/voc.c
++++ b/src/voc.c
+@@ -625,6 +625,10 @@ static int getblock(sox_format_t * ft)
+         v->rate = new_rate_32;
+         ft->signal.rate = new_rate_32;
+         lsx_readb(ft, &uc);
++        if (uc <= 1) {
++          lsx_fail_errno(ft, SOX_EFMT, "2 bits per word required");
++          return (SOX_EOF);
++        }
+         v->size = uc;
+         lsx_readb(ft, &uc);
+         if (v->channels != -1 && uc != v->channels) {
+-- 
+2.49.0
+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index d8a0d7d1df..eba166f68b 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -59,6 +59,11 @@ SOX_IGNORE_CVES += CVE-2019-8357
 # sox-14.4.2-44-g7b6a8892
 SOX_IGNORE_CVES += CVE-2019-13590
 
+# 0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
+# This entry is NOT stale, those CVEs are not reported by pkg-stats
+# due to the change of CPE ID to sox_project:sox in the NVD database
+SOX_IGNORE_CVES += CVE-2021-3643 CVE-2021-23210
+
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
