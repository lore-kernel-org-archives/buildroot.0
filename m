Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6D5C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 09:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5619B40B95;
	Wed, 10 Aug 2022 09:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5619B40B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWO2Qg95ZSlD; Wed, 10 Aug 2022 09:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67BC24056E;
	Wed, 10 Aug 2022 09:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BC24056E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 126FB1BF578
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 09:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E17498175C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 09:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E17498175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oGq-OhvOB_Hy for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 09:49:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E11CF81455
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E11CF81455
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 09:49:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l22so17126987wrz.7
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 02:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=FWJwhBPvJ7WzO1B63Pt/U7JVwdC/Iphox256K0kvtHU=;
 b=0fzwhgLRVPJnsMk4IbIrkRrJ2nHzMyK6xFCP/SBCosD3YvsxFfUdnlrKc9qEAJ/5S1
 LVpu9w5Zahf8yPyehaAgLvJS00Vrimf52fun3j7rYx5xJbHwdBrSRvZRVekvKnyp/cID
 A8CLcZAIv80bzy6LMc5PeMYbLxgcfNit0cwj8TkU9lmk1E03BgjQ5r8j5uklIPz8Godn
 6t1dDVcjUBPMWVEKapBz0SDlGtvhPHXVN6paqyn0hETz8ofKOq7ZymezXL4pcGyTY+As
 P1ceWLooXOd+6Bfb5mYgnbfhHS+k58eSfXbSM1wlnrvZc0xLi7KBpxAZ1AkQawPiQm0V
 q7hQ==
X-Gm-Message-State: ACgBeo3DqTVADdBIcP7ljX8oG3KFHYDppKmnDJTokJBxrlKXZnoDAr6N
 QuZkYSNoLomcZqz0aIjNJj9bAxZtDLA=
X-Google-Smtp-Source: AA6agR4pIcdZ7e89CDx0FEaVlf5gp4zgglQXdQijfZdUfPHXoDuoEHUHAT5+qX7YlXW7nyemj1vMNA==
X-Received: by 2002:adf:d1c6:0:b0:220:676b:74bf with SMTP id
 b6-20020adfd1c6000000b00220676b74bfmr16268436wrd.262.1660124963610; 
 Wed, 10 Aug 2022 02:49:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n187-20020a1ca4c4000000b003a513ee7830sm2288387wme.27.2022.08.10.02.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 02:49:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 11:49:11 +0200
Message-Id: <20220810094911.2908651-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=FWJwhBPvJ7WzO1B63Pt/U7JVwdC/Iphox256K0kvtHU=;
 b=BwUgq/FE+wKVbF5DgxB4hXFjcSBLi+jtiSGHP0GU8IFzO4amNGuPFpyPkkNW7E0LDV
 aDoqBYVF9RezXVDnPeGxmeHi869AbPGdkpbXO9rrbIXu228dy7AsJqt8dkIkc1xqLQAe
 zeYLZEaJDGwK46CqrKnFw/pZb+xWXIvFJ+AoWOnR/0sb4/hO0M4UJ4qctTvpqB72nSoL
 QY/0C1e0OGznprC7PREMhjECbajT6UinAMf1DcId45S3totYBE4Vn58ltqpjSQNEwJ+N
 Q6HbOg7u8XG05lF445Zl84ANm7tb2rKg27S9HsQNI5Cj9IBddtGG90EecUAQqyLFF2kB
 VTEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BwUgq/FE
Subject: [Buildroot] [PATCH 1/1] package/libdill: bump to latest git commit
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following openssl static build failure raised
since the addition of the package in commit
d4b13b21024a894a2fc682090f3e01d53bd699e9 thanks to
https://github.com/sustrik/libdill/commit/b3b81d2c7bf4daf8a57925ddd40f5b6f13484187:

checking for SSL_ctrl  in -lssl... no
configure: error: libssl not found; install OpenSSL

Fixes:
 - http://autobuild.buildroot.org/results/0b5c1f8675d218e0abf57b4d46428fe06e28431e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdill/libdill.hash | 2 +-
 package/libdill/libdill.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdill/libdill.hash b/package/libdill/libdill.hash
index 4a1fb91a57..2f74b762c6 100644
--- a/package/libdill/libdill.hash
+++ b/package/libdill/libdill.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  6df7527e8f1e91f5106c21c5bfeaa69eee470bec476c74585143e3e439864404  libdill-fa01648cf2a8d06e53c965b45eeacfb3ac57bd04.tar.gz
+sha256  a883a38d4073f43612b3221f908428ce9f663f940e5dd89c8dfad14058890380  libdill-32d0e8b733416208e0412a56490332772bc5c6e1.tar.gz
 sha256  3f78d9c42c8919cb6dc63e51de17b9eb40a49d9cdd876ce59e77392721e8c2c6  COPYING
diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index 117e8254e0..9dda81d085 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
+LIBDILL_VERSION = 32d0e8b733416208e0412a56490332772bc5c6e1
 LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
 LIBDILL_LICENSE = MIT
 LIBDILL_LICENSE_FILES = COPYING
@@ -19,7 +19,7 @@ LIBDILL_CONF_OPTS += --disable-threads
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBDILL_DEPENDENCIES += openssl
+LIBDILL_DEPENDENCIES += host-pkgconf openssl
 LIBDILL_CONF_OPTS += --enable-tls
 else
 LIBDILL_CONF_OPTS += --disable-tls
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
