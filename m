Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13793C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 13:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9240140C9B;
	Wed, 19 Oct 2022 13:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9240140C9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xbWhk7B_-NK; Wed, 19 Oct 2022 13:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E53D40612;
	Wed, 19 Oct 2022 13:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E53D40612
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97FEF1BF375
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72262408DD
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72262408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ln0GWu-qfKVo for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 13:35:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589CB4089B
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 589CB4089B
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 13:35:18 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id t16so6049208edd.2
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 06:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q0VxizVUVrPsOJeqKF9vaSh6wrv72dG7gnbkBqXzhrw=;
 b=uJE2XjV8y6u7G+YCwQ+lym+8kdmjq9Re+Yr2nUlg/Iia9Y8Wqjk7HG2Tcu+Q5HfGn7
 RQzpmmKdJ+fXSoQaCwBCt5KEaLliDM9Smt+2gHIHZHiSUexupCo41Mn4b03fzVAUdeJ2
 DXW7599ZM56LB8HFlO8/YqdamZrwUkn91uJ4SuJOZdnV4QznE0q2fF43Ms+wbaN0rNPd
 U+G/E8IlQcr9BuLGkfeh6nkid9DQLJdzRN/gmr9mN178nkI8HB4b2BGe6KY1mC71W0eL
 HEVoKwk4ckfIm5s4HIVkWfpKE6DcbxeGyMGEWu2w1biQRsfd2INEO7K9c19Hgj8f6Ghg
 9rnw==
X-Gm-Message-State: ACrzQf3cURYashxhBYd12fOBCy3da2go+wPLOozOx0ylWKqW8bNBVSjo
 2tO9A0QBHDyE56s5k/iq+lXjYH55ia4KbA==
X-Google-Smtp-Source: AMsMyM4GESwazfABGaJKh2q+9ihxv05K6v2+r1UuNyeb/XlXovNgDGEH3bwWppQtbgGSzISImSHZhw==
X-Received: by 2002:aa7:cd92:0:b0:456:cbb5:2027 with SMTP id
 x18-20020aa7cd92000000b00456cbb52027mr7533198edv.384.1666186516144; 
 Wed, 19 Oct 2022 06:35:16 -0700 (PDT)
Received: from localhost.localdomain ([37.160.58.125])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a17090651d900b0078da24ea9c7sm9012662ejk.17.2022.10.19.06.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 06:35:15 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:35:11 +0200
Message-Id: <20221019133511.1717939-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q0VxizVUVrPsOJeqKF9vaSh6wrv72dG7gnbkBqXzhrw=;
 b=IxYza8X56IoI6fVTcigcur3bBcROLupZYN9cee0xrQ6IiN+dKV1a/0ImbaoGeLskW5
 X6jnO1yxuqSiNaovvGd30c+mg11Gy3GewGRy20oMZTr6MYPxHv9mNjKWKLCdfKI+4D2R
 t0TlC3UUrzZ7vY16J1apsZz32lMoFAkMayhwo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IxYza8X5
Subject: [Buildroot] [PATCH v3] package/python-minimalmodbus: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Easy-to-use Modbus RTU and Modbus ASCII implementation for Python.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
V2:
* Adding me to DEVELOPERS
V3:
* Move to pypi (Marcus Hoffmann)

 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-minimalmodbus/Config.in             |  7 +++++++
 .../python-minimalmodbus/python-minimalmodbus.hash |  4 ++++
 .../python-minimalmodbus/python-minimalmodbus.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-minimalmodbus/Config.in
 create mode 100644 package/python-minimalmodbus/python-minimalmodbus.hash
 create mode 100644 package/python-minimalmodbus/python-minimalmodbus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c0e6f8bbef..9eb5400999 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -173,6 +173,7 @@ F:	package/mono-gtksharp3/
 F:	package/monolite/
 F:	package/openjpeg/
 F:	package/python-can/
+F:	package/python-minimalmodbus/
 F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-spidev/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..08574931f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1112,6 +1112,7 @@ menu "External python modules"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
 	source "package/python-mimeparse/Config.in"
+	source "package/python-minimalmodbus/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
diff --git a/package/python-minimalmodbus/Config.in b/package/python-minimalmodbus/Config.in
new file mode 100644
index 0000000000..fd0f33e0d4
--- /dev/null
+++ b/package/python-minimalmodbus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MINIMALMODBUS
+	bool "python-minimalmodbus"
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
+	help
+	  Easy-to-use Modbus RTU and Modbus ASCII implementation.
+
+	  https://minimalmodbus.readthedocs.io/
diff --git a/package/python-minimalmodbus/python-minimalmodbus.hash b/package/python-minimalmodbus/python-minimalmodbus.hash
new file mode 100644
index 0000000000..b29e83773b
--- /dev/null
+++ b/package/python-minimalmodbus/python-minimalmodbus.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/project/minimalmodbus
+sha256  cf873a2530be3f4b86467c3e4d47b5f69fd345d47451baca4adbf59e2ac36d00  minimalmodbus-2.0.1.tar.gz
+# Hash for license file
+sha256  abe787d472ae2069e935c84eb13fd770518dfb08b92d5f190f3cd7ff6d1f6f32  LICENSE
diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
new file mode 100644
index 0000000000..434323ccf8
--- /dev/null
+++ b/package/python-minimalmodbus/python-minimalmodbus.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-minimalmodbus
+#
+################################################################################
+
+PYTHON_MINIMALMODBUS_VERSION = 2.0.1
+PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
+PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/78/99/8cd22b4465e697bae2b02fd06aaccd4c5cdfbb18945d728db99f23d71df9
+PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
+PYTHON_MINIMALMODBUS_LICENSE = Apache License 2.0
+PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
