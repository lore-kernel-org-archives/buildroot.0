From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 6 Feb 2007 19:33:42 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: package target
	target/device toolchain etc...
In-Reply-To: <20070206181938.DD35C4866D@busybox.net>
References: <20070206181938.DD35C4866D@busybox.net>
Message-ID: <20070206183342.GA21114@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 06, 2007 at 10:19:38AM -0800, sjhill at uclibc.org wrote:
>Author: sjhill
>Date: 2007-02-06 10:19:38 -0800 (Tue, 06 Feb 2007)
>New Revision: 17800


>Modified: trunk/buildroot/target/Makefile.in
>===================================================================
>--- trunk/buildroot/target/Makefile.in	2007-02-06 18:17:31 UTC (rev 17799)
>+++ trunk/buildroot/target/Makefile.in	2007-02-06 18:19:38 UTC (rev 17800)
>@@ -7,4 +7,7 @@
> # and finally build the filesystems/tarballs
> include target/*/*.mk
> # kernel rules
>+ifeq ($(BR2_PACKAGE_LINUX),y)
>+TARGETS+=linux26
>+endif
> include target/linux*.mk
>
>Modified: trunk/buildroot/target/device/Makefile.in
>===================================================================
>--- trunk/buildroot/target/device/Makefile.in	2007-02-06 18:17:31 UTC (rev 17799)
>+++ trunk/buildroot/target/device/Makefile.in	2007-02-06 18:19:38 UTC (rev 17800)
>@@ -1,6 +1,3 @@
> TARGET_DEVICE_DEPMOD:=target/device/x86/depmod.pl
> 
> -include target/device/*/Makefile.in
>-ifeq ($(BR2_PACKAGE_LINUX),y)
>-TARGETS+=linux26
>-endif

What do the above two hunks do? Why were they needed?
Building a 2.6 kernel worked flawlessly even before that patch, for any
arch and for any device.
Please elaborate.

>Added: trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
>===================================================================
>--- trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	                        (rev 0)
>+++ trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2007-02-06 18:19:38 UTC (rev 17800)
>@@ -0,0 +1,56 @@
>+#
>+# copy_toolchain_lib_root
>+#
>+# $1: source
>+# $2: destination
>+# $2: strip (y|n)	default is to strip
>+#
>+copy_toolchain_lib_root =									\
>+	LIB="$(strip $1)";									\
>+	DST="$(strip $2)";									\
>+	STRIP="$(strip $3)";									\
>+												\
>+	LIB_DIR=`$(TARGET_CC) -print-file-name=$${LIB} | sed -e "s,/$${LIB}\$$,,"`;		\

That -print-file-name is a gcc-ism. Not every external toolchain uses
gcc. Please fix this.

>+												\
>+	if test -z "$${LIB_DIR}"; then								\
>+		echo "copy_toolchain_lib_root: lib=$${LIB} not found";				\
>+		exit -1;									\
>+	fi;											\
>+												\
>+	LIB="$(strip $1)";									\
>+	for FILE in `find $${LIB_DIR} -type l -name "$${LIB}*" -maxdepth 1`; do			\
>+		LIB=`basename $${FILE}`;							\
>+		while test \! -z "$${LIB}"; do							\
>+			echo "copy_toolchain_lib_root lib=$${LIB} dst=$${DST}";			\
>+			rm -fr $(TARGET_DIR)$${DST}/$${LIB};					\
>+			mkdir -p $(TARGET_DIR)$${DST};						\
>+			if test -h $${LIB_DIR}/$${LIB}; then					\
>+				cp -d $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/;			\
>+			elif test -f $${LIB_DIR}/$${LIB}; then					\
>+				cp $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/$${LIB};	\
>+				case "$${STRIP}" in						\
>+				(0 | n | no)							\

I don't think that this is portable.
case "$${STRIP}" in ;
0|n|no) ;; 
*) $(TARGET_CROSS)strip "$(TARGET_DIR)$${DST}/$${LIB}" ;;
esac

should be more portable

>+					;;							\
>+				(*)								\
>+					$(TARGET_CROSS)strip "$(TARGET_DIR)$${DST}/$${LIB}";		\
>+					;;							\
>+				esac;								\
>+			else									\
>+				exit -1;							\
>+			fi;									\
>+			LIB="`readlink $${LIB_DIR}/$${LIB}`";					\
>+		done;										\
>+	done;											\
