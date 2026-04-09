Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04997E9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E194101B;
	Thu,  9 Apr 2026 08:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKvF7hluFCLD; Thu,  9 Apr 2026 08:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C65D41052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724264;
	bh=mrH8HIhZZSjmhnApCznL6BBozUbgViAaLg8AEFm59TI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvE+hbZ+h5u6vjnodua1QMTbTXXnkj3YvXlcYmXbqSunR5vjFZLuINm7l6he6xLua
	 /OCqJKlbTnMCkYrvd11c4dSvGLXSzdsG+QgSNWB+3dkmN4BB2gOhnPKNrTdTPDTO2m
	 VgbWYjMPAzv/yUqOlsFK+ZT0ZehJCmO0A8+cZxjcFAqJFWndBihUcBACsm8aUAOZTC
	 8b2tOEjKcdKgVJErPlhd++wLqnGupWnEIBOZM6ZWjRTbG3cJ3g9oHob6XZSMAqX5+4
	 XDXaqvzBDHdng/vMNJvhXkrQRWGuCtmBG0Su4onIkPkzewak+sGqT6zZEUB4nLIFX4
	 nUq5OiMSuqjvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C65D41052;
	Thu,  9 Apr 2026 08:44:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB541F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC9B060D92
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id On3I-vXbsLmw for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B450660819
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B450660819
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B450660819
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60271A4C08D9;
 Thu,  9 Apr 2026 10:43:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyh-000000004SH-0BIC;
 Thu, 09 Apr 2026 08:43:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:50 +0200
Message-ID: <20260409084305.3960494-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724198;
 bh=SL8OGcegjlcjfVSHaQxYD4jcQU/rqYdRV750ccFLSxI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=oKcOuOWWQQCtZzermPlsCaCkeVASJdpEQ/UmZBRE0n35Ldep4SWM+uVhLjOCfVTmH
 wUNHH9QscjUK7Wg9izqTguxIpxJmN8RtdB1Y6iB/S2Oyfd30cLHVacm2wqg895x3gE
 9I9xUOx9GqRa0iViTYbN8axdUrOKREhDDikkUgF+NWNF9eHavB06D6Gj4ppNCd1gXn
 XZtQYrImd24eXYf3FJ7JvBra/8Ez6if9s/61b7sz1oQZkFP1pGZ8OHfmYKVPcxU9ct
 IfaPcvNq9P0dBhpFjCOKVErJjEjSN1W+Letyut1YcSfmpMhb11OSxhnLlcM+4L9OjR
 4tXhNeU+XEU0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oKcOuOWW
Subject: [Buildroot] [PATCH 06/20] package/brltty: remove optional support
 for pcre, keep pcre2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/brltty/brltty.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 4952210121..c4bbfc9a40 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -95,9 +95,6 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE2_32),y)
 BRLTTY_DEPENDENCIES += pcre2
 BRLTTY_CONF_OPTS += --with-rgx-package
-else ifeq ($(BR2_PACKAGE_PCRE_32),y)
-BRLTTY_DEPENDENCIES += pcre
-BRLTTY_CONF_OPTS += --with-rgx-package
 else
 BRLTTY_CONF_OPTS += --without-rgx-package
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
