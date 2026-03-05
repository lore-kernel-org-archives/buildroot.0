Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F7DF3092C
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 13:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C90D440BBB;
	Thu,  5 Mar 2026 13:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FD0comNcVxr9; Thu,  5 Mar 2026 13:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0481640A78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772716693;
	bh=9yTZPevJ6NgEydqmR2mDFW/uP/nRIWX8UUwgtHn9BV8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yh+bDdaDmoh7khe/h6a7UdxQaNBk/XrLvEVD6tfqckOMhyq/ltdLF8ToGgHJXk2fA
	 Rq66eXWS/Nr8xJVogi8Bza/Q+51lEonV2A7d8aCuv2XI/8bApPOFBJCVBgbybfkOL6
	 U/UqYM9annZyGREzWp69WZAFx4qh4M1vOsrpjsJMG9CJ9d3yZbbkrQvUUdIgxB/2FE
	 8Z1l7u/B+aT5Q+/3CyevvVKRNnIy3hsjpF4jUB/0NgiNtOCdrOGgdnZw4d/k2ksllh
	 WuuNdHsPqy5wKS/4hO6lbvigfb9IsZJ/7qN0DD1NoQ1/OTTekak5z/5MOy0C+gtn1E
	 fdsNqw0NZMmZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0481640A78;
	Thu,  5 Mar 2026 13:18:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 141DF223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDC8C60B51
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7f5sQFzxzBV for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 13:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0802605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0802605E0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0802605E0
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 13:18:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439c944bb62so1449889f8f.3
 for <buildroot@buildroot.org>; Thu, 05 Mar 2026 05:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772716688; x=1773321488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yD/+cAUc1BTIeZEDz0kVIP5MXdRJfX/ErID2oeecFI=;
 b=gSeBW91KjN2zWEiSV018eWx3i8I89k29OO/kqicuBl7SeNVG28HUDbsX4Pj8/YPfOa
 VWwRoONmOShGpKUtBB7Pkr6jsPBCR+dqIYRm+ygRSwnR4EiSKy6yxGJig87mE8IVMScx
 jlAm9t5rYu8uwEma05zmKuB4ImRGBaxzTiGaJAiyu+q7eK1PJxgJq3aJ0lPboBw+7Tqr
 wfxRhstLUMooAz+UppnpHzIwah7AftYZJFi60yjDky029oO5bc+dv6z9GKI/renM6YcQ
 oOrSCjHaioq+LHAooUOhSnheDO9Cq0G8DxceRqggbH4jvc5nLF3kKIanUQ8W/EreyjuO
 KJ6Q==
X-Gm-Message-State: AOJu0YwuPh3maf11TIf/1SkzB8aA63DwGhlcc9u5VN45EHXu91KBmTs0
 gJ0lJdGy6SBvQcujRbn9u62Et9LUap28SIvEG9kW5WvTeLGwcG6CWPsHz2Gc4jKYSnOZopnE+T/
 Z3Edn
X-Gm-Gg: ATEYQzyL2dIeXbISKbQOvAcwwTwIMWMkx0232MM6sAwDiJPcwamZ80RVsG3HcU8SuTz
 fjwuQc5VpEXF/Jk14rl6BnwyJFaQeQbfvrVewUqka65BdrEUBYruW6GRvCLjMToXzk2lNNIAFDe
 wL4jdU1PtutDnNcwsvxRwgE5swf5WYExmpxir9koASzu869Y1PmNANWCRbCeQs0bzDR0zytsWsi
 i8gdhC4UfBgHewuK6dK9WGYWazVOhooqjtXCepoSMK7bTR/exe8zmfGaeZ46JsFM3wKEe8Ajqxq
 0s063kol1DEtbYUhGzR7cKeumlfCZ+ZT3zExBKxafVGFBZo/IpnJMhSntIYb+6Y9lTWXFUjs1Li
 gUfiQmlYU4pjBegr5gqQgpAQ9uhKkbCop9JqB79Zmh2AIMm5A7yNVuQlhHb+Wt08Tuiejc4rywK
 RrX3RYJRk824nKTMudQ34SjQJLUcpJpKdJuTyyk+M69p9CnZBHx2vxja+TFHVo3JKiu8j5XtR0V
 hdnuRkD5wy9rZ7UPbbvYjCj/6JOypQfNgkNv31je5maMIg4Ijl7AHCHvMD4EHwm0ac3QYteKIpI
 DQ==
