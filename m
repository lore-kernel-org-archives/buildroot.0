From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2013 22:52:04 +0100
Subject: [Buildroot] [PATCH 2/3] support/dependencies: use globally-exported
	BR2_CONFIG_FILE
In-Reply-To: <cover.1357595083.git.yann.morin.1998@free.fr>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
Message-ID: <bab3e6b0d7770f6f159df2f4372ce38984a58d85.1357595083.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to recreate a path we already have.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/dependencies/dependencies.mk |    1 -
 support/dependencies/dependencies.sh |   10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index cee2a48..ebe743a 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -22,7 +22,6 @@ endif
 
 core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
-		CONFIG_FILE="$(CONFIG_DIR)/.config" \
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index ca58450..a542f25 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -147,8 +147,8 @@ for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio p
     fi
 done
 
-if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
-   grep ^BR2_ENABLE_LOCALE=y       $CONFIG_FILE > /dev/null ; then
+if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BR2_CONFIG_FILE > /dev/null && \
+   grep ^BR2_ENABLE_LOCALE=y       $BR2_CONFIG_FILE > /dev/null ; then
    if ! which locale > /dev/null ; then
        /bin/echo -e "\nYou need locale support on your build machine to build a toolchain supporting locales\n"
        exit 1 ;
@@ -159,7 +159,7 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
    fi
 fi
 
-if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
+if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG_FILE ; then
     for prog in javac jar; do
 	if ! which $prog > /dev/null ; then
 	    /bin/echo -e "\nYou must install '$prog' on your build machine\n" >&2
@@ -168,7 +168,7 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
     done
 fi
 
-if grep -E '^BR2_TARGET_GENERIC_ROOT_PASSWD=".+"$' $CONFIG_FILE > /dev/null 2>&1; then
+if grep -E '^BR2_TARGET_GENERIC_ROOT_PASSWD=".+"$' $BR2_CONFIG_FILE > /dev/null 2>&1; then
     if ! which mkpasswd > /dev/null 2>&1; then
         /bin/echo -e "\nYou need the 'mkpasswd' utility to set the root password\n"
         /bin/echo -e "(in Debian/ubuntu, 'mkpasswd' provided by the whois package)\n"
@@ -176,7 +176,7 @@ if grep -E '^BR2_TARGET_GENERIC_ROOT_PASSWD=".+"$' $CONFIG_FILE > /dev/null 2>&1
     fi
 fi
 
-if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $CONFIG_FILE ; then
+if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG_FILE ; then
     if test ! -f /lib/ld-linux.so.2 ; then
 	/bin/echo -e "\nYour Buildroot configuration uses pre-built tools for the x86 architecture,"
 	/bin/echo -e "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
-- 
1.7.2.5
