Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1F3C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 08:35:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547FF61178
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 08:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 547FF61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEE6E4055E;
	Thu,  9 Sep 2021 08:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3RJw7-qhqF2; Thu,  9 Sep 2021 08:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0971C4055C;
	Thu,  9 Sep 2021 08:35:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D10D61BF873
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 08:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF7C4849B4
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 08:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBTxZ2cOI8DT for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 08:35:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2179A82D45
 for <buildroot@busybox.net>; Thu,  9 Sep 2021 08:35:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i28so1345288wrb.2
 for <buildroot@busybox.net>; Thu, 09 Sep 2021 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xayuhOHrB25GDDV04vZC0FB+JQVYgX/j4CR5FWMSm5k=;
 b=oRmB0DIZ3x18T/zRGRdO2B6TXm2RcoknkIM/gwaxXRxy80lArVqVfijEQDKXRBUYnH
 lnaI8n9YLkMkBN93R80iHZZY18ARdiVAY7ITXsrapIzkneMq30DC1KXfzOAdcPMtZ1XF
 esDgFiJPp3reK2KbqJ8CJzRVn0DzFK23COt3UL20gSsuCjiIKj0UNX5iMfp6g2Sb/cFT
 gyY9QCLiIBwHEIQW4JdXRlk3Q8t8neKJSUiqXwtO6unUpVWEAKjjOzeghOvlN8FDO0BA
 PLFjlrNeucb9yDCzk4tjzTPwN1iIeCuUhzdrgaNbEeoeoLXw+Txn3RW7eBbJjxZ5aEQI
 pEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xayuhOHrB25GDDV04vZC0FB+JQVYgX/j4CR5FWMSm5k=;
 b=hhgUPudRX1izkeua1R0KBd52cJzLnTlN5vz5EBxv66J3//ujmq8A4jxGhLEVxAXgyE
 q/sdAkRA4uLm9folgG3nyqWayhyVsZjKYt5KYkl6tOfkenAvVE6f9Uky/mXNb7Q2u3qn
 jQPti/kg0M9Y5CsxQN/KMDw7n1Q0jJi88cJ5O1Yp3k5MNbVGH8cscVDTyDDWrdpPrhG7
 Hn6j4TtG0mL+igfXOkRhpn9HOex5Td60nzAOki4G3fe5da6Iy1dZdsSzMXmBUsojB48B
 bn6fRT2gPOUp4Pc+2XxIReSSUuwUqWiOph5qUwBNrfXsOT4os0jm9RQcOzDSJW2sp5YR
 6o2Q==
X-Gm-Message-State: AOAM531xrXEsHS3izPfhXslfIo6vPEIvIMjS/y9BTFvKoA4dqUA6psAy
 435+U+DvRAjtPOiKZcBpUf1bt5iQ4eE=
X-Google-Smtp-Source: ABdhPJwJmp3kxSFkqrckjPZJZ+mEuVB++r81i2FiPq2HuJDfKqvbn3gDzZs6SF44BSgoa3UYdT3nIw==
X-Received: by 2002:a05:6000:343:: with SMTP id
 e3mr2061645wre.96.1631176531417; 
 Thu, 09 Sep 2021 01:35:31 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t11sm946843wmi.23.2021.09.09.01.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 01:35:31 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  9 Sep 2021 10:35:25 +0200
Message-Id: <20210909083525.2066982-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgcrypt: bump to version 1.9.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...0001-configure.ac-add-an-option-to-disable-tests.patch | 4 ++--
 package/libgcrypt/libgcrypt.hash                          | 8 ++++----
 package/libgcrypt/libgcrypt.mk                            | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
index 21ff20a47..4ef02fba6 100644
--- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
+++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
@@ -24,7 +24,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 7fa4fa4d..f0bd90e4 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -39,9 +39,14 @@ else
+@@ -40,9 +40,14 @@ else
  doc =
  endif
  
@@ -44,7 +44,7 @@ diff --git a/configure.ac b/configure.ac
 index e8c8cd39..1a6b61e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2710,6 +2710,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+@@ -3198,6 +3198,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
  AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
  
  
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 26ec492e1..23562d0ed 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,7 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  6b18f453fee677078586279d96fb88e5df7b3f35  libgcrypt-1.9.3.tar.bz2
+sha1  1bccc8393482fa1953323ff429c6b5ba5676eb1a  libgcrypt-1.9.4.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.3.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  97ebe4f94e2f7e35b752194ce15a0f3c66324e0ff6af26659bbfb5ff2ec328fd  libgcrypt-1.9.3.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.4.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  ea849c83a72454e3ed4267697e8ca03390aee972ab421e7df69dfe42b65caaf7  libgcrypt-1.9.4.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 26be5d2f4..e5fdfcfc8 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.9.3
+LIBGCRYPT_VERSION = 1.9.4
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
