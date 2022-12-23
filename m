Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62779C4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 09:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE89161139;
	Fri, 23 Dec 2022 09:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE89161139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQGVnTgMhnwz; Fri, 23 Dec 2022 09:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3503661135;
	Fri, 23 Dec 2022 09:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3503661135
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 201381BF34C
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7A8440160
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7A8440160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwQB2DeVVequ for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC0A040C2D
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC0A040C2D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB09786DD9; Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 10:35:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53f2999edfa5e67923d4d8a102c15fa3200e089c
X-Git-Newrev: 08049e9f522c0fee6ff05b7358b1f1689f4e53c0
X-Patchwork-Hint: ignore
Message-Id: <20221223093614.AB09786DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=08049e9f522c0fee6ff05b7358b1f1689f4e53c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since bump to version 1.15
in commit c31087182fa545784d9a0a01f0b32715d78c3955:

[ 79%] Linking C shared library libdeflate.so
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/12.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/12.2.0/crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/25489e5c6f0da642136e099ab35b091624f53a2b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdeflate/libdeflate.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 2305af4dc9..67e97c6e5e 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -12,4 +12,18 @@ LIBDEFLATE_INSTALL_STAGING = YES
 LIBDEFLATE_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE"
 
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=ON \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=OFF
+else ifeq ($(BR2_STATIC_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=OFF \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBDEFLATE_CONF_OPTS += \
+	-DLIBDEFLATE_BUILD_SHARED_LIB=ON \
+	-DLIBDEFLATE_BUILD_STATIC_LIB=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
