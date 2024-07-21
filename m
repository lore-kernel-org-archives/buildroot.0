Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63C8C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 07:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8BCF40474;
	Sun, 21 Jul 2024 07:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hkD6cPL5XAU; Sun, 21 Jul 2024 07:41:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B27E40578
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B27E40578;
	Sun, 21 Jul 2024 07:41:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD95C1BF868
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA5A140341
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 07:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VPH9sNCAy-1 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 07:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52DEA4033D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DEA4033D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52DEA4033D
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 07:41:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3685b9c8998so1138954f8f.0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 00:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721547688; x=1722152488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dnzd+lJe5c6kMJoUni90zktMoX6f6+FKQ7JGEmPUUdM=;
 b=jiwFrZCXxohhJIX1+77RZAEouyY7biEEyAvv28jesfL4GuLsuqsSH/ISXgTKTh6Q+F
 lqTrR5f/Anq1GLvHabnkDMmOswelwHuqW81elWqtQDWIUdNypBZy7YCAIyLwHutt8px+
 EMs7Qc1pkqIjZcSVw1/mRHX1PgCNqsA1Pc98CI01UYXV22GRVamG89psole4KcXQ/Kkd
 1G8XKReo+LP4QGIWcGcZxB9GTSznRy9Y3uOpsSQnPjgbOX3o/wTitMk42b9DAQVwpnr7
 OOe7si4wHy5hzc5Mrb68PmvLb8OSm8dVDr6qAORX4ast1+0n0ExN9s052p3DkhByuPU9
 ppwA==
X-Gm-Message-State: AOJu0YxovjHgiHYa5aD2l7GUyki5djJIO6TNdf+10PyIreSvGzsaImwc
 JmngqPRN55sPT0N6DoI8jjHalsh1lN0c1VHN4YHUP0nnRR74yyqtMRFF1w==
X-Google-Smtp-Source: AGHT+IHj5ycU3hE860hIrR0TEYLu5fbESXh0RhLMyiHsodglBV1o2xsEr6Pv+9k/tK4Kytn6hTK0kA==
X-Received: by 2002:a05:6000:1105:b0:367:8926:812e with SMTP id
 ffacd0b85a97d-369bbcbaabfmr1855312f8f.62.1721547688429; 
 Sun, 21 Jul 2024 00:41:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787eced0sm5323126f8f.98.2024.07.21.00.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 00:41:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 09:40:53 +0200
Message-ID: <20240721074053.90620-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240721074053.90620-1-fontaine.fabrice@gmail.com>
References: <20240721074053.90620-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721547688; x=1722152488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dnzd+lJe5c6kMJoUni90zktMoX6f6+FKQ7JGEmPUUdM=;
 b=GOdV09Kxj2jXGlbfiMNsKKNzvmmEkmQC5UmguJBEadbKA0IPC44MFCQyN50MSCaN/2
 kHLRbaGDXLl8xd0iEk8Q87/OWDQabLZ7+VQ+zaxLJC08F7eJ5CLKyIjkeBeO0Ccgz0X8
 Cq4WONud9mbhkfJkYtn0sU/Yyr37aWv3Cj+ngSNoYcwTMJrUKk3cBRR61+h6J86Cr0+V
 8NXVrJNQyz5ilW7xrYg29gkbi1POGW3rt7bAGxUBG2uxJDbN7PPsyZtoEABKJw2ZLT6i
 e2U0uC9mecmdNHyLjXcKtjl7KcXOfdZqXTh40e8++rtT43u2tO6qtCZqrqrjLJJvvGKn
 wwpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GOdV09Kx
Subject: [Buildroot] [PATCH 2/2] package/ibm-sw-tpm2: fix build with openssl
 3.3.x
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

Fix the following build failure with openssl 3.3.x raised since commit
6d5ce8609f17a3403d1148a0bbf7a2bdb5ec7f67:

In file included from BnValues.h:327,
                 from Global.h:80,
                 from Tpm.h:78,
                 from AuditCommands.c:62:
TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
   83 | #   error Untested OpenSSL version
      |     ^~~~~

Fixes: 6d5ce8609f17a3403d1148a0bbf7a2bdb5ec7f67
 - http://autobuild.buildroot.org/results/2fb5e1cb792fe25ef860ff8111622cd1ff3770bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lMath.h-fix-build-with-openssl-3.3.x.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch

diff --git a/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch b/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch
new file mode 100644
index 0000000000..a349c05d4c
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch
@@ -0,0 +1,40 @@
+From 1b5d9eb91f0d24d09d711ef839d301ee8b640d61 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jul 2024 09:08:39 +0200
+Subject: [PATCH] src/BnToOsslMath.h: fix build with openssl 3.3.x
+
+Fix the following build failure with openssl 3.3.x:
+
+In file included from BnValues.h:327,
+                 from Global.h:80,
+                 from Tpm.h:78,
+                 from AuditCommands.c:62:
+TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
+   83 | #   error Untested OpenSSL version
+      |     ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2fb5e1cb792fe25ef860ff8111622cd1ff3770bf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/15
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index df4bcfb..72939ea 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30200ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x30300ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
