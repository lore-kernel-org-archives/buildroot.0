Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C7CCD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD5A280D2E;
	Wed,  3 Jun 2026 20:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_tcsFnYBRbU; Wed,  3 Jun 2026 20:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FF0F80F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780517736;
	bh=Dpra2xRThnFjFEIaubuZrv9bJ+hQEJE4IhwcZiBpvfQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bO6GGM1DXU/bZX1RwQLktnleuUozJhklfxOeBJuniXM7hL2lRDEw6MuhL+h2t3MFp
	 KQeAS5N3INwhDR1NizMvalisRtwdYLz1ekDVja0JKa7UIQUp1W9CibuFQY21S3+dDW
	 6PQQlqt4apD97o+RXoXTQGo9p5toCjg5WVvADJtxHjwVehzSIzm/AeJD6RsyVpXwRm
	 dFmGMVmMtIiPGASK+t9oYuDq6cubHHU0MJXefynreSEks5P3MePlNHFt2TqW4C+h5y
	 k1r+Hta3AImTTksot8mywQTmKgUsZx37IUOXcDu9OTKCZGfxAp9d2EH9xmTCuKAwPq
	 HKX+4b0hiabqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF0F80F53;
	Wed,  3 Jun 2026 20:15:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7E542F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8F75428B2
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biQ5SORGIG30 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:15:34 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=ben.wolsieffer@hefring.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF066428AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF066428AF
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF066428AF
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:15:33 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-5174a1da4b2so37397121cf.2
 for <buildroot@buildroot.org>; Wed, 03 Jun 2026 13:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780517732; x=1781122532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVjuhuZv8GftYPtklpPzH/0Bv+QLOA7Bm2emDhp19y8=;
 b=j/l/WdT2uB9i2uy6cN6dsPrQOXY0u9DwSXc79771Ux9TsBlbba7lHCSPI4dqVQZnLt
 AKQHooKVahBWsxHfDArp/cLXmrg1wSABzViEQksgbxux1vwdzI/fbMCRy/ac523VETmd
 nckxSJgZT368H0W072mlNg42Pi4rohQAIKQlxW63eIfkBDS3j+K8aVpgC2/eUEim8nO/
 tsoWmrFiU8GPpt8Tqz/mIcwv4Ee0Wmdkbe3/0NrW7N0seUbZSliFiJIBCUM4SAIF+ONn
 VPqJe2+tR3qDoBgcyPvMv2wzYX9lQa43saF73EcG8p+9Z+A9u64xVE4twdjvhKO8gCR8
 cs3Q==
X-Gm-Message-State: AOJu0YzNJxb1jBQ9rORBzsjAqeYYdwp+SeQ8m2x5/xs7jmkPfotqmtxw
 efn78cDY2EujmTGnaJS5lO9MCIf9o7Yv6s2OCIEuxiMGRydvNCUotDMdKO/Bc+/rwUdLchDRxop
 oYGih
X-Gm-Gg: Acq92OEeYzwcsvsMHnV8oA7hlaDKLNSqMBhH3if1Z4j6ICdYdezm4P4U4qftd3p1F0G
 i8Gng4Zw4IQuuOyiY4KkvrEiTgC6FMDynJX9S0q+yl/mpordPnPiu2erEzLVThDLDMC5X4B/gSv
 rGxI9pmEKHCy5BU5HN5eYs5JOu7GX0xO7iiVDlCaRVRTUB9rmrfoidf8/cXv8eN1aaXvKLOG4Cg
 3UFF1DDspM1O+N/O6pC/Y69QIMaxPdIj1KeXvg69127nxtgz9B8m8d9Bo1Og0HpHZUN2O2LRe5p
 kzM7+D14wh2ymeCJ4ERNxrOdP1K1O0JUFe0SSpOKfx6G3a/wXSV03UxQtpnppvYZC3pN1Oj0dqa
 s6EVNxKPjZhWLjdNKJZFbdlC7YBGEPPKV3f08FHI4EnWMkfjcacrl1/ORzk+a7x+p8V/6x4T7rR
 nTnyks6bENbzXF+zK9wpt8U6FeyCqh
