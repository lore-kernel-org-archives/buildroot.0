Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C82DCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 15:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC3140806;
	Wed,  3 Apr 2024 15:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGngBOtPdyQ0; Wed,  3 Apr 2024 15:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B33F540868
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B33F540868;
	Wed,  3 Apr 2024 15:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2A21BF5A0
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3828640868
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCCYEmu_iZaT for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 15:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D8C6409F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8C6409F5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D8C6409F5
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 15:36:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59A06A4C0315
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:36:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35774)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rs2fJ-000000000Rn-2i2j
 for buildroot@buildroot.org; Wed, 03 Apr 2024 15:36:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 17:36:33 +0200
Message-Id: <20240403153641.4122789-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712158602;
 bh=dh0u/uZFC2i6XzquZ9bRZDNJt3pdgNIlD4v7QhRNbhM=;
 h=From:To:Subject:Date:From;
 b=wQQ3qwKtjAuGrvh1vWJ0Gk/WVMNuaTpP3yZgFiOhfMm5DrBAR5zc1wHE5RDLZLVQq
 PaZTi4HicZHlXdJ90zFG5BT0evlZqgLMP3997ToFIr7XmuQyDpivrCuwlBOn6F4v2Z
 vqkc5oGD/Ewtuh+yEkeXOiSEq5QN19/GKIgu2e+pFXW50kU09u192uHsxx4EfLRiTe
 7MMN6r/XJ/Su6jiKd5TMyT3rzMWIFbYhGQL7Os3NOapBYWzzHpW42/H5mSmrQOs5Pq
 txk1YZhkO9eqcpgudR1vOGEQtEicS55JxEZEo5BdxuNxmZ5OGYxSsOrsiXI0N4LpyX
 J1FT6H0XFalvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=wQQ3qwKt
Subject: [Buildroot] [PATCH 1/9] package/apg: add optional dependency to
 libxcrypt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing apg's libcrypt dependency this broke
the apg build using glibc version 2.39.

To fix this select the libxcrypt dependency to apg when using a glibc
toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/3df84ae300bb648492cffc21e4481fc5abf02aeb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apg/Config.in | 1 +
 package/apg/apg.mk    | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/apg/Config.in b/package/apg/Config.in
index 94c286a178..f54ffdba39 100644
--- a/package/apg/Config.in
+++ b/package/apg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_APG
 	bool "apg"
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Automated Password Generator (APG).
 
diff --git a/package/apg/apg.mk b/package/apg/apg.mk
index 16661f4b8d..1929e21f58 100644
--- a/package/apg/apg.mk
+++ b/package/apg/apg.mk
@@ -9,6 +9,10 @@ APG_SITE = $(call github,wilx,apg,v$(APG_VERSION))
 APG_LICENSE = BSD-3-Clause
 APG_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+APG_DEPENDENCIES += libxcrypt
+endif
+
 define APG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) FLAGS="$(TARGET_CFLAGS)" -C $(@D)
 endef
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
