Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FDFC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 549FA815CD;
	Mon,  4 Jul 2022 19:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 549FA815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ieqb0PVUkSsD; Mon,  4 Jul 2022 19:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 501B5814B3;
	Mon,  4 Jul 2022 19:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 501B5814B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 116501BF331
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 19:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8FC560B8F
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 19:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8FC560B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkigtVQMQDoQ for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 19:53:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C76BC60A88
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 19:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76BC60A88
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9BF8A822CC; Mon,  4 Jul 2022 19:40:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 4 Jul 2022 21:50:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d58c413940438262a94e8ed53a0784c53f869b2
X-Git-Newrev: bba4dad9aa8e7eb497e7f83b7722b8c10596e34e
X-Patchwork-Hint: ignore
Message-Id: <20220704194025.9BF8A822CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: strip symbols before
 signing IPA libs
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

commit: https://git.buildroot.net/buildroot/commit/?id=bba4dad9aa8e7eb497e7f83b7722b8c10596e34e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Open-Source IPA shlibs need to be signed in order to be runnable within
the same process, otherwise they are deemed Closed-Source and run in
another process and communicate over IPC.

The shlib installed on the target should be the same as the one signed
by libcamera during package creation otherwise the signature won't match
the shlib.

Buildroot sanitizes RPATH in a post build process. meson gets rid of
rpath while installing so we don't need to do it manually.

Buildroot may strip symbols, so we need to do the same before signing.

Signing the IPA shlibs is done by the meson install target, so we need
to strip the IPA shlibs, so after the build but before the install,
which a post-build hooks fits the best.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
[yann.morin.1998@free.fr: slight rewording of commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 77381ab3ca..41d6a5abef 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
 LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
 endif
 
+# Open-Source IPA shlibs need to be signed in order to be runnable within the
+# same process, otherwise they are deemed Closed-Source and run in another
+# process and communicate over IPC.
+# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
+# while installing so we don't need to do it manually here.
+# Buildroot may strip symbols, so we need to do the same before signing
+# otherwise the signature won't match the shlib on the rootfs. Since meson
+# install target is signing the shlibs, we need to strip them before.
+LIBCAMERA_STRIP_FIND_CMD = \
+	find $(@D)/build/src/ipa \
+	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
+		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
+	-type f -name 'ipa_*.so' -print0
+
+define LIBCAMERA_BUILD_STRIP_IPA_SO
+	$(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
+endef
+
+LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
