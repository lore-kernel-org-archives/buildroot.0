Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD98C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 12:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76FDA60814;
	Sat,  1 Jun 2024 12:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZW-l0Npdr45; Sat,  1 Jun 2024 12:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D06E60856
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D06E60856;
	Sat,  1 Jun 2024 12:59:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 150011BF239
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 12:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01F3A845E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 12:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZrrcdJpCRg0 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 12:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEF13845F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF13845F1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEF13845F1
 for <buildroot@busybox.net>; Sat,  1 Jun 2024 12:59:55 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35dbfe31905so3039940f8f.2
 for <buildroot@busybox.net>; Sat, 01 Jun 2024 05:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717246794; x=1717851594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t6TsNkuozK1mkQQJRmKhbwSBtyNseDal2PcNX+Q9l/4=;
 b=Ld7Yn9Jh6KfL9us6V9uwmGj6sEXARQSHsb4CA3vbXhO3aZU1c01lqse/6v/TrwXiXs
 5bN8vv6Ioqr2lqg8WWQSALB9ggYVyxQvvi4JmiUSj952delAppuTfniIP/Qe0NAVR5Hq
 R+AZf4uCOjQ9ZwEIwinRXrUbdSUYqP0HQHyuh4eenILSJnTlPgaQmnTvSxo2nlIUl9Fa
 ytuAR+eCbTPEEIS5PQr/JAp45w0oINSPTiBaGEY9OSZEgGxdrqGkeYgYYlFvMcE7exXZ
 jMKZqnijZ7/1630e/n3a/Bqasqoywzx+1YXsxBztK71lWiEecV4zNZL4RKUeTr7dB5zh
 cSQw==
X-Gm-Message-State: AOJu0YyqVp9QUHLV130hcWkbPkoewPaAFO2N9PpnSTDTc3umxvUGqGhp
 Oz7mG9zJMNQjb39r2Q//wZkNVCaNXV5lEpH4ndd7pDeLOGz0XHp+D9nIB4c7VTOBgzb9t3ZCSo1
 Fsw==
X-Google-Smtp-Source: AGHT+IFSG2uZAVipnEkEI5ZFesspSwsdpP/ZEaN19XIYvUHPDDlMyF6pWy3gxfHdnt9BFrMW8JmE+Q==
X-Received: by 2002:a5d:4e03:0:b0:34d:b284:9c65 with SMTP id
 ffacd0b85a97d-35e0f30ed25mr2980364f8f.45.1717246793622; 
 Sat, 01 Jun 2024 05:59:53 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c10f2sm4032011f8f.10.2024.06.01.05.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 05:59:53 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  1 Jun 2024 14:59:51 +0200
Message-Id: <20240601125951.29789-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717246794; x=1717851594; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t6TsNkuozK1mkQQJRmKhbwSBtyNseDal2PcNX+Q9l/4=;
 b=L2jtJDzVUk2oWQIXs0R/REidSVzAlvvjKZZdV6BMminpZ4iAR6sJCLqlsuNLL1qkV0
 ksJtIbeMnsucbZKUBe+1C227NS1k2eqhZiILhDF+Ynj1OiemlbMglVD95EV07MHtKwk/
 rRFUH7yiPbFdCalfXG0Rcah5TXeR0ocboMg38Pno/qr03xcv0nporJjsQVIUZPMo8UK1
 C0TUt4anVBlAM1iBAXoNRROwuM2eXX8YejuXuF1dytQpovRkPK8WYG4vZ4FAejVntLaH
 4ERE7xKVoH+DkznCdwOkfyp8m2X8nF25RIsfPnPc9y0oaTk3oPgKv4Q1w/w+rxsWbar2
 JF0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=L2jtJDzV
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.11.1
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
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index fbf527021..15a44f9db 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  25f56b3c7272fb35b869049371d649a1bbe668a56d24df0a66e3712e35dd44a6  luarocks-3.11.0.tar.gz
+sha256  c3fb3d960dffb2b2fe9de7e3cb004dc4d0b34bb3d342578af84f84325c669102  luarocks-3.11.1.tar.gz
 sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 4c9922914..cf5f966cd 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.11.0
+LUAROCKS_VERSION = 3.11.1
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
