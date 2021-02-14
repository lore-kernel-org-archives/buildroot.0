From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Feb 2021 09:36:39 +0100
Subject: [Buildroot] [git commit] package/ply: fix dependencies of comment
 for dependencies
Message-ID: <20210214081618.35DE3838AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21ef97df91143eb191e565d5250527148e53b660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commits ca1afcb2171f (package/ply: needs headers >= 4.14) and
debe9eb13ebd (package/ply: needs dynamic library) added restrictions
on the availability of ply. The first forgot to add a comment, and
the second mis-handled the dependency on the headers version.

Indeed, we want the comment to show the requirement on the headers
version (since that is not a hardware dependency).

Fix this comment to include the headers version, and fix the condition
accordingly.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Andreas Klinger <ak@it-klinger.de>
---
 package/ply/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ply/Config.in b/package/ply/Config.in
index 16f5f8a267..0500e7883f 100644
--- a/package/ply/Config.in
+++ b/package/ply/Config.in
@@ -5,11 +5,10 @@ config BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	default y if BR2_x86_64
 
-comment "ply needs a toolchain w/ dynamic library"
+comment "ply needs a toolchain w/ dynamic library, headers >= 4.14"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PLY
 	bool "ply"
