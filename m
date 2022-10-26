Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FB6C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1EB280BCE;
	Wed, 26 Oct 2022 19:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1EB280BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBebQeAQ-9Ib; Wed, 26 Oct 2022 19:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC1280B82;
	Wed, 26 Oct 2022 19:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC1280B82
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E06B1BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29B8260D73
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29B8260D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXC69_gNqIGt for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:37:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C500F60C08
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C500F60C08
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:37:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k8so19523396wrh.1
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 12:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9Koo6TvyDKep+dcg7jduF14lrLzx/zNeanrcqbYiwY=;
 b=qRnfoXa8TcZaw7l4HrKC531/uBRJSP4HwA5rjcg3Xd41f2Apgqz8Ck+ppXDa6S5wHX
 M/ZM/h+VhqnTaoJXV0QP+ioyr7IksTkVTWBzmFYAhqa09AdfRL2d5EffEbO/gYtLeP9U
 DuYndNCtlqh4xNOy6i/Npo8rXZQ1HH7Hs/eUXw1I8yBUfwJL6zl/9t6jChEZYL8NkPyh
 hNDAZIUXOYq9EZOZ988d2CCZr8uhv79G0UfpnmRnobOW6sHXH5cgEfMbQgL7liq9FO2w
 09LDYjfmKQwxuoeTZ2fw9EoNpLahhvGNrdhHZ4Dxs5DIjZzTnk+D4EpIEBgfA+JMAebB
 NkHA==
X-Gm-Message-State: ACrzQf0wDt7Tos/o9K3WR3czBTfeAz+ApJT8DB1S/JD1p7oJE4rKI7s/
 ivf7qQ4mQEqSU90CjVMfCZYMU43AiK4=
X-Google-Smtp-Source: AMsMyM74PngUayaUjo8hN480guJulNft25X23Nq1kW7PxD2D+luch3NBcsjJnS4D2mqrdjtQeDUoOw==
X-Received: by 2002:a05:6000:1ac8:b0:231:90f0:217e with SMTP id
 i8-20020a0560001ac800b0023190f0217emr29813557wry.525.1666813025455; 
 Wed, 26 Oct 2022 12:37:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l5-20020adfe9c5000000b00236863c02f5sm4310434wrn.96.2022.10.26.12.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:37:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 21:36:58 +0200
Message-Id: <20221026193658.245255-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e9Koo6TvyDKep+dcg7jduF14lrLzx/zNeanrcqbYiwY=;
 b=h1stCqSxxrTF4XQ18xVn3eZSddqKX2dXgUmw2sHEMd0RNNzVQ3lyCWg7BTVyHDMFpb
 Lg3R7EdwX6IqLNQ/C+wg2Kn+YYYGFPqYvT73L9r1U29xe2v07CLFI5dF3iokaNLD4zRp
 IAJtyFoU3YSBSTk6NX514XU53QWs5jmZ1CYlhEj2nwoCDKpkkGl5I2fAZhFo194eUUPK
 2KyOMjO6DqE0wK6B5eb7jEWSSWoG8WCx56Zh1f6PRazTH2fKH7dCA8l4dkc9bA9GItpO
 iAl6ae9zxoumyGkIYdR71y2CJ8wmuL6FsCL5MMv2HTWbmE7WEPKWi8MjT43yB2Rxkm9D
 NlXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h1stCqSx
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.5.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Expat 2.5.0 has been released earlier today. Most importantly, this
release fixes CVE-2022-43680: a heap use-after-free vulnerability after
overeager destruction of a shared DTD in function
XML_ExternalEntityParserCreate in out-of-memory situations, with
expected impact of denial of service or potentially arbitrary code
execution.

https://blog.hartwork.org/posts/expat-2-5-0-released
https://github.com/libexpat/libexpat/blob/R_2_5_0/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 15e64a4dc8..c6c25aa3e0 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.9/
-md5  8d7fcf7d02d08bf79d9ae5c21cc72c03  expat-2.4.9.tar.xz
-sha1  be91118bc495ce49b04a3fd0f27df2fb5a843e9b  expat-2.4.9.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.5.0/
+md5  ac6677b6d1b95d209ab697ce8b688704  expat-2.5.0.tar.xz
+sha1  5178e13c1e34f4643d5118d5758babfe0e836fe2  expat-2.5.0.tar.xz
 
 # Locally calculated
-sha256  6e8c0728fe5c7cd3f93a6acce43046c5e4736c7b4b68e032e9350daa0efc0354  expat-2.4.9.tar.xz
+sha256  ef2420f0232c087801abf705e89ae65f6257df6b7931d37846a193ef2e8cdcbe  expat-2.5.0.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 59854d0ee8..6f22024cc0 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.9
+EXPAT_VERSION = 2.5.0
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
