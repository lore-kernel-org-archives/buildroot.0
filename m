Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A7FF46C6D
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF4F58104C;
	Mon,  6 Apr 2026 18:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sf14Wh3gDgXF; Mon,  6 Apr 2026 18:23:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A89681045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499800;
	bh=rZnZCQn/Lpkhpn/7pqPr42X++p1/BtILOaABy29HVGE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PSPVGz7PnhmB2yvf4wqERzICKjO1xrMRzXcyV/n90xQpGu0oLIXcVEL+Xg00+1QMl
	 DjwUWHe5amnWk5UJJnJa8tBFCI4xxnx/z7QO/lSDxi6GbSk1uwmfVzI+9y0dv+EQ7C
	 VWu333gEH/16LYDdEl5OKb490U7ZTvOm8AMnXuILUZgUmYTFVQm8fBgboAjom3Rljh
	 1VhhlvGH8MaFBRqF3qJczqFt+t151gmjZHLsUmhNh8g4DK0uH4t+/ExXwHbOM+NvZB
	 IAtCGEtpApNmlLNKVhrxlovFeYmjBGgHYbcLiqDRMozIg2Ym04OC7JQh9HGu3zMA7D
	 AoKxZj2RtGJpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A89681045;
	Mon,  6 Apr 2026 18:23:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FC01219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9196A40A02
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVFvqqJBU_p7 for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 524EB40A00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 524EB40A00
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 524EB40A00
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07EDEA4C3956;
 Mon,  6 Apr 2026 20:23:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaX-000000001kA-1zKD;
 Mon, 06 Apr 2026 18:22:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:11 +0200
Message-ID: <20260406182217.1853895-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499782;
 bh=sM37K2c8ca92cFzS6KwHVjAvK/UHyntxaVHyPNqav5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=i1qj8xjf2gd9AZnwkT6K9p69pLIipRWvKCtGZaaNp71B/5hEfvVOIxySqDhPagarz
 U0DclF5zd/6KTb3VJYEvON+KDSWN030FNGKlE32HJz6z2XrYULEdl2scHyBhLnC2kw
 8kVdznUyAe4M77yad5WkqiP5YWAw9OUK3V8+Yyy6r6Q8yjfOBPo5LBQKyGcsG4AKsr
 fiI9MZLO+KFYlXqhA9yCXFH4ChC/hFdAbvkzYOl97Xjiiyl7sf4nvVpz99RRWG3jav
 TSZblYuvT5r0Izo76pw6fVkbxI943dj4t83h1X0KR/cga2Uj22oEG7CaAxubWPz1If
 kruBlMvV7K7iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=i1qj8xjf
Subject: [Buildroot] [PATCH 07/11] package/freeradius-server: switch to pcre2
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
