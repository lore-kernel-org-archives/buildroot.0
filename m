Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACF3C433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 19:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B91C860BBE;
	Fri, 18 Nov 2022 19:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B91C860BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xw4JHRsfBODG; Fri, 18 Nov 2022 19:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B0360B9D;
	Fri, 18 Nov 2022 19:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B0360B9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 134171BF383
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 19:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E312C8229F
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 19:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E312C8229F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MSLch1X7BzHJ for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 19:00:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7AFD8229E
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7AFD8229E
 for <buildroot@busybox.net>; Fri, 18 Nov 2022 19:00:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x5so6602361wrt.7
 for <buildroot@busybox.net>; Fri, 18 Nov 2022 11:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wrLZKOfX8KFKkR3lL8QTTW+7eTBYIRaTH2snjIvyRjw=;
 b=h+fyyLm9j78zLdsYtU9JXhlXo/gcxb43oyx2pTGH0U0Y9AXs+5iwgHOxQNiNKwsswJ
 68NJvOlfg59K+Iah9aUCWJJjAd5FqpTDmTygXnExsKC0OWWvm5UQJvn+h+06/zWTd1Vn
 6foN8aOh4PtjRgzdjD9f6tIwkHbhVrbgbGvziH7eU7S0jmgho5W8cpdFbfQfiSolPa40
 rykcIkpd3QYmaao4krVlXdYQRbooe9lAa5BX0WPK1bYBn4Zq43hxJ0qw5Ae9yYI6p0FE
 7v0cfNtDZ0/dXY4hPrHadRLYPHBvaBQAd8ZONSQ7THlKoOj/0wqj8+CvI0Q8v4lTIyaA
 cI8w==
X-Gm-Message-State: ANoB5pmf9E7RvF1isMKKjiR/a/UHzjxgB/LWm+qf6XxVwV4Qp427L8xa
 s58Rz3qyUqJbBdhGkcux+QXh/baXbcI=
X-Google-Smtp-Source: AA0mqf4aELbuNAj4/R7OrBAtWNzyMgyqnGWUfI5gBjJqVjpmYh/Y9neU8T6m98+thZhmiL1QbUO1wQ==
X-Received: by 2002:adf:e50f:0:b0:22c:cc75:5aab with SMTP id
 j15-20020adfe50f000000b0022ccc755aabmr5002319wrm.143.1668798037106; 
 Fri, 18 Nov 2022 11:00:37 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b003cfa26c410asm11018530wmq.20.2022.11.18.11.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 11:00:36 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 18 Nov 2022 20:00:31 +0100
Message-Id: <20221118190031.1401109-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wrLZKOfX8KFKkR3lL8QTTW+7eTBYIRaTH2snjIvyRjw=;
 b=M/emnY6Cwe7HjkpegBxOp+eEVmS51veBrAYD6qrfb7tKxhjTf0ocYC6KRaOAguMn7w
 SZRJ3W+7B4e1teZ/4m1meA8sDQ1mOUSe6BRTAJ88b68+wvjYEtjtlA8vrbvE8R2FetBh
 n6RjLwblZPWXcVkwtw/Mf+NmUP0Ovb2ZQFa8hfUctHUJFlzQo7fXA40A9BoUSwQRA102
 NyQyROf+2jR/kJJ6fmU1HL4ucUojrULRPW7xFe/IJfTJlQOc0v1Z4nNrKtLL3fy2QIFe
 ru/luZGR9sGKiGTZy8KVqCC7xdy7ou7TdKJTKeVteggoE/N5tWzV98OGGODsbAEXlbSx
 eubg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M/emnY6C
Subject: [Buildroot] [PATCH] package/nano: bump to version 7.0
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
 package/nano/nano.hash | 6 +++---
 package/nano/nano.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 83de85b41..86f414aca 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v6/nano-6.4.tar.xz.asc
-# using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  4199ae8ca78a7796de56de1a41b821dc47912c0307e9816b56cc317df34661c0  nano-6.4.tar.xz
+# https://www.nano-editor.org/dist/v7/nano-7.0.tar.xz.asc
+# using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
+sha256  8dd6eac38b2b8786d82681f0e1afd84f6b75210d17391b6443c437e451552149  nano-7.0.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index ecfc37412..f9338550d 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 6
-NANO_VERSION = $(NANO_VERSION_MAJOR).4
+NANO_VERSION_MAJOR = 7
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
