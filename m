Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B382C433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 10:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5FC74049D;
	Fri,  6 May 2022 10:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4lUmh7zbpQ3; Fri,  6 May 2022 10:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E373D4026A;
	Fri,  6 May 2022 10:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5F211BF2C8
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 10:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E2E5813FA
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 10:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGqB8XRL22MO for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 10:47:17 +0000 (UTC)
X-Greylist: delayed 22:45:08 by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C56D813ED
 for <buildroot@buildroot.org>; Fri,  6 May 2022 10:47:16 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 925F640011;
 Fri,  6 May 2022 10:47:13 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Fri,  6 May 2022 12:46:58 +0200
Message-Id: <20220506104658.3174243-1-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Open-Source IPA shlibs need to be signed in order to be runnable within
the same process, otherwise they are deemed Closed-Source and run in
another process and communicate over IPC.

The shlib installed on the target should be the same as the one signed
by libcamera during package creation otherwise the signature won't match
the shlib.

Buildroot sanitizes RPATH in a post build process. meson gets rid of
rpath while installing so we don't need to do it manually.

Buildroot may strip symbols, so we need to do the same before signing.
Since meson install target is also signing the IPA shlibs, let's strip
them before this happens.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

v2:
 - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
 LIBCAMERA_INSTALL_TARGET_CMDS,
 - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
 shouldn't,
 - added --no-run-if-empty to xargs, in case no IPA is selected,
 - removed stderr redirect and pipe to true to not hide useful
 information or fail the build if strip does not work,

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
