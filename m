From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 May 2014 23:37:55 +0200
Subject: [Buildroot] [git commit] pkg-stats: add luarocks perl python
	virtual infrastructures
Message-ID: <20140515214016.EFEB49CBBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9463d24d47aea364ecc1c1ccb1aaf626d6e03c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Recognize the recently added infrastructures: luarocks, perl, python,
virtual.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats |   71 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 71 insertions(+), 0 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4effa59..fd60d7d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -72,6 +72,10 @@ td.lotsofpatches {
 
 autotools_packages=0
 cmake_packages=0
+luarocks_package=0
+perl_packages=0
+python_packages=0
+virtual_packages=0
 generic_packages=0
 manual_packages=0
 packages_with_licence=0
@@ -99,6 +103,10 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/x11r7/x11r7.mk" -o \
  	$i = "package/pkg-autotools.mk" -o \
  	$i = "package/pkg-cmake.mk" -o \
+	$i = "package/pkg-luarocks.mk" -o \
+	$i = "package/pkg-perl.mk" -o \
+	$i = "package/pkg-python.mk" -o \
+	$i = "package/pkg-virtual.mk" -o \
 	$i = "package/pkg-download.mk" -o \
  	$i = "package/pkg-generic.mk" -o \
  	$i = "package/pkg-utils.mk" ; then
@@ -123,6 +131,45 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	hastarget=1
     fi
 
+    if grep -E "\(host-luarocks-package\)" $i > /dev/null ; then
+	infratype="luarocks"
+	hashost=1
+    fi
+
+    if grep -E "\(luarocks-package\)" $i > /dev/null ; then
+	infratype="luarocks"
+	hastarget=1
+    fi
+
+    if grep -E "\(host-perl-package\)" $i > /dev/null ; then
+	infratype="perl"
+	hashost=1
+    fi
+
+    if grep -E "\(perl-package\)" $i > /dev/null ; then
+	infratype="perl"
+	hastarget=1
+    fi
+
+    if grep -E "\(host-python-package\)" $i > /dev/null ; then
+	infratype="python"
+	hashost=1
+    fi
+
+    if grep -E "\(python-package\)" $i > /dev/null ; then
+	infratype="python"
+	hastarget=1
+    fi
+    if grep -E "\(host-virtual-package\)" $i > /dev/null ; then
+	infratype="virtual"
+	hashost=1
+    fi
+
+    if grep -E "\(virtual-package\)" $i > /dev/null ; then
+	infratype="virtual"
+	hastarget=1
+    fi
+
     if grep -E "\(host-generic-package\)" $i > /dev/null ; then
 	infratype="generic"
 	hashost=1
@@ -156,6 +203,14 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	autotools_packages=$(($autotools_packages+1))
     elif [ ${infratype} = "cmake" ]; then
 	cmake_packages=$(($cmake_packages+1))
+    elif [ ${infratype} = "luarocks" ]; then
+	luarocks_packages=$(($luarocks_packages+1))
+    elif [ ${infratype} = "perl" ]; then
+	perl_packages=$(($perl_packages+1))
+    elif [ ${infratype} = "python" ]; then
+	python_packages=$(($python_packages+1))
+    elif [ ${infratype} = "virtual" ]; then
+	virtual_packages=$(($virtual_packages+1))
     elif [ ${infratype} = "generic" ]; then
 	generic_packages=$(($generic_packages+1))
     fi
@@ -244,6 +299,22 @@ echo "<td>Packages using the <i>autotools</i> infrastructure</td>"
 echo "<td>$autotools_packages</td>"
 echo "</tr>"
 echo "<tr>"
+echo "<td>Packages using the <i>luarocks</i> infrastructure</td>"
+echo "<td>$luarocks_packages</td>"
+echo "</tr>"
+echo "<tr>"
+echo "<td>Packages using the <i>perl</i> infrastructure</td>"
+echo "<td>$perl_packages</td>"
+echo "</tr>"
+echo "<tr>"
+echo "<td>Packages using the <i>python</i> infrastructure</td>"
+echo "<td>$python_packages</td>"
+echo "</tr>"
+echo "<tr>"
+echo "<td>Packages using the <i>virtual</i> infrastructure</td>"
+echo "<td>$virtual_packages</td>"
+echo "</tr>"
+echo "<tr>"
 echo "<td>Packages not using any infrastructure</td>"
 echo "<td>$manual_packages</td>"
 echo "</tr>"
