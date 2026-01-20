Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD0D26283
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 18:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A5E409B9;
	Tue, 20 Jan 2026 18:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1IzCZJPL-Jb; Tue, 20 Jan 2026 18:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE204099A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768934044;
	bh=2/YxX1aC33VeuAZJsNl5ovthdf9KAgyOuCRROao9rm8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rS0FhWRqt5gKjrZifnExWMJDtuXKNMTSbtjWbL++9z5LhgcLa7RlWeu2QC1IoS2fX
	 isUhwXgjH1QggeTvHsp7X19uF46/gQLzD2LaSh4w9bUg6YXbHkXIT13jSIYRUtsLoJ
	 llNTFXiapQPEhpUkC30YQB2ca6yEJ1rQfuA2MG1YetDFkqaM8FBtT9tVSsrJiEzJOa
	 omyd84viHfE0LVJiqJmvwhAQmiqGnjQY+nRD3CBS5bBOXSiLk5Bm3YRzLReLTOmN8X
	 ADeljqM+/R/KqBNH4FvMyhI9+1+KBIsgvjnnvVWZrLZAvpP1mHzSnXyHHlbD0PrvLe
	 TcfiMMsnQwpbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DE204099A;
	Tue, 20 Jan 2026 18:34:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9650C160
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 18:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A6836081E
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 18:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QS8nwBgmMtQJ for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 18:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6E95606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E95606D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6E95606D6
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 18:33:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5243AA4C03FE
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:33:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54772)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1viGY7-0000000052K-1zP4
 for buildroot@buildroot.org; Tue, 20 Jan 2026 18:33:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 19:33:55 +0100
Message-ID: <20260120183355.2730446-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768934036;
 bh=3f7KWVZjHTAp29FE+9ES/374fje4Kn2mfFMq8z+mucE=;
 h=From:To:Subject:Date:From;
 b=ngrYm+PQx5n2UjL80m9UKh7n+LWlVnAI1yzu1B4nUKkEX1eIaJedP/l0OBcKJELFG
 TjIUqhYGHXDwKUO+p+gHUoJzUCT6kVqmMz43PIaO0xQ/m9Kh979fszhBJV3F9ewhFt
 sB+j5j/tr4zwzhZLjcmVQJmFFtA0ihkmUOFg71vH6gS/11PNg/L10SRF9RNZw6Jzhr
 srmHOkw9VGLjqhaQAa9/aS6YxMx36e/9vUpTYOmSKcvC9IZ6MR+ShyIWhBfbzxOofW
 pAKcAqxHN5AYJfFJFfskNPSlhQ2C0q2IS8sFfyR4C/OBYx+yXa75dYOGmLpRGa+xbu
 ssVZ7N0+WlQdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ngrYm+PQ
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x series
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
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 1f9256c27f..a3e621f38d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -4,8 +4,8 @@ sha256  ba3897a1c060b05a03cb4dda6f20d8c75e6f73c88b217744823a915056536eaf  linux-
 sha256  76af9d4fce24cc5a1c9f1fcbba2e23c4e87bbc8e20525b1691206801f24d14ba  linux-6.6.121.tar.xz
 sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
-sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
+sha256  5d4c0994580dd3bbd5ffc5fcb81c22dd305b844c9d8c7b176cc41b28f7e29743  linux-5.15.198.tar.xz
+sha256  b5e6e4f1f904a3377dde32ef3bc322f03a78f045c4d666483d383153902de005  linux-5.10.248.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 04dce45ea5..dcf5d46505 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -456,8 +456,8 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
+	default "5.10.248"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.198"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.121"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.66"	if BR2_KERNEL_HEADERS_6_12
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
