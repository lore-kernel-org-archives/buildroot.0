Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3339EE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 21:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBFED607BC;
	Fri,  6 Dec 2024 21:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFoPwpuyw_iK; Fri,  6 Dec 2024 21:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA6DF6073C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA6DF6073C;
	Fri,  6 Dec 2024 21:31:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F4B7ED8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CA4F40598
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBqRV59-RfIo for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 21:31:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58FA14055A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58FA14055A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58FA14055A
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:40 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:bca7:77f2:7ee8:6a7a])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 497D8780372;
 Fri,  6 Dec 2024 22:31:33 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Fri,  6 Dec 2024 22:30:02 +0100
Message-ID: <20241206213002.24669-3-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241206213002.24669-1-vjardin@free.fr>
References: <CADwxmT=HZU4=zEneby_NjqVhz6hbBzRHJ8xAqR2O4g0vZsw3Hg@mail.gmail.com>
 <20241206213002.24669-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733520698;
 bh=LdRJJFklqAMsMsbseLOEoeIMoPuz5DZU7TopyprefnI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KV/HTN4LfKRO6rneobZkbPhtYoWW9dRVs8mW+TPoYrmEl02LNBJcguNM+2gLvL/V6
 auEgOv8AJ1adeh+glB7VRNPuenoPMMlNrmsvGIg/VzQBpLU3yllCw2jmIwfU+RBFid
 Qq8uyl6ey4eq1LNe+ePgxtuh4i1viIapRW9ORY/OVAEQ+UuemAvcVNR8mzCMi8hQ/I
 MKEU9z2oW0hAM0sbjZ+KcRRPtZY3qZK54WX5qsbwEWvxRnngdycrBggm2vKuy1cAbA
 h6jNyMGD0D7IiC+uZZcEFKlYFXGO8VgA6TyIBJtlqujIzey+jNPsBrPRmWIVOtFvSt
 MIvszbQvWDMnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KV/HTN4L
Subject: [Buildroot] [PATCH v5 2/2] doc/manual/adding-packages-meson.adoc:
 tags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Described the usage of FOO_MESON_INSTALL_TAGS=YES which decreases
the footprint of the target since only the runtime will be installed.
All the other development header files or libraries will be installed
into the staging folder.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Suggested-by: Brandon Maier <brandon.maier@gmail.com>
---
 docs/manual/adding-packages-meson.adoc | 5 +++++
 package/pkg-meson.mk                   | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-meson.adoc b/docs/manual/adding-packages-meson.adoc
index 01891e03cc..b7c987ddd1 100644
--- a/docs/manual/adding-packages-meson.adoc
+++ b/docs/manual/adding-packages-meson.adoc
@@ -124,6 +124,11 @@ will therefore only use a few of them.
   +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
   +pkg_config_libdir+.
 
+* +FOO_MESON_INSTALL_TAGS+, can be set to +YES+ to enable meson's `--runtime` and
+  `--devel` installation modes for the target and staging folders, respectively.
+  This configuration is necessary to prevent meson from installing development
+  artifacts into the target folder.
+
 * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
   +ninja+, meson companion tool in charge of the build operations. By default,
   empty.
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 4568f8690e..a4e77cde42 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -235,7 +235,7 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
 		$$(MESON) install -C \
-		  $$($$(PKG)_SRCDIR)/build $(if $(filter YES,$($(2)_MESON_INSTALL_TAGS)),--tags=runtime$(comma)devel)
+		  $$($$(PKG)_SRCDIR)/build $$(if $$(filter YES,$$($$(PKG)_MESON_INSTALL_TAGS)),--tags=runtime$(comma)devel)
 endef
 endif
 
@@ -247,7 +247,7 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
 		$$(MESON) install -C \
-		  $$($$(PKG)_SRCDIR)/build $(if $(filter YES,$($(2)_MESON_INSTALL_TAGS)),--tags=runtime)
+		  $$($$(PKG)_SRCDIR)/build $$(if $$(filter YES,$$($$(PKG)_MESON_INSTALL_TAGS)),--tags=runtime)
 endef
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
