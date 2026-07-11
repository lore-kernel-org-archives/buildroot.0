Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F0CC43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 11:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEFCD608E2;
	Sat, 11 Jul 2026 11:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 537Kkk63M3vR; Sat, 11 Jul 2026 11:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E5160BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783768681;
	bh=hQQXjFylVVKMhXB1sAEV6M9d1a2BKnB1AJbgICYQ3ig=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLyLfbc+OKyUTL1NRVstc66wsRz0+CEEBmzoMY9bF3uRsvbBhX7rT43c61JjgAiNw
	 zymzhy1/7ISLjvT4rmnaGYOivhAVbqSzojN3An6HUj+TkICEVW+Yq4s+S8J//xAUd3
	 wECcFWY4wo9uKK1mYlTT5hZMHrj+w8mDBDDbGINePY1HYTHkkaDSz6H1sBeSOnFB0h
	 TMnEkrp25ahggsSqPflOxO+TMH9NMn6LXpWWn26NKWbcI/D/YDaCAZXwQhYMdsCbIa
	 BNxLq6bCBddvVpDa4fHbRlSLPRX+bnm0k8dZKYHFsEU0T3B6UlX7ojjDOEg6dZvPdG
	 qIA2Xd/bEXKIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91E5160BD7;
	Sat, 11 Jul 2026 11:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E150E22F
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D34AA81926
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fP20WyQom83k for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 11:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C587A815AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C587A815AD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C587A815AD
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:17:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 876AEA4C32C1;
 Sat, 11 Jul 2026 13:17:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56980)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiViK-000000001Df-0zxX;
 Sat, 11 Jul 2026 11:17:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David du Colombier <0intro@gmail.com>
Date: Sat, 11 Jul 2026 13:17:43 +0200
Message-ID: <20260711111744.877250-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711111744.877250-1-bernd@kuhls.net>
References: <20260711111744.877250-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783768664;
 bh=MctIP9xA3YRChJWiRWe6TYFt63fg9OyEwWIJNF/uMcA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jKML5fLmpYgV4C5YAl1H/G/B90DrNmBggyIN3zcOVPjaun7Mec2g2jVi7d77eKOPg
 ZU9+D70IoNrLrFc4KCJ1wjXoAuazrv7KrA2LS7H/48NMw7CWkJVqlU1Qg3a9I0585N
 OvG0K9wPJmI5GjLdsJUhGMtPfgHJckjY87i/QcO35MbZdGvey3m/0vdXcxOu7apSNY
 ZtVKXOgenidXkNzPYK8BtJuqI3ZiMu5Kx1TNeabbf48khVHhVzF/3M36OXisEQ0gMM
 cD09Ez1SJjrpjxx3S8JAIBtG/8B45Ag5HthnIbzQI7AYUSfoRfDBKWigh47eqvrU99
 N+jDaLRlVSLxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jKML5fLm
Subject: [Buildroot] [PATCH 2/2] package/x264: bump version to git 0480cb05fa
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
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/e8272329a492289972dc19540ecd933fadfa22ec

 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index dc2d3d7b5b..31657d5ab3 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  adb3f2f780607420134def42d0fac58be9c6de718a451f3f0ec56236a783f937  x264-baee400fa9ced6f5481a728138fed6e867b0ff7f-git4.tar.gz
+sha256  dbfac9615e62cc85a638643ae0ba8cdfecff645755fcded389b53507eebb23ec  x264-0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee-git4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 858486af54..78b4dcf5e9 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = baee400fa9ced6f5481a728138fed6e867b0ff7f
+X264_VERSION = 0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee
 X264_SITE = https://code.videolan.org/videolan/x264.git
 X264_SITE_METHOD = git
 X264_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
