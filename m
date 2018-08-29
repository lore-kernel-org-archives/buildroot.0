From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:49:16 +0200
Subject: [Buildroot] [git commit branch/next] qemu: add an option to enable
 user mode networking (SLIRP)
Message-ID: <20180829194919.95D19819EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37c49cf2f4a511fbf937dcf67efe73cca0fec9c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

User mode networking is a useful feature that does not depend on other
packages. Add an option to enable it but keep it disabled by default,
for backwards compatibility.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in | 25 +++++++++++++++++++++++--
 package/qemu/qemu.mk   |  6 +++++-
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 13b615bfba..61a2a1072e 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -54,8 +54,29 @@ config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
 	    x86_64-softmmu        | sparc-bsd-user
 	    ...                   | ...
 
-config QEMU_FOO
-	bool # To break the indentation
+comment "Networking options"
+
+config BR2_PACKAGE_QEMU_SLIRP
+	bool "Enable user mode networking (SLIRP)"
+	help
+	  Enable user mode network stack, which is the default
+	  networking backend. It requires no administrator privileges
+	  and generally is the easiest to use but has some
+	  limitations:
+
+	  - there is a lot of overhead so the performance is poor;
+	  - in general ICMP does not work (can't ping from/to a guest)
+	  - on Linux hosts, ping does work from within the guest, but it
+	    needs initial setup by root (once per host)
+	  - the guest is not directly accessible from the host or the
+	    external network
+
+	  User Networking is implemented using "slirp", which provides a
+	  full TCP/IP stack within QEMU and uses that stack to implement
+	  a virtual NAT'd network.
+
+	  Notice that this option does not disable other networking
+	  modes.
 
 if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index aec803c1ae..afb2aa92f6 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -55,6 +55,11 @@ endif
 
 endif
 
+# There is no "--enable-slirp"
+ifeq ($(BR2_PACKAGE_QEMU_SLIRP),)
+QEMU_OPTS += --disable-slirp
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
 QEMU_OPTS += --enable-sdl
 QEMU_DEPENDENCIES += sdl
@@ -101,7 +106,6 @@ define QEMU_CONFIGURE_CMDS
 			--enable-vhost-net \
 			--disable-bsd-user \
 			--disable-xen \
-			--disable-slirp \
 			--disable-vnc \
 			--disable-virtfs \
 			--disable-brlapi \
