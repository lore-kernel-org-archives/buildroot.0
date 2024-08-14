Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B74C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 06:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 292D64000B;
	Wed, 14 Aug 2024 06:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6H4MV-XuP-m; Wed, 14 Aug 2024 06:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 846A040284
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 846A040284;
	Wed, 14 Aug 2024 06:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF711BF484
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 06:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D3E88140A
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 06:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5U9GXeD7bAE for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 06:02:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=dylan.bespalko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5100E81402
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5100E81402
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5100E81402
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 06:02:27 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1fc65329979so57317845ad.0
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 23:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723615346; x=1724220146;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+40br+K4qvMGQXi9+tGbjXX6zRqWdgtVv86N8jfn0lU=;
 b=VUZUawOwdf10K85oc0GkQCB+UFNRtYbiT5JxjjSJSm1mckW2K12DB5o7jiSWhAcIsW
 E2bHReGO39Vtm2mBVRCvTBRQDZ68hLVD2dfg9an5OKc+iUTc3x5sQsyeOFCfjGFwlndl
 LWz+68XPmpw+Yom33SaOfhnpCGwj8cTA26gLg7X7oUD82rvojsiA0yAwRGofGPSY+ZwO
 orTFcKCvNyeVrGQiuJ4E8e4/zjrA/Wr/acJiOgKf6CxRBgvHJjRP8HkB2cqu+DK7ZgUU
 DGBSWTjy76+ONB1Mgf4ccj59MFu7t4+4Ko6otg3nBDD605i5ikPXp9aj2rCQiXjo5NwZ
 13og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf3lVv/6RVMKKYcsChTyvK1TM3X0vkBPYibBBXthXe0/u4Ut+tH3G0cqwH0vJEcKr0RNrkEkHjqNaXwO4uX9f+325sAGIEJw==
X-Gm-Message-State: AOJu0YwElnff7av2ocv2XdTjIZgJmRjx9egmuKnLEXfGgAAWcO8ysdqk
 BCvnAwbwnWuQKA02qcEc04tMsBKvgYT1M6ryrmw74HiPcua2Zv3v
X-Google-Smtp-Source: AGHT+IHULwFSEFxborv87d2wknIsuN+C51kbMqLme7U8NX+HtRPkJ+Atdu7xFxBVqMMQYLHmxxD5qg==
X-Received: by 2002:a17:902:fb46:b0:200:a9d7:8c6c with SMTP id
 d9443c01a7336-201d67dde30mr17449185ad.65.1723615346196; 
 Tue, 13 Aug 2024 23:02:26 -0700 (PDT)
