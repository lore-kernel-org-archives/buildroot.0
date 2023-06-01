Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C909C77B7A
	for <buildroot@archiver.kernel.org>; Thu,  1 Jun 2023 16:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5727284300;
	Thu,  1 Jun 2023 16:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5727284300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7IT9cN820qt; Thu,  1 Jun 2023 16:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D11D842FB;
	Thu,  1 Jun 2023 16:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D11D842FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42AAA1BF589
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 16:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29372842FB
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 16:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29372842FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8DNzg8kYLUc for <buildroot@lists.busybox.net>;
 Thu,  1 Jun 2023 16:11:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B87BD842F3
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B87BD842F3
 for <buildroot@busybox.net>; Thu,  1 Jun 2023 16:11:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f3baf04f0cso1329412e87.1
 for <buildroot@busybox.net>; Thu, 01 Jun 2023 09:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685635911; x=1688227911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Y3QmI+2ZZ9e9+ONHx6kaGW9IALF2FVXL5MQc1ciJug=;
 b=BEOSP5hgyfkCYwonZi9NZxo+UA5U5SpfzpfZr0O79rPGQlPaTqIE1ZclXdIy7KqEhI
 i01ZKuHa70J+r/PBJ5fJEp+yomrGB/G/Y1HJyLgSSuuTD3TLRlwJmEnE85oYJQlOJLa4
 uuI5Ij6jPuoSrb/SjZ2B73fu8ZcSYDmAOvhee5S6ib7rdoXevZSwq4CJxBsfD5yEq4QQ
 EvNzTLi/r7aqPRofudK4AdLsUdglOPI5sB3U9nhm+1RtWOtThE7CGESk7mspLVDVenZF
 yjXj6zNnXPeDoRaYtmQ/eNhoYXieyXP56WHkPDVmznrl9EJc7TyJaNLOrmhsk2bcipt0
 RnOA==
X-Gm-Message-State: AC+VfDy5Kz+An2atyy5Ub20EZzb1sfpsnM0IFqWIYVZR06ANGEy8X9mX
 2u2xApJLhjVqUPKcFQsma7LJRddrlWc=
X-Google-Smtp-Source: ACHHUZ4L4/t6lbx4fB9fBfMz3ie4JuZ4g4YZDje586XB4ndPscjHgM2OEqM9kqcJ0rk857hsV5dzLQ==
X-Received: by 2002:ac2:4253:0:b0:4f3:b0e1:feba with SMTP id
 m19-20020ac24253000000b004f3b0e1febamr266272lfl.16.1685635911169; 
 Thu, 01 Jun 2023 09:11:51 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a7bc448000000b003f42158288dsm2807139wmi.20.2023.06.01.09.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 09:11:50 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  1 Jun 2023 18:11:46 +0200
Message-Id: <20230601161146.40829-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685635911; x=1688227911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Y3QmI+2ZZ9e9+ONHx6kaGW9IALF2FVXL5MQc1ciJug=;
 b=FsbsPKktPMi6l9OmTemSiZIRGVuiZFcpvi8/Rfp0DS+jS29S68p7hNjM4oVuYOqkBn
 ynAL+TscH9gYTPUcXmW/iVNi3M71B4Qt0BxmQzVYMIkR7i57g34kUdPiUBbJ7x6BAKmB
 +HTv9RmyuOv7bxLpt3E45DgAdcWV07lerCYYHqpVhGaOcMt0YzRo0GzYWejCK2rz3hJu
 ABeGDu6QunDyMBnG8yQM1tty2gwIrivvUv/3PjPfdwCcYVHcU8PvAv0/dqBGIsaUGQva
 ZskR2VrmeZ/l2hk7IN1i4owDM+rfIfwd5tZNBnk9rl/UHraD95ox1rMyRWzg1dxeD7zM
 Hhlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FsbsPKkt
Subject: [Buildroot] [PATCH] package/libopenssl: security bump to version
 1.1.1u
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fix CVE-2023-2650  Possible DoS translating ASN.1 object identifiers

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch | 2 +-
 ...Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 2 +-
 .../0007-Fixup-support-for-io_pgetevents_time64-syscall.patch | 2 +-
 package/libopenssl/libopenssl.hash                            | 4 ++--
 package/libopenssl/libopenssl.mk                              | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch b/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
index c51a3cd684..ef40b0353a 100644
--- a/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
+++ b/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
@@ -13,7 +13,7 @@ diff --git a/crypto/mem_sec.c b/crypto/mem_sec.c
 index 9e0f670..32c7282 100644
 --- a/crypto/mem_sec.c
 +++ b/crypto/mem_sec.c
-@@ -485,7 +485,7 @@ static int sh_init(size_t size, int minsize)
+@@ -491,7 +491,7 @@ static int sh_init(size_t size, int minsize)
      if (mlock(sh.arena, sh.arena_size) < 0)
          ret = 2;
  #endif
diff --git a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index b5070ad74c..9f34e1f5fb 100644
--- a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -21,7 +21,7 @@ diff --git a/Configure b/Configure
 index 5a699836f3..f9152b1702 100755
 --- a/Configure
 +++ b/Configure
-@@ -1417,6 +1417,10 @@ my %predefined_CXX = $config{CXX}
+@@ -1424,6 +1424,10 @@ my %predefined_CXX = $config{CXX}
      ? compiler_predefined($config{CROSS_COMPILE}.$config{CXX})
      : ();
  
diff --git a/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch b/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
index 4313eecd6d..7b003e4836 100644
--- a/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
+++ b/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
@@ -23,7 +23,7 @@ diff --git a/engines/e_afalg.c b/engines/e_afalg.c
 index 9480d7c24b..4e9d67db2d 100644
 --- a/engines/e_afalg.c
 +++ b/engines/e_afalg.c
-@@ -124,27 +124,56 @@ static ossl_inline int io_read(aio_context_t ctx, long n, struct iocb **iocb)
+@@ -121,27 +121,56 @@ static ossl_inline int io_read(aio_context_t ctx, long n, struct iocb **iocb)
      return syscall(__NR_io_submit, ctx, n, iocb);
  }
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index ebc56b11dd..708926de80 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1t.tar.gz.sha256
-sha256  8dee9b24bdb1dcbf0c3d1e9b02fb8f6bf22165e807f45adeb7c9677536859d3b  openssl-1.1.1t.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1u.tar.gz.sha256
+sha256  e2f8d84b523eecd06c7be7626830370300fbcc15386bf5142d72758f6963ebc6  openssl-1.1.1u.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 6e84f06175..178979f43b 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1t
+LIBOPENSSL_VERSION = 1.1.1u
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
