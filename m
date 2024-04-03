Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBF4CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 15:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382B0415F8;
	Wed,  3 Apr 2024 15:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0qXlr_qrz-4; Wed,  3 Apr 2024 15:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F8BA416A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8BA416A5;
	Wed,  3 Apr 2024 15:38:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44C6E1BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3234F60EC5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 15:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ccb-3nK3j0SW for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 15:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B45560EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B45560EC4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B45560EC4
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 15:38:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95922A4C2AC2
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 17:36:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35774)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rs2fK-000000000Rn-0g1f
 for buildroot@buildroot.org; Wed, 03 Apr 2024 15:36:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 17:36:41 +0200
Message-Id: <20240403153641.4122789-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403153641.4122789-1-bernd@kuhls.net>
References: <20240403153641.4122789-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712158602;
 bh=kWn6cp96ih2wUxfkDsawGujPFk4UYa2W8bo6mVlMMlE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gcac5UPsEcswrC6F6ZHXIvwINKngnB6i73VbZqGLYIJQAzX/Th0vvkOmvBhYRvkAk
 pteo+GAX242Y4gDe8V59iQZ20HfUh5b8fllyLOvUXHbTH9Ji8cMad0MEOLTPI9dp1x
 4WaTV7BZknK+UCne8Lf5Uu30lq1Hp0EknVNzJIBqdLE0/r2vkef6diFedo4o1x1rCx
 3XJ16G9Qxk1T42+jYtk96fRL68otCNOn0Yg6yME7yvdzHb/DCkGnaBG1T0ZYfPs+AD
 TempKcwvFBk5ZEnE1NdYml8SKRpJiDvK7G4qjDADekoZExEYJzn32vs09BSmJUcYUu
 qMN+1KMtBZ8AQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Gcac5UPs
Subject: [Buildroot] [PATCH 9/9] package/sysvinit: add optional dependency
 to libxcrypt
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

As glibc's libcrypt was providing sysvinit's libcrypt dependency this
broke the sysvinit build using glibc version 2.39.

To fix this select the libxcrypt dependency to sysvinit when using a
glibc toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/3a9/3a99389bd7b6db7f9467b34c7bead1d58ce5a18d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sysvinit/Config.in   | 1 +
 package/sysvinit/sysvinit.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 7f27a70fcc..e5ca1d7f2d 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSVINIT
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INIT_SYSV
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  System V style implementation of /sbin/init, parent of all
 	  processes
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 49c92ec2ac..7f37cea131 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -18,6 +18,10 @@ SYSVINIT_DEPENDENCIES += libselinux
 SYSVINIT_MAKE_OPTS += WITH_SELINUX="yes"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SYSVINIT_DEPENDENCIES += libxcrypt
+endif
+
 define SYSVINIT_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(SYSVINIT_MAKE_OPTS) -C $(@D)/src
 endef
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
