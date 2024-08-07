Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378F5C52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02229608AA;
	Wed,  7 Aug 2024 14:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKZdLcdu0ssr; Wed,  7 Aug 2024 14:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764FD608DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 764FD608DF;
	Wed,  7 Aug 2024 14:35:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5E61BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 050E0608E9
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTfXVyPQn2yP for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B2CE60908
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2CE60908
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B2CE60908
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-428178fc07eso12818075e9.3
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041285; x=1723646085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SqMfqblJIt+EhVoJBzc22Ru5DIUGsw2w+6BLwwpl6AI=;
 b=uQlZT3bZg/ZXEedYk+yr/hwaFWW0oHsXjI5ZZayYX0X/ThjRQJQhhUtdeeyr60j7Cj
 bltyyheTLAXvRMbX2Et4FXWmflsrqI1ZdBMU3/xmTffW6jjfd7XGC57hn4s/wWs9M1zK
 hEdb8iBd33PM7+RNnY51bTYqByqUSbqLTd3Fs+VQ5KCGHQhAwkjEBnToCEE+9CUvwFHm
 jU6uH0B1VYsgdwttuYhZETfDwgA2fKtMbO3Z0XA7qZehRPubDlAkRWkW2n3scD4PIO8C
 N0CJ2WtoKwqO7nqT9THpNWuPcarCdvXHa2d4Bul+chW2KJizYtZ280N1mVJkYpbQiPot
 2xQg==
X-Gm-Message-State: AOJu0YxguI9xOvbqPKlDgeUtFyR/bIw/Aojn+vOLhpo1x25UtKQON5py
 vVdbfYLCKDZUWs4ug+pJUBPOFHIhrhKr9ZPiJc86zM3FkrAM/uG89Kcb7A==
X-Google-Smtp-Source: AGHT+IGIzcYpw4ATTwbFK4z87HJlRWeSrM5ceSUIOn8Jdx7pGt27QUdL9ZlcoyUf34cVcZSH7aLmMQ==
X-Received: by 2002:a05:600c:4514:b0:426:6000:565a with SMTP id
 5b1f17b1804b1-428e6b07ebamr114540385e9.16.1723041284912; 
 Wed, 07 Aug 2024 07:34:44 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:44 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:15 +0200
Message-Id: <20240807143318.439619-16-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041285; x=1723646085; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SqMfqblJIt+EhVoJBzc22Ru5DIUGsw2w+6BLwwpl6AI=;
 b=NjY37+bm1u6HtVlQF3mhIMjOn60TKgVuhfZcZpWMgOPORYGWV2PLE+q87tDAV/dXUR
 7czjDeEfZetAcLZ8YSWQ5YZpnd7YmCqffMzTWbpVEprVDV2AQlfUw/7miWg51Q8c/IpY
 BKOZYsPXW8AahpYAytNkcnSb5b9ktvSC0SxtUrF6nYJf6tMe3cjen/vUtO+sH/nOZwRl
 doq+UlHDvCLLGAOXNqrRvT5F7/QjggQ/mjRMlKExp3WDjbZSLMR04YxtDhvdE0HGZfzH
 hzldVx33RRYZQr7D3E+ziT/A/mrpLMgj/Cqlh4VAj0Z+xQqW/U8FUflpXxxdmDFpYka2
 xqvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NjY37+bm
Subject: [Buildroot] [PATCH 15/18] package/erlang-p1-acme: bump version to
 1.0.23
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-acme/erlang-p1-acme.hash | 2 +-
 package/erlang-p1-acme/erlang-p1-acme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
index e417d4b181..0894176fbd 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.hash
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a445b66e76acdf1342eda166344004473bf4f45ad7e7f5ae38fb0333d896eb2d  erlang-p1-acme-1.0.22.tar.gz
+sha256  59a0113022c87afe25a8664fba76739b0ad481e25081599e0b69a098f6d628ed  erlang-p1-acme-1.0.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
index cb8c7a8a19..5c7c5cc9e9 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.mk
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ACME_VERSION = 1.0.22
+ERLANG_P1_ACME_VERSION = 1.0.23
 ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
 ERLANG_P1_ACME_LICENSE = Apache-2.0
 ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
