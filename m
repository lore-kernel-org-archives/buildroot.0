Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8A0C83F2F
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E15341DBA;
	Thu, 29 Aug 2024 14:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlBvCVfQ36ah; Thu, 29 Aug 2024 14:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7266441E40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7266441E40;
	Thu, 29 Aug 2024 14:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD771BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 020D841BDE
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPvHfemgSrnS for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F5F841B84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F5F841B84
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F5F841B84
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-371c5187198so495513f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943052; x=1725547852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uEhJr/aAukhiqpwoc+Jj8XHienjdDJAjrtFsn1ZqdGM=;
 b=D5HeLUb1e+0xy+iGzGNihB9U3pZH3JwMl2/HINO3uShniOzWrpZWivxiMYj0z1I6oZ
 MkQpt/uSncLDKD8Rne0VYQ8H84MZyb/t3SwZsWCzcRIz0zfzHL8zjSOIg6CC/2oF3YhK
 ro5Q9IuSc66NJp4KZ1OTVKSNMDABRQfvFiMSnya77xoDWNS6cOLi0iZ9cXWWZYLuQKB+
 Z5XLpXcNd/zKkZpSJh/Hpo+g8GrXuHFagA/yUygSjMeR6GQeePL9+MSluSLnpj69Blo3
 bzcgGkQKy8JwY1ruKmqEK0gtU7dJ5ay1FFoRQ8z/gV76wfkNK2fDhXtRSj6l2dh9seLk
 X9Qw==
X-Gm-Message-State: AOJu0YxRSZ5YwKU2aGF/LKsAKKEzRGgUtW5Vl/OE4WJVifbrt/luyHgD
 kq4tJ8PDDkC+akMte1TQa6cvu4SK1v7aiX5j+bESRR/t88p25Ak29FAI7A==
X-Google-Smtp-Source: AGHT+IHLAtaKI8LjovR4uKyYfC2v3u7SBXYlntAc73/gzY7hm3UPrm/dO9/Kjb7uiK8RtpVXAVgDTQ==
X-Received: by 2002:a05:6000:1802:b0:368:4da3:a3ac with SMTP id
 ffacd0b85a97d-3749b57ec5amr2192097f8f.40.1724943052458; 
 Thu, 29 Aug 2024 07:50:52 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:52 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:37 +0200
Message-Id: <20240829144940.209964-22-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943052; x=1725547852; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uEhJr/aAukhiqpwoc+Jj8XHienjdDJAjrtFsn1ZqdGM=;
 b=PBsA/lx3tiNo0Ww3tfSejCXN3kX+9T8+FGb+VCHZcnP+0rOJsIYS0ByC6H20hPfRZt
 fwpQmruuYLMCl1itA1fbWDPFz+Eu/FIwCJo2lVryXLXmvYgM4NnLww/NNS5Mvf+0k0vA
 NK0mdJeIDoLqkjEuS8vmPl4JLyjqTalv5d7YbQLlLS65eotegQjFaJ8/LM8fuJoChDQs
 212nAqsnV7ndXCqcD0IUwJSuog5LwzKkXbBSYSgenwLhpIfkempmsm55xEu0bIyS/IbM
 Xp814kkhoTIrty+5T7lZ4EdtZ3tplVEY6UDE7EgL6jeuCAaLM204S/DE5PcLNrxm+4Xm
 VyJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PBsA/lx3
Subject: [Buildroot] [PATCH v2 21/23] package/erlang-p1-zlib: bump version
 to 1.0.13
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
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index fa8cdacd8c..9d4399b9a0 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f2e7a3d17bbd752ad3ffd8a24c7948bf7c211c67c953a98c03110ddc497798d1  erlang-p1-zlib-1.0.12.tar.gz
+sha256  ae14f266e50c843a46bfcd5fc480112416cd542e82d68c5a97927118ddfb8187  erlang-p1-zlib-1.0.13.tar.gz
 sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index da55d310af..fd20464cc9 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 1.0.12
+ERLANG_P1_ZLIB_VERSION = 1.0.13
 ERLANG_P1_ZLIB_SITE = $(call github,processone,ezlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = Apache-2.0
 ERLANG_P1_ZLIB_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
