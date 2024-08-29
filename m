Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D460C83F2E
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D4B441A6E;
	Thu, 29 Aug 2024 14:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgi8y-F4HUjP; Thu, 29 Aug 2024 14:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2568A41B93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2568A41B93;
	Thu, 29 Aug 2024 14:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D721B1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4CD0606B9
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9kxYFmoVW9y for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0DC66069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0DC66069B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0DC66069B
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso6892125e9.1
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943041; x=1725547841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aTYJZUUOGdxPilc7wM4kw4fLIiJ/wjCEowkQt/gJQs=;
 b=vjOC4qRQ/ScFbDKDV/kU1VyQGK6NSlyaIXuhszVREBQBz6JDCD2VGtrN1CcQBrhbH4
 HOouhigGcho8NSmCAu1JpMNq4oASR1nWzkJawjmX5SaCW10R2hk39GKrzMouXoodvlzv
 3DvhBpU4BTDZkCpIqifgwtREkjWthxWn4KlfROZqgAtanUbGSSIjQknsnxc5Xczh2TZT
 KLK4cmM4RHfrC3YfJo9TN98nPRUhedFCF7M9d56VaZfSjNtr7m6vom/X5Xn0R2YK5RTy
 SOSgqwAqfjJqtLCbcdvdq81hwJXRSNVqjRrkusLuGLUPNiVn93Kfo6Z3xoQppDCA7Vp7
 2M0w==
X-Gm-Message-State: AOJu0YxHctwRg4lBrw0m+NLdpYWStnahxKk3T3PfU4dAqwihBg3aX6wj
 XtNklhZngrjzNF5XKYa1awYTo2t4SsUKOvlzQLAJ0B+qrIxkMnOKb88PEg==
X-Google-Smtp-Source: AGHT+IE3TUmVJAzI9hHrLhK816N65B0Opx6Eg5nrQM6v5Jtfv68IkH7Bwjdb36IP3xgwlaOwcWiWOg==
X-Received: by 2002:adf:b34e:0:b0:371:8c79:73c1 with SMTP id
 ffacd0b85a97d-3749b526dd5mr2260611f8f.2.1724943040485; 
 Thu, 29 Aug 2024 07:50:40 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:40 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:30 +0200
Message-Id: <20240829144940.209964-15-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943041; x=1725547841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aTYJZUUOGdxPilc7wM4kw4fLIiJ/wjCEowkQt/gJQs=;
 b=cAl982Rfcltik3fDEC934etHVnh5wd7iuCwRE9JOcBQwA20slwr1lyADEVqfLJnEVq
 xJZg+b353XUz2riFmKfxO2qByeP4w97H5a/afLkbUcRAlfLVEmWwypJLHYDU6Fs4vdmT
 KyMGmRwUIj54szz4ObqaCVuhXyLfAW0fK/+1LGLXfJERXEtYIrWb4mXmNaiHeJ4DSLl7
 lBuxnZvcWw1vu86gxVeDsm7vgd5qXGXSxCtRP78/RforsSlZUmO4lfuK8RhfLg/+Yf16
 JiQaspN4Rhbk9PpDQCm2l4C5IAA8+haiw2e5lMGt0E1xxq2X+6YUtZyBkMeMvCuxL4Lp
 6cPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cAl982Rf
Subject: [Buildroot] [PATCH v2 14/23] package/erlang-p1-oauth2: bump version
 to 0.6.14
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
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash | 2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
index ac87485d5b..dd2f8782b7 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a33d96ab007b77759f48613a65794351569e7d2d800700b71e50448eed0e3b8  erlang-p1-oauth2-0.6.11.tar.gz
+sha256  6437184239ea3053584834771776062c4e055e897dc6ca94dd8f960f393d891c  erlang-p1-oauth2-0.6.14.tar.gz
 sha256  0ecddd0a5e35b7fcdab451f54c5bb688fac8365cdf6b0da0ac64b7895a0770f3  LICENSE
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
index b01a391963..09bb0e6752 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_OAUTH2_VERSION = 0.6.11
+ERLANG_P1_OAUTH2_VERSION = 0.6.14
 ERLANG_P1_OAUTH2_SITE = $(call github,processone,p1_oauth2,$(ERLANG_P1_OAUTH2_VERSION))
 ERLANG_P1_OAUTH2_LICENSE = MIT
 ERLANG_P1_OAUTH2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
