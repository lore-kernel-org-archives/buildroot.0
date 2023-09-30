Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE757E748E7
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C5CC8305A;
	Sat, 30 Sep 2023 22:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C5CC8305A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTlsjARFfZoe; Sat, 30 Sep 2023 22:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FEB83089;
	Sat, 30 Sep 2023 22:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23FEB83089
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BAD71BF3B9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 752C061170
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 752C061170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alEoBS1PkMED for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:11:00 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFA6961096
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA6961096
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4054f790190so144546775e9.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696111857; x=1696716657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FIbEDm3MoYtWW7EUZADzvz9TtljLKwiT/owrnxMAeG0=;
 b=jjCYchYzxVR/wgdIh8H1AHwUkE1/7/bBGaWY5wX6ut3Q2fd4meWaVpzMJwf/w83DRa
 seWqTa1zXLSE4sodOeLCgYJy+Jr5EwKBXHOGMyRwTdSH/u/ZspdQTVpnk7QYSsm6nWh/
 T7tuQV9C2o/CQtebYxNN0YwLVnZ5wb66LVOjKQlC9rroCKG2oCjJf22ZOr+elt4ox4GJ
 O/xo01bg/bpl2CaxTP7IfR+042R+K+GPApiSVox8et8kluawH4spe/l+MkDxMmWonWv7
 91yVGNs0WjmjyBR+KQYK9ivvu99s7MicVTKk5xDpAy5qQBSoJAUMgOqN+BQBpqSMX1p4
 sSYg==
X-Gm-Message-State: AOJu0YxVnrQJYAbXJN9AEPOq91ObThRMkBIoaPXV/Qb/lKwX4Af6rGXq
 W7Bmm3Hky4abUxhx+f9dehlHr+swRmI=
X-Google-Smtp-Source: AGHT+IHDH8mwaJjNW6w/BskQEmlCWUKPLe2EEOOqyMY+ev4AjGz1EA39+rPD2hwoEa+nWBH/k5zEBA==
X-Received: by 2002:a05:6000:1c19:b0:326:d915:d1c0 with SMTP id
 ba25-20020a0560001c1900b00326d915d1c0mr2233672wrb.56.1696111856851; 
 Sat, 30 Sep 2023 15:10:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y10-20020adff14a000000b00327297abe31sm1796550wro.68.2023.09.30.15.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:10:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:10:51 +0200
Message-Id: <20230930221051.231730-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696111857; x=1696716657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FIbEDm3MoYtWW7EUZADzvz9TtljLKwiT/owrnxMAeG0=;
 b=NZIS9+NTDBMHIE1+qsKKBUKynbVC+Skf701BwXWwBaBMpy1YwTQXLhDEbCR5rrTaP3
 C1YBZQguZaUg/TbmIw9aR09W4TxZuBPU3y77tdu9P/K3vWT+Gylb2nKF50E3jEunRZDx
 0x/nv2uDAYsxxRVQ0P66fvJavvOx6g86mvA/fruXaBB8u2nY7HPyYLVOpm2uzRUbSy8F
 HFzCNXbxwJb5zJU2rynK7klepIelGHgWx2yvSy4pr6kT+9MPTYkouqLw5qgBH0QBMS/c
 Nfj+wVBNW1tID0NGM/8LNvYP07ssa42gr9fFvi/SdrdkbM2/YDxVSsAPd7ikKaUPkrXw
 TQqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NZIS9+NT
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: needs gcc >= 8
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-numpy needs gcc >= 8.4 since bump to version 1.25.0 in commit
ca63464e3777ca2596b4d396accb6a384ccf8514 and
https://github.com/numpy/numpy/commit/4002a7d421ff10780c28a3643683af7a9754f87f:

../output-1/build/host-python-numpy-1.25.0/meson.build:30:4: ERROR: Problem encountered: NumPy requires GCC >= 8.4

Fixes:
 - http://autobuild.buildroot.org/results/9ec82be71c908873112064792ace283049355031

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuradio/Config.in          | 6 ++++--
 package/ola/Config.in               | 6 ++++--
 package/opencv3/Config.in           | 6 ++++--
 package/opencv4/Config.in           | 6 ++++--
 package/piglit/Config.in            | 6 +++++-
 package/python-crossbar/Config.in   | 5 +++--
 package/python-matplotlib/Config.in | 7 +++++--
 package/python-numpy/Config.in      | 4 +++-
 package/python-scipy/Config.in      | 7 +++++--
 package/python-zlmdb/Config.in      | 4 +++-
 package/uhd/Config.in               | 8 ++++++--
 11 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 51237e62b9..7896648d17 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -79,6 +79,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -86,8 +87,9 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
-comment "python support needs glibc or musl"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "python support needs a glibc or musl toolchain w/ host gcc >= 8"
+	depends on !BR2_HOST_GCC_AT_LEAST_8 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_GNURADIO_UTILS
 	bool "gr-utils support"
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 701083b5d3..febadfc77f 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -53,14 +53,16 @@ config BR2_PACKAGE_OLA_RDM_TESTS
 	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Build OLA RDM tests.
 
