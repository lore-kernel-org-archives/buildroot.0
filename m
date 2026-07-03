Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FAFC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 13:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9528841080;
	Fri,  3 Jul 2026 13:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mr6QNk4aLI3u; Fri,  3 Jul 2026 13:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B5E040FE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783084097;
	bh=Wiwgn+xRfAGR8PzRLqpcQvD2ZKMS7BnPgQp5ZLS5vYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=DGBXdWwn+jwUXkiJ5zcyJtLo9iaKjZbu7mVkVQnW/BpnSk9SH3fqNs1blK01E0Uuy
	 qoNhVh7f8MLeagZHmBQztQMVszbraLiMuFPExJMSyqtQ/9o5VhAXOwq3BV0tB4aYk5
	 cUri+12kKCfASSb2Ir75lobnIVT7cEWmJrrEQ6h8JOMNThbKoPTQPMVFtsKxTMjKSF
	 8VzU3EEpeuDI5/r0OugSWZ+3IqWA83nKSDcD67ZRlFd5GjgJTsslz72HiVZl4SC3CW
	 SaUVxLIGweCCIHCNo2SnHsprEuEheQ5uERFjJvmxFTHfXGP5VOg+x6gIV4xIxEQnF2
	 hw3Yohixk4Vjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B5E040FE8;
	Fri,  3 Jul 2026 13:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E3BB316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 13:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17E6D8232F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 13:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEi0R338eV7L for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 13:08:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA357820B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA357820B4
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA357820B4
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 13:08:14 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6983f20a8bfso996548a12.1
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 06:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783084093; x=1783688893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5nZ3zy2ohGQVC+u5fq3tim7XqFixe55Bu1zXKAQ2Ho=;
 b=jvs+w3rv3b43SAWXGUHvcSsXw2F1iuUQCJA1r41O9eh800XAwCNjldvBIO0kOw7nLf
 6A5+sC5Ov81FBeTQPrsLbRtIDnJjjgkx1K8vBr4HiJjEolrpQ8oj3+G8tCpH/d7f0Y8z
 uUdadTKLZU0rG4QokI8YmO8Mo9EZjFrTeNcpNjMUrTy3mT+hkq2IIvIEa/tzP4GvgGXZ
 i3aFZXPr9k7yhrigas+wdEl17mhiBKlKSqkXzFU3AfZEuVYSOTBNez6Iqnzejx8vkLxF
 agZgMrAEvupTDskYH8wsb/lUJEztxPgRNQfT6237sw2XpnHsV4IyM4dBvWg1ToZ22tqd
 TEyg==
X-Gm-Message-State: AOJu0Yy3Zes7OvelvCg33pHmk0eKJuUKxd2+dC29LnoX1TthD9je4+io
 Va3K/keVkiBGVs3XhGxQJN6fmIE5nVA45f/T7Bqh4i31OVRKWjfN0sslbNKV4Q==
X-Gm-Gg: AfdE7cmqyS1Z0ZvDFd/maor9Us5j1oWKNNPIEHOk1hWE9LS4/bWRYB7gwDME7yqgBiN
 lNiDXE+H07xgpDMkx9CkmFQryzLp3tq/CH7dEv5YutcuAm1sYEjhxxle71sGmq0hMusHyHDF4DU
 zxYzXIu0ZN7Y33x7vUovMQ1FdFFUGX++p7lBK7es7bYeHszqBfJI4ts/OxwGB+yOsKanhoTfxlO
 mm0ZGZX8+5FLxqG4rnsmk6hjpjesXYkYGNrzYM0wSS05VgUNx7dVtz9WZ9FiatURw+2BU0o1JEb
 2OBtcO4D1WZyI2RmE/La2z72lkJZS1evs3+GIih4qxyl9jWHjFvjMlmszzCFOIAhawyT3T/0WxH
 Vy324CNHVrvlTaLvgR0O20i4pfhl1G9GqLZC0Bb1gjQily6PCGIdP9dBUvLOwaWt12tCYdSvV93
 2kzwmYAs0C1PK+gSJ4VT0hKpPnknxcWJFoNdmOYBiPn9GJ++ecfv2q0ItuAPfN3QNQURkStf2oX
 u9nyQs=
X-Received: by 2002:a17:907:a786:b0:c12:34ed:da0c with SMTP id
 a640c23a62f3a-c12aa3694damr493050866b.56.1783084092293; 
 Fri, 03 Jul 2026 06:08:12 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12b628efefsm284851966b.32.2026.07.03.06.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 06:08:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 15:08:02 +0200
Message-Id: <20260703130802.1789931-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1783084093; x=1783688893; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j5nZ3zy2ohGQVC+u5fq3tim7XqFixe55Bu1zXKAQ2Ho=;
 b=RJC6sxpkWpbUtFGnWZwZQpzRbamqM4idYA/+FTVab2D/LVeQxYQEHPymSXaB4j33Ik
 6HLm6BRzIyzvIDkcEg9vAGUqqBHs+c/C1xcpQi2bzokK14XA67PWWrEXSNg2ewRlX8ZM
 L4q95hdBU1SL9c89i9IGUT3z3fzXxGoETu2QLiNw2P1VdwUCbXTy0CpynNrdqlagRnzv
 Sekh3MZv/CrLaqMgYYa/P1DVzzos0+mhSYLYJh297cQSzx67wY0pqdLRKjZDFxDLkyMT
 Ajdz3svWXAKpKvcwUAUk1EcNLFLpL8XsVXfJ4A6u5WX8ARIwUSU7JGfVF35wyrDdkYqe
 KeBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RJC6sxpk
Subject: [Buildroot] [PATCH] package/libxmlrpc: bump to version 3341
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This version fixes boolean usage for musl toolchains:

Use <stdbool.h> whenever possible to work around musl libc incorrectly
defining __bool_true_false_are_defined.

Fixes:

https://autobuild.buildroot.org/results/5719bb7f5bd709cebc8012341c0b448a8fec3aba/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libxmlrpc/libxmlrpc.hash | 2 +-
 package/libxmlrpc/libxmlrpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 00cef19b77..d7555c3be8 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a071da3204132585a40313e17e01699d428e0fc9b58d30fcd7e538037254668  libxmlrpc-r3335-svn5.tar.gz
+sha256  b7fbe0fe9f6393c59c31f85c0ca7d050db83bb630fceef75ca7cabfd2fc3fc3a  libxmlrpc-r3341-svn5.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 283914ca81..c2ccfe80ab 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # 1.67.00 (code/advanced@r3335)
-LIBXMLRPC_VERSION = r3335
+LIBXMLRPC_VERSION = r3341
 LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
