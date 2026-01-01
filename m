Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070F0EEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C537E405B6;
	Thu,  1 Jan 2026 18:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FfegTN-syKj; Thu,  1 Jan 2026 18:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA58404AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767290464;
	bh=/o/jq3pw46RVj0aSzTXskwg26HjnsC5f43OdiEJTLkM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HS8+IQjbuEzJRkkcZajZh64f5fQ5LwjSThvaL4aJlx2ZSfnR7+LrAWr4np89DLkXx
	 1XULpF9J0aSqXpU0j+5kVy/TzqOnyuxIxO/eXw4bX9bQekUkCzzl7vXCbYMEdl6t3K
	 QcxLDnhEQ/0i2A9NQenm6VNM391D4rQkUao6SCtpAmkj15SAHkf4g1Kv3WTGpsi1FI
	 EexUGk5kDakJQ9uEyLF9I1l8uTGbwfLKq7T47+RqGg3HY2Sx1vibpNDmQbYuFgELd4
	 2M6XcV/bOKXVsH6uioWmojBogUYPfBiimkKFtBnOpecsiTzxA+SXkI16ZEAgV0bBK/
	 mK1HLGfUP/ewA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA58404AF;
	Thu,  1 Jan 2026 18:01:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB30B206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2277809EE
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBxne_cbEDZZ for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA071809E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA071809E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA071809E7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:01:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 49CCAA4C2F95;
 Thu,  1 Jan 2026 19:00:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33758)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbMyb-000000005MC-2yal;
 Thu, 01 Jan 2026 18:00:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  1 Jan 2026 19:00:44 +0100
Message-ID: <20260101180045.247057-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101180045.247057-1-bernd@kuhls.net>
References: <20260101180045.247057-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767290446;
 bh=jDBcZ9rq7JjV229ObTbCuFJespuKTRmyWYgwBZSDi0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IEMRhD6Ap30iycTN60UYLamgBZGEnTKZBjAJILheoSyZJkuFrZdlXYQ5bkSYXxqqO
 NxUSuue/YViTd+7ZHR/6hanD7vf51hLmYVm8HuixFDj6WiRgdz9TwVXaXgxCU4EpOu
 Fxbxglsab+jik2rTWsg0TnQnq+o27lJPAWQzlMcyNxGJGB6iyBiGqRU9tKAOR3oHQt
 8VmE5M/pbmNfDdt1PhyHAjDeLnOPhGQba4OI1/Y0lQxFe2JkRfisUyk5+yCXSK2CzW
 8jfDnStKsaaj+whMkCXYnKXIruskqyWSu/ZuagHRQ3rzM/x+BlsjGEt06rZntFfKjf
 B4o3zBn4g6E6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=IEMRhD6A
Subject: [Buildroot] [PATCH 2/3] package/libdill: update project URL
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

https://github.com/sustrik/libdill/pull/228

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdill/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdill/Config.in b/package/libdill/Config.in
index 2376fc9698..ec649c6600 100644
--- a/package/libdill/Config.in
+++ b/package/libdill/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBDILL
 	  Libdill is a C library that makes writing structured
 	  concurrent programs easy.
 
-	  http://libdill.org
+	  https://sustrik.github.io/libdill/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
