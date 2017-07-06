From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:45:41 +0200
Subject: [Buildroot] [git commit] pkg-stats: take into account waf packages
Message-ID: <20170706195001.8B0CE7FABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df3bf7bccd4b1caab137cec0f9ce17e7e2a39202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The waf package infrastructure was not known by the pkg-stats script,
so let's add it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 95a8afc..eb48711 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -84,6 +84,7 @@ python_packages=0
 rebar_packages=0
 virtual_packages=0
 generic_packages=0
+waf_packages=0
 manual_packages=0
 packages_with_licence=0
 packages_without_licence=0
@@ -231,6 +232,11 @@ for i in $(find boot/ linux/ package/ toolchain/ -name '*.mk' | sort) ; do
 	hastarget=1
     fi
 
+    if grep -E "\(waf-package\)" $i > /dev/null ; then
+	infratype="waf"
+	hastarget=1
+    fi
+
     pkg=$(basename $i)
     dir=$(dirname $i)
     pkg=${pkg%.mk}
@@ -259,6 +265,8 @@ for i in $(find boot/ linux/ package/ toolchain/ -name '*.mk' | sort) ; do
 	virtual_packages=$(($virtual_packages+1))
     elif [ ${infratype} = "generic" ]; then
 	generic_packages=$(($generic_packages+1))
+    elif [ ${infratype} = "waf" ]; then
+	waf_packages=$(($waf_packages+1))
     fi
 
     if grep -qE "^${pkgvariable}_LICENSE[ ]*=" $i ; then
@@ -391,6 +399,10 @@ echo "<td>Packages using the <i>virtual</i> infrastructure</td>"
 echo "<td>$virtual_packages</td>"
 echo "</tr>"
 echo "<tr>"
+echo "<td>Packages using the <i>waf</i> infrastructure</td>"
+echo "<td>$waf_packages</td>"
+echo "</tr>"
+echo "<tr>"
 echo "<td>Packages not using any infrastructure</td>"
 echo "<td>$manual_packages</td>"
 echo "</tr>"
