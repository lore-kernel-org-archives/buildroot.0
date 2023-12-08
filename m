Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DE8C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 17:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F16D83C11;
	Fri,  8 Dec 2023 17:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F16D83C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vi87BNShSiob; Fri,  8 Dec 2023 17:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA17D83B90;
	Fri,  8 Dec 2023 17:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA17D83B90
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D038C1BF357
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 17:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A99B583B90
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 17:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A99B583B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plKSL0I9_HSy for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 17:21:21 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 888EE83B8F
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 17:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 888EE83B8F
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3316c6e299eso2366436f8f.1
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 09:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702056079; x=1702660879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=41Rp6JrbmIuEDOal7FNVLnJHdNCCezDLfvo9ln9+F20=;
 b=IC80wqTBXq/KVXuJJWltorHEPCacmJq0mxswyfsuujfpMkwsFhiYMNb/DfCWxlDdCE
 M22o8fjTcdJ+EchwOzW60rP8FYQiWfqvab7OLqZlFgz6MX0eiOrQDFRBhekJDYf3f1h8
 T6/ksbICFEx6QV36HporpCrf+5KGUzf5SNQO7YbtdkWXNEF4zKebocKt/bQ9t4qd5w/w
 4n87p0hqbmeoCrqMrIyL9FMqGAz5ashmY1uzg2sOvwPT9Jpt5E207j8q5jA6/c4LMoP6
 llIcRwrE+D0ZU5i1BdAVthJpdmOq3c2/9JbQhKQCImUWR4pPZPWTQM1Q2A9rl2Rfoyo8
 EJjA==
X-Gm-Message-State: AOJu0YxO5Maij0icV9JVxB7tsIgeAySKdEKNY0dICs2ES/pJ44a1tN4e
 cWliGtDe2uqAzwAzukFMrSrJSVpfdkc=
X-Google-Smtp-Source: AGHT+IF1ca502+aj3YwuFWPdBSTTY8A4aeTkqHTs2itZGhsVxCaVyi48YsJqCHdOL8kLMB/EfAiLRA==
X-Received: by 2002:a05:600c:20e:b0:40c:22de:79 with SMTP id
 14-20020a05600c020e00b0040c22de0079mr114582wmi.226.1702056078890; 
 Fri, 08 Dec 2023 09:21:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b0040c34e763ecsm2136983wmb.44.2023.12.08.09.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 09:21:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 18:21:14 +0100
Message-ID: <20231208172114.1514561-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702056079; x=1702660879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=41Rp6JrbmIuEDOal7FNVLnJHdNCCezDLfvo9ln9+F20=;
 b=Xj7QKLT6LKDgeG/onp9N72PgDzHvSzFxDBAGRJzkobpPhjiSSqDmgKXjOJZs5/fV52
 Bro9XIcV1R3DmPmswqKToNSkgnVY68o0qDPiIzjIHJyhCJC0rkDCifHMV0kmE/34s9O1
 K98QIbA0vA7qx6EqUbOuSfxmvXEeLCtKp7N1MM85v7P91Wm/xOTiPVnmm3qpmQeZr21J
 bdejwqWWe52iXoVoykd10cjmCq+PeIhGWaRBjEd/1Nh1oL5Oatphxs87WQ43rmJs0+9m
 KrT3mY4d9CYPa4RWl7xNLI92up+KHm/k6Q2pKOROazBFSpaPrvfymI88qbT2D38qfmt6
 f3KQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xj7QKLT6
Subject: [Buildroot] [PATCH v2,1/1] package/erlang: fix build without DES
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
Cc: Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without DES raised since bump to version
26.0.2 in commit 2cfa86a54882f2831b36a78a0ca642aa3a4bd0a4:

cipher.c:51:42: error: 'EVP_des_ede3_cbc' undeclared here (not in a function); did you mean 'SN_des_ede3_cbc'?
   51 |     {{"des_ede3_cbc"}, "des-ede3-cbc", {&EVP_des_ede3_cbc}, 0, 0},
      |                                          ^~~~~~~~~~~~~~~~
      |                                          SN_des_ede3_cbc

Fixes:
 - http://autobuild.buildroot.org/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add a patch instead of selecting DES in openssl

 ...-openssl_config.h-fix-build-without-.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch

diff --git a/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch b/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch
new file mode 100644
index 0000000000..a17a43a95d
--- /dev/null
+++ b/package/erlang/0001-lib-crypto-c_src-openssl_config.h-fix-build-without-.patch
@@ -0,0 +1,46 @@
+From 8c7d62662cf51902d759be0e8d3bfd96a3524b3c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 8 Dec 2023 09:00:17 +0100
+Subject: [PATCH] lib/crypto/c_src/openssl_config.h: fix build without DES
+
+Fix the following build failure without DES raised since version 24.2
+and
+https://github.com/erlang/otp/commit/abf7f84c2f77bb07dbdbb8a29b9d41f1f24c5f14:
+
+cipher.c:51:42: error: 'EVP_des_ede3_cbc' undeclared here (not in a function); did you mean 'SN_des_ede3_cbc'?
+   51 |     {{"des_ede3_cbc"}, "des-ede3-cbc", {&EVP_des_ede3_cbc}, 0, 0},
+      |                                          ^~~~~~~~~~~~~~~~
+      |                                          SN_des_ede3_cbc
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/erlang/otp/pull/7937
+---
+ lib/crypto/c_src/openssl_config.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypto/c_src/openssl_config.h b/lib/crypto/c_src/openssl_config.h
+index cb63f28369..f3904986c9 100644
+--- a/lib/crypto/c_src/openssl_config.h
++++ b/lib/crypto/c_src/openssl_config.h
+@@ -218,7 +218,6 @@
+ 
+ #ifndef OPENSSL_NO_DES
+ # define HAVE_DES
+-#endif
+ 
+ #if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION(0,9,7,'e')
+ # define HAVE_DES_ede3_cfb
+@@ -227,6 +226,7 @@
+ #if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION(0,9,7,'e')
+ # define HAVE_DES_ede3_cbc
+ #endif
++#endif
+ 
+ #ifndef OPENSSL_NO_DH
+ # define HAVE_DH
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
