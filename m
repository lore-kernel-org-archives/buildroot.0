Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5931FC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 19:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E391C60774;
	Sun, 17 Jul 2022 19:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E391C60774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vOSB-G5Q4Hn; Sun, 17 Jul 2022 19:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4399606EC;
	Sun, 17 Jul 2022 19:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4399606EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7B61BF255
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53A99415B8
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 19:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A99415B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id af8ka3kCyIDQ for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 19:37:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF091415AD
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF091415AD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 19:37:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so6226215wmb.5
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 12:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=C3jsV7f7Zmk+1fGZIjYGHRu3gO4TFpvNcY1SNFY6Zyo=;
 b=5SXpaflL/6iCu8I2WIx81zXA8I8mcKjfXxKVtqMlBrk5iRAprC9yLjiI/D8VTr5fd9
 jXS6o3JQfrBjC1jFtI0gdwL7/YWFB0Hlf0EGvR5YsuwtnvVNAVxOO38fhN7D3LWnI+VP
 wBh16wuAubNkTgROLhQuObMR29pLr1tDP0I8dg6axWMs0U0lNyVPU/y3gLLWqjlINDhC
 qjU5U7DJMaQtPoKG7yqx0VcG6Z/0wok4UyLA3DD55FwZYKpv5AxIc7wL0FxpmtfkPfDO
 slpEVCYPoLmzu4rYqznFQ3RPHq3PXrQE3G9O2sLiPhzmpeY2FLJicF8yP6RU4oSX1hLy
 8rlQ==
X-Gm-Message-State: AJIora+vYi8yQ0MrYkRxL4KHTCHVPGS9YYMqMo/UwsWWIBsM5KKB5mac
 /v+W0U84VwpoKLbavTIBL04aZRyvsBI=
X-Google-Smtp-Source: AGRyM1tp3t9cWqpBp/j39cfC8lsJnqpKL8C7SJbn8eRuyfo05mC7jAcseBE5YinBw/HQAO7wTaSLNg==
X-Received: by 2002:a05:600c:3b20:b0:3a2:e956:67ca with SMTP id
 m32-20020a05600c3b2000b003a2e95667camr23731816wms.183.1658086640869; 
 Sun, 17 Jul 2022 12:37:20 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:6518:6457:938c:3f55])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe883000000b0021d7ff34df7sm10643118wrm.117.2022.07.17.12.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 12:37:20 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 21:37:19 +0200
Message-Id: <20220717193719.2429999-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3jsV7f7Zmk+1fGZIjYGHRu3gO4TFpvNcY1SNFY6Zyo=;
 b=Cb+8CefDSjqVG/otyv2SrU64WA18N6NGGbsFSipCp9Is7+bddNrHcwPvSvwleuvSYW
 bayRDsCz7N6vI3RXHPhFkG++3RsEGroiBc3wan8uJrLvHz1cWLL+Lx76gNLsRQwlYcE2
 0SwqoyxuW4PkEk9I03XYJXo8obZlrAh/IResInEB8ZquKWlJR+WqgiryKDpVoHQ3Ae1N
 TmfKJyF+gBrSsUunuNCXnNmbw+U+ij/KLoQurMSHXv1OHvhmWRaRGQLhH0eazerE/dgR
 0dqo76Z+9wUuLpqBq7JHFg/nmNDFjNGIgz+AJFwdYvzB2hchyFfzfUi8GpIoePUQPwWC
 F5Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cb+8CefD
Subject: [Buildroot] [PATCHv4] package/uacme: requires TLS support in libcurl
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Baruch Siach <baruch@tkos.co.il>

uacme configure script fails when libcurl does not support TLS. This
means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.

Add a kconfig knob to libcurl so that no_TLS is not an option. Select
that from uacme.

Fixes:
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/

Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998@free.fr:
  - keep the current forward select
  - add the kconfig knob
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
v4 (Yann E. MORIN)
  Restore forward select
  Add the force-ssl-tls kconfig knob; use it from uacme

v3:
  Move comments up to fix suboption indentation (Yann)
  Add missing MMU comment dependency (Yann)

v2:
  Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
---
 package/libcurl/Config.in | 5 +++++
 package/uacme/Config.in   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 3381decca8..a3148e086d 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -45,6 +45,10 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
 	  - DICT
 	  - Gopher
 
+# Packages must select that if they require a SSL/TLS-enabled libcurl
+config BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
+	bool
+
 choice
 	prompt "SSL/TLS library to use"
 
@@ -77,6 +81,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
+	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
 
 endchoice
 
diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e7..1458e74d28 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UACME
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
 	help
 	  uacme is a client for the ACMEv2 protocol described in
 	  RFC8555, written in plain C with minimal dependencies
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
