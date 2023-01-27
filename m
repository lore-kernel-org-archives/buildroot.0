Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FC3C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 23:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4CCB40547;
	Fri, 27 Jan 2023 23:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4CCB40547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3nTG2ww3GrF; Fri, 27 Jan 2023 23:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2732640579;
	Fri, 27 Jan 2023 23:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2732640579
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86DFF1BF34B
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 23:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FD5682423
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 23:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FD5682423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Lv2phbwIph3 for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 23:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA1D8231F
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEA1D8231F
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 23:18:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id mg12so17662390ejc.5
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 15:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LhQ4HNqXmXbyEZqHxm8jSCBnqVm2Wy5J7yLcFxXIvZA=;
 b=GvrYwm46FWRQNCBSzFKADWvROtiwAOMyZcQrJrntWp+3NCH0DyCFFqr9PpIbifyedW
 cRweYnzkqAGeiugb4Tz/05paGnBtQ3FUtaOtz60WFTztdF5xeiF0QzfdIpmpnDMNRTqO
 UGdJxjX7VITgNRAIbAVjYyQR2QEucRrlWzzUaV5hGVmM9Jce5Olc+G7T/NUVaARpzAwa
 BVm3Izesb8PR+VtSMTXT2yCSb0YiFghJBddlza7/8Z8+T4E0oLjqMWyPPajPtBp+f0zz
 ncsNq5dudmYr5GSYnLWx36+cOkV4aF9tRR+WTumn8dTxwqlgSoik2ux5SLXofRZ5E41g
 zp6w==
X-Gm-Message-State: AFqh2kogpxMsqwTOTIuvYmMzrxTu5LMY8apuYWF8wP/zge/yEWSbRixy
 zu81V8559LvEjiIEnsGLa0xXbJAVdxMvtA==
X-Google-Smtp-Source: AMrXdXvBCKWi4EbTdZYst2xOw9s+eTlyyhok57X+V/vRGlysF/65vTSydsers7Ee1FYI5i1GSRX2GQ==
X-Received: by 2002:a17:906:d78d:b0:7c0:d452:2e74 with SMTP id
 pj13-20020a170906d78d00b007c0d4522e74mr44525463ejb.4.1674861491639; 
 Fri, 27 Jan 2023 15:18:11 -0800 (PST)
Received: from devlab.lan (93-43-212-100.ip93.fastwebnet.it. [93.43.212.100])
 by smtp.gmail.com with ESMTPSA id
 bq21-20020a056402215500b0046c7c3755a7sm3041158edb.17.2023.01.27.15.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 15:18:11 -0800 (PST)
From: Alessandro Partesotti <a.partesotti@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 00:18:08 +0100
Message-Id: <20230127231808.1364957-1-a.partesotti@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LhQ4HNqXmXbyEZqHxm8jSCBnqVm2Wy5J7yLcFxXIvZA=;
 b=PA3Yfl41sSw5iWajRq0Bj1BTOglmyh9X6BPisB7zUaqX/qaxF06CLx/v+E4i+ipLs7
 HVk4xeRr+O0FZ19XbhjNJ32L4AbKardYgK0OU6uydZ3mNfXUSF6/ALMldXNL6zEcID9D
 eFGcxLySbqVcKdXFqqc39Pg/hXze3Ms0uj7cuucmJsqG8HnLNx6jah4IFe483QaLEB8m
 +cADKXldoniSPY3wq79NC1ugsYLiJblomj2tK3HK9ko1NLkzBXIXk17qZ7gyxo62mL4o
 ULAsu8xkOqjlYLfiGF6fgGAnT6prsCsvtw3XBelh1Tc+yijKJ2ozncKlRwRbew22Fy41
 JWzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PA3Yfl41
Subject: [Buildroot] [PATCH 1/1] package/oatpp:: new package
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
Cc: Alessandro Partesotti <a.partesotti@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package introduce oatpp in BR buildsystem. oatpp must be used as static linkable library in $(STAGING_DIR)/usr/include/oatpp-$(OATPP_VERSION)/oatpp for user that want to build therir own application by linking oatpp in a buildroot build system.

Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
---
 package/Config.in       |  3 +++
 package/oatpp/Config.in | 14 ++++++++++++++
 package/oatpp/oatpp.mk  | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/oatpp/Config.in
 create mode 100644 package/oatpp/oatpp.mk

diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..481876a278 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1941,6 +1941,7 @@ menu "Networking"
 	source "package/nss-mdns/Config.in"
 	source "package/nss-myhostname/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
+	source "package/oatpp/Config.in"
 	source "package/omniorb/Config.in"
 	source "package/open-isns/Config.in"
 	source "package/open62541/Config.in"
@@ -2702,4 +2703,6 @@ menu "Text editors and viewers"
 	source "package/vim/Config.in"
 endmenu
 
+
 endmenu
+
diff --git a/package/oatpp/Config.in b/package/oatpp/Config.in
new file mode 100644
index 0000000000..3cf6bf3ef5
--- /dev/null
+++ b/package/oatpp/Config.in
@@ -0,0 +1,14 @@
+comment "Oat++ needs a toolchain w/ C++, threads and Paranoid Unsafe Path compiler flag disabled"
+        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_COMPILER_PARANOID_UNSAFE_PATH
+
+config BR2_PACKAGE_OATPP
+	bool "Oat++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_COMPILER_PARANOID_UNSAFE_PATH
+	help
+		Oat++ is an open-source C++ web framework for highly scalable and resource-efficient web applications.
+		It provides all the necessary components for production-grade development.
+		This package allows you to use oatpp to statically build this a project inside the staging directory.
+		See https://oatpp.io/docs/
+
diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
new file mode 100644
index 0000000000..7abdeb6de5
--- /dev/null
+++ b/package/oatpp/oatpp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# oatpp
+#
+################################################################################
+
+OATPP_VERSION= 1.3.0
+OATPP_SOURCE= $(OATPP_VERSION).tar.gz
+OATPP_SITE= https://github.com/oatpp/oatpp/archive/refs/tags
+#OATPP_SITE= git://github.com/oatpp/oatpp.git
+OATPP_INSTALL_STAGING= YES
+OATPP_INSTALL_TARGET= NO
+OATPP_MAKE=make
+
+$(eval $(cmake-package))
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
