Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687C1E78482
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EA8A82118;
	Sun,  1 Oct 2023 18:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EA8A82118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CrihMlOmG6Yt; Sun,  1 Oct 2023 18:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47EDC820F9;
	Sun,  1 Oct 2023 18:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47EDC820F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73C791BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D8FC418A5
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D8FC418A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNesjPjX397R for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15A5F418C1
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A5F418C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04F7B83E73; Sun,  1 Oct 2023 18:46:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 20:37:45 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: cdb4d67b5bff9a1b65bd1d786623cb9219e455fe
X-Git-Newrev: 8b9251b8cc548830b27804c292eecbcfbfafe034
X-Patchwork-Hint: ignore
Message-Id: <20231001184643.04F7B83E73@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libvpx: Add
 upstream security patch to fix CVE-2023-5217
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b9251b8cc548830b27804c292eecbcfbfafe034
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes CVE_2023-5217: Heap buffer overflow in vp8 encoding in libvpx in
Google Chrome prior to 117.0.5938.132 and libvpx 1.13.1 allowed a remote
attacker to potentially exploit heap corruption via a crafted HTML page.

https://www.openwall.com/lists/oss-security/2023/09/28/5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: extend commit message, add _IGNORE_CVES]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e99999d7cb1dca94d1073fc1b2db672152cd728b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-VP8-disallow-thread-count-changes.patch   | 38 ++++++++++++++++++++++
 package/libvpx/libvpx.mk                           |  3 ++
 2 files changed, 41 insertions(+)

diff --git a/package/libvpx/0002-VP8-disallow-thread-count-changes.patch b/package/libvpx/0002-VP8-disallow-thread-count-changes.patch
new file mode 100644
index 0000000000..d625255a9f
--- /dev/null
+++ b/package/libvpx/0002-VP8-disallow-thread-count-changes.patch
@@ -0,0 +1,38 @@
+From 3fbd1dca6a4d2dad332a2110d646e4ffef36d590 Mon Sep 17 00:00:00 2001
+From: James Zern <jzern@google.com>
+Date: Mon, 25 Sep 2023 18:55:59 -0700
+Subject: [PATCH] VP8: disallow thread count changes
+
+Currently allocations are done at encoder creation time. Going from
+threaded to non-threaded would cause a crash.
+
+Bug: chromium:1486441
+Change-Id: Ie301c2a70847dff2f0daae408fbef1e4d42e73d4
+
+Fixes CVE-2023-5217: https://www.cve.org/CVERecord?id=CVE-2023-5217
+
+Upstream: https://github.com/webmproject/libvpx/commit/3fbd1dca6a4d2dad332a2110d646e4ffef36d590
+Upstream: https://chromium.googlesource.com/webm/libvpx/+/3fbd1dca6a4d2dad332a2110d646e4ffef36d590
+
+[Bernd: Removed patch for test/encode_api_test.cc]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ vp8/encoder/onyx_if.c   | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/vp8/encoder/onyx_if.c b/vp8/encoder/onyx_if.c
+index c65afc643bf..c5e9970c3cc 100644
+--- a/vp8/encoder/onyx_if.c
++++ b/vp8/encoder/onyx_if.c
+@@ -1447,6 +1447,11 @@ void vp8_change_config(VP8_COMP *cpi, VP8_CONFIG *oxcf) {
+   last_h = cpi->oxcf.Height;
+   prev_number_of_layers = cpi->oxcf.number_of_layers;
+ 
++  if (cpi->initial_width) {
++    // TODO(https://crbug.com/1486441): Allow changing thread counts; the
++    // allocation is done once in vp8_create_compressor().
++    oxcf->multi_threaded = cpi->oxcf.multi_threaded;
++  }
+   cpi->oxcf = *oxcf;
+ 
+   switch (cpi->oxcf.Mode) {
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 67b25c9100..b558c41981 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -11,6 +11,9 @@ LIBVPX_LICENSE_FILES = LICENSE PATENTS
 LIBVPX_CPE_ID_VENDOR = webmproject
 LIBVPX_INSTALL_STAGING = YES
 
+# 0002-VP8-disallow-thread-count-changes.patch
+LIBVPX_IGNORE_CVES += CVE-2023-5217
+
 # ld is being used with cc options. therefore, pretend ld is cc.
 LIBVPX_CONF_ENV = \
 	LD="$(TARGET_CC)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
