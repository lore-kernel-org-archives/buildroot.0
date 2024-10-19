Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA3ED3E1BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 08:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B039408A9;
	Sat, 19 Oct 2024 08:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWyCEI98XXgc; Sat, 19 Oct 2024 08:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09BB5408A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09BB5408A2;
	Sat, 19 Oct 2024 08:15:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8F23A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 08:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E35C980D46
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 08:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lbyc9HCFmXR6 for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 08:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDAEC80D1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDAEC80D1D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDAEC80D1D
 for <buildroot@busybox.net>; Sat, 19 Oct 2024 08:15:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d4a5ecc44so2211299f8f.2
 for <buildroot@busybox.net>; Sat, 19 Oct 2024 01:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729325715; x=1729930515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48fOjqV0VxjxPfQIiRzZ6WqRiu3A86KhJpfzJx7jzd0=;
 b=jveCr1dLscznHCkVVA3tRZBEhhxNp6lGEWzTfPwMF3wgp2EJB092MIjgzRdUXs4+4N
 YgmwxP/91KcXRWAa38gUNlQnOC7JcXWW8EefxSQcUirLAbivh6JAawATq3zXspcYAN6Q
 1wovY2Os0k5O/nVvlqMb8s7pEv4Hoda66/rNNFNXZdQaWB2bt10kRQeOq+8JcnNpQFTs
 UjO+gQItR8xjAAAc4008NeG1yKoxeCW1ELDWSf6hX9COA+n0UP/1VNK08sQe+an+K1nX
 DWDNLmrlgoYEAnXaYZWiFo7SPaUMyTlmZIGwrWb3OzA/mbMVzVKRWQivtmlr9MlBGLhS
 zKoA==
X-Gm-Message-State: AOJu0YyqO4axdUgVYMCChRxMIu8flDKwHuf579DychZiQRdqWVTbO2SH
 vCq7PY+buFo93VY3AYStLVmbJxjWwggjEeHcFqeSLWGA8NkZJ5kiPK+ghNZIoofcM3OJmOQUJhJ
 TMw==
X-Google-Smtp-Source: AGHT+IEyX9BpjiL7sXNJaAYMBG5VLcjzGE/RjZ6jVR7lkbL783OUrENPALCPxZDriuoZYKAc/ypuMA==
X-Received: by 2002:adf:fe90:0:b0:374:d25f:101 with SMTP id
 ffacd0b85a97d-37eab7436eamr3138391f8f.18.1729325715533; 
 Sat, 19 Oct 2024 01:15:15 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf089d52sm3875477f8f.61.2024.10.19.01.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 01:15:14 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 19 Oct 2024 10:15:03 +0200
Message-ID: <20241019081504.289566-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729325715; x=1729930515; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48fOjqV0VxjxPfQIiRzZ6WqRiu3A86KhJpfzJx7jzd0=;
 b=QD+XbgLQGVgG8vgFSKi8hPhlILQ2Yn/TnvLBGigwL4cnvYJP87NqYF72vsvYsDuMkb
 ysS4kl+VhAb9pSU2Me7WKo+2TctY72R0H0RDc4gXs26xZceVFPX/euLNGsobbvy/7vX+
 JyeZzNoC+OLQCPaqVn19vVa+Fn5372NSJbE9dUxhJyVUzxoocxfGQAR1IrRBJg1DkUu5
 UvO6NfUw154ZnI4c8Qx7TICQnsYktjqzDMg/kdR3/C+FTr/ph3jGZlw8ZH36FgCpIpTV
 g6ucJrJuy2EJYKctPQxl1vuu1d308abdIGGgFTwGV4JyvhV2MNOTVk0P3FgO66xtWlq0
 en5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=QD+XbgLQ
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 97813fb924edf822455f91a5fbbdfdb349e5984f
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/0002-install-inc.patch | 2 +-
 package/luajit/luajit.hash            | 2 +-
 package/luajit/luajit.mk              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 163a5d36f..eec77a5f8 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -14,4 +14,4 @@ Index: b/Makefile
 +INSTALL_DEFINC= $(DPREFIX)/include
  INSTALL_INC=   $(INSTALL_DEFINC)
  
- INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(MMVERSION)
+ export INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(MMVERSION)
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 54ae3f993..eddd2a241 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  346b028d9ba85e04b7e23a43cc51ec076574d2efc0d271d4355141b0145cd6e0  luajit-04dca7911ea255f37be799c18d74c305b921c1a6.tar.gz
+sha256  cbf1647acbd340c62b9c342dae43290762efa1b26d8bf8457f143fabf8ed86c7  luajit-97813fb924edf822455f91a5fbbdfdb349e5984f.tar.gz
 
 # Locally calculated
 sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 951206b83..301973db7 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 04dca7911ea255f37be799c18d74c305b921c1a6
+LUAJIT_VERSION = 97813fb924edf822455f91a5fbbdfdb349e5984f
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
