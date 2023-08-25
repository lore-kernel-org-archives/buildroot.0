Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81D0C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F26261460;
	Fri, 25 Aug 2023 13:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F26261460
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ri9UydxvIDL7; Fri, 25 Aug 2023 13:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84D561481;
	Fri, 25 Aug 2023 13:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D84D561481
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 231881BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F07F841E95
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F07F841E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DS4m7nUiaEs6 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2C9441E8D
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C9441E8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 902BA862F7; Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 14:54:25 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 90dbfba38503c734b251b724731ce4fc5602aeb2
X-Git-Newrev: 65714b7e8670f1b7b9821aee59f43b0c5bbff2f7
X-Patchwork-Hint: ignore
Message-Id: <20230825131243.902BA862F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/unzip: configure
 with LARGE_FILE_SUPPORT by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=65714b7e8670f1b7b9821aee59f43b0c5bbff2f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit 168e5848addda21067d3b8791e9b781847daa30f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
