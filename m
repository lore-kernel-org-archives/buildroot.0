Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45366C3ABA3
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 08:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA5241489;
	Thu,  1 May 2025 08:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5p31odNIiNI; Thu,  1 May 2025 08:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13A7240DEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13A7240DEA;
	Thu,  1 May 2025 08:26:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CE5422D
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E843A40D5F
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEKuakrYFqkp for <buildroot@buildroot.org>;
 Thu,  1 May 2025 08:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3695240D58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3695240D58
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3695240D58
 for <buildroot@buildroot.org>; Thu,  1 May 2025 08:26:54 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-74019695377so631018b3a.3
 for <buildroot@buildroot.org>; Thu, 01 May 2025 01:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746088013; x=1746692813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3GNeQleqOG2cIb0qwULf6b9vSFmqmi7P6LsXYZQyAKM=;
 b=iSbdV5sQyPxLyWt5GS53D80RC7uFIzcjuck4l2u9+3lyT1mxd5fEdsao/0yoIwNklC
 NtUJEjX9UX1ZNSSFEtp7EnNFy5aymXsRrjaHBcm3mCYil5gWt/Jf66YIQ7kN1YS/M6df
 jcdaIgOzcYUi17TQYH7eOLHdBZAzjyRHVnJt/71B3l+yexuW0KIOoAbfoMfsvZlOhILM
 MhKajOyX8vdA7oor7KyaeuBge/mEfAiSH2pgIxCiQEYvgbIgIDaM1Y0CFa8ATnc6qfll
 Jic76kYuyRV9XwR0AXaS+4ZfWJZz7fudD1W4WKS30bt3fGOLMviG0CuJMPcxqeRonB2m
 rqcw==
X-Gm-Message-State: AOJu0Yy9yxwYuzA9lBIZenL/1tBcpJmtzfCv3Ng+PihYpSuEcMAgL1EY
 Dh5DuYRiKD/Segr+2dOmS3uK4aajs81Z3P2AjdwUcAVOuZY8yHaDtGy6H85X
X-Gm-Gg: ASbGncvNxco+NyNVhNnJHQjMKJNn92snjJNGtDs9oQBFTn/G+wm6NrDtQXE55uUMW53
 kgxgO+8fBIsD1zxHV509ztJMis7oJ1zXeZ74iIJODNu6ZrOmxuZyaH7ZzUWVeKiLJXA3FXneE3i
 PX+o/575QDY7IymIpuQGn63Ep4JwU2J0XjazgkSyfLtK7rebazOPWlf8AZ74so0tOLfANGBC1VM
 tx41YARFDqGv25x5ptpDww46VSCpokr8RXAjWM5Rcrty57WZ8fT55/i9IzLTy77ZX8ki8FD7DJX
 qXVhlHTvGhrWzxcGGWnsyYk67V9gkMEcrokE5RvsHx/yJjq0VP0FJfLKs4i9q7q8Qp2Ft1tONRp
 7OAs9QTVSe8kvI9lWFHEXg6Z/BYfd0s116w7ZrQ==
X-Google-Smtp-Source: AGHT+IGVoY5HqVaLXE3d/iHIXiq681bHngDiq3pY905mxZCX4OjpPOlVQ88gz+LNLiddR3+tSRNVmQ==
X-Received: by 2002:a17:90b:3812:b0:2ff:5ec1:6c6a with SMTP id
 98e67ed59e1d1-30a41e66f07mr3284563a91.18.1746088013197; 
 Thu, 01 May 2025 01:26:53 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e813sm301340a91.24.2025.05.01.01.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 01:26:52 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 May 2025 01:26:49 -0700
Message-Id: <20250501082649.30153-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746088013; x=1746692813; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3GNeQleqOG2cIb0qwULf6b9vSFmqmi7P6LsXYZQyAKM=;
 b=byyuP4VZIjcTZskusw4DOIYa1FTFul2p+wt1rwyLxP7GYmO7Q2T5HmIyind8a9l8E7
 0rXTQxqMCoAAfrgQ9wWzUkNkTdvaUq/Vi+rTFdJ0oOzmbK70FG8dSsksT4WcVWI2eTAK
 uUnHn9uUjiozWOWXIUL5T5x3HRqFeYeS4XgjyAEFWzL+JRMT3OmPmPsTtKpjzema4xdx
 5gazD8NpDTyTPcOlx2rtpTdQmuDaVkV0OfGsqLZMelIpAICKgh3lBllB/p/0PmZlsJHI
 gzjzcN5R0md2ZD7Qiqdgq/ROvkK5QwVleB0ySWkMSOMgVDcF1/d2rW8gAmqTsjbvfEw+
 yIhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=byyuP4VZ
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to version 4.3.5
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/warmcat/libwebsockets/compare/v4.3.3...v4.3.5

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 01e7c7bfd1..57e7d7b0f4 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6fd33527b410a37ebc91bb64ca51bdabab12b076bc99d153d7c5dd405e4bdf90  libwebsockets-4.3.3.tar.gz
+sha256  87f99ad32803ed325fceac5327aae1f5c1b417d54ee61ad36cffc8df5f5ab276  libwebsockets-4.3.5.tar.gz
 sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index e53febfce4..1b4dfc1596 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.3.3
+LIBWEBSOCKETS_VERSION = 4.3.5
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
