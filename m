From: Jaap Crezee <jaap@jcz.nl>
Date: Tue, 22 Sep 2015 12:31:01 +0200
Subject: [Buildroot] slang failing on my system | detects host
	libraries/headers
Message-ID: <56012DE5.4000909@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,


It looks to me as if slang is finding some host files on my system currently:


configure:7437: checking for the onig library and header files oniguruma.h
configure:7513: result: yes: /usr/lib and /usr/include


Which ultimately results in:

/data/work/zupr/ZUPR-Embedded-Buildroot/output/host/usr/bin/ccache
/data/work/zupr/ZUPR-Embedded-Buildroot/output/host/usr/bin/arm-linux-gnueabihf-gcc
-I/data/work/zupr/ZUPR-Embedded-Buildroot/output/build/slang-2.3.0/src -shared -fPIC
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
-I/data/work/zupr/ZUPR-Embedded-Buildroot/output/build/slang-2.3.0/src
-Wl,-R/usr/lib:/data/work/zupr/ZUPR-Embedded-Buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
  -lm
/data/work/zupr/ZUPR-Embedded-Buildroot/output/build/slang-2.3.0/modules/onig-module.c -o
onig-module.so -lonig
/data/work/zupr/ZUPR-Embedded-Buildroot/output/build/slang-2.3.0/modules/onig-module.c:27:23:
fatal error: oniguruma.h: No such file or directory
 #include <oniguruma.h>
                       ^
compilation terminated.
Makefile:119: recipe for target 'onig-module.so' failed


Anybody care to fix that correctly? Here's my quick-and-dirty patch:

[jaap at jaap /data/work/zupr/ZUPR-Embedded-Buildroot ]$ git diff
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 59ef993..f597017 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -54,4 +54,6 @@ SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
 SLANG_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
 endif

+SLANG_CONF_OPTS += --without-onig
+
 $(eval $(autotools-package))
[jaap at jaap /data/work/zupr/ZUPR-Embedded-Buildroot ]$


Kind regards,


Jaap Crezee
