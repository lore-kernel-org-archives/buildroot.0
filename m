Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52015C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA931404F0;
	Thu,  3 Nov 2022 19:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA931404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBpMl5IbTzrU; Thu,  3 Nov 2022 19:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB1CC404C1;
	Thu,  3 Nov 2022 19:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB1CC404C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 959031BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F94881F68
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F94881F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJ5ffXVVkVo0 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:01:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C7AD81F67
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C7AD81F67
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:01:49 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p141so2148675iod.6
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vyP1RZHG0yOW3drDjrItmjULjlW78MuWyJNMa26aKKg=;
 b=gIAhll6+LacMc+z0feW7JAV10BMrgWhV9nONJgZGLH5KZzvpE0n1ZHychmEQLX5PaG
 XlB9i5hcFLs6MUUBEfF/i+KbEtOxBCjTpb9zFDoPXvlKjtsHSbD80UmI44m2IBcb2pc5
 tm/qov8jwhXzfrvyim2WNtK2n7MVwjJsm9yRdpSgdqf6F88zygUg5WbygZcMvhXYyMgG
 Z0212sXjUxh9DeYZz2LQaCDFWRqT0KqzVnaiRcc5OwIcYL2+TqG2Dwk8MCGIa8eUJFig
 0/dxYqmEPUgufF70SjWjWeZ2L/1XXs5cbN4clkeqLiw7YrLuzxcmnex/AY+fzJU2Kw0u
 5cpw==
X-Gm-Message-State: ACrzQf3Iqn2nYNxm6uFkotNQv+MwoizkqNKO7ZJ7ZJ/rRC61gZxZZX3A
 6vprS/u33V1MGRizNVFnTLna/dXiAZ/e9k9Z
X-Google-Smtp-Source: AMsMyM6RFZdWObCOSOJXV/baTsSmiZb+7MsmkWP2ZbkQPwhR+xTNdBTF4cU859cgmIYuAcwDLKPrHQ==
X-Received: by 2002:a05:6638:2216:b0:375:68a3:2930 with SMTP id
 l22-20020a056638221600b0037568a32930mr12996200jas.290.1667502107905; 
 Thu, 03 Nov 2022 12:01:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i8-20020a056e02152800b00300e6efca96sm410145ilu.55.2022.11.03.12.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:01:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:01:45 -0600
Message-Id: <20221103190145.3329752-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vyP1RZHG0yOW3drDjrItmjULjlW78MuWyJNMa26aKKg=;
 b=P7FjzJj6bam7pRYs/a4KnYUf0Y/mLMumf3ww8gowVPY7WIXp7nrNSlBhMjUVEq+xZf
 qY98xnb/euEZaxH/PLEToAgrZY7UVANhPYOOgJTh1mXPPIW23foPqPjIrJ2SI1bNngIi
 nrxfoUUdyRUpDLWKReAvuK/Di9TwAp36VP4OfXgSQpOQWj8+9rUeWADfUmTQ21XketHL
 kIpVUR3TQfFM4HzGkCRxws8gFeHbaI06l+BKMFE/TUSySsgElGL283UOha84y/2ZFPGo
 nOYXEC1rKzovVCa/BezE8d+eCAHevuZ26Maed54sj/47QojrEi6GVmQE1F380Xe+JE/B
 Qyrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P7FjzJj6
Subject: [Buildroot] [PATCH 1/1] package/python-rpi-gpio: bump to version
 0.7.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Ian Haylock <haylocki@yahoo.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from distutils to setuptools build backend.

Drop patch which is now upstream.

License hash changed due to date update:
https://sourceforge.net/p/raspberry-gpio-python/code/ci/7524ba4d7dc243f32238ca54ee5f6ef94ef801c2/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-fix-build-with-gcc-10.x.patch        | 147 ------------------
 package/python-rpi-gpio/python-rpi-gpio.hash  |   9 +-
 package/python-rpi-gpio/python-rpi-gpio.mk    |   6 +-
 3 files changed, 7 insertions(+), 155 deletions(-)
 delete mode 100644 package/python-rpi-gpio/0001-fix-build-with-gcc-10.x.patch

