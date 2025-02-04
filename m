Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9067C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80DC47085B;
	Fri, 28 Feb 2025 17:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p71ET7mLD9NB; Fri, 28 Feb 2025 17:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E3870A9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80E3870A9A;
	Fri, 28 Feb 2025 17:10:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 117DF1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A3084079C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzGmfltmq6qc for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13AFD42525
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13AFD42525
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D62C80042; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 11:56:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8af6f2eaf99c3c808742bf5154e57752b20b234a
X-Git-Newrev: dad34a1a22a3b52d3ef2f014640e5155f84db0ad
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.0D62C80042@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsigrok: install
 udev rules
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dad34a1a22a3b52d3ef2f014640e5155f84db0ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some devices that libsigrok can talk to, need a firmware to be uploaded.
libsigrok comes with a set of rules to allow non-root users to upload
those firmware blobs.

Depending on how the system is configured, different set of rules are
needed [0] (yes, it's documented on the fx2lafw page, not on the
libsigrok one [1]). Basically:

  - 60-libsigrok.rules is always used;
  - 61-libsigrok-uaccess.rules is used when systemd-logind is used;
  - 61-libsigrok-plugdev.rules is used when systemd-logind is not used.

For systems without udev, it is the responsibility of the user to
implement proper access management if they need non-root to upload
firmware files.

[0] https://sigrok.org/wiki/Fx2lafw#Install_the_udev_rules_file
[1] https://sigrok.org/wiki/Libsigrok

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrok/libsigrok.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 639ee4dc25..22524dd4f6 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -65,4 +65,20 @@ else
 LIBSIGROK_CONF_OPTS += --disable-cxx
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBSIGROK_UDEV_RULES = \
+	60-libsigrok.rules \
+	$(if $(BR2_PACKAGE_SYSTEMD_LOGIND), \
+		61-libsigrok-uaccess.rules, \
+		61-libsigrok-plugdev.rules \
+	)
+define LIBSIGROK_INSTALL_UDEV_RULES
+	$(foreach rule, $(LIBSIGROK_UDEV_RULES), \
+		$(INSTALL) -D -m 0644 $(@D)/contrib/$(rule) \
+			$(TARGET_DIR)/usr/lib/udev/rules.d/$(rule)$(sep) \
+	)
+endef
+LIBSIGROK_POST_INSTALL_TARGET_HOOKS += LIBSIGROK_INSTALL_UDEV_RULES
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
