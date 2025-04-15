Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54218C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FAE61087;
	Tue, 15 Apr 2025 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ROZ5gB-glUW; Tue, 15 Apr 2025 20:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 057656076A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 057656076A;
	Tue, 15 Apr 2025 20:15:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBC22109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCF1640290
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDsPBWmgdTlw for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1962340C4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1962340C4C
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1962340C4C
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:15:43 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-739525d4e12so5557941b3a.3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 13:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744748143; x=1745352943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fFLq734U74fyfNj1utm6xNrPBEgII4B4qHw/ltdkkv4=;
 b=mKeG9y3kRZZl8acCe9KQuE7yhg2EQRA9bKBAdrrqEBB/EMPh5j6rY4SfkaW4W7fQEE
 6rrOjffDmD6DARBJRDE0oUXUJKwv5WvvugVrRYDBUIZ5vuL6hSjLxX/lNobnS8uL9JJK
 MJQDFbv/wVDkNqS4dlsbW9ELYNU8dRq2+MUeOBjmcRUyWpHBwqCpMKPOGo5sXd63r/E4
 ab+618cHZ5YErSkPUymphoR9h82zRua4Xj0F54xfp7V5/0z2voghV3RMdDE3GKibwG+G
 MQfLHiflc+9SL+ic0UStc7/AV/sKM9Qk5W3LbIRULaPaBJ21ypBIHRdp+PZyzMcpwiUo
 Hz6w==
X-Gm-Message-State: AOJu0YzF6S/mGbmLomdxFsnlnYbh1TPMxba2Lu0eJ/EJit+ELl9Qyfdt
 jcg0i9kWH0QnObX6Q1LkeRJ39/lsiFb4XPtEqcMKbL60ABjWLhwv6AgTtA==
X-Gm-Gg: ASbGncv8ru7UBH8/IYnPymYvafkb+oQUCk2Cg8ByrGs50n2uGqrak5++iMB2J/ZlUGY
 C33uUESHVrTIMXVgZV7xotsZCEckphLna0mfDFAMt8vqsMvdjwoYLTOY9JipyRxIOrfUT+3omVv
 FTdl+JvAdwJSfLZ6Nl38l31kT4he+nIukP82/5Dm0/RWOiSMVkfoPLkJOC33pjGd8NXsVkJzaz9
 4hQaQkHTcDGZRqSS+QxKEH9vl8g16pU6e48ptfJfhTxMSbu4tlcpPBZTmW7HGUPx8h3yL+rEuWQ
 8yezAS5Otua0IMyIyJRa3w==
X-Google-Smtp-Source: AGHT+IFcPXjZ9v9WiYxF7p4S8IalIBfwoAB8/1u6msox7OXkls7vX23Ok9JmK7IKfpYQaKB/gAvnGA==
X-Received: by 2002:a05:6a20:c707:b0:1f3:3690:bf32 with SMTP id
 adf61e73a8af0-203adfdf29dmr521938637.18.1744748143025; 
 Tue, 15 Apr 2025 13:15:43 -0700 (PDT)
Received: from ProgramPC.bm.local ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a0de8926sm9593462a12.30.2025.04.15.13.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 13:15:42 -0700 (PDT)
From: Lance Fredrickson <lancethepants@gmail.com>
X-Google-Original-From: Lance Fredrickson
To: buildroot@buildroot.org
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Tue, 15 Apr 2025 14:15:27 -0600
Message-Id: <20250415201527.2035915-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744748143; x=1745352943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fFLq734U74fyfNj1utm6xNrPBEgII4B4qHw/ltdkkv4=;
 b=LA4/9CP7WjjBqZW5ROxJGaKxvHOdI0yhYcLPxWLJG/beiKDIp7XA1pcE8Z+HJX5aJf
 mBDf68TjRV4S8LE3QvK0c5FO5k2+dNAenws7XFB5pOTBwsN3jdf6kQhSus7KWVeDEqhR
 19cKSINIOzKfdTIgxpYh75LDQfKPHAwEJww3gxX4boQuPhGj3sYdScgW4ydEKXOHFeDv
 gSEc68e6QbAXPF08KC3ZKlL+rqvnQbD0cVMURyTCQ7JyzIPE0E6ShG3yQha/X7yt1BbZ
 1wyWCPpX5Pl8VBPlJQTKD+hMbGvNndrGVPIkNkeIYLj/XUq/ql1tSEDnS/s+4nCaB8jA
 xoQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LA4/9CP7
Subject: [Buildroot] [PATCH] package/ipset: bump to version 7.23
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

From: Lance Fredrickson <lancethepants@gmail.com>

https://ipset.netfilter.org/changelog.html

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
---
 package/ipset/ipset.hash | 4 ++--
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index fb9b8c40d2..7be4b368c2 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From https://ipset.netfilter.org/ipset-7.16.tar.bz2.sha512sum.txt
-sha512  e69ddee956f0922c8e08e7e5d358d6b5b24178a9f08151b20957cc3465baaba9ecd6aa938ae157f2cd286ccd7f0b7a279cfd89cec2393a00b43e4d945c275307  ipset-7.16.tar.bz2
+# From https://ipset.netfilter.org/ipset-7.23.tar.bz2.sha512sum.txt
+sha512  5a43c790abf157a55db5a9a22cb5f28a225f5c7969beda81566a2259aa82c9d852979eb805b11b4347f47c6a0c2cc4de6f14e4733bee5b562844422a45fb9dab  ipset-7.23.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 9832d8fd30..ba53c1f8bd 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.16
+IPSET_VERSION = 7.23
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
