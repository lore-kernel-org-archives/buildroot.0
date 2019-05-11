From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 May 2019 12:10:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cpp: add -lpthread to LIBS
Message-ID: <20190511101048.20406-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linknx fails to build with log4cpp because log4cpp does not add
-lpthread to its log4cpp.pc file:

/home/buildroot/autobuild/instance-0/output/host/bin/mipsel-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os     -o linknx linknx.o logger.o ruleserver.o objectcontroller.o eibclient.o threads.o timermanager.o persistentstorage.o xmlserver.o smsgateway.o emailgateway.o knxconnection.o services.o suncalc.o luacondition.o ioport.o ../ticpp/libticpp.a  -L/home/buildroot/autobuild/instance-0/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib -lpthsem  -L/home/buildroot/autobuild/instance-0/output/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/lib -llog4cpp     -lm
/home/buildroot/autobuild/instance-0/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib/liblog4cpp.so: undefined reference to `pthread_key_create'

Help log4cpp to find this dependency by adding it to LIBS

Fixes:
 - http://autobuild.buildroot.org/results/1863f8f27041bc15ca68e786ba3b8e4764c40574

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cpp/log4cpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index 8664a54385..527ad49e53 100644
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -12,7 +12,7 @@ LOG4CPP_SUBDIR = log4cpp
 LOG4CPP_LICENSE = LGPL-2.1+
 LOG4CPP_LICENSE_FILES = log4cpp/COPYING
 LOG4CPP_INSTALL_STAGING = YES
-LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no
+LOG4CPP_CONF_OPTS = --enable-doxygen=no --enable-dot=no LIBS=-lpthread
 # needed to fix broken configure script
 LOG4CPP_AUTORECONF = YES
 LOG4CPP_AUTORECONF_OPTS = -I m4
-- 
2.20.1
