From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:59:55 +0100
Subject: [Buildroot] [git commit] manual: add legal-info.txt
Message-ID: <20121115230542.BD1D999E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=757eb1910e4a66d57c876f6d19fed45e8283a414
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-generic.txt |   58 +++++++-------
 docs/manual/legal-notice.txt            |  136 +++++++++++++++++++++++++++++++
 docs/manual/manual.txt                  |    2 +
 docs/manual/using.txt                   |  130 -----------------------------
 4 files changed, 168 insertions(+), 158 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index e3f16c2..b05043a 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -22,33 +22,35 @@ system is based on hand-written Makefiles or shell scripts.
 06: LIBFOO_VERSION = 1.0
 07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
 08: LIBFOO_SITE = http://www.foosoftware.org/download
-09: LIBFOO_INSTALL_STAGING = YES
-10: LIBFOO_DEPENDENCIES = host-libaaa libbbb
-11:
-12: define LIBFOO_BUILD_CMDS
-13: 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
-14: endef
-15:
-16: define LIBFOO_INSTALL_STAGING_CMDS
-17: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
-18: 	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
-19: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
-20: endef
-21:
-22: define LIBFOO_INSTALL_TARGET_CMDS
-23: 	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
-24: 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
-25: endef
-26:
-27: define LIBFOO_DEVICES
-28: 	/dev/foo  c  666  0  0  42  0  -  -  -
-29: endef
-30:
-31: define LIBFOO_PERMISSIONS
-32: 	/bin/foo  f  4755  0  0  -  -  -  -  -
-33: endef
-34:
-35: $(eval $(generic-package))
+09: LIBFOO_LICENSE = GPLv3+
+10: LIBFOO_LICENSE_FILES = COPYING
+11: LIBFOO_INSTALL_STAGING = YES
+12: LIBFOO_DEPENDENCIES = host-libaaa libbbb
+13:
+14: define LIBFOO_BUILD_CMDS
+15:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+16: endef
+17:
+18: define LIBFOO_INSTALL_STAGING_CMDS
+19:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
+20:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
+21:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
+22: endef
+23:
+24: define LIBFOO_INSTALL_TARGET_CMDS
+25:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
+26:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
+27: endef
+28:
+29: define LIBFOO_DEVICES
+30:	/dev/foo  c  666  0  0	42  0  -  -  -
+31: endef
+32:
+33: define LIBFOO_PERMISSIONS
+34:	/bin/foo  f  4755  0  0	 -  -  -  -  -
+35: endef
+36:
+37: $(eval $(generic-package))
 --------------------------------
 
 The Makefile begins on line 6 to 8 with metadata information: the
@@ -245,7 +247,7 @@ information is (assuming the package name is +libfoo+) :
 * +LIBFOO_LICENSE+ defines the license (or licenses) under which the package
   is released.
   This name will appear in the manifest file produced by +make legal-info+.
