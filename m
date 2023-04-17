Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CBEC77B78
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 13:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBBDC41D28;
	Mon, 17 Apr 2023 13:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBBDC41D28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENZHmyfjC8lO; Mon, 17 Apr 2023 13:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC17041D12;
	Mon, 17 Apr 2023 13:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC17041D12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E6C21C40BF
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 13:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3688D41989
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 13:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3688D41989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Svpagh6l6Rjn for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 13:03:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D46B041946
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D46B041946
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 13:03:58 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a5so7389419ejb.6
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 06:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681736637; x=1684328637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mcookY8TvfhHxqNaAsnMqBNwMUU8lwzVNpC/MRTz//M=;
 b=CXCKGwHECs6duqLRr3eUjyYcf/xeFgWPmhjwy3sOKYTOiCAx+V0SKJUPracfdidVpg
 cuGuFOf+2kz6hqrGh8i927wg+xzkCD+hAb7xvr7KQgTSLWr0nGjfzAtANAnSrxoX+Lxd
 8sr2aFHN1IneYvv+W7xPHPbjPdAft/cjKZ+JLFDyGlmkCbitkPppvJaLz7+DrmhymMrY
 TKe4T4gHRkEhgKRFuuW3FKEnhjtC14l/JFcAQB1N6wO3S8cZCWLZ4S6cUyLSbYt2Naw+
 96u0U4Z8JCpNyA7KXb2fxstAsRYZRsMneH94MtqkA0aRXvDassOQmqfptmyLsb1Yf9pJ
 ayiA==
X-Gm-Message-State: AAQBX9fkzllBdT0GUlrxCnHMLlvr8KFTl9QSjGK4hJh8V+l32mfKCKZm
 To8xmC8zMF37OFbq9ooqzyYlH5IYXQxwlxf/xxk=
X-Google-Smtp-Source: AKy350bxudbczGWQ3SDgFyK5ljjDm4OdrpDZ1PA0SxvsSCU0ZpnTkvBajI/Zbw9IXlfjNu8AQUI5pg==
X-Received: by 2002:a17:907:3da6:b0:94f:5d1b:d33a with SMTP id
 he38-20020a1709073da600b0094f5d1bd33amr3982622ejc.40.1681736636777; 
 Mon, 17 Apr 2023 06:03:56 -0700 (PDT)
Received: from localhost.localdomain ([91.90.166.178])
 by smtp.gmail.com with ESMTPSA id
 me15-20020a170906aecf00b0094f4e914f67sm2404354ejb.66.2023.04.17.06.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 06:03:56 -0700 (PDT)
From: Witold Lipieta <witold.lipieta@thaumatec.com>
To: buildroot@buildroot.org
Date: Mon, 17 Apr 2023 15:03:42 +0200
Message-Id: <20230417130342.1119237-1-witold.lipieta@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1681736637; x=1684328637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mcookY8TvfhHxqNaAsnMqBNwMUU8lwzVNpC/MRTz//M=;
 b=t+1w4vXRqO/q9QFRAzQMbf1y4V2k8V11FFfHBPzKJnnUETt6RNKfTt4YJrbzaVk+lG
 9B/aT+a8WB5q4uQIVKvfYsZCCZnGq6xkDvioKQ5joDI2+EUHsKdLwoPuy94VUTMcbzut
 LIT+iXLRpo7TuRJ1Kwt3aKx2xNIgg3j8JNWMHN+IoIOo0AsR8/jStrw3nQKIJRRg/QVT
 2VUZs0+G+/H0KX+87HrQnJZOumh3GNfmieMW+7yH5grGR1aSkcyfTHWa80S7mlJ1cbUy
 qWwOGKVxrxsUjkzA+RF289u2H+qAuSGbHdXO0dWQZWKvxb2syL1oFnO3Qnbuu+CBdORF
 aniA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=thaumatec-com.20221208.gappssmtp.com
 header.i=@thaumatec-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=t+1w4vXR
Subject: [Buildroot] [PATCH v2 1/1] package/python-evdev: new package
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
Cc: Witold Lipieta <witold.lipieta@thaumatec.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

