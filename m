Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DDAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 22:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4871582BE7;
	Sun,  9 Oct 2022 22:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4871582BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNf9KmM134tn; Sun,  9 Oct 2022 22:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5920282BC4;
	Sun,  9 Oct 2022 22:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5920282BC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89C291BF376
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 22:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63917416FD
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 22:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63917416FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYj6JcNI2F3j for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 22:02:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6738416FA
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6738416FA
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 22:02:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b4so14582581wrs.1
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 15:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k8AdEuLTiHrN/AErv39foSqUKo9ECgmSgsqUNOb/DAw=;
 b=5McUNZm946doLiutYC/HcdyR8p6h1xaZ29zZAaG4OYgikQFJuMbJHc6LrU4sLYaxSm
 0V+thq6xzyr4GDVOScJeDP68h3LO5MQFCi9Egt8I2X0W7gIeb1NGG+01a3OMxNAY74ZG
 vfNDzkQfjSiNmT4F8pbOSeEzLTRk1Y0Txbsw/3X/xDUMjKbjvILB+wH4oW0TOnDVwh/k
 NhPWH1O5Ps6gki6BPv+/ei77akp71lS3I888Bi4RFJIIJ31DsWc2fFsV/ZB5JTutqDPe
 arjUws91SAS3BUsGNysByjlGB1mHzq5lui9yuu5UN7kJ2/d+VmBm8T36n8r3oxZt1dOx
 bWTA==
X-Gm-Message-State: ACrzQf3oy7sHxxl+I82dnOtliBhPwpIY7cNe4fITAP9ZF/YpjnOIcYWc
 iL6NEpArr/nHtmE4fbhJrcGyG1pGfj0=
X-Google-Smtp-Source: AMsMyM5g/cfYsnGdqpELSnWfigUEowoRvJYpn1nsA+XHwNFaTlPKCEiV77gniFnc56m9KJQbUMXoag==
X-Received: by 2002:a5d:64a2:0:b0:230:c757:e3db with SMTP id
 m2-20020a5d64a2000000b00230c757e3dbmr120602wrp.495.1665352973709; 
 Sun, 09 Oct 2022 15:02:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay34-20020a05600c1e2200b003b4de550e34sm2234503wmb.40.2022.10.09.15.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 15:02:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Oct 2022 00:02:50 +0200
Message-Id: <20221009220250.310026-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k8AdEuLTiHrN/AErv39foSqUKo9ECgmSgsqUNOb/DAw=;
 b=YhXNjAxjVk6xN7ufY4hj1x60X6Qg9bltY2EHZx2a3wc1eJxPwK96Sww/SSsaop78kv
 1rk9Hdg49oe3xCSZy2Vi1ycgmL1Un8jhPFXAatusFyk1FY0ZQ+fZoPNRrycwFz00TuMq
 +QAa0+neP46YEy4ssUGLMV9N33rfB0pEE4gswhqPzqzme0BrrK3nnGYL1vAwUQMTuJ+8
 3eQZiKQNYcIlzXKTPla19I3APy/iNMWOTPGwDbWF3V//WvreRNmDjA0nzkm5LPj/JjHy
 kSo9WM/RYNi3FIQeASvxehBJmWFOjF0ntH4kv6dxF8x+JQ+2mrQHBv5EMIGBPe89nji2
 QhEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YhXNjAxj
Subject: [Buildroot] [PATCH 1/1] package/gnutls: bump to version 3.7.8
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bug fix and enhancement release on the 3.7.x branch.

https://lists.gnupg.org/pipermail/gnutls-help/2022-September/004765.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 46dd99291c..303f1351e0 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.7.tar.xz.sig
-sha256  be9143d0d58eab64dba9b77114aaafac529b6c0d7e81de6bdf1c9b59027d2106  gnutls-3.7.7.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.8.tar.xz.sig
+sha256  c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c51977fb396d4617114  gnutls-3.7.8.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 56dae4c6b7..6e2cc501ef 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).7
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
