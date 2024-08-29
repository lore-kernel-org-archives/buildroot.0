Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CE6C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD79B4199B;
	Thu, 29 Aug 2024 14:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cc6pif_ZOqL9; Thu, 29 Aug 2024 14:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7118419CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7118419CF;
	Thu, 29 Aug 2024 14:50:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F87C1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C86F606BE
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jDW4GUn8q0V for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADF87606B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF87606B9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADF87606B9
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42817bee9e8so6737305e9.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943026; x=1725547826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irgp99nIx2Wsufujjfh/ojJy5/RbRyugGbWA5z5tasg=;
 b=MVKujtz/ldrWr5hiGu63Ahw0tv1d7P/+ZwLfucjptE6c1T2wE5T1vcJ/MeUj9Y79ZD
 jH+GAxAkszOByz+HrVJz7UWx1vvsp2yvt3caeOBPvgrKFLfK0g5pUp5th1rAffYKKg8M
 AfsVTPTuYORA2Xt/LpO5aVm7F6ykbrN/oa8un5a6eFwN2gO7nnEBTRUt4egz7toB8U3i
 xdNiVR0krzGLoTke5Ixxt02WZlRwqU4saKGgpplKVtg85WrxwlKTtEjGk/5bN2g4OA/U
 Uk++bMpDhneYV3+OLZnDZGIKcKuekiEGCbZhc9QVrubjfRvJZKvCPKclrekNgv7jWzKp
 RoHQ==
X-Gm-Message-State: AOJu0Yz7kl06KtvZZ81RNV+1dXKw7pXuIUcFG3Cjm63aXvoNorGsetNh
 e7hX5FNMMfBXp/a7LIjHNNei1C0jIWLIn4t8Rr0YQ6x/48wLDx+spjJATA==
X-Google-Smtp-Source: AGHT+IF7O43xrMpXbmYOtV9vNacdFz2ebkKJdwkgfWbYq+92S5XDvwhoGVu9EKJFQtkyPIZzotXD6g==
X-Received: by 2002:a05:600c:4585:b0:426:51dc:f6cd with SMTP id
 5b1f17b1804b1-42bb01bfbdemr28935405e9.18.1724943025952; 
 Thu, 29 Aug 2024 07:50:25 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:25 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:24 +0200
Message-Id: <20240829144940.209964-9-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943026; x=1725547826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irgp99nIx2Wsufujjfh/ojJy5/RbRyugGbWA5z5tasg=;
 b=dwIW5NYN9upaD+s3TiddcvMqmAUxP43+YW2fFaEI7Ipbzjagw1sSaFZ+zHnEWY3OEi
 QVCTKx4GZwjnHGhGDeY/r8o1Fo8RIAGyoG/RIA5jajuGTfQprwWe5Nnh3JlqPaWWXjUR
 7n4PMPogTB2eKdseTmKhg10RE/9f3QdLlWYNkK+0m8TlZOGk93vhC4Bn1YGa2jefT7ca
 i8Ob296FgFj070LXZePGl5GlVAKztXBkv6ZPMaS/kPw8gtn8FBC+osZDc1Hk+isDaTi0
 uonZ9lUjjILstgsUZbajjQMhojqyJsf/aV9Hb/M1b5V7ZuXy9jm0lzt47fH6O8hBmmvC
 2R9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dwIW5NYN
Subject: [Buildroot] [PATCH v2 08/23] package/erlang-p1-cache-tab: bump
 version to 1.0.31
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
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash | 2 +-
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
index 83c40f37d7..9662c39aca 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c506d2aa2e59f1e0086ce32234618189d557a767312179cc1c8df19754131ca2  erlang-p1-cache-tab-1.0.30.tar.gz
+sha256  7d30cacd91b4a691e1e4bb458df895fd71803853a624bd0afaba0db4dbfc3f15  erlang-p1-cache-tab-1.0.31.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
index e2479b8214..07d28fd2d4 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_CACHE_TAB_VERSION = 1.0.30
+ERLANG_P1_CACHE_TAB_VERSION = 1.0.31
 ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
 ERLANG_P1_CACHE_TAB_LICENSE = Apache-2.0
 ERLANG_P1_CACHE_TAB_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
