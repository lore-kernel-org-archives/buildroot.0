From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 13 Feb 2014 23:59:53 +0100
Subject: [Buildroot] [PATCH v5 4/5] dependencies.sh: XBMC needs java on the
	host
In-Reply-To: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1392332394-27935-5-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

XBMC uses a code-generator which is build in two phases:
In the first phase SWIG is used to parse C++ header files that define the API.
SWIG outputs an XML file that contains a complete description of the structure
of the API.
In the second phase, the XML file is ingested by a Groovy (Java) program that
then creates C++ code that forms the bridge to the scripting language (Python).

The second phase is why we need java on the host.

You can learn more at the XBMC's wiki:
http://wiki.xbmc.org/index.php?title=Codegeneration#How_it_works

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 support/dependencies/dependencies.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 0e7e1fa..5f77f35 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -191,6 +191,16 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
 	done
 fi
 
+if grep -q ^BR2_PACKAGE_XBMC=y $BUILDROOT_CONFIG ; then
+	for prog in java; do
+		if ! which $prog > /dev/null ; then
+			echo >&2
+			echo "You must install '$prog' on your build machine" >&2
+			exit 1
+		fi
+	done
+fi
+
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 	if test ! -f /lib/ld-linux.so.2 ; then
 		echo
-- 
1.8.5.3
