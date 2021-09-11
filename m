Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313CCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:49:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0C1B60FDC
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0C1B60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7BA880EF3;
	Sat, 11 Sep 2021 19:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ktfc5AlujNyo; Sat, 11 Sep 2021 19:49:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D0AE80ECD;
	Sat, 11 Sep 2021 19:49:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEA281BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB94E80ECD
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNlf4fOpEcsP for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:49:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A65A80E9F
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 70857890FD; Sat, 11 Sep 2021 19:47:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 21:31:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70bad61b53c50801fc916f78194c0c4ded1bb6b6
X-Git-Newrev: 22d65321ece2bc8a0f9928d0ec1a5911d62ada30
X-Patchwork-Hint: ignore
Message-Id: <20210911194747.70857890FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: Add
 QEMU_USERMODE_ARGS support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22d65321ece2bc8a0f9928d0ec1a5911d62ada30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the qemu package has the BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS string,
the gobject-introspection g-ir-scanner-qemuwrapper script can pass that string
to qemu.

Add the QEMU_USERMODE_ARGS to g-ir-scanner-qemuwrapper.in and unconditionally
sed @QEMU_USERMODE_ARGS@ with BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS.

Fixes:
http://autobuild.buildroot.org/results/2e9dbc0d36600c09fa9e59ab1b1903c9f40661e8

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Arnout: don't add QEMU_USERMODE_ARGS variable to shell script]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gobject-introspection/g-ir-scanner-qemuwrapper.in | 1 +
 package/gobject-introspection/gobject-introspection.mk    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
index 85f0750b4d..9786feea40 100644
--- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
@@ -8,6 +8,7 @@ GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname
 # which may then get deleted (or their dependencies) and potentially segfault
 GIO_MODULE_DIR="$(dirname "$0")/../lib/gio/modules-dummy" \
 @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
+    @QEMU_USERMODE_ARGS@ \
     -L "$(dirname "$0")/../../" \
     -E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
     "$@"
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index f34dca7278..6a3d321cc7 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -84,6 +84,8 @@ define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
 	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
+	$(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
+		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
 	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
