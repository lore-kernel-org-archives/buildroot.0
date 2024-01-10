Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD63C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58182400C1;
	Wed, 10 Jan 2024 21:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58182400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxmmjSxRK_Ac; Wed, 10 Jan 2024 21:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41B7A436D7;
	Wed, 10 Jan 2024 21:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41B7A436D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AC7D1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7387242419
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7387242419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpGUEIMP84cP for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:51:57 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AA4F42418
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AA4F42418
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e5535b8cfso15399925e9.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 13:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704923515; x=1705528315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZP3W2e1bX0ZH0Ou7+FMty2lT9xJah8t1kI0iZsn7iTA=;
 b=Yr7OFdd3mRRkpyzMcBLvE2RoWZnTcyNeiKsUPnUGo8OgmyLBmdVpc19IzAAqbG43xu
 08IZar9d/1U/qFRevSC6Ty66Ufy9hOoCL8eEw5pk+fYBAcwiqY1vVlGlCdod2uPWAu82
 Fy1ZSmNa7aRBrJvWfsz7ePpc3M34Ft3dXmS8rQFTj/ifw7Nl1d1IbNkhq8YmzIJrr8m0
 16ZEDoecrunbyxMJjiCAG4pOvHKFToEO8T6OaoSjwdgI8EaIQahHBwvqyAMd1qfuggbM
 Le9zva3PlnpR7z1jQWUe8ie1TWWBo/Dn3UIQxAtiLvvFMNiPsu6qmh40lE3Th61r2/xr
 IcRA==
X-Gm-Message-State: AOJu0YxX3Rpo6M57DNyjkjwKqXyhqXAn6QghkJwuWU7LJYj/D7swYZf2
 wS85fPiRjBtLf3flBXr0ZpQm7gn75+M=
X-Google-Smtp-Source: AGHT+IEwg6uizyBGyPZKtyM5wRFw6zOpQgP/ttw8xn23LaYVVE06EOeA+5tjSRioiY43j0lqbekxrQ==
X-Received: by 2002:adf:eed0:0:b0:336:647c:cef1 with SMTP id
 a16-20020adfeed0000000b00336647ccef1mr66025wrp.44.1704923514630; 
 Wed, 10 Jan 2024 13:51:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j8-20020a5d4488000000b00337464bf71bsm5718935wrq.39.2024.01.10.13.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 13:51:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:51:51 +0100
Message-ID: <20240110215151.1261702-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704923515; x=1705528315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZP3W2e1bX0ZH0Ou7+FMty2lT9xJah8t1kI0iZsn7iTA=;
 b=jLbVeayUZwh7OdoAa40w9MHAMMghfMcdtRvpo6akB6mtwluouw93A8v5Iew/Nucxj9
 Gg6xKC61TXcWXXhqmXgZHLXd4GpnVqeq5ZfY3K1NmuFSYzszIBObTiA9ED7ekRMkhj5f
 vvCHSBP9Orua83MkB/obrx7Wa+1JN+bxul4AT4Jt0rr9CGp9+ZqeDSFe++WuzxEJPemW
 zcDDxEggmiSR7lBNIeL0lNoGMhBV9dHFi5NY6nLD1WxXyE2vAxVVaxmN3ZwpHFdA/Nys
 g45bedAqBstUzCkmOk5XU7Ea1oYFcBg9Zmq7xoWfaus5Hrtzb4JYfXZB+O88sUEKgyTb
 dyBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jLbVeayU
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: fix openssl build
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
Cc: Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of openssl to version
3.2.0 in commit 973b1eba5a4ee72f040bd471b147267e36be73ad:

In file included from BnValues.h:327,
                 from Global.h:80,
                 from Tpm.h:78,
                 from ACTCommands.c:62:
TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
   83 | #   error Untested OpenSSL version
      |     ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f22867e71dca64d4ab5fee4db39fe9b1899f4b85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-Add-support-for-OpenSSL-3-2-x.patch  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch

diff --git a/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch b/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch
new file mode 100644
index 0000000000..6732efce8c
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch
@@ -0,0 +1,28 @@
+From beea0f97b3c95ec69f3e269df1af87eb2cdd3c46 Mon Sep 17 00:00:00 2001
+From: Otto Hollmann <otto@hollmann.cz>
+Date: Tue, 12 Dec 2023 13:58:32 +0100
+Subject: [PATCH] Add support for OpenSSL 3.2.x
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/13
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/TpmToOsslMath.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/TpmToOsslMath.h b/src/TpmToOsslMath.h
+index 0b18191..1271937 100644
+--- a/src/TpmToOsslMath.h
++++ b/src/TpmToOsslMath.h
+@@ -76,10 +76,10 @@
+  * As of release 3.0.0, OPENSSL_VERSION_NUMBER is a combination of the
+  * major (M), minor (NN) and patch (PP) version into a single integer 0xMNN00PP0L
+  */
+-#if OPENSSL_VERSION_NUMBER > 0x30100ff0L
++#if OPENSSL_VERSION_NUMBER > 0x30200ff0L
+ // Check the bignum_st definition in crypto/bn/bn_lcl.h or crypto/bn/bn_local.h and either update
+ // the version check or provide the new definition for this version.
+-// Currently safe for all 3.1.x
++// Currently safe for all 3.2.x
+ #   error Untested OpenSSL version
+ #elif OPENSSL_VERSION_NUMBER >= 0x10100000L
+ // from crypto/bn/bn_lcl.h
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
