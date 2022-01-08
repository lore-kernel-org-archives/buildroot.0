Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA08C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E58260908;
	Sat,  8 Jan 2022 16:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZOF-MBrDcoa; Sat,  8 Jan 2022 16:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 145EB607FF;
	Sat,  8 Jan 2022 16:17:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5816B1BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B8140136
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vo-ujxapxI1w for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:17:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DE264011F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:17:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l10so17433425wrh.7
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Dd5R9jSqlLFLd++WOAi1jaTH4rztihLx/QgCs6EihU=;
 b=cUa8whTS4VeCdkvRxptxtLMoNN/pejqlt4gQmNjto7yMN7NYBEUaRUkRTp/FDjBUJW
 ROs68RJpbCz4PwDoD2cbD3QRnh92xf2PsV8LWxZKdiJ2OovZWsoM75lmzGw/WdPfcGpS
 YVG7ktudt+6IZkEsH+PgQ3hdI/Xuvz1ZM81DHK5az4nW6kIYe54weXHKGpCdfCziz26F
 EN9pNA25cBjMku6x7pby4Zz17OXrEF8K52N/JoPPjLJLXfMkSMGKHU+sXC4fIzIt/tne
 +hsKdwlEZyg/HbnztQeUCzVj/q/5LPUuLtA78YRAC5pwuKfsJJdo2wCYSMxkGJ6Kw2Qs
 UA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Dd5R9jSqlLFLd++WOAi1jaTH4rztihLx/QgCs6EihU=;
 b=Or+aRS9I3Y/A9hdo2oW/AzHHKmEPckLcEJgtP94vApg0FCUBPi1G3ZX8Fd3Sj3A0Z1
 pcTzqsYmZBhomz3ISNr7c/i5B+lEiVNG+N1TMknF2ol9Lz8gUEA76pZOOFsMW9au9mF+
 9kC5D4dZWgJIZhnqSA4jJDAiXNQbWAxz1F4tqWaOfOOsZf4kETsKPeOHfwd12ZkRZ4SX
 ynq0r9UhDI7d9ut6rGW4akxTVpm5KHNlXy9HedkFJqsfhXo/4MSw4MAm/bP0bRbqdwBo
 QGaGUc7Kxlhp5JlS10avj2X8qHFhl4H81OWAaN6Z2C+t3DB2l1bBCx3z9kETecYkp6nU
 XJpg==
X-Gm-Message-State: AOAM533UHK5jcFBC/Ptj0ttYjW6QKyD+Ss+QrVzP84QwaM/HO8F2D7SH
 tgQ1gP+DgkcGElh+f38oDfUtO0jg7l8=
X-Google-Smtp-Source: ABdhPJy1SBOQ4iWyKAywNKKsNCPPRIDl9pW/bfm1RKkyAy9QV4K//SJ2SKzxmoXufz/zSoaAi6Jimw==
X-Received: by 2002:a5d:4e44:: with SMTP id r4mr293016wrt.593.1641658666456;
 Sat, 08 Jan 2022 08:17:46 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id w17sm2113117wmc.14.2022.01.08.08.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 08:17:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 17:16:30 +0100
Message-Id: <20220108161630.2730118-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libeastl: drop duplicated sentence
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop duplicated sentence from Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libeastl/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
index 7609434519..5abea8f810 100644
--- a/package/libeastl/Config.in
+++ b/package/libeastl/Config.in
@@ -13,7 +13,6 @@ config BR2_PACKAGE_LIBEASTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  EASTL stands for Electronic Arts Standard Template
-	  Library. EASTL stands for Electronic Arts Standard Template
 	  Library. It is a C++ template library of containers,
 	  algorithms, and iterators useful for runtime and tool
 	  development across multiple platforms.  It is an extensive
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
