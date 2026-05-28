Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E08CD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 17:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E7D242AE0;
	Thu, 28 May 2026 17:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgBD9389LR47; Thu, 28 May 2026 17:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5A742AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779989119;
	bh=7fLp25X9z3y1hSuA99qolu1ZrwBEbyDn/nDTELPkk58=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pRuT1KWbQSt6U+xFMjTrrV85giPYhyPher8ArcaZPybf6so7dQEJw3Nzf3hA6jsLd
	 Mcx888v6RjdI9SOBtoczc5C3HOkwscCxeEUHmuKik6HpmryEWoTSM4pkULPZVqAMWK
	 cNVTAAs43J7ssy8hNlgREta9hLPuXiTsO1seD6xS/jjeUryYn/K8yhu0+tW2ZWHDx9
	 vn4Jnj90jo2XqmaKtRjPeskkVZgfMbv+qA0iOXoSPII4qr8RMj3eQoYhLLEeSFnMVx
	 DMtaJ8397Fpfe1Kj5dILdmv8tq2/kt5GS9vJykrmydUbXtxExXW+pUXZcr91h9iDr6
	 DGSgdp0wdRpPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF5A742AE3;
	Thu, 28 May 2026 17:25:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A45A288
 for <buildroot@buildroot.org>; Thu, 28 May 2026 17:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E439940494
 for <buildroot@buildroot.org>; Thu, 28 May 2026 17:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMB_3qLmjaDV for <buildroot@buildroot.org>;
 Thu, 28 May 2026 17:25:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB3CD40492
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB3CD40492
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB3CD40492
 for <buildroot@buildroot.org>; Thu, 28 May 2026 17:25:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4905529b933so46725055e9.0
 for <buildroot@buildroot.org>; Thu, 28 May 2026 10:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779989110; x=1780593910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gg+rm1Skk56fOwFvp2DTHPGO8R+xahQFjHn4oieFdJA=;
 b=FDixWJU3tPx8a13CstqnxTwUwWW71oj6AHrE8WcyhgTyHuYyeRNaPHvTbxuhduNwb5
 LN2WeF4H4lKP2FThzwk/Oy6gXumLaCv6ANJpuLG4sQqQgYZ389hfelO47UAYXLbOvRGe
 c7dOwTGgQCCB3cB1T5sGHwfgB/Y5jYcAj3raRDbRLjsn3b1UeURLT5HZWKvlbPKbhoU1
 WvCyWvZrQ1h7ugJ3PZ+8DUSJUjUwB/EvZ4HFRnL0hAN/cj8fx9ozvtIrrEiXCiuwFCiR
 IYkoZU1v6puQAKQV3bK2yjc94XaN1RYFe+6xAMUzqXEdEd9cFy2L6rJ0ked2qvSYMP2b
 4/KQ==
X-Gm-Message-State: AOJu0YyC2iIQjVpQaDVEtO9u6LOsH6lYf3yqgkc6cq9ePYrT7RZGW4/H
 qbzJ7EGPw3wszLt/bBHCToBJTA5f5Hlo8p+KGgResBrvvkW4lGtYCUS9xIqi3A==
X-Gm-Gg: Acq92OFG18+pwxZQKtzqEhbhQMikN1nfI0O0apV02LBkvGKIt+f90WJB7QQr/LxzR1h
 a4NlRqXaaP0qtjtLyJQJestPxXldKqVZ0pzFecu04BjA1hAmT2jwrYXCc/iStqNI8zkF7+VZhPb
 Myix02hS3B/NZAOlFqoNK8m6E+SCi6tLClBenS8c+6DGMHpfgGWeo29iLpKi3JH1lOFUPZH6SM7
 zXUPTw5XSc6c8VuKLOVk+xEEpIuwF3Jq8x/RQ+s1QMBZgW5wb73kwNljo9a8McSD6xs1aPLS/Ep
 uKmNLT7yo5eXIqXNo4zkinLik1KbuTWOtSzZY16WciX1mdZRuFLuWGHpRem0Nzbh1BL1Z2jYnh6
 JcdojopvZ1uvWnK36KRZThJ1CJGlT1clLgkSCqQq0mNtp1YotHhvxQ9s+frbIsE3k+q1EBpATre
 bpdm7DALahN7AZXPnVCCobPKqdtxK0lVhDyx7MxdX/UQ==
X-Received: by 2002:a05:600c:3581:b0:490:482c:4391 with SMTP id
 5b1f17b1804b1-490482c4586mr500479415e9.23.1779989110314; 
 Thu, 28 May 2026 10:25:10 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00:c64b:8476:a88e:af45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909a52ca5fsm1098045e9.2.2026.05.28.10.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 10:25:09 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Thu, 28 May 2026 19:24:52 +0200
Message-ID: <20260528172452.25273-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779989110; x=1780593910; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gg+rm1Skk56fOwFvp2DTHPGO8R+xahQFjHn4oieFdJA=;
 b=ossEkS0LKOfvVFG8VO8WBZ7FN/cydJaBckb+iI3e21TYabQClzG2xHY4mDJwFJQ5sS
 cLzMDjlXiqejB4et1CYG7kyyXmhH3d2ukgg4YtcJQlRG8fjYPOFh3yhUCzn4V13QO57e
 UXavqrZvi/gg1nuCa0SZZMkYS3qqOm8qusn87ku7fzNMD7KgJ5wkFk/Ikm75Ve1PboIV
 5bKRdITQ7p2gsJy58ipxXJSr38o5HNEVfMzQDKXm4pQxaDUKC2pUijJGV3BBsF5lYZDF
 XxyvuwfXQ1Al6/vGTTfSxmLentpimCuJllm/qtK8JR2I0i8Ee9SSEy4d1+DslqDAN3R7
 WSsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ossEkS0L
Subject: [Buildroot] [PATCH v1 1/1] package/xwayland: bump to version 24.1.11
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

Changelog:
https://lists.x.org/archives/xorg-announce/2026-April/003697.html
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index ba84d20b9f..6204400852 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2026-April/003679.html
-sha256  459762be8ea046c94386687d77a87add6073868bee14f02913eafebb945b7aa0  xwayland-24.1.10.tar.xz
-sha512  bceba1db7f4d7ac92d2b2a3c8f6f7ab0cc093f396fe89406f8dba25e32ffc3edfa552df246cbfb3b0708c1d28b3e179694d11870b063d5b8f9ab2db9fb861a8f  xwayland-24.1.10.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003697.html
+sha256  27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff  xwayland-24.1.11.tar.xz
+sha512  586d7e60c8bf0d92cec66451284c6c43b960010f14a1e204b5de722c610dc067481fd6ece0ffae615ca53ca2d0262e2a3dbb916d04811b8d57c1085bc363f5e9  xwayland-24.1.11.tar.xz
 
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 5902f85d4f..0643cc5c4c 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.10
+XWAYLAND_VERSION = 24.1.11
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
