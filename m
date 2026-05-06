Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00074CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C850382BBA;
	Wed,  6 May 2026 18:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BN4fwn3BbORQ; Wed,  6 May 2026 18:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F391982BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092950;
	bh=rPNlf7i5YJJfwf1RQLSKnthtkIjhxodrNERqylKkEF4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sbwnzTcnzkn4u4XSw24hA+dVHrAg3/l2rgB+nttH7NxuOexC0igtVP40bmyKzi5f2
	 p+SA9xyIRZEsn6A9G2xosbmjNzTzfHGZVr89AxIxrXUfjHih2H4kOpUKgLEM3QrLEe
	 fu6Jf3j+HpTHwtOUAqgGiEcSJcxYfVW9T61FVzhobqfpLb8OoqNQaAWiX5sscORfi3
	 kpJhpIdl7uxz6002dguvdYfmYtRqoVewwQndsz0eyJ6IUJZhfGEIOi2iwUjPV4rsS5
	 Y/dASYnr8L/0E7/Kt+21dbVAoeIPCCquTYjyCerQTAVLo36Q1nNoZDfZLphWfY4F1t
	 HPt8RJ653x1FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F391982BBC;
	Wed,  6 May 2026 18:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DCBC317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B24582BBC
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSNxZBrXaZZU for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2BFC82BBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2BFC82BBA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2BFC82BBA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EB38BA4C20E0;
 Wed,  6 May 2026 20:41:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-0bDm;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  6 May 2026 20:40:49 +0200
Message-ID: <20260506184057.665854-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092861;
 bh=5R7U3JJJ5NAkv7AjhkEK1Znp2VeQlO3rFShOh9NN2Vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=D8c073FGxODqdGFm99YPa8hjCfVso2UIUHnVKw3ApGm0GroCJK0iBzDuuIBA2Q9tA
 2xV4gZxfUZPC2b3R7uI1tXE07P1J/av35fjXmWK4hJHudRtcg0UMz4C3+WH3mVsyHi
 +gHuK3XPRJH4t6ENCreq7YqFaEq6hEr0SsClB7haibVOPUooYfTWhMvF3wzV2iczYA
 4OEfY9h2TwtIkHelA53lV6VKAV54RlgF8YpaUfQEtzNYotBDCVa2XQFuC+MReEdOE0
 X1oURi2HG5LacK11tnH8zVflPgcr1lxa6vreeCsIdbg28ZvdvjSHYiKP/fuzMIExWV
 /DvXPVvYUA3PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=D8c073FG
Subject: [Buildroot] [PATCH 05/12] package/systemd: provides libudev
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

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Bernd: adjusted for libudev-zero]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/systemd/Config.in  | 4 ++++
 package/systemd/systemd.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 62dc3f5ad0..3d62a17b6f 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,6 +26,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_ROOTFS_MERGED_BIN
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
@@ -107,6 +108,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9ce4f8fef2..3223915d40 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -62,7 +62,7 @@ SYSTEMD_DEPENDENCIES = \
 
 SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
-SYSTEMD_PROVIDES = udev
+SYSTEMD_PROVIDES = libudev udev
 
 SYSTEMD_CONF_OPTS += \
 	-Dcreate-log-dirs=false \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
