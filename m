From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 24 Aug 2020 20:21:21 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/kismet: fix build with gcc >= 9
Message-ID: <20200824182121.1929324-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kismet fails to build with gcc >= 9 on:

In file included from /home/buildroot/autobuild/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/sys/socket.h:39,
                 from ipc_remote.h:61,
                 from ipc_remote.cc:34:
/home/buildroot/autobuild/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/include/bits/socket.h:289:33: error: flexible array member 'cmsghdr::__cmsg_data' not at end of 'struct<unnamed>'
  289 |     __extension__ unsigned char __cmsg_data __flexarr; /* Ancillary data.  */
      |                                 ^~~~~~~~~~~

Adding -std=c++11 fix the build and can be removed as soon as kismet is
bumped to latest version as the offending code has been removed. It
should be noted that kismet builds fine with gcc 8 so it remains unclear
why this build failure is raised only with gcc >= 9 (build failure
confirmed with gcc 9 and 10)

Fixes:
 - http://autobuild.buildroot.org/results/85f7c746ae1cc19f8839f892f0c280dcb0444ea9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop incorrect patch and use -std=c++11

 package/kismet/kismet.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index d3946d65f3..49ec6d1467 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -17,6 +17,11 @@ KISMET_AUTORECONF = YES
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
+# flexible array member 'cmsghdr::__cmsg_data' not at end of 'struct<unnamed>'
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_9),y)
+KISMET_CXXFLAGS += -std=c++11
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KISMET_CXXFLAGS += -O0
 endif
-- 
2.28.0
