Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7ECC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 20:26:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF1661074
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 20:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFF1661074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40BE28407F;
	Sun, 19 Sep 2021 20:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bT83JaI2fpW6; Sun, 19 Sep 2021 20:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9771583E9B;
	Sun, 19 Sep 2021 20:26:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C47B01BF4D5
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 20:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B41F940420
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 20:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FePli1hYfuty for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 20:26:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3CDF4039A
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 20:26:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w29so24983146wra.8
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WZtmXnGR32hcvufQIZi19id/5PXkTaDjzo6yOQ1dg9c=;
 b=A5OjhTHTndajrzXYnlsrizi+3tf3KRRskDK4dC9JwXiXKbkKLEG2MEof4mmQY1wwA/
 ChbE6y/wQbvUQllCYen81wRq53bN+nxGBlKRBKnW1dZ8OofyvuKwWgS5eHi3fOkIYy6T
 vmvh3ICv7KZpHjZQgfsOwZOf+K7kCk7Pqlec133NT4SabIHdTXWZAfJzIGQlBfRv/eRj
 eR3GthI957kdCurMOvJ2cYewP14ygTrdM8TXb2pfL6iuYMkpG3VM1OVJ6MwNyBrw7u2N
 g/15uVboq4ElPqoKa78+NVTlGHOe55swH8gstR+rTcnTzxMqdRJnohorFwiRPyC51OVY
 RjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WZtmXnGR32hcvufQIZi19id/5PXkTaDjzo6yOQ1dg9c=;
 b=ZLxTeI1W6mkmFSleuavUywaT79aeoLsHfQvjFhtyY1XVAI1hTeEfoln2nL1kbEjdJs
 H1DnVQEHKKE6p33OSr7Bxz+QScjbPySWckcaOvl1HY6KHCtXoTIzuzE3kSn49a1k+eDL
 PK72O7UrIiW/TxhK4OodtdasyUAWcH1ji8vwQ1rdZi/iMhNVlwGLP+ldpqKbYw84PIYX
 nW2LfgOtC/BN+ohQkHreoOdHTtQnFBQ6tVmLHdkFwcjzCaW6d9w0mE+tWd/rzAh4CWtW
 9ovGhSQpNoypSGGL3n1+khqXBEzNiA7cEZAddtAJq88dplpVxo5sK226vfbUVGAQUSuL
 4eaw==
X-Gm-Message-State: AOAM530JtuikVGl1/SxykoyhUyGLlBeCLLRkxmryAcifRBwiPHRsu6dH
 HMIIbSGWY/xIbr4IVKcEyIGZr5JP0es=
X-Google-Smtp-Source: ABdhPJyXQg5pE/eJbezHpxDUZr7Pes6YLE2OsdRo5Qr9T6c4IegNFfc0iPBRUJkXxPeoRuM9zAJ4Bw==
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr24588747wro.432.1632083161740; 
 Sun, 19 Sep 2021 13:26:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id g13sm12343634wmh.20.2021.09.19.13.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 13:26:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 22:25:23 +0200
Message-Id: <20210919202523.69758-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsrtp: bump to version 2.4.1
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- libnss is an optional dependency since version 2.3.0 and
  https://github.com/cisco/libsrtp/commit/a946b3f561757a08b879cb337bfa932086df3081
- Drop comment about pkg-config as libsrtp uses PKG_CHECK_MODULES to
  find libnss and openssl
- Update indentation in hash file (two spaces)

https://github.com/cisco/libsrtp/blob/v2.4.1/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsrtp/libsrtp.hash |  4 ++--
 package/libsrtp/libsrtp.mk   | 13 ++++++-------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index d4b7b54d03..3de0130f4c 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 44fd7497bce78767e96b54a11bca520adb2ad32effd515f04bce602b60a1a50b  libsrtp-2.2.0.tar.gz
-sha256 8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
+sha256  3cb580928fcd502426809c68406d04aaa5ef1af7ebb0a3a41a52a13576f2fc07  libsrtp-2.4.1.tar.gz
+sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 5cbd97957a..885f05a33c 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.2.0
+LIBSRTP_VERSION = 2.4.1
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
@@ -19,18 +19,17 @@ else
 LIBSRTP_MAKE_OPTS = libsrtp2.a shared_library
 endif
 
-# While libsrtp is not using pkg-config itself, it checks if
-# pkg-config is available to determine whether it should install
-# libsrtp.pc. Since installing it seems useful, let's depend on
-# host-pkgconf to make sure pkg-config is installed.
 LIBSRTP_DEPENDENCIES = host-pkgconf
 
 # openssl handling needs libdl support
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 LIBSRTP_DEPENDENCIES += openssl
-LIBSRTP_CONF_OPTS += --enable-openssl
+LIBSRTP_CONF_OPTS += --disable-nss --enable-openssl
+else ifeq ($(BR2_PACKAGE_LIBNSS),y)
+LIBSRTP_DEPENDENCIES += libnss
+LIBSRTP_CONF_OPTS += --enable-nss --disable-openssl
 else
-LIBSRTP_CONF_OPTS += --disable-openssl
+LIBSRTP_CONF_OPTS += --disable-nss --disable-openssl
 endif
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