-  If the license is one of those listed in xref:legal-info[],
+  If the license appears in xref:legal-info-list-licenses[the following list],
   use the same string to make the manifest file uniform.
   Otherwise, describe the license in a precise and concise way, avoiding
   ambiguous names such as +BSD+ which actually name a family of licenses.
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
new file mode 100644
index 0000000..22e5769
--- /dev/null
+++ b/docs/manual/legal-notice.txt
@@ -0,0 +1,136 @@
+// -*- mode:doc; -*-
+
+[[legal-info]]
+
+Legal notice and licensing
+==========================
+
+Complying with opensource licenses
+----------------------------------
+
+All of the end products of Buildroot (toolchain, root filesystem, kernel,
+bootloaders) contain opensource software, released under various licenses.
+
+Using opensource software gives you the freedom to build rich embedded
+systems choosing from a wide range of packages, but also gives some
+obligations that you must know and honour.
+Some licenses require you to publish the license text in the documentation of
+your product. Other require you to redistribute the source code of the
+software to those that receive your product.
+
+The exact requirements of each license is documented in each package, and it is
+your (or your legal office's) responsibility to comply with these requirements.
+To make this easier for you, Buildroot can collect for you some material you
+will probably need. To produce this material, after you configured Buildroot
+with +make menuconfig+, +make xconfig+ or +make gconfig+, run:
+
+--------------------
+make legal-info
+--------------------
+
+Buildroot will collect legally-relevant material in your output directory,
+under the +legal-info/+ subdirectory.
+There you will find:
+
+* A +README+ file, that summarizes the produced material and contains warnings
+  about material that Buildroot could not produce.
+* +buildroot.config+: this is the Buildroot configuration file that is usually
+  produced with +make menuconfig+, and which is necessary to reproduce the
+  build.
+* The source code for all packages; this is saved in the +sources/+
+  subdirectory (except for proprietary packages, whose source code is not
+  saved);
+  patches applied to some packages by Buildroot are distributed with the
+  Buildroot sources and are not duplicated in the +sources/+ subdirectory.
+* A manifest file listing the configured packages, their version, license and
+  related information.
+  Some of these information might be not defined in Buildroot; in this case
+  they are clearly marked as "unknown" or similar.
+* A +licenses/+ subdirectory, which contains the license text of packages.
+  If the license file(s) are not defined in Buildroot, the file is not produced
+  and a warning in the +README+ indicates this.
+
+Please note that the aim of the +legal-info+ feature of Buildroot is to
+produce all the material that is somehow relevant for legal compliance with the
+package licenses. Buildroot does not try to produce the exact material that
+you must somehow make public. It does surely produce some more material than is
+needed for a strict legal compliance. For example, it produces the source code
+for packages released under BSD-like licenses, that you might not want to
+redistribute in source form.
+
+Moreover, due to technical limitations, Buildroot does not produce some
+material that you will or may need, such as the toolchain source code and the
+Buildroot source code itself.
+When you run +make legal-info+, Buildroot produces warnings in the +README+
+file to inform you of relevant material that could not be saved.
+
+[[legal-info-list-licenses]]
+Here is a list of the licenses that are most widely used by packages in
+Buildroot, with the name used in the manifest file:
+
+* +GPLv2+:
+  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
+  GNU General Public License, version 2];
+* +GPLv2++:
+  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
+  GNU General Public License, version 2]
+  or (at your option) any later version;
+* +GPLv3+:
+  http://www.gnu.org/licenses/gpl.html[
+  GNU General Public License, version 3];
+* +GPLv3++:
+  http://www.gnu.org/licenses/gpl.html[
+  GNU General Public License, version 3]
+  or (at your option) any later version;
+* +GPL+:
+  http://www.gnu.org/licenses/gpl.html[
+  GNU General Public License] (any version);
+* +LGPLv2.1+:
+  http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
+  GNU Lesser General Public License, version 2.1];
+* +LGPLv2.1++:
+  http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
+  GNU Lesser General Public License, version 2.1]
+  or (at your option) any later version;
+* +LGPLv3+:
+  http://www.gnu.org/licenses/lgpl.html[
+  GNU Lesser General Public License, version 3];
+* +LGPLv3++:
+  http://www.gnu.org/licenses/lgpl.html[
+  GNU Lesser General Public License, version 3]
+  or (at your option) any later version;
+* +LGPL+:
+  http://www.gnu.org/licenses/lgpl.html[
+  GNU Lesser General Public License] (any version);
+* +BSD-4c+: Original BSD 4-clause license;
+* +BSD-3c+: BSD 3-clause license;
+* +BSD-2c+: BSD 2-clause license;
+* +PROPRIETARY+: marks a non-opensource package;
+  Buildroot does not save any licensing info or source code for these packages.
+
+Complying with the Buildroot license
+------------------------------------
+
+Buildroot itself is an opensource software, released under the
+http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
+License, version 2] or (at your option) any later version.
+However, being a build system, it is not normally part of the end product:
+if you develop the root filesystem, kernel, bootloader or toolchain for a
+device, the code of Buildroot is only present on the development machine, not
+in the device storage.
+
+Nevertheless, the general view of the Buildroot developers is that you should
+release the Buildroot source code along with the source code of other packages
+when releasing a product that contains GPL-licensed software.
+This is because the
+http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU GPL]
+defines the "'complete source code'" for an executable work as "'all the
+source code for all modules it contains, plus any associated interface
+definition files, plus the scripts used to control compilation and installation
+of the executable'".
+Buildroot is part of the 'scripts used to control compilation and
+installation of the executable', and as such it is considered part of the
+material that must be redistributed.
+
+Keep in mind this is only the Buildroot developers' opinion, and you should
+consult your legal department or lawyer in case of any doubt.
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 4032a6b..a1ee68a 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -23,6 +23,8 @@ include::going-further.txt[]
 
 include::developer-guide.txt[]
 
+include::legal-notice.txt[]
+
 include::get-involved.txt[]
 
 include::contribute.txt[]
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 56ed23b..e8136f8 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -110,133 +110,3 @@ your needs, with all the supports and applications you enabled.
 
 More details about the "make" command usage are given in
 xref:make-tips[].
