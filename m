Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E3CC54EED
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5267341517;
	Sun, 29 Jan 2023 21:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5267341517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7H2sBFeosK6; Sun, 29 Jan 2023 21:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C23415D4;
	Sun, 29 Jan 2023 21:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C23415D4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC081BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EEF940102
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EEF940102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_Fi9gGr4hYo for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:23:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C779F400CC
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C779F400CC
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:23:38 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id fi26so9234044edb.7
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 13:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IQPYoGsWCg5Gwf1QxmoXP6f6tLNu3vUA3envPCgV8rk=;
 b=79DODaK26nOwldlUgxDkoHatRx2Ju2NvwluK9dRu1CqUw2XfCQ6A6BIQjkrJdS7h9D
 ey7KHYH+xnVdUJFxLYrI+9F2o27RhpP/x08pawYgXDwgaiDCHbex/CyQbMyDW0DdK+MC
 wz6qxxnJjzTDNYVswOMwEfL0laTXwLI5N92Pcf8AOxTTuBnsE7W721Yh/YlrLF65ntB8
 J5mQ438Qcdu1X3jV5KQESTWbWyxk3s7lQqBImoEumh45ve95ToP+uNVt6EEQ30gV8Qsy
 YalZrWAmdfFOdESZKHd/joM2v7Cej1ot4YU7r5bdRYxZ4uYibrZ2dSXho212H3UIRQE6
 kqrA==
X-Gm-Message-State: AFqh2kqAWY98GFKAVQdQRTtl21zlVLoSusxrKuKO3sp+NW6dil/g56Yd
 1sFsgfk+ZgBG+lIcMI5j/3KS7r8nRohCTxhl
X-Google-Smtp-Source: AMrXdXu0DByFucPLw4r+7qfKZ7AOBJvDlw47Rz/wvMPx6cPb5ZaG7v3zNioHCR+0P8m2YRc/7dtwYA==
X-Received: by 2002:a05:6402:2990:b0:499:8849:5fb8 with SMTP id
 eq16-20020a056402299000b0049988495fb8mr52691748edb.30.1675027416271; 
 Sun, 29 Jan 2023 13:23:36 -0800 (PST)
Received: from devlab.lan (93-43-212-100.ip93.fastwebnet.it. [93.43.212.100])
 by smtp.gmail.com with ESMTPSA id
 ko25-20020a170907987900b0086edf177209sm5923743ejc.78.2023.01.29.13.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 13:23:35 -0800 (PST)
From: Alessandro Partesotti <a.partesotti@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 22:22:57 +0100
Message-Id: <20230129212256.1027790-1-a.partesotti@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IQPYoGsWCg5Gwf1QxmoXP6f6tLNu3vUA3envPCgV8rk=;
 b=FdE08IsBKkTikXYnexA5gQXUSgCKT1cJIzgZEQenPdFTny6VV+oLbYRvOx4BKWNuHC
 eu/dY/YIceU1xwLO4qUy54/IvkkYhUqCXzPxOHFiV7CvuWa7KYHW6j8ZLDOsPKJxlbao
 uXTpHoTFomvnr0bWZ7aI0VlKveQuiND30hpB6S9IoZvA3K9cuUEa62BSyEU4UdXMvRNo
 8gWLKx/mRs2cMfsE4d25xM0ZQwQjg/Bd2fve1LxJIujavf1q2wraSB7waa4k3S8vYFrV
 knnDJcnK0e16gFGS91sXz2nTUfAAC3UIq/gSrfz29q+Stoa2r5BoxHB9EUhdwRmK5bR9
 J/1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FdE08IsB
Subject: [Buildroot] [PATCH v2] package/oatpp:: new package
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
 package/Config.in        |  1 +
 package/oatpp/Config.in  | 13 +++++++++++++
 package/oatpp/oatpp.hash |  2 ++
 package/oatpp/oatpp.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/oatpp/Config.in
 create mode 100644 package/oatpp/oatpp.hash
 create mode 100644 package/oatpp/oatpp.mk

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
index 0000000000..d146d05d53
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
+OATPP_INSTALL_STAGING= YES
+# Only builds a static lib:
+OATPP_INSTALL_TARGET= NO
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