X-Received: by 2002:a05:622a:8305:b0:517:78c7:d93a with SMTP id
 d75a77b69052e-51778c7dde3mr59477891cf.16.1780517731558; 
 Wed, 03 Jun 2026 13:15:31 -0700 (PDT)
Received: from dell-xps-15-9500 ([2601:18c:8002:3d41::5])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cecd2682f8sm29967466d6.43.2026.06.03.13.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 13:15:29 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: buildroot@buildroot.org
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Date: Wed,  3 Jun 2026 16:14:40 -0400
Message-ID: <20260603201439.3893380-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20251104.gappssmtp.com; s=20251104; t=1780517732; x=1781122532;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XVjuhuZv8GftYPtklpPzH/0Bv+QLOA7Bm2emDhp19y8=;
 b=ilq7HUYrElOTDU6zVn9shNvhz2iGTtCzCCLA5jAIU4ZyrcY7rDBvwM6rLWow4mzaXj
 vcpHjD73f/RNdP00wcmW4qrArAEwzTc02l4045rqHz4ggO5d8A6mdu8alVj9GKE467l7
 qywQXjWuOp7Ix2MHVwkVLjHOrjLJ2qB6uc9jsz/t/JSP6HzyyFejc5WSgF6LzUVWRWmf
 UiWWrs4fxTWT1DekyC5rQUmuG2iTxbqRWzyoi/KGE+f8jML66vX9mDrZoCnoFtGkAxXX
 Lq2TYgBweFic4bbrv48HQp1exw7oCHz1YsVZfyKtyce/Dzt2wXmD4kHagySui0PvTzsM
 vNcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hefring.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20251104.gappssmtp.com
 header.i=@hefring-com.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=ilq7HUYr
Subject: [Buildroot] [PATCH 1/1] package/openssh: allow installing only
 sftp-server
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

It is common to use dropbear as an SSH server while pulling in OpenSSH
sftp-server for SFTP support. Currently, this requires installing all of
sshd. Add a new BR2_PACKAGE_OPENSSH_SFTP_SERVER option to allow
installing just sftp-server. This is enabled by default by
BR2_PACKAGE_OPENSSH_SERVER to maintain backwards compatibility.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 package/openssh/Config.in  | 8 +++++++-
 package/openssh/openssh.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 25843447a7..ba1d9d1781 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -24,7 +24,13 @@ config BR2_PACKAGE_OPENSSH_SERVER
 	default y
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
-	  Server programs: sshd, sftp-server
+	  Server programs: sshd, sshd-session, sshd-auth
+
+config BR2_PACKAGE_OPENSSH_SFTP_SERVER
+	bool "SFTP server"
+	default y if BR2_PACKAGE_OPENSSH_SERVER
+	help
+	  SFTP server programs: sftp-server
 
 config BR2_PACKAGE_OPENSSH_KEY_UTILS
 	bool "key utilities"
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 8f46d886dc..1232f140d8 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -119,7 +119,6 @@ ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
 define OPENSSH_INSTALL_SERVER_PROGRAMS
 	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
 	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
-	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
 	$(INSTALL) -D -m 0755 $(@D)/sshd-auth $(TARGET_DIR)/usr/libexec/sshd-auth
 endef
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
@@ -136,6 +135,13 @@ define OPENSSH_INSTALL_INIT_SYSV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSH_SFTP_SERVER),y)
+define OPENSSH_INSTALL_SFTP_SERVER_PROGRAMS
+	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
+endef
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SFTP_SERVER_PROGRAMS
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSH_KEY_UTILS),y)
 define OPENSSH_INSTALL_KEY_UTILS
 	$(INSTALL) -D -m 0755 $(@D)/ssh-keygen $(TARGET_DIR)/usr/bin/ssh-keygen
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
