Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C82C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 19:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C4F840B26;
	Sun, 18 May 2025 19:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huCGYvSP9S4H; Sun, 18 May 2025 19:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890CB40B36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890CB40B36;
	Sun, 18 May 2025 19:46:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A86DE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEDBD81EEE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8oz_90bT8A8 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 19:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C63081EE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C63081EE9
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C63081EE9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:46:01 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b200047a6a5so4208777a12.0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747597561; x=1748202361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTxLRcgRfE4qZGp7QkHGL28SfWsPtW7M4OqVfm7vpnM=;
 b=fB/w2zx/c90TC+sjRywGZsUfaQnjilw0wXILs6WVWr/PZZxxTZGDY3XQvtztEvndBC
 Pg1FkIWCbEmg5qFf3u1dXEVW8leia5rfSz7NXvPwT+dlIz0otqnVkD/WGOizZeQQkmPX
 k9bBA7HM8ua7hGijCVRULxDot1ob/bJMgKdLAqxUZXbVKP9Bt/STZxkHGehS8p95DpSa
 7xl7Ql6/1gYge4pPS9RAvFc72E4nCYi/uzY0ABkDjkT1IC1j2/J83JMTHffS+0/bzuaB
 twYkYxbXHErmZRzP2U9t9ZlmeDg9YR0CPv58eezsLlc+opwhuT6pvdn0dG2vCbdgIbEC
 6c2w==
X-Gm-Message-State: AOJu0Ywh2E/+K1wZd5B1h3ROrvrUIksOX+CFxATAqJtYzHz7skXybu5l
 gIYLo8Jgmtf4sxhHlnOrA6P8/6RfMoCPXNshP0KvMOYMKB1Vu98JEfJ+woF6e3H/
X-Gm-Gg: ASbGncv23mZ65BijuJCnecd/lBXT35hWJK+PT1XzD2vygEefN1l2omN6YvU5f2A41In
 rWco4n0dws2tnCALdVx0XyLk8uhSP5tuIZeAwOujmKVGSaYSr+xOI5V49dtqq9ZSoBhty1hF0WK
 nglAMRvOArwk1131sVrtoJOD/y6NcjJ+y1MrpKZEDBJO9JHxUGPahfR5Oi8Ka28YR7grXY/UVqX
 bTDHbSclJD+Bi+zRoaD4mM1VKLNIUdbuaRrk2N5j/reDyfG5WG+Gzjz38O91O7ceDYraoMlNjpC
 +MdlPTrBbSZ4//wRREVrmgptR3KSGFr+0d06WKPMKujEhaeXr6pW+NwKLcHUakirjgx8IFIPywb
 e4m3D3YTDoYFjWQZLk9kqUK8xyzo8NczukW/B9Q==
X-Google-Smtp-Source: AGHT+IEQmMqZ0NiQzYhurv++Gs0+XGFPTXU6M7OhOLYnUT+rFYKPw6xCeH4SGcb8/uHl4mh4Pki7FA==
X-Received: by 2002:a17:902:d4d0:b0:22e:3d2e:d94f with SMTP id
 d9443c01a7336-231d481919cmr163772545ad.0.1747597560765; 
 Sun, 18 May 2025 12:46:00 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ac95e1sm46664915ad.20.2025.05.18.12.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 12:46:00 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Sun, 18 May 2025 12:45:50 -0700
Message-Id: <20250518194550.108748-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747597561; x=1748202361; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GTxLRcgRfE4qZGp7QkHGL28SfWsPtW7M4OqVfm7vpnM=;
 b=IJTKr/kooByvDjduudlZ3A7s9I6Gf3Nt9EF3pWSFopCinncSdxndA1w8BGNp4M3akT
 LMEnZEq5EtY4RTKC33C0+ifUiCiCLL9dTsD5/82eVbelJ1VVEzO2NmKCKyHu9qdI73RB
 lzS0QhFS7Kg7U8VUIdba3bzRn4M09fiqG7NxfO9OEDLr7Y+M4kb2EJtCZ30y90G3+7W+
 SpDX/8YK05AsmP6QAQ3n6MQpA9pulsRIGUYDT8TXsCtkihJcbfUfL9hYXbPBGfB8llo+
 tVb3n6xLgG/j3UZ5LWgh0HeFuCVXZB0UOUj0VmD2p0Eaud/pRdI1YqaIhgJEraRuo2/N
 olDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IJTKr/ko
Subject: [Buildroot] [PATCH 1/1] package/grep: bump version to 3.12
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

Release notes:
https://git.savannah.gnu.org/cgit/grep.git/tree/NEWS?h=v3.12
https://savannah.gnu.org/news/?id=10753
https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00008.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index a0028a4e2f..fdc1505e36 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz.sig
+# https://ftp.gnu.org/gnu/grep/grep-3.12.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab  grep-3.11.tar.xz
+sha256  2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9  grep-3.12.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 61900bb957..9dff26bafa 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.11
+GREP_VERSION = 3.12
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
