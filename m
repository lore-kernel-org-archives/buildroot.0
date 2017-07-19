From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:55:40 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] efivar: fix build with
	gcc 7
Message-ID: <20170719204758.314867FF4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2c5f257a4b6ea1e4cd40349ebb064676b15c37c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Add upstream patch fixing a warning that breaks the build because of -Werror.

Fixes:
http://autobuild.buildroot.net/results/33a/33adc3ef139d6814aef4c92ae0bcc4c810ab0b86/
http://autobuild.buildroot.net/results/e7d/e7d80e823e13edc6698148244553bd90367bcd03/
http://autobuild.buildroot.net/results/3b6/3b61246f8b04a332d1c61732f0eb6e50ea8ca366/

Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0ca30170345a81f5f21e4ef4424b1f186cde1988)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...some-extra-const-that-gcc-complains-about.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch b/package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch
new file mode 100644
index 0000000..6b9f77e
--- /dev/null
+++ b/package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch
@@ -0,0 +1,47 @@
+From 1c7c0f71c9d22efda4156881eb187b8c69d1cca7 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 6 Feb 2017 14:28:19 -0500
+Subject: [PATCH] Remove some extra "const" that gcc complains about.
+
+One of these days I'll get these right.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream commit 1c7c0f71c9d22e.
+
+ src/include/efivar/efiboot-loadopt.h | 4 ++--
+ src/loadopt.c                        | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/include/efivar/efiboot-loadopt.h b/src/include/efivar/efiboot-loadopt.h
+index 07db5c4c53e3..efc29c69d47e 100644
+--- a/src/include/efivar/efiboot-loadopt.h
++++ b/src/include/efivar/efiboot-loadopt.h
+@@ -32,8 +32,8 @@ extern ssize_t efi_loadopt_create(uint8_t *buf, ssize_t size,
+ 
+ extern efidp efi_loadopt_path(efi_load_option *opt, ssize_t limit)
+ 	__attribute__((__nonnull__ (1)));
+-extern const unsigned char const * efi_loadopt_desc(efi_load_option *opt,
+-						    ssize_t limit)
++extern const unsigned char * efi_loadopt_desc(efi_load_option *opt,
++					      ssize_t limit)
+ 	__attribute__((__visibility__ ("default")))
+ 	__attribute__((__nonnull__ (1)));
+ extern uint32_t efi_loadopt_attrs(efi_load_option *opt)
+diff --git a/src/loadopt.c b/src/loadopt.c
+index a63ca792d2dc..ce889867fd29 100644
+--- a/src/loadopt.c
++++ b/src/loadopt.c
+@@ -357,7 +357,7 @@ teardown(void)
+ 
+ __attribute__((__nonnull__ (1)))
+ __attribute__((__visibility__ ("default")))
+-const unsigned char const *
++const unsigned char *
+ efi_loadopt_desc(efi_load_option *opt, ssize_t limit)
+ {
+ 	if (last_desc) {
+-- 
+2.13.2
+
