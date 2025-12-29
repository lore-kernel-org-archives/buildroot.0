Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B321E92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40C1760C07;
	Mon, 29 Dec 2025 18:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82NA_XZFYK0T; Mon, 29 Dec 2025 18:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B5660AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031461;
	bh=cdk3uyR2tN09eHNwm5Rjl3np1xeRHzRNyTR1wAmWovo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZ1SaM/OWXEySGY7cEDhg8jIs6YTJRM8bsEmlQuexOkxHqX2+mUPj4ZzOl5puRGlw
	 QLLfdfmC7UiD/DJUNpXuGxEpXXeVoWKYOjviHqzXzn9WAZx9FExbxPVK5JdU/ESWBZ
	 AFvpx5apOuiZfhCtGF79rTGio4rL76DUPceAQ3IP6fBde0vPEiFXFDfhCT+NngpuYp
	 vVgVyOMz6uTf4a6Pv1Ox3fWpjVtbcQZTbrhf9adfxjOgEtB1TxO/yi3MukEJHWyS2m
	 mNuP9WzBSdMy51VSScU8g0ZBDnttFFWNEoLLMEJ1Qs1hvlDefwZ9+NTbbUos+9MZdy
	 bJpUnVgYEPyLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B5660AF5;
	Mon, 29 Dec 2025 18:04:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4821BD8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 365E780BA1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtH2s0D0FCzS for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:04:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B25180B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B25180B29
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B25180B29
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:04:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26473A4C264A;
 Mon, 29 Dec 2025 18:59:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWw-000000002P5-2KAX;
 Mon, 29 Dec 2025 17:59:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:31 +0100
Message-ID: <20251229175938.3549882-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031190;
 bh=7Aag5+7VYWixr8uut6I5+10hYWlRm5sJRYNWQLveGuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cvusT1syQXPBeSNTxc3aOve8/u+RP3HDHJhJX2bdXzc3vNeI1coEz8Bb0ZDdi6p37
 zoeWit7Zp90HLZBpiAN0Hmu48dL9A/+eHH1fjTvjUwa52yrs6dm7V0zHtYY+Lw2kax
 2hc8o4KR450UpgsO7RLLSH0NcLXdjDDMg0pTOI+ylbbPem7bGUyvuFlqwa74aWE2Xe
 R0BZ9QO8t37Eik4vn+xh0G1rY+n2T4acbEYQsXIRWublFeHeIZS7qyYjpODm3VHDtU
 RzY3108iYaGQbrLfQWWUqwI2cuBXeNUJYb3El6+dBtUA9JsbMOwruUYNLWQpqesZmm
 DsqR3DcZyrVYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cvusT1sy
Subject: [Buildroot] [PATCH v8 23/29] package/gtkiostream: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gtkiostream/gtkiostream.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index c748c7a000..250e47a0a4 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -47,10 +47,6 @@ ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
 GTKIOSTREAM_DEPENDENCIES += libwebsockets
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-GTKIOSTREAM_DEPENDENCIES += opencv3
-endif
-
 ifeq ($(BR2_PACKAGE_SOX),y)
 GTKIOSTREAM_DEPENDENCIES += sox
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
