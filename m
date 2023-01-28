Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470CDC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 09:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F6D960B4C;
	Sat, 28 Jan 2023 09:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F6D960B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Coc2edylqg9G; Sat, 28 Jan 2023 09:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C63D760B46;
	Sat, 28 Jan 2023 09:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63D760B46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BCFE1BF859
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 09:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D966F60B44
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 09:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D966F60B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBTMXWyeNbM8 for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 09:41:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FC6C60A65
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FC6C60A65
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 09:41:30 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id mf7so864544ejc.6
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 01:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cd/uzuoFbpTfr64iO4ooyDnt8HDT8vbE/HOU05YHDd4=;
 b=OiF1uMRusECBcH2jGM5qWmWQa2/Mrj6L05E4Hu50KHlWi+Ym3ugIelB/VRRoRPdelW
 s25PS2XOAhenQp2ZoPMfmir9gG1PODSKm9ktuCQFvJAd83Tin0zxOwjIPMVIrroo8TdM
 70C8hnDjcVT7M0N2CipvebKxG4cLQlxDmd7GGElKfgRy4ZZGUqanFTB4eQ/nq1oqaA9A
 Rm5sTaNDn2DI7dsC+snAJXjgptTrefP0g8vZXip7VJVE14UyUZArxE/CfhC95LRQxkHL
 Fr36egFiQwiqk1tOdFVISkqt6fz+x5Ng/9UCPqkicZaKQVBCgqp93alyQs6FqEcB5cMZ
 w9Bg==
X-Gm-Message-State: AO0yUKWHvxpDERzeSebaTALWI8HkXPtr704yln2GIUxQlfIKg3wg69Sx
 PFqbgUydkZK7b/PlGDSJ9DA/5CWalK44ew==
X-Google-Smtp-Source: AK7set8gKTtSXbXNNHgICjR1TANhwdKivOtisEsgVNfGJEFdJQQnbFCHf7zOgMxpdYda5LK73JpKRQ==
X-Received: by 2002:a17:906:3807:b0:883:258d:2951 with SMTP id
 v7-20020a170906380700b00883258d2951mr939709ejc.4.1674898888164; 
 Sat, 28 Jan 2023 01:41:28 -0800 (PST)
Received: from devlab.lan (93-43-212-100.ip93.fastwebnet.it. [93.43.212.100])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a170906709200b0087bd2ebe474sm2311317ejk.208.2023.01.28.01.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 01:41:27 -0800 (PST)
From: Alessandro Partesotti <a.partesotti@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 10:41:19 +0100
Message-Id: <20230128094119.10660-1-a.partesotti@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cd/uzuoFbpTfr64iO4ooyDnt8HDT8vbE/HOU05YHDd4=;
 b=X2YQM/B7d02jQaoyxAR7eDeJpG2bEIQSMaemwKDn5NEliPfbfMECAtLhm5uPNENI4n
 igPTdMVCj5VlPO3u+JOfEeKnVrFJnLp8qyeeqD/LRIwGdj8pXgp7YbV/G2oXjjissWsr
 v2TvM2eBTEWHK8P6OBm44D/0paclkXTO/Ed94KSc3qq+6cvAu1YT/yhHLObRuVsXVZsq
 Ft5zCP7UUy0nkze/AKlTdHA59oM5291/2QviKysecfKqMVw5x7+pOJnPa8ZPWV13V9cP
 Iy3qrlh3aG7GmJ34wTuEQZbDj/V52lAWNnZt2sJttojihU/j5Ejg0EGWhDg8KP9y3aNW
 +7lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X2YQM/B7
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

This package introduce oatpp in BR buildsystem. oatpp must be used as static library in $(STAGING_DIR)/usr/include/oatpp-$(OATPP_VERSION)/oatpp for user that want to build therir own application by linking oatpp in a buildroot build system.

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
index 0000000000..86eb4573a6
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
+		See https://oatpp.io/docs/start
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
