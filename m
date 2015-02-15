From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 15 Feb 2015 21:23:57 +0100
Subject: [Buildroot] [PATCH for master 1/2] pkg-stats: add kconfig and rebar
	infrastructures
Message-ID: <1424031838-16804-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 support/scripts/pkg-stats | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 48a5536..9af974d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -73,9 +73,11 @@ td.lotsofpatches {
 
 autotools_packages=0
 cmake_packages=0
+kconfig_packages=0
 luarocks_package=0
 perl_packages=0
 python_packages=0
+rebar_packages=0
 virtual_packages=0
 generic_packages=0
 manual_packages=0
@@ -106,9 +108,11 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/x11r7/x11r7.mk" -o \
 	$i = "package/pkg-autotools.mk" -o \
 	$i = "package/pkg-cmake.mk" -o \
+	$i = "package/pkg-kconfig.mk" -o \
 	$i = "package/pkg-luarocks.mk" -o \
 	$i = "package/pkg-perl.mk" -o \
 	$i = "package/pkg-python.mk" -o \
+	$i = "package/pkg-rebar.mk" -o \
 	$i = "package/pkg-virtual.mk" -o \
 	$i = "package/pkg-download.mk" -o \
 	$i = "package/pkg-generic.mk" -o \
@@ -134,6 +138,11 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	hastarget=1
     fi
 
+    if grep -E "\(kconfig-package\)" $i > /dev/null ; then
+	infratype="kconfig"
+	hastarget=1
+    fi
+
     if grep -E "\(host-luarocks-package\)" $i > /dev/null ; then
 	infratype="luarocks"
 	hashost=1
@@ -163,6 +172,17 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	infratype="python"
 	hastarget=1
     fi
+
+    if grep -E "\(host-rebar-package\)" $i > /dev/null ; then
+	infratype="rebar"
+	hashost=1
+    fi
+
+    if grep -E "\(rebar-package\)" $i > /dev/null ; then
+	infratype="rebar"
+	hastarget=1
+    fi
+
     if grep -E "\(host-virtual-package\)" $i > /dev/null ; then
 	infratype="virtual"
 	hashost=1
@@ -207,12 +227,16 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	autotools_packages=$(($autotools_packages+1))
     elif [ ${infratype} = "cmake" ]; then
 	cmake_packages=$(($cmake_packages+1))
+    elif [ ${infratype} = "kconfig" ]; then
+	kconfig_packages=$(($kconfig_packages+1))
     elif [ ${infratype} = "luarocks" ]; then
 	luarocks_packages=$(($luarocks_packages+1))
     elif [ ${infratype} = "perl" ]; then
 	perl_packages=$(($perl_packages+1))
     elif [ ${infratype} = "python" ]; then
 	python_packages=$(($python_packages+1))
+    elif [ ${infratype} = "rebar" ]; then
+	rebar_packages=$(($rebar_packages+1))
     elif [ ${infratype} = "virtual" ]; then
 	virtual_packages=$(($virtual_packages+1))
     elif [ ${infratype} = "generic" ]; then
@@ -321,6 +345,10 @@ echo "<td>Packages using the <i>luarocks</i> infrastructure</td>"
 echo "<td>$luarocks_packages</td>"
 echo "</tr>"
 echo "<tr>"
+echo "<td>Packages using the <i>kconfig</i> infrastructure</td>"
+echo "<td>$kconfig_packages</td>"
+echo "</tr>"
+echo "<tr>"
 echo "<td>Packages using the <i>perl</i> infrastructure</td>"
 echo "<td>$perl_packages</td>"
 echo "</tr>"
@@ -329,6 +357,10 @@ echo "<td>Packages using the <i>python</i> infrastructure</td>"
 echo "<td>$python_packages</td>"
 echo "</tr>"
 echo "<tr>"
+echo "<td>Packages using the <i>rebar</i> infrastructure</td>"
+echo "<td>$rebar_packages</td>"
+echo "</tr>"
+echo "<tr>"
 echo "<td>Packages using the <i>virtual</i> infrastructure</td>"
 echo "<td>$virtual_packages</td>"
 echo "</tr>"
-- 
2.3.0
