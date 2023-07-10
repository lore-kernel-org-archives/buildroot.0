Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD33CC0015E
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8246B40B91;
	Mon, 10 Jul 2023 20:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8246B40B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRbQfxdb2ek7; Mon, 10 Jul 2023 20:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1CE740B98;
	Mon, 10 Jul 2023 20:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1CE740B98
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F389F1BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7FA98203F
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7FA98203F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsM0Foz4XpNH for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:00:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90F3F82051
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F3F82051
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79B4386CE4; Mon, 10 Jul 2023 20:00:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 21:58:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 794b9e993273fbaa4e814f9a4b3e62c633d8d117
X-Git-Newrev: 168e5848addda21067d3b8791e9b781847daa30f
X-Patchwork-Hint: ignore
Message-Id: <20230710200005.79B4386CE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unzip: configure with
 LARGE_FILE_SUPPORT by default
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=168e5848addda21067d3b8791e9b781847daa30f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot always enable largefile support in the toolchain, and thus
the associated definitions are always on. This leads to a problem in
unzip that on a 32-bit arch with these flags being passed in

   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64

but the LARGE_FILE_SUPPORT define not being set will cause a size
mismatch on the comparison of the zipfiles:

    $ unzip test.zip
    Archive: test.zip
    error: invalid zip file with overlapped components (possible zip bomb)

The simple solution is just enable LARGE_FILE_SUPPORT to enable large
file support. In order to avoid redefinition warnings, we undefine
_LARGEFILE_SOURCE and _LARGEFILE64_SOURCE.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unzip/unzip.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 44cc2013fb..14ccedd48f 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -28,4 +28,18 @@ UNZIP_IGNORE_CVES = \
 	CVE-2022-0529 \
 	CVE-2022-0530
 
+# unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
+# necessary, redefining it on the command line causes some warnings.
+UNZIP_TARGET_CFLAGS = \
+	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
+
+# unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
+# necessary, redefining it on the command line causes some warnings.
+UNZIP_TARGET_CXXFLAGS = \
+	$(filter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE,$(TARGET_CXXFLAGS))
+
+UNZIP_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(UNZIP_TARGET_CFLAGS) -DLARGE_FILE_SUPPORT" \
+	-DCMAKE_CXX_FLAGS="$(UNZIP_TARGET_CXXFLAGS) -DLARGE_FILE_SUPPORT"
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
