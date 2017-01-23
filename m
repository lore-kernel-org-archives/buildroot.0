From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 23:07:39 +0100
Subject: [Buildroot] [git commit] gdb: unbreak 7.12 target gdb/gdbserver
	build without C++ support
Message-ID: <20170123220845.51988805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba8338060bd10abb49a7ca413fd5ea53e80b0868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdb 7.12+ by default builds with a C++ compiler, which naturally doesn't
work when we don't have C++ support in the toolchain.

Fix it by passing --disable-build-with-cxx for such setups.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ea27d0c..606f1f9 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -107,6 +107,12 @@ ifeq ($(BR2_arc),y)
 GDB_CONF_OPTS += --disable-build-with-cxx
 endif
 
+# gdb 7.12+ by default builds with a C++ compiler, which doesn't work
+# when we don't have C++ support in the toolchain
+ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+GDB_CONF_OPTS += --disable-build-with-cxx
+endif
+
 ifeq ($(BR2_PACKAGE_GDB_TUI),y)
 GDB_CONF_OPTS += --enable-tui
 else
