Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEA8C00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 07:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A70FA4136C;
	Thu,  4 Aug 2022 07:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A70FA4136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnZ5EcKDbtui; Thu,  4 Aug 2022 07:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5566541610;
	Thu,  4 Aug 2022 07:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5566541610
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7563C1BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 07:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5099B81750
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 07:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5099B81750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UOmeJJ_y7XBf for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 07:15:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD65781656
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD65781656
 for <buildroot@busybox.net>; Thu,  4 Aug 2022 07:15:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p10so19934925wru.8
 for <buildroot@busybox.net>; Thu, 04 Aug 2022 00:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PwsP/C6roxXPfFq4PpXttaaImr6uH93Qb+0Xak86ux4=;
 b=0gcR6M2wTyH7QAzlVFqshqVqnUFQtEGVJ9dCxvYdCkWaJmh3JPuINt74AEWJLn+yMH
 OOA/wpW+xbCNu3vJbg/70V8Aym9HXVdYnoCSopkQVQk5fEUqWYWvFKbDkoBnmCto1g0Z
 LziaOSU43jcLb6bX5g7n7qpHYxtTtUhOhrRV3cYMeiHK0UjUZoO2WE+MFvomnL5Ntm+v
 gE8dVc3ykE2BeSHESDZiXt4z0epevKmWdUXy1nFzZTCUEtxVm2xOwJcPaT90Rs5QHXZr
 ZTiZDUsC7TYxbOgjz9KzBw6mpO5DLhdWCw0qALyPT0XO8LE94yhXBnQquzN/j67J7NT8
 zLBA==
X-Gm-Message-State: ACgBeo0mXx+uUm5PWBnDtlhpMGuG3k9WGp37IvIZumVMjscMYjApLUkn
 pCumGTiT3xQEtRXsfFeeOvuUKI/uF7w=
X-Google-Smtp-Source: AA6agR7DQkYxCrSDuGWiCat3Q016O4VHKpqylNu1r33LUjkzFjsAvfC8qd4Cgb0NkdWYVHP1EmkM7g==
X-Received: by 2002:a5d:4912:0:b0:220:6633:104f with SMTP id
 x18-20020a5d4912000000b002206633104fmr394162wrq.625.1659597326626; 
 Thu, 04 Aug 2022 00:15:26 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a056000120500b002207a0b93b4sm248905wrx.49.2022.08.04.00.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:15:26 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Thu,  4 Aug 2022 09:15:04 +0200
Message-Id: <20220804071504.4062-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220804071504.4062-1-guillaume.bressaix@gmail.com>
References: <20220804071504.4062-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PwsP/C6roxXPfFq4PpXttaaImr6uH93Qb+0Xak86ux4=;
 b=ia2yPTXcjWXGhxcIEGuFIbQvlyXfwKjNca2/zpJNL7SHXQpH4FMDQJwMmgbk6z8JHZ
 1vpUIQXE6K7DgbO93V4MwoDau0sqd+lTK6EkUGJM8MMPzZubO/muTcioKt5QuQvihkAg
 nD3HmbCVA4V3bb8naGW3XfFAm6mv0MhIZKIfAw9GurVWARo7gUlc1jj0PBmgNGtc0hjU
 9D0zMwjSJe7eq9AmhlSB7TbUTYfnxV7AWihghfjbQYNw8ZKKvOrEvqxCg0TvDDijwGzg
 o7FyjDGsYFBxZMo+8mt29DBO9vk7Fv55DpNjkwT9HAKm9e3lMHQeJ44hY7R/WQs0iCWd
 GpEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ia2yPTXc
Subject: [Buildroot] [RFC v2 2/2] package/python-scipy: bump version to 1.9.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-scipy is moving to a meson build infrastructure.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
thank you guys for the valuable help already, this is significant progress
and we're almost there.

Here's a V2 for those willing to test, I dediced to make it available
although i'm just starting investigating. It terminates in a -lnpymath
cross/host mix up "file format not recognized", that I've had with previous
scipy versions (distutils). I think I solved it with some LDFLAGS, but I need to
search my notes.

v1 -> v2
- patch pkg/meson to become knowledgeable of "fortran" compiler
- keep using tarball like before (but .tar.xz was not released this time)
- correct blas = lapack definition
- investigating new error
---
 package/python-scipy/python-scipy.hash |  2 +-
 package/python-scipy/python-scipy.mk   | 34 +++++++++-----------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 0274679c43..6637faf5b4 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9  scipy-1.8.1.tar.xz
+sha256  c0dfd7d2429452e7e94904c6a3af63cbaa3cf51b348bd9d35b42db7e9ad42791  scipy-1.9.0.tar.gz
 sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c  LICENSE.txt
 sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index b5006a2e15..6faa147ba2 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.8.1
-PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.xz
+PYTHON_SCIPY_VERSION = 1.9.0
+PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
 PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
@@ -23,6 +23,7 @@ PYTHON_SCIPY_LICENSE_FILES = \
 	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
 	scipy/spatial/qhull_src/COPYING.txt
 PYTHON_SCIPY_DEPENDENCIES += \
+	host-pkgconf \
 	host-python-numpy \
 	host-python-pythran \
 	zlib \
@@ -31,26 +32,15 @@ PYTHON_SCIPY_DEPENDENCIES += \
 	python-pybind
 PYTHON_SCIPY_INSTALL_STAGING = YES
 
-PYTHON_SCIPY_SETUP_TYPE = setuptools
-PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
+#PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
+#	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
 
-PYTHON_SCIPY_LDFLAGS = $(TARGET_LDFLAGS) -shared \
-	-L$(PYTHON3_PATH)/site-packages/numpy/core/lib
-# -lnpyrandom localization
-PYTHON_SCIPY_LDFLAGS += \
-	-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/random/lib
+#PYTHON_SCIPY_CONF_ENV += \
+#   PYTHONPATH=$(PYTHON3_PATH) \
+#   LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
 
-PYTHON_SCIPY_ENV = \
-	F90=$(TARGET_FC) \
-	LDFLAGS="$(PYTHON_SCIPY_LDFLAGS)"
+PYTHON_SCIPY_CONF_OPTS = \
+	-Dblas=lapack \
+	-Dlapack=lapack
 
-# Provide system configuration options to numpy distutils extensions, telling
-# to find all include files and libraries in staging directory.
-define PYTHON_SCIPY_CONFIGURE_CMDS
-	-rm -f $(@D)/site.cfg
-	echo "[DEFAULT]" >> $(@D)/site.cfg
-	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
-	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
-endef
-
-$(eval $(python-package))
+$(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