-
-Complying with opensource licenses
-----------------------------------
-[[legal-info]]
-
-All of the end products of Buildroot (toolchain, root filesystem, kernel,
-bootloaders) contain opensource software, released under various licenses.
-
-Using opensource software gives you the freedom to build rich embedded
-systems choosing from a wide range of packages, but also gives some
-obligations that you must know and honour.
-Some licenses require you to publish the license text in the documentation of
-your product. Other require you to redistribute the source code of the
-software to those that receive your product.
-
-The exact requirements of each license is documented in each package, and it is
-your (or your legal office's) responsibility to comply with these requirements.
-To make this easier for you, Buildroot can collect for you some material you
-will probably need. To produce this material, after you configured Buildroot
-with +make menuconfig+, +make xconfig+ or +make gconfig+, run:
-
---------------------
-make legal-info
---------------------
-
-Buildroot will collect legally-relevant material in your output directory,
-under the +legal-info/+ subdirectory.
-There you will find:
-
-* A +README+ file, that summarizes the produced material and contains warnings
-  about material that Buildroot could not produce.
-* +buildroot.config+: this is the Buildroot configuration file that is usually
-  produced with +make menuconfig+, and which is necessary to reproduce the
-  build.
-* The source code for all packages; this is saved in the +sources/+
-  subdirectory (except for proprietary packages, whose source code is not
-  saved);
-  patches applied to some packages by Buildroot are distributed with the
-  Buildroot sources and are not duplicated in the +sources/+ subdirectory.
-* A manifest file listing the configured packages, their version, license and
-  related information.
-  Some of these information might be not defined in Buildroot; in this case
-  they are clearly marked as "unknown" or similar.
-* A +licenses/+ subdirectory, which contains the license text of packages.
-  If the license file(s) are not defined in Buildroot, the file is not produced
-  and a warning in the +README+ indicates this.
-
-Please note that the aim of the +legal-info+ feature of Buildroot is to
-produce all the material that is somehow relevant for legal compliance with the
-package licenses. Buildroot does not try to produce the exact material that
-you must somehow make public. It does surely produce some more material than is
-needed for a strict legal compliance. For example, it produces the source code
-for packages released under BSD-like licenses, that you might not want to
-redistribute in source form.
-
-Moreover, due to technical limitations, Buildroot does not produce some
-material that you will or may need, such as the toolchain source code and the
-Buildroot source code itself.
-When you run +make legal-info+, Buildroot produces warnings in the +README+
-file to inform you of relevant material that could not be saved.
-
-Here is a list of the licenses that are most widely used by packages in
-Buildroot, with the name used in the manifest file:
-
-* +GPLv2+:
-  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
-  GNU General Public License, version 2];
-* +GPLv2++:
-  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
-  GNU General Public License, version 2]
-  or (at your option) any later version;
-* +GPLv3+:
-  http://www.gnu.org/licenses/gpl.html[
-  GNU General Public License, version 3];
-* +GPLv3++:
-  http://www.gnu.org/licenses/gpl.html[
-  GNU General Public License, version 3]
-  or (at your option) any later version;
-* +GPL+:
-  http://www.gnu.org/licenses/gpl.html[
-  GNU General Public License] (any version);
-* +LGPLv2.1+:
-  http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
-  GNU Lesser General Public License, version 2.1];
-* +LGPLv2.1++:
-  http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
-  GNU Lesser General Public License, version 2.1]
-  or (at your option) any later version;
-* +LGPLv3+:
-  http://www.gnu.org/licenses/lgpl.html[
-  GNU Lesser General Public License, version 3];
-* +LGPLv3++:
-  http://www.gnu.org/licenses/lgpl.html[
-  GNU Lesser General Public License, version 3]
-  or (at your option) any later version;
-* +LGPL+:
-  http://www.gnu.org/licenses/lgpl.html[
-  GNU Lesser General Public License] (any version);
-* +BSD-4c+: Original BSD 4-clause license;
-* +BSD-3c+: BSD 3-clause license;
-* +BSD-2c+: BSD 2-clause license;
-* +PROPRIETARY+: marks a non-opensource package;
-  Buildroot does not save any licensing info or source code for these packages.
-
-Complying with the Buildroot license
-------------------------------------
-
-Buildroot itself is an opensource software, released under the
-http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
-License, version 2] or (at your option) any later version.
-However, being a build system, it is not normally part of the end product:
-if you develop the root filesystem, kernel, bootloader or toolchain for a
-device, the code of Buildroot is only present on the development machine, not
-in the device storage.
-
-Nevertheless, the general view of the Buildroot developers is that you should
-release the Buildroot source code along with the source code of other packages
-when releasing a product that contains GPL-licensed software.
-This is because the
-http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU GPL]
-defines the "'complete source code'" for an executable work as "'all the
-source code for all modules it contains, plus any associated interface
-definition files, plus the scripts used to control compilation and installation
-of the executable'".
-Buildroot is part of the 'scripts used to control compilation and
-installation of the executable', and as such it is considered part of the
-material that must be redistributed.
-
-Keep in mind this is only the Buildroot developers' opinion, and you should
-consult your legal department or lawyer in case of any doubt.
