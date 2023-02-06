Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70098C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 08:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1743260A65;
	Mon,  6 Feb 2023 08:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1743260A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gl80-T2BUv2l; Mon,  6 Feb 2023 08:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FBB860A62;
	Mon,  6 Feb 2023 08:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FBB860A62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1202A1BF329
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED78F60A62
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED78F60A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2o3b-kIBDpc for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 08:36:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 203E9607F0
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 08:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 203E9607F0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D5EB83950; Mon,  6 Feb 2023 08:36:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 09:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78e3637dd26766976d09e5d8286613f67975f8d6
X-Git-Newrev: bfef88762d19b2fd8f99b55cee5c9ebaf986e1c7
X-Patchwork-Hint: ignore
Message-Id: <20230206083621.0D5EB83950@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xxhash: use MOREFLAGS instead of
 overriding CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfef88762d19b2fd8f99b55cee5c9ebaf986e1c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set MOREFLAGS instead of overriding CFLAGS to avoid the following build
failure raised since commit 94b66fb49cd57d0863245fbe0a3dc0833e76aad0:

/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /tmp/ccabb8cF.o: relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/953133575d8c13266f1450fa545e70e4a518508d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xxhash/xxhash.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 40e3c2696c..75d375a2fa 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -28,8 +28,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) -DXXH_NO_INLINE_HINTS" \
-		$(XXHASH_TARGETS)
+		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
