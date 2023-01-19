Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD541C678DD
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 13:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B0441913;
	Thu, 19 Jan 2023 13:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55B0441913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlzJIj54wmqf; Thu, 19 Jan 2023 13:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F7C418E5;
	Thu, 19 Jan 2023 13:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F7C418E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 986D81BF2E5
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 13:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 748B582200
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 13:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 748B582200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2oPcopzy3myH for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 13:29:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D8EE81F1C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D8EE81F1C
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 13:29:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id z5so1862021wrt.6
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 05:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udTfjvTwNCvbNf3pqYLfmUmTv5Yrdwiy/Ui1gqY0mFM=;
 b=2DbhXAqDKN16e84fzSEHyTVzd5E5kGGZYc6i7FaTj2NHxijxsLB+Km9a8y8+l/s+OE
 EtGFQ7RJ5hb16HsT1CawJNynItZ5Ol22cA3OCtQbVgp9qyK0odyCv90hiPc86xv6Ct72
 1uA4tqjb0SiB8WgpcZ1fBUNzzsLoXHTTuynLYhwPNrZsJMH47yNWtvW7BAUjg3c4R3fV
 jyP4ZoUDqPU5eEzLpXI7FCTLx1tXDY+6Q7TOwOE8wsL9iS6AyWzW2lSf6fASHLwpZGgn
 Ev/dlaVqF7ifHK+ApoICbR6+02L38AcqiLTrxbXJDJgNFdv0Af6crxXr02+qNtWQSKZo
 oWMA==
X-Gm-Message-State: AFqh2koxuaKO/YBxKvWHZ04zTdO49TlBStiioAaew6fZLUe15kOkt6yx
 wt/bkdVIRNWzQgu9qkewGk/CcXCxtQXnqQ==
X-Google-Smtp-Source: AMrXdXvicV24LTdz1KwAAT/aT11V7zUZPI/4SRjBbwohGgiI2zBrTkrhJGhdksbgTnohRHuRBgPfQg==
X-Received: by 2002:adf:fbd0:0:b0:242:6777:c7e2 with SMTP id
 d16-20020adffbd0000000b002426777c7e2mr4851097wrs.31.1674134970127; 
 Thu, 19 Jan 2023 05:29:30 -0800 (PST)
Received: from ncarrier.spectracom.local
 (2a02-8428-7321-aa01-1304-3364-4203-42ea.rev.sfr.net.
 [2a02:8428:7321:aa01:1304:3364:4203:42ea])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002bdc19f8e8asm22011320wru.79.2023.01.19.05.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:29:29 -0800 (PST)
From: carrier.nicolas0@gmail.com
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 14:28:55 +0100
Message-Id: <20230119132856.1801425-3-carrier.nicolas0@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
References: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udTfjvTwNCvbNf3pqYLfmUmTv5Yrdwiy/Ui1gqY0mFM=;
 b=bpZBUMZMWLa5yhGXFPGsdqDJ39ODTiX5ilLSyOCZ0HYqkXXNSQ+PJHZH+j7zTT5H+a
 3PsTnAzoOCy0b3Cx0Kv7XPyJxIgz4vyv6ApGBndvywbKJO7VVM5EnfOZOQk93FdPg4ql
 CaIwThasRR2Tlnr38CZkMGonehQeEeuH3kw2vVr4UVU+k4K4S6G3vk7gCJtQc6ExQDVM
 gJt1mUDGZQxJAsLJuNi11OjzUyugFcP5EONOGh/07ql+oyPoGnIjkUBV7wsJb77D+67M
 S7jqkqx1JBWXLwHwHL0lzmesYZmfJ7tYHSHGOIau0q9j/v6fRyGXVIds6B6CqBJIaLgP
 NSLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bpZBUMZM
Subject: [Buildroot] [PATCH 2/3] package/php/php.mk: add host-php
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Nicolas Carrier <carrier.nicolas0@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nicolas Carrier <carrier.nicolas0@gmail.com>

having a working PHP with the correct version, is mandatory for executing
some PHP tools, such as composer, when building packages.

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
---
 package/php/php.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 23dd4ba96f..bd301254d4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -14,6 +14,24 @@ PHP_DEPENDENCIES = host-pkgconf pcre2
 PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CPE_ID_VENDOR = php
+
+# This host php is installed in $(HOST_DIR), as it is needed
+# to use composer.
+
+HOST_PHP_CONF_OPTS += \
+	--disable-all \
+	--without-pear \
+	--with-config-file-path=/etc \
+	--disable-phpdbg \
+	--enable-phar \
+	--enable-json \
+	--enable-filter \
+	--enable-mbstring \
+	--enable-tokenizer \
+	--with-openssl=$(HOST_DIR)/usr
+
+HOST_PHP_DEPENDENCIES += host-oniguruma host-openssl host-pkgconf
+
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
 	--infodir=/usr/share/info \
@@ -344,3 +362,4 @@ PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(PHP_CXXFLAGS)"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
