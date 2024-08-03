Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7C3C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 21:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F29260622;
	Sat,  3 Aug 2024 21:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_1j4JnMjewn; Sat,  3 Aug 2024 21:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63366605D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63366605D8;
	Sat,  3 Aug 2024 21:55:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 289271BF3E3
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13A31804E6
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 21:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xE6FfhZzdrBN for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 21:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DC2980C50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC2980C50
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DC2980C50
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 21:55:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6CD2E0002;
 Sat,  3 Aug 2024 21:55:24 +0000 (UTC)
Date: Sat, 3 Aug 2024 23:55:23 +0200
To: Dylan Bespalko <dylan.bespalko@gmail.com>
Message-ID: <20240803235523.0fbdba05@windsurf>
In-Reply-To: <20240726192904.234263-1-dylan.bespalko@gmail.com>
References: <20240726192904.234263-1-dylan.bespalko@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722722125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PpRtE/Es9GltEUB81c2M3QMztPLJaPEfYqd9/pd3dY8=;
 b=IllvFgc3d92XOEyHTrVQalS8ijl5e6MjW7hHAXSy3vyb4xmPIVwXfdtgNQG3Zg9aEunWMc
 gjys4uNlpOm0JeAYXwtIPH+OpgYFH9irhKNUj5nI0IoNN9Rk3iGu2VaJyojq4qatxhUFwO
 PKiLpfZ/OQwsyLFPggMSHt1jpIbsLu0G7wvGLYQ+FSvk0/vXUs0Ixf0q510LPo1iBQSV8n
 zjPCJRaHBNVmxMKRuV6Pm31q3Bi7ZD1ie0IrMVbD+UPem6QZMgO+XwXjK08hr+51T+hhKN
 jMDVRaqR1EZ0rW/fCxyP0HWjIBWp0p7F1B+5SrbPbxR9A29Ltfg8X0iGmMi+ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IllvFgc3
Subject: Re: [Buildroot] [PATCH v2 1/1] added python-pyside6 recipe
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dylan,

Thanks for your contribution! You are tackling some really difficult
packaging topic for what seems to be your very first Buildroot
contribution!

See below some comments/questions.

First very minor thing: commit message should be:

	package/python-{shiboken6,pyside6}: new packages

On Fri, 26 Jul 2024 12:29:03 -0700
Dylan Bespalko <dylan.bespalko@gmail.com> wrote:

> The Shiboken6 C++/Python binding generator and the PySide6
> binding of the Qt6 C++ project is added. All PySide6 modules
> are supported except:
>   - PySide6.QtUITools is blocked by a build error in QtUITools
>   - PySide.QtOpenGLWidgets runs, but cannot be tested in QEMU.
>   - PySide6.QtQuickTest runs, but never passes any tests. 

You don't have to support everything: if there's something that you
don't use/haven't been able to get to work or test, just disable it,
and leave it up to whoever comes next and needs it.

> 1. Since Shiboken6 and PySide6 are in the same git repo, I needed
> to re-implement the *_CONFIGURE_CMDS to navigate to a sub-directory
> in the git repo. Two separate buildroot package recipes were needed
> because:
>   a) host-python-shiboken6 is needed, but not host-python-pyside6.
>   b) PyQt also separates python-sip from python-pyqt.

I was surprised to see that actually PySide and Shiboken are available
as standalone Git repositories:

  https://code.qt.io/cgit/pyside/pyside.git/
  https://code.qt.io/cgit/pyside/shiboken.git/

but I guess these are the older (Qt 5) versions?

Regarding the re-implementation of the CMake configure command, have
you tried using <pkg>_SUBDIR ? Indeed if you set:

PYTHON_PYSIDE6_SUBDIR = sources/pyside6

then the cmake-package infra CONFIGURE_CMDS will use the CMakeLists.txt
in $(@D)/sources/pyside6/, which should give you want you want, and
would avoid duplicating the configure commands.

> 2. Although PySide6 is a python-package, the Qt Company recommends
> using the cmake-package build-system for package managers.

I was a bit confused by this
because https://code.qt.io/cgit/pyside/pyside-setup.git/tree/README.md#n196 says:

"""
Nevertheless the default build process is done via setup.py, in which case each
of the sub-projects are built and installed separately, as mentioned, the super
project is just for development convenience.
"""