-comment "rdm tests needs a toolchain w/ glibc or musl"
+comment "rdm tests needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
 
 comment "plugin selections"
 
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index b9ea033f13..d5b37cf555 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -157,15 +157,17 @@ config BR2_PACKAGE_OPENCV3_LIB_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Include opencv_python module into the OpenCV build.  No
 	  python example is installed.
 
-comment "python support needs glibc or musl"
+comment "python support needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_OPENCV3_LIB_SHAPE
 	bool "shape"
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 286a7ebf9d..228ae0e506 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -180,15 +180,17 @@ config BR2_PACKAGE_OPENCV4_LIB_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	help
 	  Include opencv_python module into the OpenCV build.  No
 	  python example is installed.
 
-comment "python support needs glibc or musl"
+comment "python support needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 ||\
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_OPENCV4_LIB_SHAPE
 	bool "shape"
diff --git a/package/piglit/Config.in b/package/piglit/Config.in
index 22d1c7c28e..c2427b7a8d 100644
--- a/package/piglit/Config.in
+++ b/package/piglit/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_PIGLIT
 		BR2_PACKAGE_WAFFLE_SUPPORTS_GBM
 	depends on BR2_INSTALL_LIBSTDCPP # mesa3d-demos, python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-python-numpy
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
@@ -32,6 +34,8 @@ config BR2_PACKAGE_PIGLIT
 
 	  https://piglit.freedesktop.org
 
-comment "piglit needs a glibc or musl toolchain w/ C++"
+comment "piglit needs a glibc or musl toolchain w/ C++, gcc >= 8, host gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_HOST_GCC_AT_LEAST_8 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index aadcb2c360..c2680732f9 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
 	depends on BR2_INSTALL_LIBSTDCPP # python-autobahn's compress and serialization
 	# All the following dependencies are runtime dependencies. It
 	# matches almost 1:1 the requirements-min.txt from crossbar
@@ -64,8 +65,8 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 
 	  https://pypi.python.org/pypi/crossbar
 
-comment "python-crossbar needs a glibc or musl toolchain w/ C++"
+comment "python-crossbar needs a glibc or musl toolchain w/ C++, gcc >= 8"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 8a9281b8e7..3823859a59 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-python-numpy
 	select BR2_PACKAGE_FREETYPE # runtime
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
@@ -36,6 +38,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 
 endif
 
-comment "python-matplotlib needs a glibc or musl toolchain w/ C++"
+comment "python-matplotlib needs a glibc or musl toolchain w/ C++, gcc >= 8, host gcc >= 8"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 132c3f7a82..4a2d94b385 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_PYTHON_NUMPY
 	depends on BR2_INSTALL_LIBSTDCPP
 	# python-numpy needs fenv.h which is not provided by uclibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
@@ -28,7 +29,8 @@ config BR2_PACKAGE_PYTHON_NUMPY
 
 	  http://www.numpy.org/
 
-comment "python-numpy needs a glibc or musl toolchain w/ C++"
+comment "python-numpy needs a glibc or musl toolchain w/ C++, gcc >= 8"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
index 0a4acb9699..4d696cda62 100644
--- a/package/python-scipy/Config.in
+++ b/package/python-scipy/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PYTHON_SCIPY
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS # lapack
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # openblas
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-python-numpy
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LAPACK
@@ -19,10 +21,11 @@ config BR2_PACKAGE_PYTHON_SCIPY
 
 	  https://www.scipy.org/scipylib/
 
-comment "python-scipy needs toolchain w/ fortran and c++ and glibc or musl"
+comment "python-scipy needs glibc or musl toolchain w/ fortran, c++, gcc >=8, host gcc >= 8"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
-		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 8eba2d7946..e77d709112 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
@@ -18,7 +19,8 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 
 	  https://github.com/crossbario/zlmdb
 
-comment "python-zlmdb needs a glibc or musl toolchain w/ C++"
+comment "python-zlmdb needs a glibc or musl toolchain w/ C++, gcc >= 8"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 4316a2c185..7b3367cd65 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -94,16 +94,20 @@ config BR2_PACKAGE_UHD_OCTOCLOCK
 	help
 	  enable OctoClock support
 
-comment "uhd python API needs python3 and a toolchain w/ glibc or musl"
+comment "uhd python API needs python3 and a glibc or musl toolchain w/ gcc >= 8, host gcc >= 8"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_TOOLCHAIN_USES_MUSL) # python-numpy
+	depends on !BR2_HOST_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC && BR2_TOOLCHAIN_USES_MUSL) # python-numpy
 
 config BR2_PACKAGE_UHD_PYTHON
 	bool "python API support"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # python-numpy
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
 	select BR2_PACKAGE_PYTHON_REQUESTS
 	help
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
