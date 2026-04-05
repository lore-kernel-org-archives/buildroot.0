Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D66E64013
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 12:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BFB9811C1;
	Sun,  5 Apr 2026 12:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mv47c9v4C-Tg; Sun,  5 Apr 2026 12:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B21810B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775391330;
	bh=qCJNOQ9OatHbuHIHDkCyt2o8EWf9RUcF70Nwt8jEVCc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoVvGIf1YPqvMLxc6qakN0QJqVNYBoJwS9M0WrumKDcyjVTZtvwtUzyVMgSkj2msf
	 rSYQWVwtWl0nQCwvLyX/MPNYAzIRt/JgMhxQyosVxkovQbeoZ3y5/KPynCUZ9nuBLD
	 jxjnNNqTnA1eRTofOIBJmHTLgM/X+SyF+aa/+OpCUdOUHF6blpsO4sIjbSH8Yg0kLX
	 rjQa15Y98VeEyXVi9YYS8OFPKiaCHpBdKSdkK9iNelCpRQ/tccq8cb9bdEYkDODAGK
	 JeADKe2QweYtG+S7LFluaMbNoTRuyVtNESZUj5kDUyq0b+WxOy0g+x0m8vzb2gFn9N
	 E8Fli7m2XEEMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B21810B6;
	Sun,  5 Apr 2026 12:15:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB4C91EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 12:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB0DD40A84
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 12:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgykXeA0f1sI for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 12:15:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F8D440A12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8D440A12
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F8D440A12
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 12:15:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67CDCA4C37C0;
 Sun,  5 Apr 2026 14:15:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57052)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9MNx-000000007lm-0Ehg;
 Sun, 05 Apr 2026 12:15:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun,  5 Apr 2026 14:15:24 +0200
Message-ID: <20260405121524.2590079-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405121524.2590079-1-bernd@kuhls.net>
References: <20260405121524.2590079-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775391325;
 bh=oq9n2QSQyAO74W904EEzzztDNI3oiL79m7Jg+0UiBSM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=seXnhxM6Wn2ZDgTYDKIVkKK4tfBIUWihrgLz9T6QL4les5pecJqOoR4T5bozwfMqj
 lDgPJ5cS+uxfZw+F5aRMQzWapxU7DA6P6olqGZSTUERIoZSd24VFNqfx9UwjRwEpDx
 UK14Q9ub+cE/B362KaoBIngsMAOQu+//PcvCN6wEQoKrOkJaAOytEb/0y5PM4t2DkJ
 qdftZJg4w3B6UC9HcO4XZPhV+Em4a+3ffSjLUlMZYAnQAWGRgu5G8LJosyCx4jGRly
 v46l9s01iBOuEaLWzKHoWhpcd+EFaH9UV5Dq02Lc+HnXXKPaTXHKjc+5wt1ygV7eC4
 Fhf+q3wq+Shww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=seXnhxM6
Subject: [Buildroot] [PATCH 2/2] package/postgis: bump version to 3.6.2
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

https://github.com/postgis/postgis/blob/3.6.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index e70d0e43eb..8ca0fa48c3 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ec0cfaab475630106211d180d71df46782e41e10b6dffe91d79ca818ecd2cbb4  postgis-3.6.1.tar.gz
+sha256  d488089a64ee4060bce7dbba0291fcca358e7f7ac5230e2ee5b344e7485729c4  postgis-3.6.2.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 8585694c06..0a55ee0e58 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.6.1
+POSTGIS_VERSION = 3.6.2
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
