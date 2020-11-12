From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 12 Nov 2020 23:00:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/qemu: use a system-wide slirp
Message-ID: <20201112220059.804870-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a system-wide slirp now that we switched to the up to date
https://gitlab.freedesktop.org/slirp/libslirp

qemu already depends on libglib2 so we don't need to add any new
dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qemu/Config.in | 1 +
 package/qemu/qemu.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 33d4cccd7b..391fd5faaf 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -58,6 +58,7 @@ comment "Networking options"
 
 config BR2_PACKAGE_QEMU_SLIRP
 	bool "Enable user mode networking (SLIRP)"
+	select BR2_PACKAGE_SLIRP
 	help
 	  Enable user mode network stack, which is the default
 	  networking backend. It requires no administrator privileges
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 69850ec938..2bac96bd66 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -51,8 +51,10 @@ endif
 
 endif
 
-# There is no "--enable-slirp"
-ifeq ($(BR2_PACKAGE_QEMU_SLIRP),)
+ifeq ($(BR2_PACKAGE_QEMU_SLIRP),y)
+QEMU_OPTS += --enable-slirp=system
+QEMU_DEPENDENCIES += slirp
+else
 QEMU_OPTS += --disable-slirp
 endif
 
-- 
2.28.0
