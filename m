From: Cameron Hutchison <lists@xdna.net>
Date: Mon, 08 Feb 2010 06:34:42 -0000
Subject: [Buildroot] Copying extra libs into image using external
	toolchain
References: <39a5.4b68b030.ecb50@getafix.xdna.net> <hkaeil$bis$1@ger.gmane.org>
	<6267.4b69f4f6.222b@getafix.xdna.net>
	<1265241688.2045.48.camel@coalu.atr> <20100206170238.345e1bd8@surf>
	<7931.4b6fa347.59f92@getafix.xdna.net>
Message-ID: <7ad1.4b6fb082.b951f@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cameron Hutchison <lists@xdna.net> writes:

>Alternatively, I could put all the libraries
>in /lib and just forget about /usr/lib (I prefer to on embedded systems,
>but that's probably not a commonly accepted idea).

Here's a patch that does just that and nothing else. It's much smaller
and might be more useful to others:

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 1f5aa19..e39979f 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -45,8 +45,8 @@ copy_toolchain_lib_root = \
 	DST="$(strip $3)"; \
 	STRIP="$(strip $4)"; \
  \
-	LIB_DIR="$${SYSROOT_DIR}/lib" ; \
-	for FILE in `find $${LIB_DIR} -maxdepth 1 -name "$${LIB}.*"`; do \
+	for FILE in `find $${SYSROOT_DIR} -name "$${LIB}.*"`; do \
+		LIB_DIR=`dirname $${FILE}`; \
 		LIB=`basename $${FILE}`; \
 		while test \! -z "$${LIB}"; do \
 			rm -fr $(TARGET_DIR)$${DST}/$${LIB}; \
