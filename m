Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F78C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:44:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A348460FE7
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A348460FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6558C400F1;
	Sat, 31 Jul 2021 20:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJ4A4n_QurHQ; Sat, 31 Jul 2021 20:44:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D1154010B;
	Sat, 31 Jul 2021 20:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B297F1BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1F574028A
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vN_07ItAzxjl for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:44:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B32DC40286
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:44:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b13so5318181wrs.3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 13:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U2QXCJXBo0IBg7ux6Oo4Pls9ZZy6mK/esZI3pyE7xkI=;
 b=TFYvl+H2v4JX/F1WfCSoXuzWNFWknYWVtsidjsr0MmKOIkits6gxcWhDDp7ld3YdKS
 sxPZQfQdq+EbmLNcLT3mgU3ydzUu/7/qb3lpYhLKv0laMTEBtPbJC+sXCl3zPEDHunD8
 TqxxX5bOsXg9Xj9Vla/jelmTwFxZrPLqvWeOBIgFx9DiGq/FeTZ2NWpZ6/budyxHY2Ry
 l4qGljhia1d6jq6CD6gNm4BN61ANxD8DMwqG0GTM5/4ENPtvDo2oAvLEvWf+nuJqX8fR
 aJUbBdYhHVnGf+Sf1Noi6h4swSwt0dYJWcndV8dKDRgTLqW740WtSMpnZw2cxi6IMtDD
 CyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U2QXCJXBo0IBg7ux6Oo4Pls9ZZy6mK/esZI3pyE7xkI=;
 b=TwXkAOIb3O3BKzGGWVyicXcEtfzVOxQrqF/LBK98/QJnKKObopXexy6WkpyOXYEot7
 AgsC2qNf9Lr3dm4Um8NmUaBF/FfmC+BmMyo48DlXaJNGh/NT5gwJu3bE0V2mcMf7BFLO
 as88lxMQD5HceuMkEMy6uF8BcohIghpU316ctf74lTNclu1uawBBaPVRNslQgCjRe5+v
 4btIf9aQZGzh+Nw0hpVkjjkphOe9wYtXYLquQRS0WEkkv4+3HjQIa43/a627hD8JZ9Ts
 Q79XxNGodvYGV/LXxM9A4k4WmvjdqE4Y7r9KYdQ175WVFcWaoVOSJIhiYgulmwchobAg
 rrAw==
X-Gm-Message-State: AOAM531y+EzTJi8kT9xnb20ZhO4IUEm+z3VY9scZYCXaxUo06wFWXwRy
 3LSqJ7aDphp/o04iEiqWTm7bMiK9rFRGyQ==
X-Google-Smtp-Source: ABdhPJz5hzta9SD+3Ko/1l2cEAcZ3zcMwKWGWwK/00ECGRTyYkmRPlZsxsfD/JQaoKKnMQSlrPjsRw==
X-Received: by 2002:adf:b605:: with SMTP id f5mr9626454wre.419.1627764273639; 
 Sat, 31 Jul 2021 13:44:33 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id t17sm5821568wru.94.2021.07.31.13.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 13:44:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:44:25 +0200
Message-Id: <20210731204425.1314423-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xerces: needs dynamic library
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Disable xerces on toolchains without dynamic library to avoid a static
build failure raised since the addition of xml-security-c in commit
bbda38afbbfa79ff436e1a187bb267b8d9558036 because xerces-c.pc does not
contain icu or iconv dependencies in Libs.Private

Fixes:
 - http://autobuild.buildroot.org/results/3e4f31eb017878d3417742cbc83e16bc848db98e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xerces/Config.in         | 6 ++++--
 package/xml-security-c/Config.in | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 828b5dd2a0..20cd2ab1a6 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
@@ -17,5 +18,6 @@ config BR2_PACKAGE_XERCES_ENABLE_NETWORK
 
 endif
 
-comment "xerces-c++ needs a toolchain w/ C++, wchar"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+comment "xerces-c++ needs a toolchain w/ C++, dynamic library, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 17d0ca3aad..02544d5a01 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XML_SECURITY_C
 	bool "xml-security-c"
 	depends on BR2_INSTALL_LIBSTDCPP # xerces
+	depends on !BR2_STATIC_LIBS # xerces
 	depends on BR2_USE_WCHAR # xerces
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
@@ -12,6 +13,6 @@ config BR2_PACKAGE_XML_SECURITY_C
 
 	  https://santuario.apache.org/cindex.html
 
-comment "xml-security-c needs a toolchain w/ C++, wchar, gcc >= 4.7"
+comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