evdev 1.6.1 https://pypi.org/project/evdev/

Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
---
Changes v1 -> v2:
 - remove runtime dependency
 - add dependency on linux 4.4 headers
 - pass path to uinput.h during setup
 - add basic runtime check
---
 package/Config.in                              |  1 +
 package/python-evdev/Config.in                 |  7 +++++++
 package/python-evdev/python-evdev.hash         |  5 +++++
 package/python-evdev/python-evdev.mk           | 18 ++++++++++++++++++
 .../tests/package/sample_python_evdev.py       | 11 +++++++++++
 .../testing/tests/package/test_python_evdev.py | 12 ++++++++++++
 6 files changed, 54 insertions(+)
 create mode 100644 package/python-evdev/Config.in
 create mode 100644 package/python-evdev/python-evdev.hash
 create mode 100644 package/python-evdev/python-evdev.mk
 create mode 100644 support/testing/tests/package/sample_python_evdev.py
 create mode 100644 support/testing/tests/package/test_python_evdev.py

diff --git a/package/Config.in b/package/Config.in
index 760dda6ac1..eaac32a01a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1049,6 +1049,7 @@ menu "External python modules"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
+	source "package/python-evdev/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
diff --git a/package/python-evdev/Config.in b/package/python-evdev/Config.in
new file mode 100644
index 0000000000..91e4642d48
--- /dev/null
+++ b/package/python-evdev/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_EVDEV
+	bool "python-evdev"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+	help
+	  Bindings to the Linux input handling subsystem.
+
+	  https://github.com/gvalkov/python-evdev
diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
new file mode 100644
index 0000000000..9a6d0d07be
--- /dev/null
+++ b/package/python-evdev/python-evdev.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/evdev/json
+md5  905b12ef6136b518ddf418d8d5b053e4  evdev-1.6.1.tar.gz
+sha256  299db8628cc73b237fc1cc57d3c2948faa0756e2a58b6194b5bf81dc2081f1e3  evdev-1.6.1.tar.gz
+# Locally computed sha256 checksums
+sha256  55fd76d7b3f90d312f161d318631b93c58a0e69d662d07c4f5aca2c6c9ecc85e  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
new file mode 100644
index 0000000000..5cf62b5160
--- /dev/null
+++ b/package/python-evdev/python-evdev.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-evdev
+#
+################################################################################
+
+PYTHON_EVDEV_VERSION = 1.6.1
+PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/05/50/629b011a7f61cb2fca754ea8631575784bf8605a1ec4d6970a010bc54e2b
+PYTHON_EVDEV_SETUP_TYPE = setuptools
+PYTHON_EVDEV_LICENSE = Revised BSD License
+PYTHON_EVDEV_LICENSE_FILES = LICENSE
+
+PYTHON_EVDEV_BUILD_OPTS = \
+	build_ecodes \
+	--evdev-headers $(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h:$(STAGING_DIR)/usr/include/linux/uinput.h
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_evdev.py b/support/testing/tests/package/sample_python_evdev.py
new file mode 100644
index 0000000000..0c00fa6e2f
--- /dev/null
+++ b/support/testing/tests/package/sample_python_evdev.py
@@ -0,0 +1,11 @@
+import evdev
+
+devices = [evdev.InputDevice(path) for path in evdev.list_devices()]
+e = evdev.events.InputEvent(1036996631, 984417, evdev.ecodes.EV_KEY, evdev.ecodes.KEY_A, 2)
+k = evdev.events.KeyEvent(e)
+
+assert(k.keystate == evdev.events.KeyEvent.key_hold)
+assert(k.event == e)
+assert(k.scancode == evdev.ecodes.KEY_A)
+assert(k.keycode == 'KEY_A')
+assert(len(devices) > 0)
diff --git a/support/testing/tests/package/test_python_evdev.py b/support/testing/tests/package/test_python_evdev.py
new file mode 100644
index 0000000000..f2d64c7bd1
--- /dev/null
+++ b/support/testing/tests/package/test_python_evdev.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Evdev(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_EVDEV=y
+        """
+    sample_scripts = ["tests/package/sample_python_evdev.py"]
+    
\ No newline at end of file
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
