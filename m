Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B244BC77B7F
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2886B428C0;
	Mon,  8 May 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2886B428C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EalJUXQIow-Z; Mon,  8 May 2023 20:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D728942897;
	Mon,  8 May 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D728942897
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E14C41BF868
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C86F760E4B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86F760E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wopxNM3qtw2 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BD7360D6B
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD7360D6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0836786241; Mon,  8 May 2023 20:52:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 22:47:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a289667f5dba6fffb3a21faa14517e9b49726a4
X-Git-Newrev: a0484b888f8d1e30590758d8a8f6730e3a2890fa
X-Patchwork-Hint: ignore
Message-Id: <20230508205243.0836786241@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: add a new option to
 install tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0484b888f8d1e30590758d8a8f6730e3a2890fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option can be used for runtime testing or package debugging.

Signed-off-by: Julien Olivain <ju.o@free.fr>
[yann.morin.1998@free.fr: tweak the comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openblas/Config.in   |  5 +++++
 package/openblas/openblas.mk | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 0144e93a3f..58976e657a 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -94,4 +94,9 @@ config BR2_PACKAGE_OPENBLAS_USE_LOCKING
 	  function calls from multiple threads, then locking is
 	  mandatory for correct operation.
 
+config BR2_PACKAGE_OPENBLAS_INSTALL_TESTS
+	bool "install tests"
+	help
+	  Install C test programs on target.
+
 endif
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index f7a50d7bc7..d8fcb4a2c6 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -77,4 +77,23 @@ define OPENBLAS_INSTALL_TARGET_CMDS
 		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
 endef
 
+ifeq ($(BR2_PACKAGE_OPENBLAS_INSTALL_TESTS),y)
+# Tests are always built, but are not installed, so we need to install
+# them manually. The set of available tests may fluctuate depending on
+# the architecture and other options, so only install whatever gets
+# built.
+define OPENBLAS_INSTALL_TESTS
+	mkdir -p $(TARGET_DIR)/usr/libexec/openblas/tests
+	find $(@D)/ctest \
+		-type f -name "x[sdcz]cblat[123]" -perm -0100 \
+		-exec $(INSTALL) -m 0755 {} \
+			$(TARGET_DIR)/usr/libexec/openblas/tests \;
+	find $(@D)/ctest \
+		-type f -name "[sdcz]in[123]" \
+		-exec $(INSTALL) -m 0644 {} \
+			$(TARGET_DIR)/usr/libexec/openblas/tests \;
+endef
+OPENBLAS_POST_INSTALL_TARGET_HOOKS += OPENBLAS_INSTALL_TESTS
+endif
+
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
