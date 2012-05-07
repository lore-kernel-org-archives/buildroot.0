From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:12:29 +0200
Subject: [Buildroot] [PATCH v3 08/22] manual: document usage of the
	legal-info feature
In-Reply-To: <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336421563-5986-8-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/adding-packages-gentargets.txt |   18 +++++
 docs/manual/using.txt                      |  100 ++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index cfcee8c..85723b2 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -218,6 +218,24 @@ information is (assuming the package name is +libfoo+) :
   You can find some documentation for this syntax in the xref:makedev-syntax[].
   This variable is optional.
 
+* +LIBFOO_LICENSE+ defines the license (or licenses) under which the package
+  is released.
+  This name will appear in the manifest file produced by +make legal-info+.
+  If the license is one of those listed in xref:legal-info[],
+  use the same string to make the manifest file uniform.
+  Otherwise, describe the license in a precise and concise way, avoiding
+  ambiguous names such as +BSD+ which actually name a family of licenses.
+  This variable is optional. If it is not defined, +unknown+ will appear in
+  the +license+ field of the manifest file for this package.
+
+* +LIBFOO_LICENSE_FILES+ is a space-separated list of files in the package
+  tarball that contain the license(s) under which the package is released.
+  +make legal-info+ copies all of these files in the +legal-info+ directory.
+  See xref:legal-info[] for more information.
+  This variable is optional. If it is not defined, a warning will be produced
+  to let you know, and +not saved+ will appear in the +license files+ field
+  of the manifest file for this package.
+
 The recommended way to define these variables is to use the following
 syntax:
 
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index a5dc9e1..09f4136 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -181,3 +181,103 @@ or +g+++ for building helper-binaries on your host, then do
 --------------------
  $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 --------------------
+
+Complying with opensource licenses
+----------------------------------
+[[legal-info]]
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
+will probably need. To produce this material, run:
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
+* +BSD-2c+: BSD 2-clause license.
-- 
1.7.5.4
