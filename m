Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17777C4320A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:26:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2EB760F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 21:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2EB760F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8172840264;
	Thu,  5 Aug 2021 21:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jd9-Y0ltRYqT; Thu,  5 Aug 2021 21:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40341401CA;
	Thu,  5 Aug 2021 21:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BFE01BF2BB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9839640270
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 21:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-XU-X7mZQVH for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 21:25:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86B1C40265
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 21:25:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h13so8356228wrp.1
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 14:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pgpt/DiKas+YqtyMEgXMHF1IlejXlPZORAkL9Ltj4zw=;
 b=EfRb0pcsLRoZ2kwgjlL7jyt7Ia6hxr2m+so+cO1uE39TYKTYO0Vh9N9o4nbIWRg/Oe
 z5MvjSrGdNegwL4YXVAeK6gYm+FNPTfY+GJ0evOIf3/v4doeljO9ttnsST0CbmIzBzlH
 sFpjhMVDLHLlLQS2hFBp8EsHrPYmJLfpjWOQeNN7mW7nP4vzqtbwXicqWkWlox1rOtzP
 BOl1xQoDRpOcY2hWvXsm46g12N5uacE9/4i0nJoBEL9o5kHlCWzduUrTJFumPB7ppTxr
 gVq04+ygRTijqDkT/kByog45d2O8Jj5T/otEkStD8e4QmJBAgrJyAt+JA37YxcUFucVD
 rZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pgpt/DiKas+YqtyMEgXMHF1IlejXlPZORAkL9Ltj4zw=;
 b=tIMpEq7mAPMgFzjtKeBU1gfcbzzCRZH6q0y3cIS8vzui+bmnknFRqlf8hBz2gLw2Py
 fy3f+MawqTWh8sZH+7NHbsQWiPQds21b5kpKtSXb3VVIInve5BxXdv73BkNeZgVpW/Hj
 zg3rhkoOCq0xrCdi7+xbb76VLKvm7b934WuqVkXGeOCH+Bw2nd8UtlA4usFZ6+XSjexc
 cHlmyaAWdVb+o9YoT4E9+xvFxBzz+IoMbudM3kyyWO7kvUm+cOR659v3k75w3i1ZSNHL
 PkfNJfktVycnFPqlsc3wDBO95wvCf0+bRHpfQyHJJPhm82GNB5GkypU/qeaB0Cpnhof7
 MMeg==
X-Gm-Message-State: AOAM530/6HClFyIcZiXtmJzDnfP8W3evhuGhM9kn4kNpznHNpbxoOwVe
 LgCJ3RIR4KJOQLlpgpHP7k8Sm+manFvoFQ==
X-Google-Smtp-Source: ABdhPJxh1pADj8eCQwQw7A0U4KjT8E+WBVm8sROz5PuB6JHbQS2apnBfVydS6owuMAMast4A41oT/Q==
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr7241988wrg.134.1628198755463; 
 Thu, 05 Aug 2021 14:25:55 -0700 (PDT)
Received: from kali.home (pop.92-184-97-59.mobile.abo.orange.fr.
 [92.184.97.59])
 by smtp.gmail.com with ESMTPSA id p14sm3687423wmi.25.2021.08.05.14.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 14:25:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 23:25:40 +0200
Message-Id: <20210805212540.3032007-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libesmtp: security bump to version
 1.1.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

After more than a decade, libESMTP version 1.0.6 is superceded. Despite
proving robust a little bitrot has occurred, especially regarding
OpenSSL support. The original application data APIs are prone to memory
leaks and are deprecated in favour of safer replacements. Version 1.1
updates libESMTP without breaking API and ABI compatibility and
provides a basis for future development.

In addition to updates to the codebase, documentation is modernised and
is more comprehensive.

All libESMTP users are encouraged to upgrade from version 1.0.6.

- Update license files
- Update indentation in hash file (two spaces)
- Switch to meson-package
- Handle threads and tls meson options
- libesmtp-config has been dropped:
  https://github.com/libesmtp/libESMTP/issues/8
- Fix CVE-2019-19977: libESMTP through 1.0.6 mishandles domain copying
  into a fixed-size buffer in ntlm_build_type_2 in ntlm/ntlmstruct.c, as
  demonstrated by a stack-based buffer over-read.

https://github.com/libesmtp/libESMTP/releases/tag/v1.1.0
https://libesmtp.github.io/changes-since-v1.0.6.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libesmtp/Config.in     |  1 +
 package/libesmtp/libesmtp.hash |  6 +++---
 package/libesmtp/libesmtp.mk   | 24 +++++++++++++++++-------
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index db2dc8ec9c..5c6a412134 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBESMTP
 	bool "libesmtp"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Library for sending emails through SMTP.
 
diff --git a/package/libesmtp/libesmtp.hash b/package/libesmtp/libesmtp.hash
index 9e1ca22b5b..596ed4eaca 100644
--- a/package/libesmtp/libesmtp.hash
+++ b/package/libesmtp/libesmtp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	d0a61a5c52d99fa7ce7d00ed0a07e341dbda67101dbed1ab0cdae3f37db4eb0b	libesmtp-1.0.6.tar.bz2
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
-sha256	f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa	COPYING.LIB
+sha256  32bc3614ca12d21c7d933f32d43410e8744b6f91fdca7732da9877a385e4e6c3  libesmtp-1.1.0.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING.GPL
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index 1f5cdec191..10fe7bf324 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -4,14 +4,24 @@
 #
 ################################################################################
 
-LIBESMTP_VERSION = 1.0.6
-LIBESMTP_SOURCE = libesmtp-$(LIBESMTP_VERSION).tar.bz2
-LIBESMTP_SITE = http://sources.buildroot.net/libesmtp
+LIBESMTP_VERSION = 1.1.0
+LIBESMTP_SITE = $(call github,libesmtp,libESMTP,v$(LIBESMTP_VERSION))
 LIBESMTP_INSTALL_STAGING = YES
-LIBESMTP_CONFIG_SCRIPTS = libesmtp-config
-LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
 LIBESMTP_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
-LIBESMTP_LICENSE_FILES = COPYING COPYING.LIB
+LIBESMTP_LICENSE_FILES = COPYING.GPL LICENSE
 LIBESMTP_CPE_ID_VENDOR = libesmtp_project
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBESMTP_CONF_OPTS += -Dtls=enabled
+LIBESMTP_DEPENDENCIES += openssl
+else
+LIBESMTP_CONF_OPTS += -Dtls=disabled
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBESMTP_CONF_OPTS += -Dpthreads=enabled
+else
+LIBESMTP_CONF_OPTS += -Dpthreads=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
