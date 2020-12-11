From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 14:54:44 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qemu: use a
 system-wide slirp
Message-ID: <20201211211702.7CD198469F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fe192649840db2424d143d66d955a595a11f0fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Use a system-wide slirp now that we switched to the up to date
https://gitlab.freedesktop.org/slirp/libslirp

qemu already depends on libglib2 so we don't need to add any new
dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7e237b79ad138dd296477c7ed631ca83f5145fc5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 7fe64e3605..9ae982616d 100644
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
 
