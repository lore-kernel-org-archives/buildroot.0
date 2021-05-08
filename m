From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 16:35:59 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/cifs-utils: add
 missing python dependencies
Message-ID: <20210508142103.9CE2B86895@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab13c7a97e28ce22dff74ceca61e347da1591e9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add missing python dependencies which have been forgotten when bumping
to version 6.12 in commit b5dede7d1a03ab2b8caa0a8e79b09c8df6c62fe4

Fixes:
 - http://autobuild.buildroot.org/results/acdbf7c58ec8ae648f8048bc75650dcdcdca6285

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - dependencies are because of python3, not python
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 99001b0a814775ff24f27c14d60a606da4120db5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
