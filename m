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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5AFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:39:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A1B60FBF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51A1B60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE8DD83487;
	Sun, 19 Sep 2021 14:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hyrp-g7Pqu67; Sun, 19 Sep 2021 14:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44BD5828A9;
	Sun, 19 Sep 2021 14:39:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53DF31BF27A
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50AE9828A9
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PV1I85qJkgQ7 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 14:39:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FCE880F08
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 14:39:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t8so16961832wri.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pRTku87MkGLnUnmQdCeFsFxgJXc9Q0oDYkgaJTDnuz0=;
 b=NYy0KFbjAFXLrqQAVysxriSpYDPRMybmoFj54adIN7BulSwQScwByh2Uk1JdV7IVtu
 GqPO9+RbVqfuACykjfMNYk4aQXigdkGLnQVUOuy+SBbf/qeWpV2YHCBPq+E3p9Y8kTK7
 ibYI+fyfJY7fUasA8viI78CM8CeJkTI361PtDq8S3yEmoVBrung4huiqQK7YC4KyJe96
 275azg76IHPw4WI6qgW+z+UFlnr5GvVqM2/defi9yX567h/Qc2o2kahwQkApaBW2oqLL
 /hqFIefhbZGv+BQkmo1mGh1h2EGrP8ggSDQQ2+3ip9HBxtgG0JMhI/BDCTFYjo9icwaN
 k42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pRTku87MkGLnUnmQdCeFsFxgJXc9Q0oDYkgaJTDnuz0=;
 b=J7o90AjE7y9vF15jvfZrJ0hlVr2G4ae+ge4qbXr1dxynQaBdp2hNvSLwWu9/Cpfmgh
 fKeYUWUvKmX5VhPIPwDwG88wbOJ2+jDz7HCxO/YJWrR7SKVdoRll5ZbK+mtWpQp0Dnda
 2v+rnudhlaPz+lck/DRR8myQ/hnmhm6wCceHKXXhvgQ4mhz4NuvyQ0SAdzTjdIowi75v
 JJk52x4qyrgguSleVeDx/VYXlxBfOMLgDFDNgMgKrWoRledUNMHNIRYATekYfFVvOzP1
 woueEJACUwFhR6Tlsi6AWbPpDud6BYOeiiF2XPcKnTfgJGe8GC3wOHVrB47nfD/cH89+
 E6MA==
X-Gm-Message-State: AOAM533JJ8WRRjqwEKEv1APnkBd0yR+YNwkBgoLVwg5mzZJ31SdMJH4D
 zTpf2Ow2z6OyHPbI9D3X7R8+usptMKE=
X-Google-Smtp-Source: ABdhPJzKh1dxUX524J0WcFNUhOrPrvxQDD41gLaKfLkPNAnegsNKOEOOv3KUPGcZ/NhPMguIqsN2mQ==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr23068056wrm.198.1632062364047; 
 Sun, 19 Sep 2021 07:39:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id g131sm11778103wme.22.2021.09.19.07.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 07:39:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 16:38:18 +0200
Message-Id: <20210919143818.3448648-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/log4cxx: bump to version 0.12.0
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Drop patch (already in version)
- Switch to cmake-package

https://www.mail-archive.com/announce@apache.org/msg06525.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-without-wchar.patch        | 55 -------------------
 package/log4cxx/log4cxx.hash                  |  4 +-
 package/log4cxx/log4cxx.mk                    | 16 ++----
 3 files changed, 6 insertions(+), 69 deletions(-)
 delete mode 100644 package/log4cxx/0001-fix-build-without-wchar.patch

