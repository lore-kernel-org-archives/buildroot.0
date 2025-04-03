Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA97FC3601A
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 15:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6061441D1A;
	Thu,  3 Apr 2025 15:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ey7UauaEXgJ; Thu,  3 Apr 2025 15:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B93C41D94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B93C41D94;
	Thu,  3 Apr 2025 15:40:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B9751F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D59D411E2
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aCN06JXMkGS for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 15:40:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F41964025B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F41964025B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F41964025B
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 15:40:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso10263445e9.3
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 08:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743694802; x=1744299602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tjyRqLXs93uSl4rEDQ6sH0OXuWGj5WxNgwliGXJxUyk=;
 b=nR+yu6Z+NhC1L5Xlp7sqqRls02Z5lf77fSlCkfRWkoE0C0AAD2b+E0ra9O4kL+5dl6
 T2nfKlAm+gb6fQYO31iiNHhnRAFQgD6F0sdLO1AzBvQ8sMLCwPaam8knEaMCzoZcyEI1
 hO1BjCp6CJbe0Vet4oy0ygVqx+HXAwOut4Hag+tMIQmPz36hbN07XgHcEDtm4I2e5uDF
 oelsI3ln4VHE2G8ahyzkJaF/tI/Gx/hZW1AsHKsOS4R283hewJQHvSZGp0vXjp8Zt8Do
 igkf75UkeyrRjajAdriF9OpZ9oD7pdZ00L7gqMUmkKQys8B9OPEUfYUog+rexMvAZPiJ
 o/rw==
X-Gm-Message-State: AOJu0YxYRlKOZYjYyyY3VSYFNuMYlMexhKtx23lJNr5SR0rs4JUisqUL
 ImdufltjObNbpHFbK0muV4YJ0hZ6KkjWHqVOX0/qL9y4xIPhQSMqSS5NfY1Zqlc=
X-Gm-Gg: ASbGncvnpwghp3gREQXoqS1RYDjVJvqHfTzvKDd16Fyt2x9jcjEJJM2T8ZqjHQXzvt4
 q3CWj6B78fJQnhe2bhmOmWM/0AF/DPkK/m7kJpFQF37JDE2BjVDNGyHLFobDj/nfnmSk+7qiAdQ
 shAo/is+lYQ2oBOMGm4N56yAYmPCyV0zH8NXL8IMVOBhaSespmLUlUedpurCrrN5/hltSYrtHIU
 gfMA9suyrInJMfOzQkibfJtDMz1HHIzY5OtF8MXan85zmiOYaGfKmdj7bQxuF6EozkYOlYrZGfG
 w4srrX0IMgyCOo8aQ0vqs1ffvZYj1vqRsX3m
X-Google-Smtp-Source: AGHT+IE/oGbA2OX4mGNOxNxK1bUz7N9x7gn9As0nGmiqOfL9cicnftdgpIhWrhXcP97Dx3PwoNfdhg==
X-Received: by 2002:a05:600c:4fd1:b0:43c:f6b0:e807 with SMTP id
 5b1f17b1804b1-43db8527142mr231673735e9.31.1743694801587; 
 Thu, 03 Apr 2025 08:40:01 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:32bf:237b:9ae:9868])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34bbd9csm21702215e9.20.2025.04.03.08.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 08:40:01 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Thu,  3 Apr 2025 17:39:49 +0200
Message-ID: <20250403153950.6407-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403153950.6407-1-maxime@leroys.fr>
References: <20250328084743.8759-1-maxime@leroys.fr>
 <20250403153950.6407-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743694802; x=1744299602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjyRqLXs93uSl4rEDQ6sH0OXuWGj5WxNgwliGXJxUyk=;
 b=BZj4FX6Lit4QDfPAEU9BGZdsJQTlpkowGGvyo0B57nBrdbRtlWrDwzYAriZrRqZk30
 +rv/7TGoATH5ZDX1jv/O8vCPLDyBN7L4NvJtmO4VY1dJ7W8AMDCzfFF628ZOPyNh9rth
 dhsxphCR8qbGlEaGS0cUkD5VaEsBxRO2t+QP5XiV8edydJgq55/WY1TR0ZwCKs3ufMQ4
 ZG7SIbiMYMdFUoNuIX/hpzYtm/VmBEcvmJj5OpFC5SfnBWsQvS4wb4iaM+dHet4EVKL6
 NMnqnID8SEDZzjvzmIIrtLpcINua7VHdH+dIap8Rfof5WQbzgMG9en2lTRTrzZ8ifMmD
 YfGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BZj4FX6L
Subject: [Buildroot] [PATCH v4 2/3] package/grout: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Grout is a Graph router based on DPDK.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/grout/Config.in  | 13 +++++++++++++
 package/grout/grout.hash |  3 +++
 package/grout/grout.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/grout/Config.in
 create mode 100644 package/grout/grout.hash
 create mode 100644 package/grout/grout.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c84f95943..1cbbf829c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2384,6 +2384,9 @@ F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
 
+N:	Maxime Leroy <maxime@leroys.fr>
+F:	package/grout
+
 N:	Meena Murthy <meena.murthy@amarulasolutions.com>
 F:	board/engicam/px30core/
 F:	configs/engicam_px30_core_defconfig
diff --git a/package/Config.in b/package/Config.in
index eb22c81d1d..585d206562 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2494,6 +2494,7 @@ endif
 	source "package/gesftpserver/Config.in"
 	source "package/gloox/Config.in"
 	source "package/glorytun/Config.in"
+	source "package/grout/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/grout/Config.in b/package/grout/Config.in
new file mode 100644
index 0000000000..a39c3283eb
--- /dev/null
+++ b/package/grout/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GROUT
+	bool "grout"
+	depends on BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_DPDK
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_NUMACTL
+	select BR2_PACKAGE_LIBECOLI
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Graph router based on DPDK
+
+	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
new file mode 100644
index 0000000000..c67633afc7
--- /dev/null
+++ b/package/grout/grout.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  46b0cf938c786c42882a03306575c7855d24158ea50a3ac01aca199e11cdcfd3  v0.9.0.tar.gz
+sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
new file mode 100644
index 0000000000..a75af27978
--- /dev/null
+++ b/package/grout/grout.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# grout
+#
+################################################################################
+
+GROUT_VERSION = 0.9.0
+GROUT_SITE = https://github.com/DPDK/grout/archive/refs/tags
+GROUT_SOURCE = v$(GROUT_VERSION).tar.gz
+GROUT_LICENSE = BSD-3-Clause
+GROUT_LICENSE_FILES = LICENSE
+
+# Avoid using buildroot commit hash
+GROUT_CONF_ENV += GROUT_VERSION=$(GROUT_VERSION)
+
+GROUT_DEPENDENCIES = \
+	host-pkgconf \
+	dpdk \
+	libevent \
+	numactl \
+	libecoli \
+	util-linux
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