diff --git a/package/python-rpi-gpio/0001-fix-build-with-gcc-10.x.patch b/package/python-rpi-gpio/0001-fix-build-with-gcc-10.x.patch
deleted file mode 100644
index 95892f997f..0000000000
--- a/package/python-rpi-gpio/0001-fix-build-with-gcc-10.x.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-Description: This patch fixes the "multiple definition of" errors with gcc10
-
-Signed-off-by: Michael Fischer <mf@go-sys.de>
-
-diff -purN python-rpi-gpio.org/source/common.c python-rpi-gpio/source/common.c
---- python-rpi-gpio.org/source/common.c	2019-07-21 14:41:22.000000000 +0200
-+++ python-rpi-gpio/source/common.c	2020-08-07 09:31:33.948575964 +0200
-@@ -28,6 +28,9 @@
- const int pin_to_gpio_rev1[41] = {-1, -1, -1, 0, -1, 1, -1, 4, 14, -1, 15, 17, 18, 21, -1, 22, 23, -1, 24, 10, -1, 9, 25, 11, 8, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
- const int pin_to_gpio_rev2[41] = {-1, -1, -1, 2, -1, 3, -1, 4, 14, -1, 15, 17, 18, 27, -1, 22, 23, -1, 24, 10, -1, 9, 25, 11, 8, -1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
- const int pin_to_gpio_rev3[41] = {-1, -1, -1, 2, -1, 3, -1, 4, 14, -1, 15, 17, 18, 27, -1, 22, 23, -1, 24, 10, -1, 9, 25, 11, 8, -1, 7, -1, -1, 5, -1, 6, 12, 13, -1, 19, 16, 26, 20, -1, 21 };
-+const int (*pin_to_gpio)[41];
-+int gpio_direction[54];
-+rpi_info rpiinfo;
- int setup_error = 0;
- int module_setup = 0;
- 
-diff -purN python-rpi-gpio.org/source/common.h python-rpi-gpio/source/common.h
---- python-rpi-gpio.org/source/common.h	2019-07-21 14:41:22.000000000 +0200
-+++ python-rpi-gpio/source/common.h	2020-08-07 09:31:33.948575964 +0200
-@@ -30,14 +30,14 @@ SOFTWARE.
- #define I2C          42
- #define PWM          43
- 
--int gpio_mode;
--const int pin_to_gpio_rev1[41];
--const int pin_to_gpio_rev2[41];
--const int pin_to_gpio_rev3[41];
--const int (*pin_to_gpio)[41];
--int gpio_direction[54];
--rpi_info rpiinfo;
--int setup_error;
--int module_setup;
-+extern int gpio_mode;
-+extern const int pin_to_gpio_rev1[41];
-+extern const int pin_to_gpio_rev2[41];
-+extern const int pin_to_gpio_rev3[41];
-+extern const int (*pin_to_gpio)[41];
-+extern int gpio_direction[54];
-+extern rpi_info rpiinfo;
-+extern int setup_error;
-+extern int module_setup;
- int check_gpio_priv(void);
- int get_gpio_number(int channel, unsigned int *gpio);
-diff -purN python-rpi-gpio.org/source/constants.c python-rpi-gpio/source/constants.c
---- python-rpi-gpio.org/source/constants.c	2019-07-21 14:41:22.000000000 +0200
-+++ python-rpi-gpio/source/constants.c	2020-08-07 09:32:15.522196618 +0200
-@@ -21,6 +21,7 @@
- */
- 
- #include "Python.h"
-+#define CONSTANTS_C
- #include "constants.h"
- #include "common.h"
- #include "c_gpio.h"
-diff -purN python-rpi-gpio.org/source/constants.h python-rpi-gpio/source/constants.h
---- python-rpi-gpio.org/source/constants.h	2019-07-21 14:41:22.000000000 +0200
-+++ python-rpi-gpio/source/constants.h	2020-08-07 09:32:15.522196618 +0200
-@@ -23,22 +23,28 @@ SOFTWARE.
- #define PY_PUD_CONST_OFFSET 20
- #define PY_EVENT_CONST_OFFSET 30
- 
--PyObject *high;
--PyObject *low;
--PyObject *input;
--PyObject *output;
--PyObject *pwm;
--PyObject *serial;
--PyObject *i2c;
--PyObject *spi;
--PyObject *unknown;
--PyObject *board;
--PyObject *bcm;
--PyObject *pud_off;
--PyObject *pud_up;
--PyObject *pud_down;
--PyObject *rising_edge;
--PyObject *falling_edge;
--PyObject *both_edge;
-+#ifdef CONSTANTS_C
-+#define MAYBE_EXTERN
-+#else
-+#define MAYBE_EXTERN extern
-+#endif
-+
-+MAYBE_EXTERN PyObject *high;
-+MAYBE_EXTERN PyObject *low;
-+MAYBE_EXTERN PyObject *input;
-+MAYBE_EXTERN PyObject *output;
-+MAYBE_EXTERN PyObject *pwm;
-+MAYBE_EXTERN PyObject *serial;
-+MAYBE_EXTERN PyObject *i2c;
-+MAYBE_EXTERN PyObject *spi;
-+MAYBE_EXTERN PyObject *unknown;
-+MAYBE_EXTERN PyObject *board;
-+MAYBE_EXTERN PyObject *bcm;
-+MAYBE_EXTERN PyObject *pud_off;
-+MAYBE_EXTERN PyObject *pud_up;
-+MAYBE_EXTERN PyObject *pud_down;
-+MAYBE_EXTERN PyObject *rising_edge;
-+MAYBE_EXTERN PyObject *falling_edge;
-+MAYBE_EXTERN PyObject *both_edge;
- 
- void define_constants(PyObject *module);
-diff -purN python-rpi-gpio.org/source/event_gpio.c python-rpi-gpio/source/event_gpio.c
---- python-rpi-gpio.org/source/event_gpio.c	2019-07-21 14:41:22.000000000 +0200
-+++ python-rpi-gpio/source/event_gpio.c	2020-08-07 09:42:05.564483136 +0200
-@@ -57,7 +57,7 @@ struct callback
- };
- struct callback *callbacks = NULL;
- 
--pthread_t threads;
-+static pthread_t threads;
- int event_occurred[54] = { 0 };
- int thread_running = 0;
- int epfd_thread = -1;
-diff -purN python-rpi-gpio.org/source/py_pwm.h python-rpi-gpio/source/py_pwm.h
---- python-rpi-gpio.org/source/py_pwm.h	2019-07-21 14:41:22.000000000 +0200
-+++ python-rpi-gpio/source/py_pwm.h	2020-08-07 09:38:49.445646807 +0200
-@@ -20,5 +20,5 @@ OUT OF OR IN CONNECTION WITH THE SOFTWAR
- SOFTWARE.
- */
- 
--PyTypeObject PWMType;
-+extern PyTypeObject PWMType;
- PyTypeObject *PWM_init_PWMType(void);
-diff -purN python-rpi-gpio.org/source/soft_pwm.c python-rpi-gpio/source/soft_pwm.c
---- python-rpi-gpio.org/source/soft_pwm.c	2019-07-21 14:41:22.000000000 +0200
-+++ python-rpi-gpio/source/soft_pwm.c	2020-08-07 09:42:40.753160437 +0200
-@@ -25,7 +25,7 @@ SOFTWARE.
- #include <time.h>
- #include "c_gpio.h"
- #include "soft_pwm.h"
--pthread_t threads;
-+static pthread_t threads;
- 
- struct pwm
- {
-diff -purN python-rpi-gpio.org/source/soft_pwm.h python-rpi-gpio/source/soft_pwm.h
---- python-rpi-gpio.org/source/soft_pwm.h	2019-07-21 14:41:22.000000000 +0200
-+++ python-rpi-gpio/source/soft_pwm.h	2020-08-07 09:39:25.916811352 +0200
-@@ -26,4 +26,4 @@ void pwm_set_duty_cycle(unsigned int gpi
- void pwm_set_frequency(unsigned int gpio, float freq);
- void pwm_start(unsigned int gpio);
- void pwm_stop(unsigned int gpio);
--int pwm_exists(unsigned int gpio);
-+extern int pwm_exists(unsigned int gpio);
diff --git a/package/python-rpi-gpio/python-rpi-gpio.hash b/package/python-rpi-gpio/python-rpi-gpio.hash
index 09d1a90765..22bcaebdcb 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.hash
+++ b/package/python-rpi-gpio/python-rpi-gpio.hash
@@ -1,6 +1,5 @@
-# md5 from https://pypi.python.org/pypi/rpi_gpio/json
-# sha256 from https://pypi.python.org/pypi/rpi_gpio/json
-md5  777617f9dea9a1680f9af43db0cf150e  RPi.GPIO-0.7.0.tar.gz
-sha256  7424bc6c205466764f30f666c18187a0824077daf20b295c42f08aea2cb87d3f  RPi.GPIO-0.7.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/rpi_gpio/json
+md5  22704930a4e674a3d35342bde6d69fe5  RPi.GPIO-0.7.1.tar.gz
+sha256  cd61c4b03c37b62bba4a5acfea9862749c33c618e0295e7e90aa4713fb373b70  RPi.GPIO-0.7.1.tar.gz
 # Locally computed
-sha256  a668b3edecb3e69e81ec25987257008208ffcba9d6c43682033b8060c5f2f994  LICENCE.txt
+sha256  1ccf039a03088da42bdb218a446a564330b881ec71f7022a9fb1930f3fb65d8a  LICENCE.txt
diff --git a/package/python-rpi-gpio/python-rpi-gpio.mk b/package/python-rpi-gpio/python-rpi-gpio.mk
index dfc59c882e..4e62e07533 100644
--- a/package/python-rpi-gpio/python-rpi-gpio.mk
+++ b/package/python-rpi-gpio/python-rpi-gpio.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_RPI_GPIO_VERSION = 0.7.0
+PYTHON_RPI_GPIO_VERSION = 0.7.1
 PYTHON_RPI_GPIO_SOURCE = RPi.GPIO-$(PYTHON_RPI_GPIO_VERSION).tar.gz
-PYTHON_RPI_GPIO_SITE = https://sourceforge.net/projects/raspberry-gpio-python/files
+PYTHON_RPI_GPIO_SITE = https://files.pythonhosted.org/packages/c4/0f/10b524a12b3445af1c607c27b2f5ed122ef55756e29942900e5c950735f2
 PYTHON_RPI_GPIO_LICENSE = MIT
 PYTHON_RPI_GPIO_LICENSE_FILES = LICENCE.txt
-PYTHON_RPI_GPIO_SETUP_TYPE = distutils
+PYTHON_RPI_GPIO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