But indeed, https://doc.qt.io/qtforpython-6/gettingstarted/linux.html
says "The setuptools approach includes internal CMake calls when
building and installing the project, but a CMake-only approach is only
recommended for packaging the project for distribution builds."

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9a8c92f122..b9685b620b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -881,6 +881,10 @@ F:	package/unscd/
>  N:	Dushara Jayasinghe <nidujay@gmail.com>
>  F:	package/prosody/
>  
> +N:      Dylan Bespalko <dylan.bespalko@gmail.com>
> +F:      package/python-shiboken6/
> +F:      package/python-pyside6/

Please use one tab for indentation.


> diff --git a/package/python-pyside6/Config.in b/package/python-pyside6/Config.in
> new file mode 100644
> index 0000000000..b999cadbbb
> --- /dev/null
> +++ b/package/python-pyside6/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_PYTHON_PYSIDE6
> +	bool "python-pyside6"
> +	depends on BR2_PACKAGE_QT6
> +	depends on BR2_PACKAGE_QT6BASE_GUI

So we can't use pyside6 for a headless system, for which QtGui is not
used/needed?

If yes, then please select BR2_PACKAGE_QT6BASE_GUI, do not use a
depends on.


> diff --git a/package/python-pyside6/python-pyside6.mk b/package/python-pyside6/python-pyside6.mk
> new file mode 100644
> index 0000000000..9db8aad384
> --- /dev/null
> +++ b/package/python-pyside6/python-pyside6.mk
> @@ -0,0 +1,123 @@
> +################################################################################
> +#
> +# python-pyside6
> +#
> +################################################################################
> +
> +PYTHON_PYSIDE6_VERSION = v6.7.2
> +PYTHON_PYSIDE6_SITE = https://code.qt.io/pyside/pyside-setup.git
> +PYTHON_PYSIDE6_SITE_METHOD = git
> +PYTHON_PYSIDE6_CPE_ID_VENDOR = qt
> +PYTHON_PYSIDE6_CPE_ID_PRODUCT = pyside6

Do you have some evidence that does CPE identifiers are correct?

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
> +#ifeq ($(BR2_PACKAGE_QT6TOOLS),y)  # Failed to find the host tool "Qt6::lconvert".  It is part of the Qt6LinguistTools package
> +#PYTHON_PYSIDE6_DEPENDENCIES += qt6tools
> +#PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES += UiTools
> +#endif

Please don't include commented code. Maybe mention which modules are
not enabled, and why.

> +PYTHON_PYSIDE6_ALL_MODULES = $(subst $(space),\;,$(PYTHON_PYSIDE6_ALL_ESSENTIAL_MODULES) $(PYTHON_PYSIDE6_ALL_OPTIONAL_MODULES))

A comment above this would be useful, because I don't quite understand
the difference between "essential modules" and "optional modules", they
end up being all grouped together in this variable.

> +PYTHON_PYSIDE6_CONF_ENV = \
> +	LLVM_INSTALL_DIR=$(HOST_DIR)
> +
> +#Add option -DMODULES=Core\;Gui\;Widgets for minimum build

I don't understand this comment. Could you clarify?

> +PYTHON_PYSIDE6_CONF_CXXFLAGS = $(subst $(space),$(comma),$(TARGET_CXXFLAGS))

This variable is apparently not used anywhere.

> +PYTHON_PYSIDE6_CONF_OPTS = \
> +	-DMODULES=$(PYTHON_PYSIDE6_ALL_MODULES) \
> +	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
> +	-DSTANDALONE=ON \
> +	-DPYSIDE_TREAT_QT_INCLUDE_DIRS_AS_NON_SYSTEM=ON \
> +	-DSHIBOKEN_GENERATOR_EXTRA_FLAGS='\
> +		--compiler-path=$(HOST_DIR)/bin/clang'
> +
> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
> +# 2. sed -i s/\$\$(PKG)/PYTHON_PYSIDE6/g
> +# 3. sed -i s/\$\$/\$/g
> +# 4. append $(PYTHON_PYSIDE6_SRCDIR) with sources/shiboken6
> +define PYTHON_PYSIDE6_CONFIGURE_CMDS

As explained above this can probably be avoided by using
PYTHON_PYSIDE6_SUBDIR = sources/pyside6.


