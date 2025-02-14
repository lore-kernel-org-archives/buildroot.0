Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E779C021A0
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 02:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485C86FA0A;
	Fri, 14 Feb 2025 02:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxuSEMODD26V; Fri, 14 Feb 2025 02:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66AF86FA23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66AF86FA23;
	Fri, 14 Feb 2025 02:14:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B1501C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 02:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FA9381289
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 02:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IuZ4EZBVL5F for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 02:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6AC4811EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6AC4811EB
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6AC4811EB
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 02:14:35 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2f9d3d0f55dso2315402a91.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 18:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739499274; x=1740104074;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R6XWrgT/B6tsRG1OByJey+cdE8GET0mWqCY0CCi4Shg=;
 b=TGozoWVH8u0LyF+mtbM9gy92bwBIZz3pEvPaGfhqNi0+iPPSZ3LD6AZRGWo9v25zpr
 qDgLDkgpbaonT3+ubRkJF530IkhmGCaS9hw6UVzUvryNvYF/ZBvzrdEou1Ghemi4Vi81
 zbrSFKP0dLtKTxUUEk4Z3Aj7HjsUzkhIH3hf7A3e5NQculg3htlX/HzDARHJ4YTQZRTj
 Y9vA9oYovTQJNCIkT/DtDlq4Td/VuqaXyt9pgF2Agm+YoXSO69zqAVBzP9EC7A2QUpOJ
 fE0oQDhqZhHqgsJFhQ7bKAIk00zqgrXL3/PZjg8wzOx5VtD3KiDsxARPj0xGvK2/sK6y
 /erw==
X-Gm-Message-State: AOJu0Yzd+SFr/M58GFxuYnfRZE8OS1d/lT8F6sdJFjAr0NkAttDCpcyG
 dGO5MC+NyGT2nasyA4IMw5cZ0nIO6aq+GawYjuZFzGEMAM78sq9LFu1U+Q==
X-Gm-Gg: ASbGnct5N3I0paaVJlqlZqQvB8lxiHlCC6qnffEAd3/XgLG52s3/olmpFXAoM21xqC7
 tQTmL67JyoCbLNb0yleXwqZLDRafi655lXN7BF+LawCJxIqlM+pVdt+T5ORf6D6XhYdE9ch8flI
 eC5JgKtzjh4bZCN5a6biQE0ljIrMVt4stLLU/uMnL9C7c0f3qAHLVu7fFnyvgCMdB+zwLmb8XL5
 9u2jwEkfbDrIhietV+FMdpQuURxplAhbuZ/CUp6571eC/TKdo2uHWWnfrNa9+HcaWapfB2IXl3m
 uXi1eWkvgEfR
X-Google-Smtp-Source: AGHT+IE/LHhWLY7MdDve6SiCw9SD/3/Dkovr9HnUF51hJD3EmW7xu5aslZh+H4zgMuKXObFsSgqz3Q==
X-Received: by 2002:a17:90b:2d03:b0:2ee:c918:cd60 with SMTP id
 98e67ed59e1d1-2fbf5c0f600mr14023714a91.20.1739499272511; 
 Thu, 13 Feb 2025 18:14:32 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d536437asm19345655ad.72.2025.02.13.18.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 18:14:31 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 14 Feb 2025 10:14:13 +0800
Message-ID: <20250214021416.392363-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739499274; x=1740104074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R6XWrgT/B6tsRG1OByJey+cdE8GET0mWqCY0CCi4Shg=;
 b=fmp2ezCgeD0I6nllfD+6lms4rWa3Mg1/tOEKxqll7OFqFCiI7XPFgQSTqlZJ7+pMHc
 5D+6+iuj1dAkmtq/93zT59WHBoE6od/NrcWdkoGBUQO3a5oqxJR5c134Aw+aR9Ye2VKi
 38NnsAIxiQiZHJNiJ6UXEitNnJUOGqynWzqeM7yPMi9Ef/i+imxxSl4FH0tgjW6ZIDe0
 Y9hATBJxhfbDCadeu/EHGfCZ2mEDrZazDOhKooWVl/jqPo+sKs6di4p/LLa7cgURlCmG
 0C7Tvn0u9nSNWof+HkYEcn4TPvcAauVO1dlUyhXjbBi1KmLClleKNUXjlle8/VuZ3q3Y
 f3pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fmp2ezCg
Subject: [Buildroot] [PATCH] package/sqlite: fix configure options for
 readline/editline support
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

The autosetup script will skip checking for readline.h when cross-compiling,
which will cause line-editing support for the sqlite3 shell to always be "none".

In this case, if the --editline option is provided, an error will be reported:
ERROR: Explicit --editline failed to find a matching library.

We can use the --with-readline-cflags option to tell autosetup where to
search for the readline.h file to avoid the disabled behavior.

In addition, the libedit package actually depends on the ncurses package,
just like the readline package. So when using the libedit package,
also add the ncurses dependency.

In addition, there is no need to pass the --disable-readline option when
the --editline option is passed.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/sqlite/sqlite.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5a8b033ce0..d3b69f2a93 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -44,9 +44,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
 SQLITE_DEPENDENCIES += ncurses readline
-else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
-SQLITE_DEPENDENCIES += libedit
-SQLITE_CONF_OPTS += --disable-readline --editline
+SQLITE_CONF_OPTS += --with-readline-cflags=-I$(STAGING_DIR)/usr/include
+else ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_LIBEDIT),yy)
+SQLITE_DEPENDENCIES += ncurses libedit
+SQLITE_CONF_OPTS += --with-readline-cflags=-I$(STAGING_DIR)/usr/include
+SQLITE_CONF_OPTS += --editline
 else
 SQLITE_CONF_OPTS += --disable-readline
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
