From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  9 Jun 2014 12:26:21 +0200
Subject: [Buildroot] [PATCH] package/libbsd: needs an (e)glibc toolchain
Message-ID: <1402309581-18430-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

libbsd needs support for .init_array and checks for a
glibc >= 2.4 since .init_array was introduced at around
that time.

uClibc claims to be a glibc-compatible toolchain, but it
only impersonates a glibc-2.2.

Just disable libbsd on uClibc.

Fixes:
    http://autobuild.buildroot.net/results/e94/e949d8fabeeecc74bd1c324c516e0b4938c99dbc/
    http://autobuild.buildroot.net/results/d3e/d3e1b70fb91571efacbe32af2cd12d055508f5ac/
    http://autobuild.buildroot.net/results/b19/b19d24dbf9d05d86d839349695da45d548705b25/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: I initially introduced libbsd as an Nth-level dependency of
qemu to be able to run qemu on the target. So I'll have to revisit
this when I am ready to push my qemu-on-target series. For now,
just disable libbsd on uClibc.
---
 package/libbsd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 8c90aa1..e22226a 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBBSD
 	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
 	depends on ( BR2_i386 || BR2_x86_64 )
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This library provides useful functions commonly found on BSD
 	  systems, and lacking on others like GNU systems, thus making
@@ -13,6 +14,6 @@ config BR2_PACKAGE_LIBBSD
 
 	  http://libbsd.freedesktop.org/
 
-comment "libbsd needs a toolchain w/ threads"
+comment "libbsd needs an (e)glibc toolchain w/ threads"
 	depends on ( BR2_i386 || BR2_x86_64 )
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
-- 
1.8.3.2
