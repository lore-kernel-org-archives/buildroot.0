Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE8EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 11:36:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38C3860FDC
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 11:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38C3860FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D4A42530;
	Sat,  4 Sep 2021 11:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZXRfeGx29_h; Sat,  4 Sep 2021 11:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BAA14252D;
	Sat,  4 Sep 2021 11:36:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0331BF616
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 11:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68C37606E2
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 11:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGjAK8vMOLlW for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 11:36:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39F3F60679
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 11:36:45 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i6so2419387wrv.2
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uAKREJ+fFBFNrEVtoxc2BISkzMbQ7X07Z5oSbqdtD0=;
 b=bd3Btb2zJoZsckSfgJXqBzEdITnET+ytXthMsL/Ot44XAmQkUwLhKNWGkQifcWgmDq
 MAV6Jm/NuCDOhHB2a1B17IHiAi5noIX6v0Z3/nNytvK7LbCtg6rPi85eWZSiqYN/CKQK
 8ow1Y3LczBt1Ea+ybljjf+JQCxGNnycSp4eTXfsxWu2bI6mnjtuLPfntmQpJqC3U45Rj
 6GJi49SKFIOUGFMG195ANB5GQOP3WRNpujjidKHqMB98aChC5LLKVHVNd01g/QLq5zSC
 /BMxsC2lI9W843+hoS04odJLmTM1WqA3NyjJ01I93iTE2dhLthiFa+7OiXaxis+KlFTJ
 iA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uAKREJ+fFBFNrEVtoxc2BISkzMbQ7X07Z5oSbqdtD0=;
 b=i8j9MUlThCp4sC/XAFWfGVmeSR99rkae5TpwpgBJrTym1izw/fXP69TMYY5AVEsHGp
 4k8RGcS+tQC3zhUOoLJMjrNiQmYSxF47DuNb9+YuWls1Gy9k0UHeETtPaR3Y7DZTdUFl
 u3N6cuDoW6MzVfZsqLFhGubr+2d78T7IG0MJ/JkF1MvviUTrzfDNu2TU34nc8P2K0BhG
 7zEWZ6KTYZ6nRpLY5MxH6SWkDIoYupZTd2GEi95+083qF10Ow2vIQvwuGZDhl8Y26BwS
 1mBKKX8Ya2yOBvqdR/6C0k/PR7gGzlTaOBSNaPKNmuFuY3RxPDBP5juvhIJjNgRmzEt/
 5WpA==
X-Gm-Message-State: AOAM5302Gubd+I0oK4GsRXTicYctkEPWY2XUa1NEv7EtW+FkF33Y8Efq
 eGVus7ayd3sB5OplNuF6ahDJ35bGKRcnlQ==
X-Google-Smtp-Source: ABdhPJyDu8eDUL5khXiSH+UAMd5/4MtgfG4YgB11n9eB8kmBPeNsdmoaZTmKzj907T4YR9UTtNEP7w==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr3679767wre.344.1630755403174; 
 Sat, 04 Sep 2021 04:36:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id j17sm1926375wrh.67.2021.09.04.04.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 04:36:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 13:36:32 +0200
Message-Id: <20210904113632.1623223-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nginx-dav-ext: needs libxslt
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
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Build is broken since bump to version 3.0.0 in commit
45524f10cd84855868c9be3901c2bd6ea1c9f079 because libxslt is needed
instead of expat since
https://github.com/arut/nginx-dav-ext-module/commit/37772c545314aa4a250066f4e7cbc8806d406fa8:

adding module in /tmp/instance-0/output-1/build/nginx-dav-ext-3.0.0
 + ngx_http_dav_ext_module was configured
checking for PCRE library ... found
checking for PCRE JIT support ... found
Package libxslt was not found in the pkg-config search path.
Perhaps you should add the directory containing `libxslt.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libxslt', required by 'virtual:world', not found
Package libxslt was not found in the pkg-config search path.
Perhaps you should add the directory containing `libxslt.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libxslt', required by 'virtual:world', not found
checking for libxslt ... not found
checking for libxslt in /usr/local/ ... not found
checking for libxslt in /usr/pkg/ ... not found
checking for libxslt in /opt/local/ ... not found

./configure: error: the HTTP XSLT module requires the libxml2/libxslt
libraries. You can either do not enable the module or install the libraries.

Fixes:
 - http://autobuild.buildroot.org/results/8735d20ca7ccf4eda2f79f9400bed70474855b40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx-dav-ext/Config.in        | 2 +-
 package/nginx-dav-ext/nginx-dav-ext.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx-dav-ext/Config.in b/package/nginx-dav-ext/Config.in
index 1e60321fe3..9e3a0faf28 100644
--- a/package/nginx-dav-ext/Config.in
+++ b/package/nginx-dav-ext/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NGINX_DAV_EXT
 	bool "nginx-dav-ext"
 	depends on BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
-	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBXSLT
 	help
 	  NGINX WebDAV missing commands support (PROPFIND & OPTIONS).
 
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
index 1b3071851a..cce527e179 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.mk
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -8,6 +8,6 @@ NGINX_DAV_EXT_VERSION = 3.0.0
 NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,v$(NGINX_DAV_EXT_VERSION))
 NGINX_DAV_EXT_LICENSE = BSD-2-Clause
 NGINX_DAV_EXT_LICENSE_FILES = LICENSE
-NGINX_DAV_EXT_DEPENDENCIES = expat
+NGINX_DAV_EXT_DEPENDENCIES = libxslt
 
 $(eval $(generic-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
