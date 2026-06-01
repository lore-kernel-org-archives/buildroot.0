Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6BCD6E56
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 08:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB757427E9;
	Mon,  1 Jun 2026 08:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3Qku50KnQIj; Mon,  1 Jun 2026 08:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFC24427DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780304342;
	bh=2ZgCALNZAqCVLuW6cBGOsj8O9XxSwNzvAXsLcpN/YU8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oKIJsISt25+u5IHB9TLJqp6lTX3k+vns0MkwPUbvCh/gUTmmcaovKVoSjtLr6bWZT
	 SRGUBA75pwxmEp5nxGfCbD+++IbbhimobiAblJd1+xf9X1djH+ITvD1l8epU++jeLZ
	 0uHfHEZTfAKlUWhA1onQr1yH3ldoDm9iHFMO7zyIszAeheFFQkLg+ixNgYqgklEIJA
	 fzQaiWta6xYq1zftkfR2EsKDTHdiy/PeXTaehuTboSmgk00naYCfYLXNDeGmTTkxil
	 bdbv1Fq5pgFJoXt+0GVk6NcW4RH2OuKh7vwhRZusvuBo8UQ7p+2cv5aumQ7fn5Mt5B
	 u+peVORr0rvwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC24427DE;
	Mon,  1 Jun 2026 08:59:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 551BB257
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 08:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4705340823
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 08:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xu1jIELQ_mXB for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 08:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FFF1400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FFF1400A1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FFF1400A1
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 08:58:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1156013984; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 01 Jun 2026 08:58:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wTyU3-00000007WBb-1J87;
 Mon, 01 Jun 2026 10:58:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jun 2026 10:58:51 +0200
Message-ID: <20260601085852.1792002-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DnL0YfvDQy4lDLdH4614f4Rf5vzoPPpvk3jwyzss5hit/8oWKfnn7ou050QNfrDZsHRZbkCfLNBpI2y2q4/heOLXkHvx7Ez6XMT9dKDJLiKB9IPAAJmjaWdPcS07PuUXOP8Ekl8mPn4WDrZEPGX3SEfo9JGXbGrAOFA3sRGxB/c4w3JMANy3AsIBeuWChj+Im7ylPrVQXHscH7gvu0Vm/6WzsB9z5EfahtAi8z/QPUYB2eWQtDYoHv7nLBbqlUv3pPM/sucdHrnQm+Q1ful6rTzm6oou4CSVgratLQaHitM/StkOyDvvoGAGekInnXBqiDXHs+I44Cl/XF2gQfKNjA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=6s43JmkMvl6QJG5chY9c4VogbXuG2QPdHBXHot9qXBE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=DnL0YfvD
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/zsh: correct download URL after 5.9.1
 release
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/9f0f50858b2f41c306f172bf011a34d2c0ad65dc/

>>> zsh 5.9 Downloading
wget -nd -t 3 --no-check-certificate -O '/home/autobuild/autobuild/instance-42/output-1/build/.zsh-5.9.tar.xz.FpXHXy/output' 'http://www.zsh.org/pub/zsh-5.9.tar.xz'
URL transformed to HTTPS due to an HSTS policy
--2026-06-01 01:46:35--  https://www.zsh.org/pub/zsh-5.9.tar.xz
Loaded CA certificate '/etc/ssl/certs/ca-certificates.crt'
Resolving www.zsh.org (www.zsh.org)... 94.142.241.90
Connecting to www.zsh.org (www.zsh.org)|94.142.241.90|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2026-06-01 01:46:36 ERROR 404: Not Found.

zsh-5.9.1 was released on 2026-05-31 and 5.9.0 release tarball moved under
old/, so update ZSH_SITE to match.

https://zsh.sourceforge.io/News/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zsh/zsh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 2c464c33a8..06da8a6b89 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ZSH_VERSION = 5.9
-ZSH_SITE = http://www.zsh.org/pub
+ZSH_SITE = http://www.zsh.org/pub/old
 ZSH_SOURCE = zsh-$(ZSH_VERSION).tar.xz
 ZSH_DEPENDENCIES = ncurses
 ZSH_CONF_OPTS = --bindir=/bin
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
