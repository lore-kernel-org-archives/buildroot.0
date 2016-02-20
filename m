From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:52:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/trace-cmd: add optional support for
	audit
Message-ID: <1456008742-4361-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When audit was compiled before, trace-cmd will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/trace-cmd | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [ld64-uClibc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libaudit.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/trace-cmd/trace-cmd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 839e7ee..2348155 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -13,6 +13,10 @@ TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
 
 TRACE_CMD_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+TRACE_CMD_DEPENDENCIES += audit
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 TRACE_CMD_DEPENDENCIES += python host-swig
 TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python
-- 
2.7.0