Received: from ?IPV6:2604:3d09:c8e:3500:d647:c6b9:b6bb:ab9c?
 ([2604:3d09:c8e:3500:d647:c6b9:b6bb:ab9c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd131528sm22446085ad.52.2024.08.13.23.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 23:02:25 -0700 (PDT)
Message-ID: <8359a431-b118-4f39-bc13-a286281ef75d@gmail.com>
Date: Tue, 13 Aug 2024 23:02:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
References: <20240812080307.553359-1-dylan.bespalko@gmail.com>
From: Dylan Bespalko <dylan.bespalko@gmail.com>
Content-Language: en-US
In-Reply-To: <20240812080307.553359-1-dylan.bespalko@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723615346; x=1724220146; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+40br+K4qvMGQXi9+tGbjXX6zRqWdgtVv86N8jfn0lU=;
 b=IvcOn7GF7CvwlHVK/soNMhCcmqPBzrMk0qKX4xaRAw4JGzRxKcXL4nOAIdREPyHC5+
 cd4XvsTWwryHIlle+gCs77YlIje0fWFPUwpqQAKZEku8mmgaxF8i9NQFzOXNGcs2EOue
 TmTID0XDecRmrcoM2ysDNOE3FBHJLH924AxhRsFJa9NYSxQ3MHjO6qnC3oycjkgUMCKA
 MT/ZAtiidrkbAO95TLKlfPoOO1c0R7sAVanaTcs64GbmSLuVwQAPlFf/YFeq+6u+PkzE
 YaoYduEq9xZmv2IWjV+45I1ZqE24QQbJmw9EOWVPYJ0dm57HOs5jg9DfHifJChsVUBDj
 dsmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IvcOn7GF
Subject: Re: [Buildroot] [PATCH v3 1/1] added package/python-{shiboken6,
 pyside6}: new packages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

pyside-tools contains the Python `pyside6-{uic|rcc}` utilities along 
with some aspirational features:
   - `qtpy2cpp_lib`: Convert *.py code to *.cpp (assuming you only used Qt)
   - `deploy`: A way to deploy PySide Code accross all platforms as a 
single file, simlar to cx_freeze.
These modules have MULTIPLE *.pyproject/setup.py files and implicit 
dependencies, which are *complicated* and don't make sense for embedded.

Alternatively, Qt has modified the C++ {uic|rcc} utilities to convert Qt 
Designer {*.uic|*.qrc} files to C++ *or Python*. Hence, the solution is 
NOT to support pyside-tools on buildroot.

I simply need to tell the downstream user to use `{uic|rcc} -g python` 
instead of `pyside6-{uic|rcc}` in their build recipe. See proposed 
changes below:

On 8/12/24 01:03, Dylan Bespalko wrote:
> There are actually three projects combined in the PySide6 repo:
>    - Shiboken6 (package/python-shiboken6): A C++/Python Binding Generator
>    - PySide6 (package/python-pyside6): A C++/Python binding of Qt6
>    - pyside-tools (Not Included): which contains pyside6-uic/pyside6-rcc

DO NOT create pyside-tools buildroot recipe. It is not needed.

>    
> A future patch will add pyside-tools. Until then, you must convert *.ui/*.qrc
> files to *.py file using pyside-uic/pyside6-rcc manually. Make sure to
> use a similar version of Qt.
> 
> Signed-off-by: Dylan Bespalko<dylan.bespalko@gmail.com>
> ---
> Changes v1 -> v2:
>    - nothing. Made sure git send-email sends the commit message above.
> Changes v2 -> v3:
>    - Used SUBDIR feature to navigate to sources/pyside6 and
>      sources/shiboken6
>    - Removed numpy from shiboken6 dependencies
>    - Added requested comments for easier maintanence
>    - Replied to review email with additional notes per review topic.
> 
>   DEVELOPERS                                    |   6 +
>   package/Config.in                             |   2 +
>   package/python-pyside6/Config.in              |  19 +++
>   package/python-pyside6/python-pyside6.hash    |  10 ++
>   package/python-pyside6/python-pyside6.mk      |  94 +++++++++++
>   package/python-shiboken6/Config.in            |  22 +++
>   .../python-shiboken6/python-shiboken6.hash    |  10 ++
>   package/python-shiboken6/python-shiboken6.mk  |  57 +++++++
>   .../tests/package/sample_python_pyside6.py    | 157 ++++++++++++++++++
>   .../tests/package/test_python_pyside6.py      |  60 +++++++
>   10 files changed, 437 insertions(+)
>   create mode 100644 package/python-pyside6/Config.in
>   create mode 100644 package/python-pyside6/python-pyside6.hash
>   create mode 100644 package/python-pyside6/python-pyside6.mk
>   create mode 100644 package/python-shiboken6/Config.in
>   create mode 100644 package/python-shiboken6/python-shiboken6.hash
>   create mode 100644 package/python-shiboken6/python-shiboken6.mk
>   create mode 100644 support/testing/tests/package/sample_python_pyside6.py
>   create mode 100644 support/testing/tests/package/test_python_pyside6.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7d0af3543..eca9e3a9f8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -876,6 +876,12 @@ F:	package/unscd/
>   N:	Dushara Jayasinghe<nidujay@gmail.com>
>   F:	package/prosody/
>   
> +N:	Dylan Bespalko<dylan.bespalko@gmail.com>
> +F:	package/python-shiboken6/
> +F:	package/python-pyside6/
> +F:	support/testing/tests/package/test_python_pyside6.py
> +F:	support/testing/tests/package/sample_python_pyside6.py
> +
>   N:	Edgar Bonet<bonet@grenoble.cnrs.fr>
>   F:	board/acmesystems/acqua-a5/
>   F:	configs/acmesystems_acqua_a5_256mb_defconfig
> diff --git a/package/Config.in b/package/Config.in
> index f2c63ffb6e..2086f5ed19 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1313,6 +1313,7 @@ menu "External python modules"
>   	source "package/python-pysendfile/Config.in"
>   	source "package/python-pysensors/Config.in"
>   	source "package/python-pysftp/Config.in"
> +	source "package/python-pyside6/Config.in"
>   	source "package/python-pysmb/Config.in"
>   	source "package/python-pysmi/Config.in"
>   	source "package/python-pysnmp/Config.in"
> @@ -1368,6 +1369,7 @@ menu "External python modules"
>   	source "package/python-setproctitle/Config.in"
>   	source "package/python-setuptools/Config.in"
>   	source "package/python-sh/Config.in"
> +	source "package/python-shiboken6/Config.in"
>   	source "package/python-shutilwhich/Config.in"
>   	source "package/python-simpleaudio/Config.in"
>   	source "package/python-simplegeneric/Config.in"
> diff --git a/package/python-pyside6/Config.in b/package/python-pyside6/Config.in
> new file mode 100644
> index 0000000000..6bc754e1cf
> --- /dev/null
> +++ b/package/python-pyside6/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_PYTHON_PYSIDE6
> +	bool "python-pyside6"
> +	depends on BR2_PACKAGE_QT6
> +	select BR2_PACKAGE_QT6BASE_GUI
> +	select BR2_PACKAGE_QT6_GL_SUPPORTS  # Requirement of PySide6.QtWidgets, but not QtWidgets
> +	select BR2_PACKAGE_QT6BASE_WIDGETS
> +	select BR2_PACKAGE_QT6BASE_OPENGL
> +	select BR2_PACKAGE_OPENSSL  # Requirement of PySide6.QtNetwork, but not QtNetwork
> +	select BR2_PACKAGE_HOST_PYTHON_SHIBOKEN6
> +	select BR2_PACKAGE_PYTHON_SHIBOKEN6
> +	help
> +	  Qt For Python is the Python Qt bindings project.
> +	  Make sure to select a qpa-platform using:
> +	  - BR2_PACKAGE_QT6BASE_DEFAULT_QPA="<qpa-platform>"
> +	  - Or, QT_QPA_PLATFORM=<qpa-platform> python > +
> +	  PySide6 auto-detects the Qt6 Modules that are present.
> +
> +	https://wiki.qt.io/Qt_for_Python


The help should be as follows:
     help
       Qt For Python is the Python Qt bindings project.

       PySide6 auto-detects the Qt6 Modules that are present.

       Make sure to select a qpa-platform using:
       - `BR2_PACKAGE_QT6BASE_DEFAULT_QPA="<qpa-platform>"`at build-time.
       - Or, `QT_QPA_PLATFORM=<qpa-platform> python3` at run-time.

       If your project converts {*.ui|*.qrc} files to *.py files during 
the build:
       - Call `$(HOST_DIR)/libexec/{uic|rcc} -g python` in your build.
       - This is equivalent to the traditional `pyside6-{uic|rcc}`
command.
       The first solution will isolate your buildroot environement from 
your local system.

       https://wiki.qt.io/Qt_for_Python

> diff --git a/package/python-pyside6/python-pyside6.hash b/package/python-pyside6/python-pyside6.hash
> new file mode 100644
> index 0000000000..361ae66124
> --- /dev/null
> +++ b/package/python-pyside6/python-pyside6.hash
> @@ -0,0 +1,10 @@
> +# Locally computed sha256 checksums
> +md5  385a4463908d14cc86d54aac0454e871  python-pyside6-v6.7.2-git4.tar.gz
> +sha256  5ddb1bac70c9504d57f31005f4cdf5921c71fbf91190abe22abf45537d725d3b  python-pyside6-v6.7.2-git4.tar.gz
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LicenseRef-Qt-Commercial.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  Qt-GPL-exception-1.0.txt
> diff --git a/package/python-pyside6/python-pyside6.mk b/package/python-pyside6/python-pyside6.mk
> new file mode 100644
> index 0000000000..af28384676
> --- /dev/null
> +++ b/package/python-pyside6/python-pyside6.mk
> @@ -0,0 +1,94 @@
> +################################################################################
> +#
> +# python-pyside6
> +#
> +################################################################################
> +
> +# Make sure to sync PYTHON_PYSIDE6_VERSION == PYTHON_SHIBOKEN6_VERSION == QT6_VERSION
> +PYTHON_PYSIDE6_VERSION = v6.7.2
> +PYTHON_PYSIDE6_SITE =https://code.qt.io/pyside/pyside-setup.git
> +PYTHON_PYSIDE6_SUBDIR = sources/pyside6
> +PYTHON_PYSIDE6_SITE_METHOD = git
> +PYTHON_PYSIDE6_CPE_ID_VENDOR = qt
> +PYTHON_PYSIDE6_CPE_ID_PRODUCT = pyside6
> +PYTHON_PYSIDE6_SUPPORTS_IN_SOURCE_BUILD = NO
> +PYTHON_PYSIDE6_INSTALL_STAGING = YES
> +
> +PYTHON_PYSIDE6_LICENSE = \
> +	GPL-2.0+ or LGPL-3.0, \
> +	GPL-3.0 with exception (tools), \
> +	GFDL-1.3 (docs), \
> +	Apache-2.0, \
> +	BSD-3-Clause
> +
> +PYTHON_PYSIDE6_LICENSE_FILES = \
> +	LICENSES/Apache-2.0.txt \
> +	LICENSES/BSD-3-Clause.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/Qt-GPL-exception-1.0.txt
> +
> +PYTHON_PYSIDE6_DEPENDENCIES = \
> +	host-python-shiboken6 \
> +	qt6base \
> +	python-shiboken6
> +
> +# Essential Modules: grep -A 8 -r "set(ALL_ESSENTIAL_MODULES" on repo for updated list
> +PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES = \
> +	Core \
> +	Gui \
> +	Widgets \
> +	$(if $(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),PrintSupport) \
> +	$(if $(BR2_PACKAGE_QT6BASE_SQL),Sql) \
> +	$(if $(BR2_PACKAGE_QT6BASE_NETWORK),Network) \
> +	$(if $(BR2_PACKAGE_QT6BASE_TEST),Test) \
> +	$(if $(BR2_PACKAGE_QT6BASE_CONCURRENT),Concurrent)
> +
> +# Add-On Modules: grep -A 33 -r "set(ALL_OPTIONAL_MODULES" on repo for updated list
> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES = \
> +	$(if $(BR2_PACKAGE_QT6BASE_DBUS),DBus) \
> +	$(if $(BR2_PACKAGE_QT6BASE_XML),Xml) \
> +	$(if $(BR2_PACKAGE_QT6BASE_OPENGL),OpenGL) \
> +	$(if $(BR2_PACKAGE_QT6BASE_WIDGETS) && $(BR2_PACKAGE_QT6BASE_OPENGL),OpenGLWidgets)
> +
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +PYTHON_PYSIDE6_DEPENDENCIES += qt6declarative
> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += \
> +	Qml \
> +	Quick \
> +	QuickControls2 \
> +	QuickTest \
> +	QuickWidgets
> +endif
> +ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
> +PYTHON_PYSIDE6_DEPENDENCIES += qt6serialport
> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SerialPort
> +ifeq ($(BR2_PACKAGE_QT6SERIALBUS),y)
> +PYTHON_PYSIDE6_DEPENDENCIES += qt6serialbus
> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SerialBus
> +endif
> +endif
> +ifeq ($(BR2_PACKAGE_QT6SVG),y)
> +PYTHON_PYSIDE6_DEPENDENCIES += qt6svg
> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += Svg
> +PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += SvgWidgets
> +endif
> +
> +# All Modules: grep -r "set(MODULES" on repo for updated list
> +# The Modules are defined here:https://doc.qt.io/qt-6/qtmodules.html
> +PYTHON_PYSIDE6_MODULES = $(subst $(space),\;,$(PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES) $(PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES))
> +
> +PYTHON_PYSIDE6_CONF_ENV = \
> +	LLVM_INSTALL_DIR=$(HOST_DIR)
> +
> +PYTHON_PYSIDE6_CONF_OPTS = \
> +	-DMODULES=$(PYTHON_PYSIDE6_MODULES) \
> +	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
> +	-DSTANDALONE=ON \
> +	-DPYSIDE_TREAT_QT_INCLUDE_DIRS_AS_NON_SYSTEM=ON \
> +	-DSHIBOKEN_GENERATOR_EXTRA_FLAGS='\
> +		--compiler-path=$(HOST_DIR)/bin/clang'
> +
> +$(eval $(cmake-package))
> diff --git a/package/python-shiboken6/Config.in b/package/python-shiboken6/Config.in
> new file mode 100644
> index 0000000000..04c5818536
> --- /dev/null
> +++ b/package/python-shiboken6/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_PYTHON_SHIBOKEN6
> +	bool "python-shiboken6"
> +	depends on BR2_PACKAGE_QT6
> +	select BR2_PACKAGE_QT6BASE_GUI
> +	select BR2_PACKAGE_QT6_GL_SUPPORTS  # Requirement of PySide6.QtWidgets, but not QtWidgets
> +	select BR2_PACKAGE_QT6BASE_WIDGETS
> +	select BR2_PACKAGE_QT6BASE_OPENGL
> +	select BR2_PACKAGE_HOST_LIBXSLT
> +	select BR2_PACKAGE_HOST_CLANG
> +	select BR2_PACKAGE_HOST_CMAKE
> +	select BR2_PACKAGE_HOST_PERL
> +	select BR2_PACKAGE_HOST_QT6BASE
> +	select BR2_PACKAGE_HOST_QT6BASE_GUI
> +	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
> +	select BR2_PACKAGE_HOST_PYTHON3
> +	select BR2_PACKAGE_HOST_PYTHON_SHIBOKEN6
> +	select BR2_PACKAGE_PYTHON3_ZLIB
> +	help
> +	  Shiboken generates bindings for C++ libraries using
> +	  CPython source code
> +
> +	https://wiki.qt.io/Qt_for_Python
> diff --git a/package/python-shiboken6/python-shiboken6.hash b/package/python-shiboken6/python-shiboken6.hash
> new file mode 100644
> index 0000000000..d6f479a477
> --- /dev/null
> +++ b/package/python-shiboken6/python-shiboken6.hash
> @@ -0,0 +1,10 @@
> +# Locally computed sha256 checksums
> +md5  0bc8a2fcc8ab4c31711b7c6e1254dae8  python-shiboken6-v6.7.2-git4.tar.gz
> +sha256  586a245db884a4d020f696b985d3afee0b81f11cc3aeeb62aa2c4632d43f4e67  python-shiboken6-v6.7.2-git4.tar.gz
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LicenseRef-Qt-Commercial.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  Qt-GPL-exception-1.0.txt
> diff --git a/package/python-shiboken6/python-shiboken6.mk b/package/python-shiboken6/python-shiboken6.mk
> new file mode 100644
> index 0000000000..bb7843a3ec
> --- /dev/null
> +++ b/package/python-shiboken6/python-shiboken6.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# python-shiboken6
> +#
> +################################################################################
> +
> +# Make sure to sync PYTHON_SHIBOKEN6_VERSION == QT6_VERSION
> +PYTHON_SHIBOKEN6_VERSION = v6.7.2
> +PYTHON_SHIBOKEN6_SITE =https://code.qt.io/pyside/pyside-setup.git
> +PYTHON_SHIBOKEN6_SUBDIR = sources/shiboken6
> +PYTHON_SHIBOKEN6_SITE_METHOD = git
> +PYTHON_SHIBOKEN6_CPE_ID_VENDOR = qt
> +PYTHON_SHIBOKEN6_CPE_ID_PRODUCT = shiboken
> +PYTHON_SHIBOKEN6_SUPPORTS_IN_SOURCE_BUILD = NO
> +PYTHON_SHIBOKEN6_INSTALL_STAGING = YES
> +
> +PYTHON_SHIBOKEN6_LICENSE = \
> +	GPL-2.0+ or LGPL-3.0, \
> +	GPL-3.0 with exception (tools), \
> +	GFDL-1.3 (docs), \
> +	Apache-2.0, \
> +	BSD-3-Clause
> +
> +PYTHON_SHIBOKEN6_LICENSE_FILES = \
> +	LICENSES/Apache-2.0.txt \
> +	LICENSES/BSD-3-Clause.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/Qt-GPL-exception-1.0.txt
> +
> +PYTHON_SHIBOKEN6_DEPENDENCIES = \
> +	host-libxslt \
> +	host-clang \
> +	host-cmake \
> +	host-perl \
> +	host-qt6base \
> +	host-python3 \
> +	host-python-shiboken6 \
> +	qt6base \
> +	python3
> +
> +HOST_PYTHON_SHIBOKEN6_DEPENDENCIES = \
> +	host-libxslt \
> +	host-clang \
> +	host-cmake \
> +	host-perl \
> +	host-qt6base \
> +	host-python3
> +
> +PYTHON_SHIBOKEN6_CONF_OPTS = \
> +	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
> +	-DQFP_PYTHON_HOST_PATH=$(HOST_DIR)/bin/python3
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> diff --git a/support/testing/tests/package/sample_python_pyside6.py b/support/testing/tests/package/sample_python_pyside6.py
> new file mode 100644
> index 0000000000..5806565041
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_pyside6.py
> @@ -0,0 +1,157 @@
> +# ALL_ESSENTIAL_MODULES
> +def test_python_pyside6_qt():
> +    from PySide6.QtCore import Qt
> +    enum = Qt.white
> +    assert(str(enum) == 'GlobalColor.white')
> +
> +
> +def test_python_pyside6_qtcore():
> +    from PySide6 import QtCore
> +    obj = QtCore.QObject()
> +    obj.setObjectName('MyObject')
> +    assert(obj.objectName() == 'MyObject')
> +
> +
> +def test_python_pyside6_qtgui():
> +    from PySide6 import QtGui
> +    color = QtGui.QColor.fromRgb(255, 255, 255, 255)
> +    assert(color.name(QtGui.QColor.HexArgb) == "#ffffffff")
> +
> +
> +def test_python_pyside6_qtwidgets():
> +    from PySide6 import QtWidgets
> +    app = QtWidgets.QApplication()
> +    label = QtWidgets.QLabel('Hello World')
> +    assert(label.text() == 'Hello World')
> +    QtWidgets.QApplication.shutdown(app)
> +
> +
> +def test_python_pyside6_qtprintsupport():
> +    from PySide6 import QtWidgets
> +    from PySide6 import QtPrintSupport
> +    app = QtWidgets.QApplication()
> +    p = QtPrintSupport.QPrinter()
> +    assert(p.creator() == '')
> +    QtWidgets.QApplication.shutdown(app)
> +
> +
> +def test_python_pyside6_qtsql():
> +    from PySide6 import QtSql
> +    db = QtSql.QSqlDatabase()
> +    assert(db.hostName() == '')
> +
> +
> +def test_python_pyside6_qtnetwork():
> +    from PySide6 import QtNetwork
> +    host_info = QtNetwork.QHostInfo()
> +    assert(host_info.localHostName() == 'buildroot')
> +
> +
> +def test_python_pyside6_qttest():
> +    from PySide6 import QtTest
> +    text = QtTest.QTest.toPrettyCString('hello there', 5)
> +    assert(text == '"hello"')
> +
> +
> +def test_python_pyside6_qtconcurrent():
> +    from PySide6 import QtConcurrent
> +    future = QtConcurrent.QFutureQString()
> +    assert(future.isRunning() is False)
> +
> +
> +# ALL_OPTIONAL_MODULES
> +def test_python_pyside6_qtdbus():
> +    from PySide6 import QtDBus
> +    message = QtDBus.QDBusMessage()
> +    assert(message.errorMessage() == '')
> +
> +
> +def test_python_pyside6_qtxml():
> +    from PySide6 import QtXml
> +    doc = QtXml.QDomDocument('temp.xml')
> +    assert(doc.toString() == '')
> +
> +
> +def test_python_pyside6_qtopengl():
> +    from PySide6 import QtOpenGL
> +    log = QtOpenGL.QOpenGLDebugLogger()
> +    assert(log.isLogging() is False)
> +
> +
> +def test_python_pyside6_qtopenglwidgets():
> +    from PySide6 import QtWidgets
> +    from PySide6 import QtOpenGLWidgets
> +    app = QtWidgets.QApplication()
> +    _ = QtOpenGLWidgets.QOpenGLWidget()
> +    # assert(widget.isValid() == False)
> +    # QOpenGLWidget is not supported on this platform.
> +    QtWidgets.QApplication.shutdown(app)
> +
> +
> +def test_python_pyside6_qtquickcontrols():
> +    from PySide6 import QtWidgets
> +    from PySide6 import QtQuick
> +    app = QtWidgets.QApplication()
> +    view = QtQuick.QQuickView()
> +    assert(str(view.status()) == 'Status.Null')
> +    view.setSource('/usr/lib/qt6/qml/QtQuick/Controls/Universal/Label.qml')
> +    assert(str(view.status()) == 'Status.Ready')
> +    view.close()
> +    QtWidgets.QApplication.shutdown(app)
> +
> +
> +def test_python_pyside6_qtquickwidgets():
> +    from PySide6 import QtWidgets
> +    from PySide6 import QtQuickWidgets
> +    app = QtWidgets.QApplication()
> +    view = QtQuickWidgets.QQuickWidget()
> +    assert(str(view.status()) == 'Status.Null')
> +    view.setSource('/usr/lib/qt6/qml/QtQuick/Controls/Universal/Label.qml')
> +    assert(str(view.status()) == 'Status.Ready')
> +    QtWidgets.QApplication.shutdown(app)
> +
> +
> +def test_python_pyside6_qtserialport():
> +    # The filepath used in this test does not need to exist. The serial port is never connected.
> +    from PySide6 import QtSerialPort
> +    ser = QtSerialPort.QSerialPort()
> +    ser.setPortName('/dev/tty')
> +    assert(ser.portName() == 'tty')
> +
> +
> +def test_python_pyside6_qtsvg():
> +    from PySide6 import QtSvg
> +    renderer = QtSvg.QSvgRenderer()
> +    renderer.setFramesPerSecond(30)
> +    assert(renderer.framesPerSecond() == 30)
> +
> +
> +def test_python_pyside6_qtsvgwidgets():
> +    from PySide6 import QtWidgets
> +    from PySide6 import QtSvgWidgets
> +    app = QtWidgets.QApplication()
> +    widget = QtSvgWidgets.QSvgWidget()
> +    widget.setObjectName('MyObject')
> +    assert(widget.objectName() == 'MyObject')
> +    QtWidgets.QApplication.shutdown(app)
> +
> +
> +if __name__ == "__main__":
> +    test_python_pyside6_qt()
> +    test_python_pyside6_qtcore()
> +    test_python_pyside6_qtgui()
> +    test_python_pyside6_qtwidgets()
> +    test_python_pyside6_qtprintsupport()
> +    test_python_pyside6_qtsql()
> +    test_python_pyside6_qtnetwork()
> +    test_python_pyside6_qttest()
> +    test_python_pyside6_qtconcurrent()
> +    test_python_pyside6_qtdbus()
> +    test_python_pyside6_qtxml()
> +    test_python_pyside6_qtopengl()
> +    test_python_pyside6_qtopenglwidgets()
> +    test_python_pyside6_qtquickcontrols()
> +    test_python_pyside6_qtquickwidgets()
> +    test_python_pyside6_qtserialport()
> +    test_python_pyside6_qtsvg()
> +    test_python_pyside6_qtsvgwidgets()
> diff --git a/support/testing/tests/package/test_python_pyside6.py b/support/testing/tests/package/test_python_pyside6.py
> new file mode 100644
> index 0000000000..a5a4872182
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pyside6.py
> @@ -0,0 +1,60 @@
> +import os
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3PySide6(TestPythonPackageBase):
> +    __test__ = True
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.72"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_PACKAGE_MESA3D=y
> +        BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
> +        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> +        BR2_PACKAGE_MESA3D_OPENGL_ES=y
> +        BR2_PACKAGE_QT6=y
> +        BR2_PACKAGE_QT6BASE_GUI=y
> +        BR2_PACKAGE_QT6BASE_WIDGETS=y
> +        BR2_PACKAGE_QT6BASE_PRINTSUPPORT=y
> +        BR2_PACKAGE_QT6BASE_SQL=y
> +        BR2_PACKAGE_QT6BASE_SQLITE=y
> +        BR2_PACKAGE_QT6BASE_NETWORK=y
> +        BR2_PACKAGE_QT6BASE_TEST=y
> +        BR2_PACKAGE_QT6BASE_CONCURRENT=y
> +        BR2_PACKAGE_QT6BASE_DBUS=y
> +        BR2_PACKAGE_QT6BASE_XML=y
> +        BR2_PACKAGE_QT6BASE_OPENGL=y
> +        BR2_PACKAGE_QT6DECLARATIVE=y
> +        BR2_PACKAGE_QT6DECLARATIVE_QUICK=y
> +        BR2_PACKAGE_QT6SERIALPORT=y
> +        BR2_PACKAGE_QT6SERIALBUS=y
> +        BR2_PACKAGE_QT6SVG=y
> +        BR2_PACKAGE_QT6BASE_DEFAULT_QPA="offscreen"
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PYSIDE6=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    sample_scripts = ["tests/package/sample_python_pyside6.py"]
> +    timeout = 30
> +
> +    def login(self):
> +        drive = os.path.join(self.builddir, "images", "rootfs.ext2")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
> +                           options=["-M", "virt",
> +                                    "-cpu", "cortex-a57",
> +                                    "-m", "512M",
> +                                    "-smp", "2",
> +                                    "-drive", f"file={drive},if=virtio,format=raw"])
> +        self.emulator.login()
> -- 2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
