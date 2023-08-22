Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB102EE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 01:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F972400DA;
	Tue, 22 Aug 2023 01:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F972400DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FYZj6tD0Vdg; Tue, 22 Aug 2023 01:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B446440B78;
	Tue, 22 Aug 2023 01:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B446440B78
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 094B31BF30A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 01:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6A3581414
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 01:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6A3581414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9Pu9_a9Gxsf for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 01:33:44 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD22581413
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 01:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD22581413
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5920efd91c7so20245537b3.2
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 18:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692668023; x=1693272823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2eehX93BqhgWK0ZhGtvr7Xl9F9QEYQmr7sG42aldNU=;
 b=F1g9/rxfiVmXoaVZoucAUZ45NolaIGsljkJXwZpE5w6StYJ0qrtMrtiKcKzzp8PU9B
 1Y7CCiffihZEgygqkUHv9Iglc+i9NRsjp9q6r9Z60zzk5+i+4u04rM1JHGwi5eLRAzvf
 31+Rc6zQdunNH6OfpUEJ1rQ8neZoqNgmTmROSrStortixPZsK3WXMmNQAit4JKxqEmah
 5qHDWoLvvvKV23PzFaXWqns1mMRKsZwzHZFe/jD50o4p9qmJh0qvUrblmolXlBZmrdpH
 wimLZe5batrxt/T6Dt/UL6ChWdyQpR103Z22WM0M0Ir1hBpR7pJV17LA4eOHLSQhdiOK
 PYNA==
X-Gm-Message-State: AOJu0YzVMIh96EfBKdvE/6YqEbjLcZfjNy3DOxXnZ2bNzNjTiummf3c5
 fMWN1Ne/RRCb4reHt04P0E2nP9u3eiFXGQ==
X-Google-Smtp-Source: AGHT+IGA4niwqR/w6lkNrLR07GRnpf/qgz0FjQL/46Bq5Is7v3JmJmk5wx7OGsA4fMuyYek1meDUCw==
X-Received: by 2002:a81:a003:0:b0:583:d9dd:37fd with SMTP id
 x3-20020a81a003000000b00583d9dd37fdmr9244002ywg.31.1692668023311; 
 Mon, 21 Aug 2023 18:33:43 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:55db:9e25:2c0a:ecb3])
 by smtp.gmail.com with ESMTPSA id
 n127-20020a0de485000000b0058451c12076sm2550229ywe.14.2023.08.21.18.33.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 21 Aug 2023 18:33:42 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 18:33:33 -0700
Message-Id: <20230822013333.47036-4-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230822013333.47036-1-ckhardin@gmail.com>
References: <20230821175828.42827-1-ckhardin@gmail.com>
 <20230822013333.47036-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692668023; x=1693272823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2eehX93BqhgWK0ZhGtvr7Xl9F9QEYQmr7sG42aldNU=;
 b=Cu/ihJ1PLQ/Sm7jEz/ao7iIi9ZU/Yxhz4GAUFGqQr7OrnU2xmuWyMViQWqNeSJbQ5p
 LkmaC8EuG+BWJ74xSGxU100jrz1/YVTtv8dyX5QrEn5MbDX+kxH35ynae1AGxJBlMV61
 BCDkQ7/qQz1yzsH5bas6nDNIyVOlMoqbLnFjpCKrnmGAD8cDVl94K1PO1l0Q9Nfz1Iip
 xkIvX2og7ZayfAZhOkasZJw6tBxsn3HZeAAP9MLFeYnhcVHENclBPc4KVAX0o/OqpPPa
 HIBzdYqD9F/Vq0BFk2oaea7lvuGOaVvkL5MAJqiHMxy7T2B75EPpZfWZ5noI6K/3YBLh
 oRuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Cu/ihJ1P
