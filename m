Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF1AE9A047
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 01:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E09BE8052D;
	Wed, 18 Feb 2026 01:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxLZEytnbsta; Wed, 18 Feb 2026 01:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1944F80530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771379675;
	bh=3Cv74iY1QBGBeih1u44aqOGrzv3Rs3s3fQv1fwQuvGQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AYyZt+K3JBSrAIE3HcOl63mThsZCCvR3+w/wyRmJgIYggSnUx/IV1+255gL27Wsrz
	 2XiEqlSS4Z17b0XRBX5U2utxAJVd4vqv32XFgrh7bJSJYZf20iubxOYLwU1MHNXLSC
	 +8WJn9ZJ7HLcWmLLulSUmrKFhtQUdlOPd/N40xCvkUhWXehHG9ze1eB5bmviFnLjaD
	 NjFne9p/T7/OuHm7VUHMB3hMqjT+SdDyNryn7nYxMeO9TiC/0Lcn4y2AI9TmeA4YT4
	 GELDxav169BYdGC98iCCoP/Col8uoRBNfoCNq5EnKc4K2HuQhWcHgcbROi1Dc1fW5+
	 SmZO4Ck5QwrcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1944F80530;
	Wed, 18 Feb 2026 01:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3601CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 01:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80DB660704
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 01:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdV6Y_eoIkjr for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 01:54:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2C0C606F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2C0C606F5
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2C0C606F5
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 01:54:32 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-45efd53148eso1526968b6e.0
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 17:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771379671; x=1771984471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cacWRl9OVivIPd+FT3uHxOednUQB93Pb2SZRrDNyaKk=;
 b=r2lo5acQbD5laf0DSC6Y6Whylk2m/cW1FaH2pBI3ZhHd1B4nDpYWmYxdjCBVjKX2Av
 sVP9dm07pxlzcRScuOb+UseM94c5q0PhXBgPN33CB7/En4WKyAmZAFyG1AjTmOPcvcb4
 I9yHeEFjq+paNu/WDwqbMySFqlRBKKnxxqTqSKBSl9P3IVBhlMjgD+SlAJtcGLgiCZRa
 XhaUPCVir2aRdT8Io2PMaVjFRKZD7I0IhK1Rwa/TiURiMKV4v9Ix2klM0MjjXRpQilOp
 YqW3LaDU0YzU4Q/yTaJ3avyraZNQ0d5OQHhBB58W+f9NJ+1ysbTvxRVsfRwPkeimixxf
 qREA==
X-Gm-Message-State: AOJu0Yw9S6qLZw/TNS4dhz7y4qvLi4qh3hS1OHaWl5Jziq/rULWC3kl+
 5CMdxDMg4GzNKn+pyRZDsUsmC5OXh5iVoUUXO3UcGC5dEV2d/0RsuTnluHzTJvA3
X-Gm-Gg: AZuq6aJR+8T3sNKdaADADf6mz4o56iybJHxGXJTCKBVJ3nULnpak5JAUhOFBTWR9IC+
 NMYELRG9cffMWuHlWZLiXEYGlGTOFXvOsd5p1kWsbCO3lT11klf2BTLUJKwBLmXvhpspwUWrMGr
 1SiQ3phsIScuhh5rnK5HAkKmV4FGo4DKFi3Z/83/XwNEFk+sVc/NNw2HqqEA3VYFtZPUxq1riKj
 rIx7Iy2vqIykP6IIkfg41rG1h78HgBqMTifHOblonTRs3XSZZoVGbCuEN+K2kCblMglRWGjHjtA
 vMWEYn27hEalCSNfe4pLs0w/aNceomG0kmE1fg1mwqwNV51upuADgYKoWU5WdDH70UXOckXhS9j
 Zjx/ikKQZZlBEjZJlLsrLN1ucFyzUdFrOtWxhIhcX+ykHXZygwkbKB3BZFkPfW8U/4+Z2xLNNF0
 jMBg0eou9ryMEURN5ErAfHUVCl/GaUXzXfHC6JZ/PCQ7q/xM/kcJR2WbCyi/t7e2icdwVMS8fqT
 UcYQthHOgi+jxjMeQklaB+3SdUfYW8WrLBaEPyDqfp051snnw1dJZ9eQ+vl0rI=
X-Received: by 2002:a05:6808:2445:b0:45e:fcf2:b6a0 with SMTP id
 5614622812f47-463b3c85332mr7244688b6e.0.1771379671374; 
 Tue, 17 Feb 2026 17:54:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net.
 [71.218.105.26]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-40eaeeb8b51sm18979619fac.7.2026.02.17.17.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 17:54:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 18:54:27 -0700
Message-ID: <20260218015427.1986765-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771379671; x=1771984471; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cacWRl9OVivIPd+FT3uHxOednUQB93Pb2SZRrDNyaKk=;
 b=Kthx2boCh/9ZXw0Os1bbAo0aerlYoxEjja9SqgSCdIljjdY8wXTFT2BYKJLWhA7Tfp
 VfPxPRGSvL+LltThtSpteiWPmVEYuoEzMami8++Tomd/uG5uZ5GwJNgtcOwJmgiURZ1H
 0wnqPYT9Y3SIYBa0wH7AavCoBp6WE7BQyrFqcpZLEwX/Jz6h+HQ2TmIxAF4O2cEWiHBH
 fUKUQXTGDR7mYherQx0CPyPKzmd6Z1d67mXFT7nacfJeDZ8CEMaeayyB7hkAKWlDXkkP
 xcw8LHqwN/NdUpblVoHccYIzrtmGc6Zb8zTjIQxoC5A/iT0pDo51/OTY/N/QLdHsgIoA
 dC0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kthx2boC
Subject: [Buildroot] [PATCH 1/1] package/ruby: disable zjit for all builds
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The zjit option introduces a rust dependency and due to that not
being handled appropriately it can cause build failures if this
feature gets incorrectly autodetected as being available.

This feature was introduced when ruby was bumped to version 4.0.0
in f594f86f9d6f6a3b8dcd03d486b0c30a1381e7bd.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ruby/ruby.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 76ad9cc73f..04b213f06d 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -26,10 +26,12 @@ RUBY_CONF_OPTS = \
 	--disable-install-doc \
 	--disable-rpath \
 	--disable-rubygems \
-	--disable-yjit
+	--disable-yjit \
+	--disable-zjit
 HOST_RUBY_CONF_OPTS = \
 	--disable-install-doc \
 	--disable-yjit \
+	--disable-zjit \
 	--with-out-ext=curses,readline \
 	--without-gmp
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
