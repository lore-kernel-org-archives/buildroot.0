Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D868C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 12:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5B9740C0C;
	Thu,  5 May 2022 12:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIZ1svicVWy9; Thu,  5 May 2022 12:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCC0040BE7;
	Thu,  5 May 2022 12:05:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A86891BF318
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 12:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95E8240BE7
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 12:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7AczLiU_EPa for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 12:05:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A219A40359
 for <buildroot@buildroot.org>; Thu,  5 May 2022 12:05:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 5E70ECDFA2
 for <buildroot@buildroot.org>; Thu,  5 May 2022 12:02:12 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 10CC440002;
 Thu,  5 May 2022 12:02:05 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 14:01:38 +0200
Message-Id: <20220505120138.493950-1-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH] package/libcamera: remove rpath and strip
 debug symbols before signing IPA libs
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Open-Source IPA shlibs need to be signed in order to be runnable within
the same process, otherwise they are deemed Closed-Source and run in
another process and communicate over IPC.
Buildroot strips debug symbols and sanitizes RPATH in a post build
process. We need to do the same before signing the IPA shlibs otherwise
the signature won't match the shlib on the rootfs.

meson gets rid of rpath while installing so we don't need to do it
manually.
However the signing process is also part of the meson install target, so
we have a chicken and the egg problem. Let's install the libs in the
target directory (and do a useless signing) to get rid of rpath, then
strip debug symbols the same way Buildroot does in post build step, then
re-sign shlibs directly in TARGET_DIR with signing script from
libcamera.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 package/libcamera/libcamera.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 77381ab3ca..d1303a2ff5 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -104,4 +104,25 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
 LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
 endif
 
+# Open-Source IPA shlibs need to be signed in order to be runnable within the
+# same process, otherwise they are deemed Closed-Source and run in another
+# process and communicate over IPC.
+# Buildroot strips debug symbols and sanitizes RPATH in a post build process. We
+# need to do the same before signing the IPA shlibs otherwise the signature
+# won't match the shlib on the rootfs.
+#
+# meson gets rid of rpath while installing so we don't need to do it manually.
+# However the signing process is also part of the meson install target, so we
+# have a chicken and the egg problem. Let's install the libs in the target
+# directory (and do a useless signing) to get rid of rpath, then strip debug
+# symbols the same way Buildroot does in post build step, then re-sign shlibs
+# directly in TARGET_DIR with signing script from libcamera.
+define LIBCAMERA_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(LIBCAMERA_NINJA_ENV) DESTDIR=$(TARGET_DIR) \
+		$(NINJA) $(NINJA_OPTS) -C $(LIBCAMERA_SRCDIR)/build install
+	find $(TARGET_DIR) -type f -name "ipa_*.so" -print0 | xargs -0 $(STRIPCMD) 2>/dev/null || true
+	MESON_INSTALL_DESTDIR_PREFIX=$(TARGET_DIR)/usr/lib/libcamera/ $(@D)/src/ipa/ipa-sign-install.sh $(@D)/build/src/ipa-priv-key.pem $(addprefix ipa_,$(addsuffix .so,$(LIBCAMERA_PIPELINES-y)))
+	MESON_INSTALL_DESTDIR_PREFIX=$(TARGET_DIR)/usr/lib64/libcamera/ $(@D)/src/ipa/ipa-sign-install.sh $(@D)/build/src/ipa-priv-key.pem $(addprefix ipa_,$(addsuffix .so,$(LIBCAMERA_PIPELINES-y)))
+endef
+
 $(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
