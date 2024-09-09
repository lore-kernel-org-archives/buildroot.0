Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A71DECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46C25810ED;
	Mon,  9 Sep 2024 16:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPqhwIxLatZu; Mon,  9 Sep 2024 16:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1788810E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1788810E1;
	Mon,  9 Sep 2024 16:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17F8F1BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C50280EBB
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsBvjIlghfSx for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6706480EAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6706480EAC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6706480EAC
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42bbe908380so40860245e9.2
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899279; x=1726504079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uo3kubv8n3WgdcP6289RwRrSMCsgeB7vvAZNYgfAC34=;
 b=tRCdVW9AOdn1hyE4DdLgE/zkdeUgLCJcOGaagbNm9SMh/AiiWBxV/yp+H3Ck3IyGZA
 7AaDy/RHhlPqAEsHPVaDLSgwBtjmNYYOL4PlvjJ82qjerhcnktEIQMQNF/BbtpIEMjsa
 5kD8hrzbMMG/2Ci/9f6tHVevQHmleswPICviHId0JO2Lsjrd/5AU3k6UVdskm5kniPTy
 QXARwQlDDX65z0XlgT/0+Kf24TlCrUrppgvM99SJvu72XNHvXAI3LXTEWQb+n6UBOSeT
 eXK0hxB7zcQ26e0kqEnV1VonztiCdSptrSv64oZ2AZli4ntaYQ1q4QGHJPQ11TxaWa8l
 ydJQ==
X-Gm-Message-State: AOJu0YxWDa595G6JCZJwUpktAr8yxk9G5Bj6nbeswd71DededwQNk9os
 73EsnELGPzR5qbeDJJdzzoSPyjweddp7c7XUbrvJ1uSJrV2LXAUARDHCqd+8T6tLiqHl6+YGYmS
 zpw==
X-Google-Smtp-Source: AGHT+IHMbBH6ISmjWunH1fYjIvrG6JDIRTwXw65LRfoB1CDiBmnHoQ3cKxRpbi77as59FFxJChiYvA==
X-Received: by 2002:a05:600c:3511:b0:42c:acb0:dda5 with SMTP id
 5b1f17b1804b1-42cacb0e2c4mr65774345e9.1.1725899279227; 
 Mon, 09 Sep 2024 09:27:59 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:58 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:55 +0200
Message-ID: <20240909162703.3439481-13-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899279; x=1726504079; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uo3kubv8n3WgdcP6289RwRrSMCsgeB7vvAZNYgfAC34=;
 b=I4ZVrpsA5STB+ji879DRlrl7rBjPjBqXNtdLcwZQalesfvSH8hjj1sxyEbaBrfWOlc
 RHfDTVkHliZPQ3kyf7DaR6qArktRDDlGx7JkTUzI4Ln6mb86pVj5LfMXnfhMWNMrELrm
 FUjvSbmVf8EpA8LcVUjjq6qTiMlbLw/oXZUb07sienJK40E/zS+iZfM0P/0SqK3uzp9F
 vXoV7G+oavq8uG9J4PgtlhrFOKa7+r8kjlkv6f4L4JJfKjgA5DiSWUxP/sE3p60VWuc0
 WBF3g9P8EZGokd1rQlvwm1rKOjrffyDUizx3UHqVVpb2nBoRxxMuz7UsI/okujHvhcKW
 TtxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=I4ZVrpsA
Subject: [Buildroot] [PATCH 13/20] package/perl-try-tiny: bump to version
 0.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-try-tiny/perl-try-tiny.hash | 6 +++---
 package/perl-try-tiny/perl-try-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-try-tiny/perl-try-tiny.hash b/package/perl-try-tiny/perl-try-tiny.hash
index 7aa88724f..fb1acc21f 100644
--- a/package/perl-try-tiny/perl-try-tiny.hash
+++ b/package/perl-try-tiny/perl-try-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  993a29ee8a03c9bd9c2f7c53d1082a03  Try-Tiny-0.31.tar.gz
-sha256  3300d31d8a4075b26d8f46ce864a1d913e0e8467ceeba6655d5d2b2e206c11be  Try-Tiny-0.31.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  964424fcada4654bede745a7a2fb870b  Try-Tiny-0.32.tar.gz
+sha256  ef2d6cab0bad18e3ab1c4e6125cc5f695c7e459899f512451c8fa3ef83fa7fc0  Try-Tiny-0.32.tar.gz
 
 # computed by scancpan
 sha256  f1864ede834871a1207fcd19838b6bd5e1ff0a8704f5cc523fc397126041ed0b  LICENCE
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index cd2421a3c..466955fff 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_TRY_TINY_VERSION = 0.31
+PERL_TRY_TINY_VERSION = 0.32
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_TRY_TINY_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
