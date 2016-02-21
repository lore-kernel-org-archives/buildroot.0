From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:39:02 +0100
Subject: [Buildroot] [git commit] package/trace-cmd: add optional support
	for audit
Message-ID: <20160221133955.E41C780415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d013a287e1402bd058553452ec1f8cbd0ea5ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When audit was compiled before, trace-cmd will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/trace-cmd | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [ld64-uClibc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libaudit.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