diff --git a/package/log4cxx/0001-fix-build-without-wchar.patch b/package/log4cxx/0001-fix-build-without-wchar.patch
deleted file mode 100644
index fc0e7be5c9..0000000000
--- a/package/log4cxx/0001-fix-build-without-wchar.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 1fa70eaf24d75e84625f22779ec347fd29bf1ae6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 24 Sep 2020 08:47:37 +0200
-Subject: [PATCH] fix build without wchar
-
-Disable wencode without wchar or the build will fail on:
-
-odbcappender.cpp: In static member function 'static void log4cxx::db::ODBCAppender::encode(wchar_t**, const LogString&, log4cxx::helpers::Pool&)':
-odbcappender.cpp:362:22: error: 'wencode' is not a member of 'log4cxx::helpers::Transcoder'
-  *dest = Transcoder::wencode(src, p);
-                      ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/bab5329fdeb894471bfd5192ce04d3fbd2f9be5c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/apache/logging-log4cxx/commit/f171f818c798d48631d5b45851e4593953f31d9c]
----
- src/main/cpp/odbcappender.cpp              | 2 ++
- src/main/include/log4cxx/db/odbcappender.h | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/main/cpp/odbcappender.cpp b/src/main/cpp/odbcappender.cpp
-index 6bfa519e..218df132 100644
---- a/src/main/cpp/odbcappender.cpp
-+++ b/src/main/cpp/odbcappender.cpp
-@@ -357,10 +357,12 @@ void ODBCAppender::setSql(const LogString& s)
- 	}
- }
- 
-+#if LOG4CXX_WCHAR_T_API || LOG4CXX_LOGCHAR_IS_WCHAR_T || defined(WIN32) || defined(_WIN32)
- void ODBCAppender::encode(wchar_t** dest, const LogString& src, Pool& p)
- {
- 	*dest = Transcoder::wencode(src, p);
- }
-+#endif
- 
- void ODBCAppender::encode(unsigned short** dest,
- 	const LogString& src, Pool& p)
-diff --git a/src/main/include/log4cxx/db/odbcappender.h b/src/main/include/log4cxx/db/odbcappender.h
-index a26bc35b..fdc144ff 100644
---- a/src/main/include/log4cxx/db/odbcappender.h
-+++ b/src/main/include/log4cxx/db/odbcappender.h
-@@ -300,8 +300,10 @@ class LOG4CXX_EXPORT ODBCAppender : public AppenderSkeleton
- 	private:
- 		ODBCAppender(const ODBCAppender&);
- 		ODBCAppender& operator=(const ODBCAppender&);
-+#if LOG4CXX_WCHAR_T_API || LOG4CXX_LOGCHAR_IS_WCHAR_T || defined(WIN32) || defined(_WIN32)
- 		static void encode(wchar_t** dest, const LogString& src,
- 			log4cxx::helpers::Pool& p);
-+#endif
- 		static void encode(unsigned short** dest, const LogString& src,
- 			log4cxx::helpers::Pool& p);
- }; // class ODBCAppender
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 535a0c4aac..6fc0d8836e 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/logging/log4cxx/0.11.0/apache-log4cxx-0.11.0.tar.gz.sha512
-sha512  f8aa37c9c094e7a4d6ca92dff13c032f69f1e078c51ea55e284fcb931c13256b08950af3ea6eaf7a12282240f6073e9acab19bfe217f88dbd62a5d2360f3fbdd  apache-log4cxx-0.11.0.tar.gz
+# From https://www.apache.org/dist/logging/log4cxx/0.12.0/apache-log4cxx-0.12.0.tar.gz.sha512
+sha512  00fe571f9c511bf93b17cac8269ce00f7e817e8d723acf62bddff1bbe0e7facd0ab2fd75c01a93870f7e5c66718b2b73fc22c5f193bfd204e34d052b1123e60d  apache-log4cxx-0.12.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 075f8cb371..49f4667a9a 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,29 +4,21 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 0.11.0
+LOG4CXX_VERSION = 0.12.0
 LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
 LOG4CXX_LICENSE_FILES = LICENSE
-# error: required file './compile' not found
-LOG4CXX_AUTORECONF = YES
 
 LOG4CXX_CONF_OPTS = \
-	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
-	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config \
-	--disable-dot \
-	--disable-doxygen \
-	--disable-html-docs
+	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
+	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
 LOG4CXX_DEPENDENCIES += libesmtp
-LOG4CXX_CONF_OPTS += --with-SMTP=libesmtp
-else
-LOG4CXX_CONF_OPTS += --without-SMTP
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
