Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A82C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E26FD40BF1;
	Fri, 22 Jul 2022 08:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E26FD40BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHqlzE23b5UF; Fri, 22 Jul 2022 08:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF82640BEE;
	Fri, 22 Jul 2022 08:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF82640BEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E27D1BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28C0241918
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C0241918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFCueltt_fUk for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:36:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1257841903
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1257841903
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D5CED840C4; Fri, 22 Jul 2022 08:22:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:32:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e5f21808976f13c906ab24878026e1c614c70b25
X-Git-Newrev: eae44eff3d1cbe22f3b53e09b4d9c518114007e6
X-Patchwork-Hint: ignore
Message-Id: <20220722082236.D5CED840C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libcamera: strip
 symbols before signing IPA libs
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

commit: https://git.buildroot.net/buildroot/commit/?id=eae44eff3d1cbe22f3b53e09b4d9c518114007e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit bba4dad9aa8e7eb497e7f83b7722b8c10596e34e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 9cbb1910dc..6db81f1758 100644
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
