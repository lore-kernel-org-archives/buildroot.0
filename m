Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76480D31765
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 16:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 329B280BA2;
	Tue,  5 Nov 2024 16:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9bzRQQQw2cP; Tue,  5 Nov 2024 16:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35CDE80FF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35CDE80FF7;
	Tue,  5 Nov 2024 16:39:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84A163B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64578403CE
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNzxuEA9ZuAy for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 16:39:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7C3E40363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C3E40363
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7C3E40363
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:39:00 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a6ababaaa9so17457935ab.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 08:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730824739; x=1731429539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ynx9qgUfwCCRgPEXQfAcsFo5HgM/wcqfB+v+1gfqdPA=;
 b=IwR7POvv30VQKCLHR2aIiNDcr3U6VBYAxyBwRAaLJUDpjHQQaN8f3jv2aZ52aarwD9
 J0s0OXoVYn7uV8xMeeQ0OPxCmNJ1uN7NgpLqIIv+lzYzxPiJyiTXUV7d7kIisn3H9WS0
 DeHhXiehDEAZQeSbuUKBcRoGDFP8vbUEdFHUcdueGsOjXT1SgKzJg/fXwLdDSXpg9juv
 MFzGmk30ev8z46zXkR8JSBogpSkH+mDlL3eTOD9kER3UBEWbKblZ8WOsrZO//1PAzeU9
 gXSuTb67RG6+sQxnH7Yax6gaJ+51yvLuNt7zuoitdXO33p+WtrhsNPZwJnb7Ywf8eoOI
 J2fQ==
X-Gm-Message-State: AOJu0YxUeQsDFm6pkR9wGbcVg9cfwASCatwz1Wlgnfjga75sEV/U2VxL
 hHZHk25qntWT6mSp5GxJOjLPRZlOUZiSS2rqR+cFfFOnT4jDFRLnFCCwDg==
X-Google-Smtp-Source: AGHT+IEjvZjMoxsSgcd0JUoehOzDbs7UugNSxQYBN6Iu6MWc2l6ZGWAzVrifnr4rL7QzA54stLvACw==
X-Received: by 2002:a92:c543:0:b0:3a6:c472:765e with SMTP id
 e9e14a558f8ab-3a6c47279edmr93203855ab.11.1730824739371; 
 Tue, 05 Nov 2024 08:38:59 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a97b007asm29274695ab.17.2024.11.05.08.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 08:38:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 09:38:57 -0700
Message-Id: <20241105163857.1377193-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730824739; x=1731429539; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ynx9qgUfwCCRgPEXQfAcsFo5HgM/wcqfB+v+1gfqdPA=;
 b=FqS9odKwHW+qgDPevsriWNmlURZcgeczf0mwOEOWnOqy3u3DXwH8/L/5LLn79yp8yo
 l2YB6kpTqYUuQrvAiTJTRLc0ACpPJkli0ABhf6kI34Z/B3GAw58P3oQBUDz6MB5Pg79w
 ehbTzmt/ZJCCL6NJJiONoK+B5ESlEYJ5K/Tu9wj+wETB1awncmnxMTVZ8TDT9xt3Rcni
 uclrUJmtzu5sTYusOpcjRnOJvfpSt45XjxIVycHCxZ96au9oe4+cdphalLvuady9gRrl
 0xTA7cMUsUpSaUNU5b5U50Gpfg+MJd2BND4BM2UuA18E9lTwRVf/b/zGP7eH81BKqAiE
 MmhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FqS9odKw
Subject: [Buildroot] [PATCH 1/1] package/python-betterproto: use poetry
 setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-betterproto/python-betterproto.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
index 70eb403f6e..0fc43e86a2 100644
--- a/package/python-betterproto/python-betterproto.mk
+++ b/package/python-betterproto/python-betterproto.mk
@@ -7,9 +7,8 @@
 PYTHON_BETTERPROTO_VERSION = 2.0.0b7
 PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
 PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/4e/94/930a1368fbed92adc897a9a1fae282e3f9d608547dbf805034ca549f381a
-PYTHON_BETTERPROTO_SETUP_TYPE = pep517
+PYTHON_BETTERPROTO_SETUP_TYPE = poetry
 PYTHON_BETTERPROTO_LICENSE = MIT
 PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
-PYTHON_BETTERPROTO_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