> diff --git a/package/python-shiboken6/Config.in b/package/python-shiboken6/Config.in
> new file mode 100644
> index 0000000000..1e42f0edcc
> --- /dev/null
> +++ b/package/python-shiboken6/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_PYTHON_SHIBOKEN6
> +	bool "python-shiboken6"
> +	depends on BR2_PACKAGE_QT6
> +	depends on BR2_PACKAGE_QT6BASE_GUI

Please select this option, if it's actually really needed.

> +	depends on BR2_PACKAGE_QT6_GL_SUPPORTS  # Requirement of PySide6.QtWidgets, but not QtWidgets
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
> +	select BR2_PACKAGE_HOST_PYTHON_NUMPY
> +	select BR2_PACKAGE_HOST_PYTHON_SHIBOKEN6
> +	select BR2_PACKAGE_PYTHON3_ZLIB
> +	select BR2_PACKAGE_PYTHON_NUMPY

I am still confused by what Shiboken does compared to PySide, and why
we need both a target variant of Shiboken and a host variant... and why
numpy is needed for the target.


> +################################################################################
> +#
> +# python-shiboken6
> +#
> +################################################################################
> +
> +PYTHON_SHIBOKEN6_VERSION = v6.7.2

Could you add a comment above this _VERSION field here, and for the
pyside6 package to indicate that they should be updated in sync?

> +PYTHON_SHIBOKEN6_SITE = https://code.qt.io/pyside/pyside-setup.git
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
> +	host-python-numpy \
> +	host-python-shiboken6 \
> +	qt6base \
> +	python3 \
> +	python-numpy

It must take a *huge* time to build all those dependencies: Perl,
Python, LLVM, etc...

> +HOST_PYTHON_SHIBOKEN6_DEPENDENCIES = \
> +	host-libxslt \
> +	host-clang \
> +	host-cmake \
> +	host-perl \
> +	host-qt6base \
> +	host-python3 \
> +	host-python-numpy
> +
> +PYTHON_SHIBOKEN6_CONF_OPTS = \
> +	-DQFP_SHIBOKEN_HOST_PATH=$(HOST_DIR) \
> +	-DQFP_PYTHON_HOST_PATH=$(HOST_DIR)/bin/python3
> +
> +HOST_PYTHON_SHIBOKEN6_CONF_OPTS =

Empty, so not needed.

> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
> +# 2. sed -i s/\$\$(PKG)/PYTHON_SHIBOKEN6/g
> +# 3. sed -i s/\$\$/\$/g
> +# 4. append $(PYTHON_SHIBOKEN6_SRCDIR) with sources/shiboken6
> +define PYTHON_SHIBOKEN6_CONFIGURE_CMDS

Use SUBDIR if possible.

> +# 1. copy $(2)_CONIFIGURE_CMDS from packages/pkg-cmake.mk
> +# 2. sed -i s/\$\$(PKG)/HOST_PYTHON_SHIBOKEN6/g
> +# 3. sed -i s/\$\$/\$/g
> +# 4. append $(HOST_PYTHON_SHIBOKEN6_SRCDIR) with sources/shiboken6
> +define HOST_PYTHON_SHIBOKEN6_CONFIGURE_CMDS

Likewise.

> diff --git a/support/testing/tests/package/sample_python_pyside6.py b/support/testing/tests/package/sample_python_pyside6.py
> new file mode 100644
> index 0000000000..079cece9d5
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_pyside6.py

Super, super great idea to have a test case! Please make sure to add
entry in the DEVELOPERS file also for the files added in
support/testing!


> +def test_python_pyside6_qtquicktest():
> +    from PySide6 import QtQuickTest
> +    QtQuickTest.QUICK_TEST_MAIN('/usr/lib/qt6/qml/QtTest/TestCase.qml')
> +    # The directory '/root' does not contain any test files matching 'tst_*.qml'
> +    # 1
> +    # todo: The tests run, but don't pass. I have no experience with this module.

So what happens? You don't check the results?

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
> +    from PySide6 import QtSerialPort
> +    ser = QtSerialPort.QSerialPort()
> +    ser.setPortName('/dev/ttyUSB0')
> +    assert(ser.portName() == 'ttyUSB0')

Will it work even if ttyUSB0 doesn't exist?

Thanks a lot for this first submission, it already looks really, really
good! Could you reply to the questions above, and work on a v2
addressing the comments?

Thanks again!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
