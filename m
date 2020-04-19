From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:17:24 +0200
Subject: [Buildroot] [git commit] package/python-pyalsa: new package
Message-ID: <20200419200313.5EACF8F27E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e87bb62613c633d7e4d63511efdc715d9bb9d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Official ALSA Python binding, including hardware management, mixer and
sequencer control.

http://www.alsa-project.org/

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-pyalsa/Config.in          | 16 ++++++++++++++++
 package/python-pyalsa/python-pyalsa.hash |  2 ++
 package/python-pyalsa/python-pyalsa.mk   | 14 ++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cf530c3dec..0360dbc769 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1447,6 +1447,7 @@ F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/ptm2human/
+F:	package/python-pyalsa/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index afa54f739e..9ae9e0bb65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1066,6 +1066,7 @@ menu "External python modules"
 	source "package/python-pudb/Config.in"
 	source "package/python-py/Config.in"
 	source "package/python-pyaes/Config.in"
+	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
diff --git a/package/python-pyalsa/Config.in b/package/python-pyalsa/Config.in
new file mode 100644
index 0000000000..e91c99b409
--- /dev/null
+++ b/package/python-pyalsa/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_PYALSA
+	bool "python-pyalsa"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_HWDEP
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	select BR2_PACKAGE_ALSA_LIB_SEQ
+	help
+	  Official ALSA Python binding, including hardware
+	  management, mixer and sequencer control.
+
+	  http://www.alsa-project.org/
+
+comment "python-pyalsa needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
new file mode 100644
index 0000000000..c484313b96
--- /dev/null
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2771291a5d2cf700f0abbe6629ea37468d1463a01b2330d84ef976e1e918676c  pyalsa-1.1.6.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
new file mode 100644
index 0000000000..74f0347d86
--- /dev/null
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyalsa
+#
+################################################################################
+
+PYTHON_PYALSA_VERSION = 1.1.6
+PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
+PYTHON_PYALSA_SITE = ftp://ftp.alsa-project.org/pub/pyalsa
+PYTHON_PYALSA_SETUP_TYPE = distutils
+PYTHON_PYALSA_LICENSE = LGPL-2.1+
+PYTHON_PYALSA_DEPENDENCIES = alsa-lib
+
+$(eval $(python-package))
