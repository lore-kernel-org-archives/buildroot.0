Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ADDC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4061608F3;
	Wed,  7 Aug 2024 14:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SSM86Lvm9MU; Wed,  7 Aug 2024 14:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8828560A84
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8828560A84;
	Wed,  7 Aug 2024 14:35:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4BA1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47BFA606F7
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BpqUmUT_Z4k for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62BAA60900
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62BAA60900
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62BAA60900
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4280b3a7efaso12768125e9.0
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041288; x=1723646088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uEhJr/aAukhiqpwoc+Jj8XHienjdDJAjrtFsn1ZqdGM=;
 b=d8etDqkXHIidtuxCsYMkgDVAdsYzUwW2WwHz+eIw+bbuH7KuYlOEu2fQ6fFfH1QwpE
 x0FTb/82ZQfy5lxZHpjglP/ifbiT4knDwEJtJHlCnIQxSZ2lX6WEVxYnIl/i+lEc3LE5
 8mt4Q9fzuy5tnzOGVYg7+1xjbefav8zsfPJpJqVwLpFtrXtqDr4/+VLoh2fuDg1Uj7Qg
 lQ9zt7joOVBhlSZAavmmHNW4uXAw4JpJgUhW49sPTNj1VC9aHidfTtqVn8H+s7xZDtNC
 i6jZjt1/20iOje9tdPw+dF23CVe+j9szuijhoI7l3T1pQ0Sy+RU4dC7ZKf9Bb4ib3gfF
 cl9Q==
X-Gm-Message-State: AOJu0YwKPxmNZun3XncCbfFAfZJL+IY4d0y/K9U9LXYOjKxt5+wOoFXW
 E9qhCBkWQbfH9n2CIxLG8GyTAbHOqmzs/pd8KdvVW+V7xLv6flE08VSHNA==
X-Google-Smtp-Source: AGHT+IGEeBS/7Q8B/rpUcMxDctSPwJ/+HkLFDWToSgoqfgiFgGHAcDZcYuKFfOohhHIH5sKQbV/GDg==
X-Received: by 2002:a05:600c:3103:b0:427:d8f2:479 with SMTP id
 5b1f17b1804b1-428e6b02275mr117730855e9.14.1723041287786; 
 Wed, 07 Aug 2024 07:34:47 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:46 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:17 +0200
Message-Id: <20240807143318.439619-18-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041288; x=1723646088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uEhJr/aAukhiqpwoc+Jj8XHienjdDJAjrtFsn1ZqdGM=;
 b=KLZg60p1FfrbJaCk8q3IJKF+frTm2kN5N8tTb5S94KniooN4ud4XhrybVqm8paenCF
 axeGtSjDyTal9TfQKabhMgzoToiGcMHCy1HDCWHhI90mXkM5n40KQiGSnkcgqycKgN13
 6QWCi93HhYJdPYtkPqe8VN7DsMpkABvtlYhZ0D4LiAsXkxewgtysK1rEvkaplenBUhgW
 LdkuvxEvngFFyg3lo9pkqMPV58TSDKBTAvpxI2tZAvB5aq0JRqRbPO0/+tnFMnp/O1f0
 Q3a9/fh0EsynD1BfeuUE5+wDvgpKCl+Bx3g/RFDzNYBmli2olE2pLyaCGiV+NHEsQDQO
 NllA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KLZg60p1
Subject: [Buildroot] [PATCH 17/18] package/erlang-p1-zlib: bump version to
 1.0.13
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
