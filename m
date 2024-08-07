Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C431C52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D15FA608C9;
	Wed,  7 Aug 2024 14:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRgJkRbewpc7; Wed,  7 Aug 2024 14:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97E5C60A42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97E5C60A42;
	Wed,  7 Aug 2024 14:34:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26DFA1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21C7D40198
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMo1P5TSfIGc for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02E7E40197
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E7E40197
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02E7E40197
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4281d812d3eso17992655e9.3
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041278; x=1723646078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkgG5FVSNOu8fIqhzjSMX/lC6z2zrJCiefQcxDcHI+c=;
 b=RnuNzDHyickJ5pojiI/C/fwY/RZDmV3yWYSvP+2axK2HLk5NAVWPhEAOjzqRu7b8B1
 ilNJ0TweIMG27hFyfxipr+68Z6An7SbltGMYuQunl7sZGNjiIyA+zJIN7I5Woa5FYZ8v
 U/DPAehubOieiW8v2N4K12VOethj/SqRiwXsCGi6MM4z5hzrXZt+8pRdQG3JSsPIxAHX
 xMwOSz2qSDt4nFShdJ/rbm0+GScc2H6iiJPet0roj3fq0TPIfyabOmXf8vW8tb81sV1d
 xmQaoTp62xfk2ZvNLNMNXyzuZGL93PHJxaIGDjmovIlsEJiSe3yZcdGvfWhGxBCC/nKd
 Db6w==
X-Gm-Message-State: AOJu0YwyLKx9hqOz0yWnQVuw7F3HXxYSjom4NZ5vSNOUDmIFmDCzsvff
 6SCCQAZj8qxX6Wb5NqsMOo+LICRwDqPNh0ssy+TcAUhuVkm4dTA1E2nbqw==
X-Google-Smtp-Source: AGHT+IGNZz6t4LjuriK23jacV04rHzsqpO2TMSt162QIjQd6kl1wSuEomOnXAufFdHPC2cuCUVJ7Rg==
X-Received: by 2002:a05:600c:154c:b0:426:62c5:4731 with SMTP id
 5b1f17b1804b1-428e6b7ea40mr172957195e9.29.1723041277619; 
 Wed, 07 Aug 2024 07:34:37 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:36 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:09 +0200
Message-Id: <20240807143318.439619-10-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041278; x=1723646078; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkgG5FVSNOu8fIqhzjSMX/lC6z2zrJCiefQcxDcHI+c=;
 b=XBlLLg8rmwCzAYRBH5HKJ1SvLZSVbdHjW44ybQOjQxv2yUwytrrK8GThMgZ3LUH2RG
 heHEU7DRs9LBDHClBNFzcZUSX+0scciuga0oGCMRiQqXvZ24sXUOV/x9p7KKWluypAzw
 UkmA/mv17KJFWqk9hyYhqqRe5JIDRE8dRKEb1SFYwmC1JnWRz1SjcibSC+lmHJ/Njpe+
 NaR4Z/pLm3ob3KZIcMsFmLAjw8GyPoJjlwUMrc5B05coJzb+rccKYF+I8LA6k0stk3nb
 ux53HVpGVQjtpBdeAQMTDbYvSKZVdk/5Jb22tgrKk1TNTk/UIIf3i/nzUvyDgyWgvnrw
 yWxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XBlLLg8r
Subject: [Buildroot] [PATCH 09/18] package/erlang-p1-yconf: bump version to
 1.0.16
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
 package/erlang-p1-yconf/erlang-p1-yconf.hash | 2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.hash b/package/erlang-p1-yconf/erlang-p1-yconf.hash
index 25d873b58a..dc2ac9937e 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.hash
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0280358c868977105104cfffa7b1fa2c5bf7856243cee9b7df974dc54904e4da  erlang-p1-yconf-1.0.15.tar.gz
+sha256  0f33a381cc580dc43284581e61e531293d1d358e35a32e51b8b4fda7b462eba1  erlang-p1-yconf-1.0.16.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
index bc72f282a9..297ab20bb2 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.mk
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YCONF_VERSION = 1.0.15
+ERLANG_P1_YCONF_VERSION = 1.0.16
 ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
 ERLANG_P1_YCONF_LICENSE = Apache-2.0
 ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
