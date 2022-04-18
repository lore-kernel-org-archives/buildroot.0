Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B77C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 21:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3A2D41E57;
	Mon, 18 Apr 2022 21:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8pYHMXCNEgA; Mon, 18 Apr 2022 21:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B145D41E4B;
	Mon, 18 Apr 2022 21:48:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 614C71BF2F1
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CDDD40BF7
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8K_04JGkeUOD for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 21:48:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F0294016D
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 21:48:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b19so19985789wrh.11
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 14:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vo8czgGlQvnrdOpNqQ+RE1b5EbEo9o2VQlIWWa0I8fA=;
 b=WSmlIigD3/I9tP1Gkq6Jb2v8TsMC+poxrS8sgXgbXkznulH/D0StYa/4fZlN5JKqnU
 WlZUsxNq2CxKfV1OnhgUopv46lrQV1vEIYzuNmyzu7Rn5KHgLGdUmKZJQH81ee1o+84h
 75XMu51J7EEQHzyNWxMRvOA7DyztCUBbreVApIojEsqek16PoT5g0DQfNJ+gaWf42hXH
 ftrEwcBzvsrYhBbR6vRzbMV8IGdyoV05mu1jBMhhHMJEDDeCaU1pa0ujcFgm86T2Mc//
 29jM1/dgZGe5OGyi9s67fs30K1aCLIr+sv9xonO24uyMTtrkYiazc5okGgBCnuCRfW4t
 3/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vo8czgGlQvnrdOpNqQ+RE1b5EbEo9o2VQlIWWa0I8fA=;
 b=rV0YWNS7Cwg1JYOunRONqbeOwARDjgi10KGAcMfn+l1EqKZxqvCs+iQAis0xjgFnuk
 3SuCRPKU3bIcW3szFWHKjCdHlMVbppwTDe6dOHi6Q5iJXB6nOfVGFIwU9F6WfcOkiJHG
 iwZnYxTZitwCghXTsStreHJWGJF1ZYqfivCTGiRm6GYm/gRRkEbL5VGA7gzDKxmXs13N
 Ouy38TQdDCLDkkjSCwTUmsG7hpRUcb8FV2FKsFN5xxDZXO0Fs+LiXjePARSeDPLqe6Kh
 6MftHMBzFLVwSbto2i/re3GjUUVfQjTOz/mTdezl5zg7x/AuscBWzhDCUepbDNBnz4v/
 5tiA==
X-Gm-Message-State: AOAM532vwt47RWzDRMBO8U/N+lscVTesMHsz8v29lo/FrdSfx87PZd6u
 VofMMhva4AuLvy4zWMKYFMmW27U09vo=
X-Google-Smtp-Source: ABdhPJxgWC9/Sj/lv5smlKxzwTht3gN6CT08mZkPUcwJJQh79fi2javd7UAqKw1ByhVKQXj40SgIlg==
X-Received: by 2002:a5d:6e87:0:b0:206:452:5b87 with SMTP id
 k7-20020a5d6e87000000b0020604525b87mr9339700wrz.473.1650318524246; 
 Mon, 18 Apr 2022 14:48:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056000184a00b0020a85e7f22asm7406002wri.26.2022.04.18.14.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 14:48:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 23:46:51 +0200
Message-Id: <20220418214651.883524-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mariadb: fix build with libressl
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

Fix the following build failure with libressl:

CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
   LIBRESSL_RESULT (advanced)
   LIBRESSL_RESULT__TRYRUN_OUTPUT (advanced)
For details see /nvmedata/autobuild/instance-27/output-1/build/mariadb-10.3.34/TryRunResults.cmake

Fixes:
 - http://autobuild.buildroot.org/results/cbdbfcdae4b89ac678e1bf6bcded96872c7223ab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/mariadb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 4eb9c71827..17751124b6 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -60,6 +60,12 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 # Explicitly disable dtrace to avoid detection of a host version
 MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
 
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+MARIADB_CONF_OPTS += \
+	-DLIBRESSL_RESULT=ON \
+	-DLIBRESSL_RESULT__TRYRUN_OUTPUT=$(LIBRESSL_VERSION)
+endif
+
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
 MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
