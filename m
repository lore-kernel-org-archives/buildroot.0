Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E74C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 09:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF1060A52;
	Thu, 25 Jul 2024 09:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxFaBSxEAcqo; Thu, 25 Jul 2024 09:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FEE460A5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FEE460A5A;
	Thu, 25 Jul 2024 09:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 965101BF2C2
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 09:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 912564075D
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 09:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eamns27LtdrY for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 09:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84AD54072B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84AD54072B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84AD54072B
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 09:22:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3684e8220f9so339041f8f.1
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 02:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721899347; x=1722504147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1tfyw4QBW3MtzusFNps7kvJXJr9InXhpDVCpnLwfIpY=;
 b=IqEKVjdylDKK1vp4toFnPISC0YopCfG8GMlGxH0Ib3Jw/dtrlQpATPvMrAt4+c0Wj9
 2nkeOCvD2s9czUuh9AsZMKDmajVO8Kulq1ehup32pq+WCXggP0plLEFmPezdXUbZRmt/
 lWER4nWpu5mqSLkro+VjRxExtnnqUWA0W+broOutV+8CJbSluw77YOB/YBwrjO3DHnzK
 2wrN2ovHd+o0lGPCS/8pP9r7H+b0XJcxCAd9hmMEI9akXRkNVIaEeLT/nbCdL1yZf9US
 THVgKyvLZEE18oFrqyUtZmraMPVL8UP5PDr6NMXz2XoRsCkgqE//Pnsm+g0HPiLHWMj+
 hfxg==
X-Gm-Message-State: AOJu0YxilWXx3+Hs6N6XLRwFZUCKVeyTjnkWgwtcZ7FcaKYFyxb1SAES
 HLYofdarI3kVaNokuQCYQX20nYtBVLuWNr7kuJg/3AA559+Dyy7lWTqFlw==
X-Google-Smtp-Source: AGHT+IH7CX7RZnAWa71wWlGJkRK/GAB+PqZyIcXOd2RYh5io9GeHqe2XIovbGoScDKAtYXi0AwxteA==
X-Received: by 2002:a5d:4442:0:b0:35f:314a:229c with SMTP id
 ffacd0b85a97d-36b31b9bc28mr1414336f8f.28.1721899346687; 
 Thu, 25 Jul 2024 02:22:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36862516sm1486695f8f.104.2024.07.25.02.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 02:22:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 11:22:09 +0200
Message-ID: <20240725092209.1356085-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721899347; x=1722504147; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1tfyw4QBW3MtzusFNps7kvJXJr9InXhpDVCpnLwfIpY=;
 b=esr4xSvaPSUZoCNurWbJp25AsxKjPr8dFpKi0/AjOi3OrdqTYYfW1MmRTZynPPLiKg
 NaEz5mATIxDw9nEmsC04DohWWZ8iedWtU7rywugsnJZwwSOuiMzNwJ94GDIDjuVNnqqR
 h6uVhVBs+qDq33IGZAswCz+qRIa/08CbxV5MaspAS9ImxompCe93JFEcUACFt0TtI4JV
 gHAJ2svLsISkj4q2VAxIrQqZUmFSQK8MEWggekpKmq8lgg9EuZCtQoNDV5zdy9ga9ycq
 9g5I0sRqynuvZEG5LmtGOvL0MXn/LbSJoWMeU9xwBlO8tfRHzXAIhuRMiaijC53AX2pZ
 n6ig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=esr4xSva
Subject: [Buildroot] [PATCH 1/1] package/lrzsz: drop bogus
 LRZSZ_POST_CONFIGURE_HOOKS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As already done for LRZSZ_BUILD_HOOKS in commit
5fde4abc8d67ac2317b1de7a1b4cde8091f4e3c7, drop bogus
LRZSZ_POST_CONFIGURE_HOOKS as this hook added in 2010 is also never
called

Fixes: 4f3f291a3bfc1893cbfb4d9803c35a4f6752784d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lrzsz/lrzsz.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index d9be23540e..7247a4bd59 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -13,11 +13,6 @@ LRZSZ_CPE_ID_VALID = YES
 LRZSZ_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LRZSZ_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
-define LRZSZ_POST_CONFIGURE_HOOKS
-	$(SED) "s/-lnsl//;" $(@D)/src/Makefile
-	$(SED) "s~\(#define ENABLE_SYSLOG.*\)~/* \1 */~;" $(@D)/config.h
-endef
-
 define LRZSZ_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
 	$(INSTALL) -m 0755 -D $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
