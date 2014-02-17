From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 18 Feb 2014 00:37:12 +0100
Subject: [Buildroot] [PATCH v7 3/4] infra: Introduce BR2_HOST_NEEDS_JAVA
In-Reply-To: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1392680233-24585-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

XBMC needs Java on the host in order to build, because it  uses a
code-generator which is build in two phases:
In the first phase SWIG is used to parse C++ header files that define the API.
SWIG outputs an XML file that contains a complete description of the structure
of the API.
In the second phase, the XML file is ingested by a Groovy (Java) program that
then creates C++ code that forms the bridge to the scripting language (Python).

The second phase is why we need java on the host.

You can learn more at the XBMC's wiki:
http://wiki.xbmc.org/index.php?title=Codegeneration#How_it_works

In order to check that, this patch introduce this mechanism in
dependencies.sh
It also defines the variable in Config.in

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v6 -> v7:
  - Fixes old use of BUILDROOT_CONFIG instead of BR2_CONFIG
  - Add definition of the variable to Config.in
Changes v5 -> v6:
  - Remove useless loop (Thomas Petazzoni)
  - Thanks to Martin Bark idea, change this patch to have a non package
    specific variable.
Changes v1 -> v5:
  - Patch non existant before
---
 Config.in                            | 5 +++++
 support/dependencies/dependencies.sh | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/Config.in b/Config.in
index bcfefc7..8afd156 100644
--- a/Config.in
+++ b/Config.in
@@ -18,6 +18,11 @@ config BR2_EXTERNAL
 	string
 	option env="BR2_EXTERNAL"
 
+# Hidden boolean selected by packages in need of Java in order to build
+# (example: xbmc)
+config BR2_HOST_NEEDS_JAVA
+	bool
+
 # Hidden boolean selected by pre-built packages for x86, when they
 # need to run on x86-64 machines (example: pre-built external
 # toolchains, binary tools like SAM-BA, etc.).
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 0e7e1fa..05039ea 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -191,6 +191,14 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
 	done
 fi
 
+if grep -q ^BR2_HOST_NEEDS_JAVA=y $BR2_CONFIG ; then
+	if ! which java > /dev/null ; then
+		echo >&2
+		echo "You must install '$prog' on your build machine" >&2
+		exit 1
+	fi
+fi
+
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 	if test ! -f /lib/ld-linux.so.2 ; then
 		echo
-- 
1.8.5.3
