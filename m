Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E4FE9DE6F
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A714D410DF;
	Thu,  9 Apr 2026 08:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wikoe9MsksWM; Thu,  9 Apr 2026 08:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82E4410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724351;
	bh=rZnZCQn/Lpkhpn/7pqPr42X++p1/BtILOaABy29HVGE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGx1osPJ7b8OUA9G4LBl1Gk2OKOseVry7tti4T1n0ncMZOFochMPzXQJ22I0V2llJ
	 58O1En+LoBYILpdsLDxdWdBCsRoQHLDIsHPELmTiQBAh6uWmCsSB5DMj8pUZNdC3OR
	 0KlIOeaDg88rxzXv20OF/QGDmDzDaGQJZmATdFwRtVOqAfd/xFZifWpm6p8VwiIsLz
	 BBQK6ngv3JDoSJZ1AC7pTlAJsiN32Pd0hd1Lo5RCdNkBB4YH7zaYs2AZFp6xzcYPJZ
	 mN7nTwQ8py91Bg/Oac34EyWLb7dDXswtTlTtaGg/ul7H4NK893TswBV5Bj68dhnLEX
	 LVf163who3kZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82E4410B5;
	Thu,  9 Apr 2026 08:45:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8FA1237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF1A3822E4
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKLf6S-AU-rh for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F9658225A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9658225A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F9658225A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7727AA4C0982;
 Thu,  9 Apr 2026 10:43:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyh-000000004SH-30z9;
 Thu, 09 Apr 2026 08:43:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:58 +0200
Message-ID: <20260409084305.3960494-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724199;
 bh=sM37K2c8ca92cFzS6KwHVjAvK/UHyntxaVHyPNqav5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LP5UOtcqApQ76lAh5KPprwtDC0IGMTs+CwVSKd8mzDZQe5oxiGYSIuPR4YlXt9NKt
 aEWzSf0+A7sDPfGQgVj6pIF7QkhXk3prYiWzhipvvAUoJsa8UDa939UCrnLwBMW0BX
 3dcFq5BogFDtlpn0lkyziT7HW/x/lPuTySYEivJ2BSIsiu4lEVMGOMYkUQ1aqOs3b1
 XPc1BZ4wbjcdIgPBGAiKGojlk0+dnw2vrY9h3hLWL/LiIXKn7YZHCLXinAAKYn2kgj
 66POcWAwCJM82ACafIDcgdTeZbjpbzIqZv6wqIREwGzyBSyGVjs7wZ95/4bPtoZstE
 5VjbzBftDsUHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LP5UOtcq
Subject: [Buildroot] [PATCH 14/20] package/freeradius-server: switch to pcre2
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

Upstream added support for pcre2 with commit
https://github.com/FreeRADIUS/freeradius-server/commit/430ed115ca58b0b99f6ea372d4e32b573aa5d0fd
with version 3.2.8 which was added to buildroot with commit
747fed73f985b8972052cc8111707279079e4aaa.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeradius-server/freeradius-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 9b5b3d13ea..80ace1c130 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -158,9 +158,9 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_mysql
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-pcre
-FREERADIUS_SERVER_DEPENDENCIES += pcre
+FREERADIUS_SERVER_DEPENDENCIES += pcre2
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-pcre
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