X-Received: by 2002:a05:6000:188e:b0:439:c5a5:c1fb with SMTP id
 ffacd0b85a97d-439c7f9824fmr11214484f8f.4.1772716688217; 
 Thu, 05 Mar 2026 05:18:08 -0800 (PST)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it.
 [93.47.52.235]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b59723fesm33025907f8f.38.2026.03.05.05.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 05:18:07 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Thu,  5 Mar 2026 14:16:56 +0100
Message-ID: <20260305131701.56962-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772716688; x=1773321488;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1yD/+cAUc1BTIeZEDz0kVIP5MXdRJfX/ErID2oeecFI=;
 b=H6xVfjMeeup8r4Oo6t3S5ehzQ/1+OLTqDKSjP6a0gd3Sm3kYoaqs4DIQp2x37QELNr
 beXqhtptLXjB/7MUjt4wuah3HObmY+lnsFe3/qw0mcPto1aIimhYJt6FhWKQQ4wkBtwr
 eMpiUBi8W5tlobsNoaJlYn4FHl1cLPc7s+TcE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=H6xVfjMe
Subject: [Buildroot] [PATCH v1 1/2] package/libcppconnman: add new package
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

libcppconnman is a C++ library that provides an easy-to-use API
to communicate with ConnMan over D-Bus using GDBus.

https://github.com/amarula/libcppconnman

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 package/libcppconnman/Config.in          | 26 ++++++++++++++++++++++++
 package/libcppconnman/libcppconnman.hash |  3 +++
 package/libcppconnman/libcppconnman.mk   | 24 ++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 package/libcppconnman/Config.in
 create mode 100644 package/libcppconnman/libcppconnman.hash
 create mode 100644 package/libcppconnman/libcppconnman.mk

diff --git a/package/libcppconnman/Config.in b/package/libcppconnman/Config.in
new file mode 100644
index 0000000000..f1fee9ae72
--- /dev/null
+++ b/package/libcppconnman/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LIBCPPCONNMAN
+	bool "libcppconnman"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libcppconnman provide easy to use C++ API to communicate
+	  with ConnMan via the DBus using GDBus.
+
+	  https://amarula.github.io/libcppconnman/
+
+comment "libcppconnman needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_PACKAGE_LIBCPPCONNMAN
+
+config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
+	bool "libcppconnman example"
+	help
+	  Compile CLI example.
+
+endif
\ No newline at end of file
diff --git a/package/libcppconnman/libcppconnman.hash b/package/libcppconnman/libcppconnman.hash
new file mode 100644
index 0000000000..6367503e7f
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6fe3f4eb7372786f76b6be8cf77720066f4aa216c6596e99d8015e7139a00073  libcppconnman-1.0.0.tar.gz
+sha256  7ffe1954587c77dfba1cf8eb9b2ea743671fa6e63f9e7a2f258119d42e14eefe  LICENSE
diff --git a/package/libcppconnman/libcppconnman.mk b/package/libcppconnman/libcppconnman.mk
new file mode 100644
index 0000000000..2a0eb10ec9
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libcppconnman
+#
+################################################################################
+
+LIBCPPCONNMAN_VERSION = 1.0.0
+LIBCPPCONNMAN_SITE = $(call github,amarula,libcppconnman,v$(LIBCPPCONNMAN_VERSION))
+LIBCPPCONNMAN_LICENSE = LGPL-2.1-or-later
+LIBCPPCONNMAN_LICENSE_FILES = LICENSE
+
+LIBCPPCONNMAN_INSTALL_STAGING = YES
+
+LIBCPPCONNMAN_DEPENDENCIES = host-pkgconf libglib2
+
+LIBCPPCONNMAN_CONF_OPTS = -DBUILD_CONNMAN=ON
+
+ifeq ($(BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE),y)
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
