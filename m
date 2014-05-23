From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 May 2014 22:54:48 +0200
Subject: [Buildroot] [git commit] package/samba{,4}: disable on nios2
Message-ID: <20140523205506.642FF9CD76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=691a36943e56dd22d50030e6e3bb66affd81a09e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba produces particularly large binaries, and the relocations needed
for it do not fit in the possible relocation mechanisms available on
nios2. Since samba is very unlikely to be used on nios2, let's just
disable it, as we've done for AVR32.

Fixes:
    http://autobuild.buildroot.net/results/7b9/7b9dcb537f98714fe57fe384ecbb49bd9ae52aee/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba/Config.in  |    4 ++--
 package/samba4/Config.in |    1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index 70ff960..8dd0bf2 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_SAMBA
 	bool "samba"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	# binary too large, relocations don't fit
-	depends on !BR2_avr32
+	depends on !BR2_avr32 # binary too large, relocations don't fit
+	depends on !BR2_nios2 # binary too large, relocations don't fit
 	select BR2_PACKAGE_POPT
 	help
 	  Provides secure, stable and fast file and print services
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 77a46cd..7008ba2 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # talloc python threads
 	depends on !BR2_avr32 # bad toolchain
+	depends on !BR2_nios2 # binary too large, relocations don't fit
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_PYTHON
