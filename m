Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7CFC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 22:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02DF940917;
	Sun, 29 Jan 2023 22:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02DF940917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GE1tIz0vylH; Sun, 29 Jan 2023 22:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C554F409FA;
	Sun, 29 Jan 2023 22:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C554F409FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D28321BF46D
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 22:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C728142B
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 22:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C728142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RjjKGL88mNZ for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 22:50:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9EFA81426
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9EFA81426
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 22:50:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id bk15so27138594ejb.9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 14:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uA1JJ0ODkg3kcBrKSOs7Hyk4u7L2a+Taftyxg1Qjf14=;
 b=C14m3yfQrSYkCnqlPNebqmepo4tdFc8S6VD//9iSssW24KYmOhmOFEstgQShfoOnCK
 TqDnutdaBKsK11cGnW1SPJ0LZSIcUsWDJIAcdj9Rp7bbuBgEt2iVDBBAORKsmZRKS3rn
 1shJqCrhpou9sUDF7cqOuGJUdOAAwOpkOuPZGMC8y04nL1gKhGzNEXjmngw8OTSReBl1
 CyicyxxHDCkLdQoJxtJV06vnkopEZN1nXszj+HfGtOIg0oxFzHeouoxuP0xDrkBGZuN2
 DnwWe/+wLba5XHka6dlGWMgtT5FNfOAdgi5fhLr3Qj2oZaOayhOaXN9kE5gpdyGAk//1
 TenQ==
X-Gm-Message-State: AFqh2kp6Hb/hpXqnSdnWDFXMejBRGYQxABD+s0BeDorBESmCOdASSqmz
 Uy6+pZOg/5h1N7GeXgeY8ejABi2X0Fl0VddE
X-Google-Smtp-Source: AMrXdXu9hw907KXqnMnn+OA9weEZL5Oyq1ZeWR9m3TxzIdHQKBJsajNA8LxqPFu/Tyh3ELRxov2H7Q==
X-Received: by 2002:a17:906:7c3:b0:870:95b6:94a4 with SMTP id
 m3-20020a17090607c300b0087095b694a4mr46687095ejc.48.1675032626608; 
 Sun, 29 Jan 2023 14:50:26 -0800 (PST)
Received: from devlab.lan (93-43-212-100.ip93.fastwebnet.it. [93.43.212.100])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170906311500b0087045ae5935sm5925945ejx.1.2023.01.29.14.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 14:50:26 -0800 (PST)
From: Alessandro Partesotti <a.partesotti@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 23:50:01 +0100
Message-Id: <20230129225000.336472-1-a.partesotti@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230128094119.10660-1-a.partesotti@gmail.com>
References: <20230128094119.10660-1-a.partesotti@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uA1JJ0ODkg3kcBrKSOs7Hyk4u7L2a+Taftyxg1Qjf14=;
 b=oG5QMXIWov+xrBRIGqeZ6yMIWcnqatm8suBpRSg2fIG+37gevqkSESTMobddJdkBrD
 nQhNSvKm+1YBIJ0uEXFvLP0NzOwJaFI8Apa6JC6gyVI7ePX+wgUgjdPArkEJ/NivCA9f
 qNf4WAZ90urGnu0yBZbj+RsrFhclBdvuZbuqqflY2qmzVKOJ9/KAqttom2z47xRZoO/I
 PJA65gr/fwdFO/bA9iCw5EQDUF3cGn1O+kW5OxxNNu7vjwmI9IOpVmxsuhr0U25M7zsE
 dTlNYsNAurxBexeP+bPXc1qhfeQ2DZSeMGyBMyRcjv2fTSRby3+7f7R9bQjHEK71qWrM
 dKqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oG5QMXIW
Subject: [Buildroot] [PATCH v2 1/1] package/oatpp:: new package
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
 Samuel Martin <s.martin49@gmail.com>,
 "YANN E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package introduce oatpp in BR buildsystem.
Oatpp must be used as static library as upstreaam suggest.

Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
---
Changes v1 -> v2
- indentation and spaces (suggested by Yann E. MORIN)
- generic macro changes (suggested by Yann E. MORIN)

Signed-off-by: Alessandro Partesotti <a.partesotti@gmail.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/oatpp/Config.in  | 13 +++++++++++++
 package/oatpp/oatpp.hash |  2 ++
 package/oatpp/oatpp.mk   | 16 ++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/oatpp/Config.in
 create mode 100644 package/oatpp/oatpp.hash
 create mode 100644 package/oatpp/oatpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..b2d173dc2e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3149,3 +3149,6 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:      Alessandro Partesotti <a.partesotti@gmail.com>
+F:      package/oatpp/
diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..c7394ae53d 100644
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
diff --git a/package/oatpp/Config.in b/package/oatpp/Config.in
new file mode 100644
index 0000000000..44f0fabed8
--- /dev/null
+++ b/package/oatpp/Config.in
@@ -0,0 +1,13 @@
+comment "Oat++ needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OATPP
+	bool "Oat++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Oat++ is an open-source C++ web framework for highly
+	  scalable and resource-efficient web applications.
+	  It provides all the necessary components for
+	  production-grade development.
+	  See https://oatpp.io/docs/start
diff --git a/package/oatpp/oatpp.hash b/package/oatpp/oatpp.hash
new file mode 100644
index 0000000000..fadea2a05f
--- /dev/null
+++ b/package/oatpp/oatpp.hash
@@ -0,0 +1,2 @@
+# Hash from: https://github.com/oatpp/oatpp/archive/1.3.0/oatpp-1.3.0.tar.gz
+sha512  4fe8587efe1b4ecae14554ec8edb209e5558a3e4a4e6ff49bbfaaf06d2cc12f2cc306c5edc43b8dafc465aff53098ad4bebb9971694761b91a553730d5acb59a  oatpp-1.3.0.tar.gz
diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
new file mode 100644
index 0000000000..f949a5cbc9
--- /dev/null
+++ b/package/oatpp/oatpp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# oatpp
+#
+################################################################################
+
+OATPP_VERSION = 1.3.0
+OATPP_LICENSE = Apache-2.0
+OATPP_LICENSE_FILES = LICENSE
+OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
+OATPP_CMAKE_OPTS = -DBUILD_SHARED_LIBS=OFF
+OATPP_INSTALL_STAGING = YES
+# Only builds a static lib and copy headers:
+OATPP_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
