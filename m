Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987FDC83F2E
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6671B41B07;
	Thu, 29 Aug 2024 14:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmIEaFmOt4vD; Thu, 29 Aug 2024 14:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BE841A6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BE841A6A;
	Thu, 29 Aug 2024 14:50:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2215C1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 385F440442
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VqaxjSfPgxo for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31FD840132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31FD840132
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31FD840132
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-428243f928fso8861545e9.0
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943037; x=1725547837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNrkkdkOzKMHElsm0MRQ/gNBkacvDh3hekd8emakAwE=;
 b=CtVjmc2L3ETbmc50vA5tY/SgIGvTljKcVIwADJxRCEU4VKNZ+v1k5q45lFc1y9VqXG
 IxAZJjX61t2kVbVEGJLC/ovtnv5XIizCIutN23kX0R0EGtCQkW0/cAHl2jFqr7u2aJQj
 5FHSk5VFXF3NST0IZ0s7+N+KOKqRfVAWytfKA/5nPE5C81Vwp0ShYganz6zc9MSfHXPZ
 GsN9thE32U25PgczagiOjrzD8ACaQo1o2W4IXGLqKDcCpgIp9s4MxQvMSq+Q3g+lj2Yp
 INvJycCLRqe1lVTbWvq5BAQj/dYoe4H7unSEfSkT9sAGiKSONKym+xuE9bv0E9o+81Kp
 87qA==
X-Gm-Message-State: AOJu0Ywuvu22UPAjpe3Bs7wFMYlhrIN9GR3WtYNONupV8PNc4SpWm7jz
 0umkkLeANEsOrpEorjehu3baMW+A4RtYP8obABY1P7//nap4Kw3OGMOfzg==
X-Google-Smtp-Source: AGHT+IG6shJQ4C8fPLlStLmnhNeVppExEpPGzCawROvEDx7zraeluFxd+33eEYO3KbCq+7TT5HnOGQ==
X-Received: by 2002:a05:600c:1d9d:b0:429:d43e:dbc3 with SMTP id
 5b1f17b1804b1-42bb020b7efmr34482815e9.34.1724943036737; 
 Thu, 29 Aug 2024 07:50:36 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:36 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:28 +0200
Message-Id: <20240829144940.209964-13-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943037; x=1725547837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNrkkdkOzKMHElsm0MRQ/gNBkacvDh3hekd8emakAwE=;
 b=YvgPGM8wMvtyEqVephxx/SC0WWG3mWp9f53SnTvARvJ50FBr5wmKeTJaXX3Isj9qC+
 cVr/yFb8079NoVPzZey9vIHLumpZKMSeFfxHZmluX7zHFMjGuO0ltXPyCJA9GZ0Fghl6
 Nmd6Ru3h/hCkYkaE4j9lS9pA8q23dyFytRYsBaXWiohjfdhselvpZ+qKamiy957B1tFr
 O2XWX/CNh6/iu41PZdMrFT9Pka3p6n0Xv3Mj8NvCl4j9VdXpLKChnV9KxLjL3fAU4A4G
 jAZmGPX0zdrja14Oy7y0cPDT8ETbDqPIz+FmG2yOGIwx0rdTmily+Gy+3jfSbz7s5aUW
 Lucw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YvgPGM8w
Subject: [Buildroot] [PATCH v2 12/23] package/erlang-fast-yaml: bump version
 to 1.0.37
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
 package/erlang-fast-yaml/erlang-fast-yaml.hash | 2 +-
 package/erlang-fast-yaml/erlang-fast-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-fast-yaml/erlang-fast-yaml.hash b/package/erlang-fast-yaml/erlang-fast-yaml.hash
index da2ccf13c9..863781725d 100644
--- a/package/erlang-fast-yaml/erlang-fast-yaml.hash
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-fast-yaml-1.0.36.tar.gz
+sha256  a8d632d97282cfdf54a0172df59d8641f37de690dd886d0b2e4ef0d4ff876077  erlang-fast-yaml-1.0.37.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-yaml/erlang-fast-yaml.mk b/package/erlang-fast-yaml/erlang-fast-yaml.mk
index 861706b547..675dba0839 100644
--- a/package/erlang-fast-yaml/erlang-fast-yaml.mk
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_FAST_YAML_VERSION = 1.0.36
+ERLANG_FAST_YAML_VERSION = 1.0.37
 ERLANG_FAST_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_FAST_YAML_VERSION))
 ERLANG_FAST_YAML_LICENSE = Apache-2.0
 ERLANG_FAST_YAML_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
