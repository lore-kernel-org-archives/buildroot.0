Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CCBC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 01:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06A908443A;
	Wed,  1 Nov 2023 01:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06A908443A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmc9J0OnFOLA; Wed,  1 Nov 2023 01:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F74C8443D;
	Wed,  1 Nov 2023 01:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F74C8443D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 091641BF2C2
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 01:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9ED42E46
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 01:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF9ED42E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6dWVMp9i6Zq for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 01:59:02 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55B1F42E36
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 01:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55B1F42E36
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1cc5b705769so20817075ad.0
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 18:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698803941; x=1699408741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulYkhZrY2y9X100d5QrthuaPJQ47NKOZ8BXPAK+/bYw=;
 b=gBMu5SEmpcDrXtXoM1foR8B7+ihX87hN+C7MF9by6QF3o+8l/3zSoucsp6CudVvrAW
 VDtntGwCh3+2/ISjRoe+czfw1gxaJ89uncaaKf30sFg4/q927UZ7FNKuu5EOLWe9yxq3
 RYFfxOajJxZd99a/h/pXkRGzJYIfSbfJSJjua0lMIIk6+iQTQR6dTp7tAMTY1Y037xIZ
 M5T7Dm8onnzJ9fu5ZunKqjIB0OA5tTMecvZ5R683I67yzU2jTarXRJmOHfCFI9kz2EH9
 GhdiNV6a4yCPg1zqXClDCBgyxj+hYvzU7RMrYkzRrRC5SLpGyjMbJpDMT7L/pLjQ5MQ1
 LNlA==
X-Gm-Message-State: AOJu0Ywc8Me2eR3UCiIZ91O0QfLZA1xXXFZrYlEBlpJ3xQ7Kxp7ACdB4
 39miGUsSuQAso+yQcoDaoq4EXZiU49Y=
X-Google-Smtp-Source: AGHT+IHSuAG9KlpCzU+hFe3cJxKsHfpTx3vqLRmwhf9WWRyTE8EqCWsOvcTPqbecjxhZIggCQqtCvQ==
X-Received: by 2002:a17:902:f9cd:b0:1cc:4071:fa44 with SMTP id
 kz13-20020a170902f9cd00b001cc4071fa44mr8744010plb.8.1698803941199; 
 Tue, 31 Oct 2023 18:59:01 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 j9-20020a17090276c900b001ca4ad86357sm195082plt.227.2023.10.31.18.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 18:59:00 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 09:58:54 +0800
Message-Id: <20231101015855.15245-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87fs1r0y3q.fsf@48ers.dk>
References: <87fs1r0y3q.fsf@48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698803941; x=1699408741; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulYkhZrY2y9X100d5QrthuaPJQ47NKOZ8BXPAK+/bYw=;
 b=KrFd095HIP2V66u78s2STqjtw3Ehdskpg1SZ8Zo0/BB6oYIF+Ywd97ogaNd952R807
 UQdwOJefzxz8UggPwo+sLD/NFV6SkOrvVYYYAKZlbJI5WJuizLF0X+liZLIrmtfqurTX
 gAgTb3aPdOBU0d03JkyQhGxcJ7od5R/947vC/yMWxkmeBVH4hIcU2L+TA3A0dV0G/82R
 ScgK8zxYwFGOHngBiotW44mrqFLddyy7yvpQXySg1G2Var2UpIndONtDb4YnBoakX7UO
 LGlQg0kYeZ5iTAoEx12mmRK8BH0fU6p15st2APXFBpDBLOVlPICfNDP6gdbjzrIL3xb1
 hekg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KrFd095H
Subject: [Buildroot] [PATCH] package/libopenssl: bump to version 1.1.1w
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
Cc: Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This maybe the last patch for OpenSSL 1.1.1 LTS, it had reached
end-of-life on 2023-09-11.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 4541087c07..cf28d4e05b 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1v.tar.gz.sha256
-sha256  d6697e2871e77238460402e9362d47d18382b15ef9f246aba6c7bd780d38a6b0  openssl-1.1.1v.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1w.tar.gz.sha256
+sha256  cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8  openssl-1.1.1w.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index fe68a20ed1..651283a828 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1v
+LIBOPENSSL_VERSION = 1.1.1w
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
