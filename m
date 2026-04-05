Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6240E64014
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 07:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D83F40BC1;
	Sun,  5 Apr 2026 07:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGkPFfWUv07S; Sun,  5 Apr 2026 07:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1845440BA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775374233;
	bh=6e9lCZ529md4CPfUdH7kXWfn2lZa+9pJX60GTIUxTNY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mdl7whwAHA7eLzUUcrOOUxNVGaIFx8G7S9cTi9G+GzzqZ2bFJ+TXCQtZVEmprB4U9
	 cd2piw6zkY1vHCcorsp+LwrBXRAtN7QNPr6ui4ZktYb/7WSdw2sbgf5rE6uv4/Y55e
	 JSb1EhxOrI9avVbxuoO2QnvNzDgSC/hDtoJF6zTkYVf+p5fUDyFx22gXxJYMCPe/ne
	 n0ZaUVtuuqOZ13yuQRQIaJuLaLfhURz2m38bUpGvTlA5gv/EWxorfWSInvxFmNJYze
	 gejm90LQk0DIFnH4QflkfkKkB1zhxRoDvxQzihHo98C+BMASI4UQcikHGTMjUGnFbn
	 X0A0k1pfsqLIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1845440BA1;
	Sun,  5 Apr 2026 07:30:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 874551EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 07:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6022C811E0
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 07:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-LxPwmr92HG for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 07:30:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0769811BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0769811BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0769811BC
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 07:30:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 438B8A4C09C3;
 Sun,  5 Apr 2026 09:30:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58606)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9Hw9-000000007fS-2WVT;
 Sun, 05 Apr 2026 07:30:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>
Date: Sun,  5 Apr 2026 09:30:25 +0200
Message-ID: <20260405073025.13295-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775374226;
 bh=GyLSRAg5BqHrO9PjfcB71v7PffA2sfrkrBg49hO1fa4=;
 h=From:To:Cc:Subject:Date:From;
 b=QByHzKaLGA7vftQR8jxy9cBCEjTGbZd3ynpdAhdbuWwMJ7Dd3jr1MYZVH3nyOa5uO
 xve6rHiX876yOiwTzRCDhqa+GFDAoiprJwUCMUYcFlq1r9ESVdJPRcUY9+HV8ZSbSt
 sKU1u6v3LAQ+nsTjz1p41C0BwEXL6Ynd4nL35QUCOMOSdl35NZmBRUgAXljI5JkmJF
 XH2PCWH8/onNyyBS3MW6NXglZv4oREoyb4zV4IbgJitGS2vNeusrxVt+oXVZqHTnEe
 3MQrhvvDIMF8ZQAPdJpHRVC/yAXGi5ScUkSnCbZrdkyYd4rGPHSPj4oXsFT7d+47YI
 zuSsKBphczmKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QByHzKaL
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: remove redundant
 pcre dependency
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

Buildroot commit 736c4c1655d93652a9a7e79235bbe726b3d46176 added the
package with two identical code blocks dealing with the dependency to
pcre:

https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/freeradius-server/freeradius-server.mk#L161
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/freeradius-server/freeradius-server.mk#L218

Remove one of these code blocks.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeradius-server/freeradius-server.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 946750f1a5..9b5b3d13ea 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -215,13 +215,6 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_eap_pwd
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-pcre
-FREERADIUS_SERVER_DEPENDENCIES += pcre
-else
-FREERADIUS_SERVER_CONF_OPTS += --without-pcre
-endif
-
 ifeq ($(BR2_PACKAGE_RUBY),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ruby
 FREERADIUS_SERVER_DEPENDENCIES += ruby
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
