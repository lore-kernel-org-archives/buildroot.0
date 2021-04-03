From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 16:51:03 +0200
Subject: [Buildroot] [git commit] package/cifs-utils: add missing python
 dependencies
Message-ID: <20210403142557.968FE8A289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99001b0a814775ff24f27c14d60a606da4120db5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing python dependencies which have been forgotten when bumping
to version 6.12 in commit b5dede7d1a03ab2b8caa0a8e79b09c8df6c62fe4

Fixes:
 - http://autobuild.buildroot.org/results/acdbf7c58ec8ae648f8048bc75650dcdcdca6285

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - dependencies are because of python3, not python
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cifs-utils/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cifs-utils/Config.in b/package/cifs-utils/Config.in
index 0e61243de4..f15d1e3dc4 100644
--- a/package/cifs-utils/Config.in
+++ b/package/cifs-utils/Config.in
@@ -18,9 +18,16 @@ if BR2_PACKAGE_CIFS_UTILS
 
 config BR2_PACKAGE_CIFS_UTILS_SMBTOOLS
 	bool "smbtools"
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON # runtime
 	help
 	  Install the smb tools smbinfo and smb2-quota (python
 	  implementations).
 
+comment "smbtools needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
 endif
