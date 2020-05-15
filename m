From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 May 2020 22:59:21 +0200
Subject: [Buildroot] [git commit] boot/uboot: support building U-Boot with
 Python 3.x
Message-ID: <20200515204314.29EF69194F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df3d1f81770060cca452d3419e214e701ac24bc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot versions newer than 2020.01 use Python 3.x instead of Python
2.x in various scripts.

We already had the BR2_TARGET_UBOOT_NEEDS_PYLIBFDT and
BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS options, but depending on the U-Boot
version, we now need to indicate if Python 2.x or Python 3.x should be
used.

In addition, it turns out that some U-Boot configurations need a
Python interpreter, without needing pylibfdt or pyelftools. Some of
our defconfigs were abusing the BR2_TARGET_UBOOT_NEEDS_PYLIBFDT option
to make sure a Python interpreter was built.

To solve this issue, we introduce a choice, that let the users specify
what, if any, host python version is needed. The default is 'no', to
preserve the previous behaviour, unless any of the pylibfdt or the
pyelftools options is enabled, in which case we hide the 'no' option,
and use python 2 by default. This dfault is guaranteed by the order of
options in the choice.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - explicitly make the choice a bool
  - make BR2_TARGET_UBOOT_NEEDS_PYTHON a blind option
  - introduce the 'no' option in the choice
  - reword the commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in | 31 +++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  | 12 +++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7a6f5053fd..0414a216bd 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -147,14 +147,45 @@ config BR2_TARGET_UBOOT_NEEDS_DTC
 	  Select this option if your U-Boot board configuration
 	  requires the Device Tree compiler to be available.
 
+config BR2_TARGET_UBOOT_NEEDS_PYTHON
+	bool
+
+choice
+	bool "U-Boot needs host Python"
+
+config BR2_TARGET_UBOOT_NEEDS_PYTHON_NONE
+	bool "no"
+	depends on !BR2_TARGET_UBOOT_NEEDS_PYTHON
+	help
+	  Select this option if U-Boot does not need any
+	  host python to build.
+
+config BR2_TARGET_UBOOT_NEEDS_PYTHON2
+	bool "python 2.x"
+	help
+	  Select this option if U-Boot needs a host Python 2.x
+	  interpreter. This is the case for some U-Boot
+	  configurations, prior to U-Boot 2020.01.
+
+config BR2_TARGET_UBOOT_NEEDS_PYTHON3
+	bool "python 3.x"
+	help
+	  Select this option if U-Boot needs a host Python 3.x
+	  interpreter. This is the case for some U-Boot
+	  configurations, after U-Boot 2020.01.
+
+endchoice
+
 config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
 	bool "U-Boot needs pylibfdt"
+	select BR2_TARGET_UBOOT_NEEDS_PYTHON
 	help
 	  Select this option if your U-Boot board configuration
 	  requires the Python libfdt library to be available.
 
 config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
 	bool "U-Boot needs pyelftools"
+	select BR2_TARGET_UBOOT_NEEDS_PYTHON
 	help
 	  Select this option if your U-Boot board configuration
 	  requires the Python pyelftools library to be available.
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7bd9cbae52..1d50e72846 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -159,12 +159,22 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
+UBOOT_DEPENDENCIES += host-python
+else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
+UBOOT_DEPENDENCIES += host-python3
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
-UBOOT_DEPENDENCIES += host-python host-swig
+UBOOT_DEPENDENCIES += host-swig
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS),y)
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
 UBOOT_DEPENDENCIES += host-python-pyelftools
+else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
+UBOOT_DEPENDENCIES += host-python3-pyelftools
+endif
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSSL),y)
