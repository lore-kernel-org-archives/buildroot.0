Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD65C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 17:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B64A40720;
	Sat, 29 Aug 2026 17:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x12sdQQtq1Br; Sat, 29 Aug 2026 17:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788025112;
	bh=0dkCnGKD+4jVgFrB0/QitXhpYuLSSQnlCCsIrUTbnBA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IC3Nx0R89q6y26edygY9Bq42BjU/UGFVP/Q0RQhcSITmq5J1SI5NLyRnMyENh6tDk
	 WGl1CdwovWxkob6/BLu0rhTub4TmUNVlbXhxDzIO1hkipmlc0gBKhvU6NRQh+2nQBK
	 Ic10GjqwAyMEFs7OsD8CSXQNOrmNkPbEsYqjd2f+vDRZBt2PL17yntIN7epR1QomhP
	 dJ/Pa2yT1WCVTdYedpHmdqQRn5S1D36sKdwaFWBBJvPnom2/OdfxRszlsSTQqEA+WC
	 1/dqFAmDJveDAg6Ytek/L39mBBVVTCVCmye+KDGHdaiVstL9XZPn5ffPx91ARmdac2
	 7nbZ2GubpZo1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914974070E;
	Sat, 29 Aug 2026 17:38:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED90A14F
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 17:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3BA6400AC
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 17:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CWAYN-Mzfvo for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 17:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PzIUII9A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23E00400A5
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788025106;
 bh=O/J44lhUyLSty/RIEmnA7IZJQ2I401s76dLW+Tj6S60=;
 h=From:To:Subject:Date:From;
 b=PzIUII9AerRWBiEUnn1B1OIUtd/No2gMNdXyEKtR9laLcS2MkJhPaUSd8U/2BE+GX
 IgXo76CfUsVzmr9XGXfBMgwIrS4GIpwCfL+Hh9ily3wL5AUz2MeppiuqfnCO1cGDTV
 iNcm08qFQfIsJ4+EXfouGUuyaKbdAi5kP6QBFv0p5bWIH2bpzx/Tn4lVL65Gn/HEvG
 PnniR+56Pi3m3anfysPDN/Qz8+x2HcY3Ys05JOjTd0hLv7h3vSfiK/QTqFKysLFcf6
 UNYT0eveY8xX8bKk9E6cW5w0ULFApIciUmua+TXtyDO4QedKA2iG4hjWx9oDvKe/Oy
 yfij092r14fIQ==
Received: from fli4l.lan.fli4l (p5b3a0f14.dip0.t-ipconnect.de [91.58.15.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68A2DA4C0887
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:38:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1x0N0c-000000001G9-1PUI
 for buildroot@buildroot.org; Sat, 29 Aug 2026 17:38:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 19:38:25 +0200
Message-ID: <20260829173825.93129-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.7
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

https://sourceforge.net/p/fetchmail/mailman/message/59381086/
"Fetchmail 6.6.7 bugfix version has been released"

https://sourceforge.net/p/fetchmail/mailman/message/59350877/
"The 6.6.6 critical bug fix release of fetchmail is available"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/e5014b0d231271bad52a9271ef717fbbae99c0f7

 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index cbf1ef2afb..023667e207 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59347909/
-sha256  ab0320fe4df0b5ee8659189e66590d9de96aadbf929fe59f353ae7a317e9ef1e  fetchmail-6.6.5.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59381086/
+sha256  bece8aaaa68e029eed9fd55fffd2adc7dd6cd5e9574d5bf92e2d9208bd97a881  fetchmail-6.6.7.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 9b3c035844..9d00d876d2 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).5
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).7
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