Subject: [Buildroot] [PATCH v2 4/4] package/python-pykwalify: add required
 package for zephyr cmake
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
Cc: Charles Hardin <charles.hardin@chargepoint.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Alvaro G . M" <alvaro.gamez@hazent.com>,
 Charles Hardin <ckhardin@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <charles.hardin@chargepoint.com>

When building zephyrproject-rtos based firmware, the cmake
integrates with python scripts that can be run using the buildroot
host-python dependencies. This is useful for the sdk setups and
associated build steps for the firmware.

See https://github.com/zephyrproject-rtos/zephyr for the build
steps that are used in the cmake and the requirements are
satisfied for the majority of build minus this package.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/Config.in                             |  1 +
 package/python-pykwalify/Config.in            |  9 ++++++++
 .../python-pykwalify/python-pykwalify.hash    |  6 +++++
 package/python-pykwalify/python-pykwalify.mk  | 23 +++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/python-pykwalify/Config.in
 create mode 100644 package/python-pykwalify/python-pykwalify.hash
 create mode 100644 package/python-pykwalify/python-pykwalify.mk

diff --git a/package/Config.in b/package/Config.in
index 54cddc3914..8eb6c2bf37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1225,6 +1225,7 @@ menu "External python modules"
 	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyjwt/Config.in"
+	source "package/python-pykwalify/Config.in"
 	source "package/python-pylibfdt/Config.in"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
diff --git a/package/python-pykwalify/Config.in b/package/python-pykwalify/Config.in
new file mode 100644
index 0000000000..03afe31865
--- /dev/null
+++ b/package/python-pykwalify/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYKWALIFY
+	bool "python-pykwalify"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
+	select BR2_PACKAGE_PYTHON_RUAMEL_YAML # runtime
+	help
+	  Python lib/cli for JSON/YAML schema validation.
+
+	  http://github.com/grokzen/pykwalify
diff --git a/package/python-pykwalify/python-pykwalify.hash b/package/python-pykwalify/python-pykwalify.hash
new file mode 100644
index 0000000000..6ddfb6306a
--- /dev/null
+++ b/package/python-pykwalify/python-pykwalify.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pykwalify/json
+md5  153197598f8508a49aefc0f44156c2b8  pykwalify-1.8.0.tar.gz
+sha256  796b2ad3ed4cb99b88308b533fb2f559c30fa6efb4fa9fda11347f483d245884  pykwalify-1.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  626fafd952ab0345edc227f2d565835fe1fd14067ae0d635ee3e47289b773dc4  LICENSE
+sha256  f89f247ddd2b9fdff655668148da4b6feaa9175fa44dd244d233006d0f551cd5  docs/license.rst
diff --git a/package/python-pykwalify/python-pykwalify.mk b/package/python-pykwalify/python-pykwalify.mk
new file mode 100644
index 0000000000..8a0bc6a227
--- /dev/null
+++ b/package/python-pykwalify/python-pykwalify.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-pykwalify
+#
+################################################################################
+
+PYTHON_PYKWALIFY_VERSION = 1.8.0
+PYTHON_PYKWALIFY_SOURCE = pykwalify-$(PYTHON_PYKWALIFY_VERSION).tar.gz
+PYTHON_PYKWALIFY_SITE = https://files.pythonhosted.org/packages/d5/77/2d6849510dbfce5f74f1f69768763630ad0385ad7bb0a4f39b55de3920c7
+PYTHON_PYKWALIFY_SETUP_TYPE = setuptools
+PYTHON_PYKWALIFY_LICENSE = MIT
+PYTHON_PYKWALIFY_LICENSE_FILES = LICENSE docs/license.rst
+PYTHON_PYKWALIFY_DEPENDENCIES = \
+	python-dateutil \
+	python-docopt \
+	python-ruamel-yaml
+HOST_PYTHON_PYKWALIFY_DEPENDENCIES = \
+	host-python-dateutil \
+	host-python-docopt \
+	host-python-ruamel-yaml
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
