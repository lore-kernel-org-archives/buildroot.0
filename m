From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2020 19:00:39 +0200
Subject: [Buildroot] [git commit] package/selinux-python: fix dependency
Message-ID: <20200421164704.1A8428F961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b68c7b3c6c4315128bad02929cf000c181f15ca8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 791292c48d5165515ca08f35d8cbc1ef78d3ed95 forgot to add
!BR2_PACKAGE_PYTHON dependency, without it the following error will be
raised if the user selects BR2_PACKAGE_PYTHON and python-selinux:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON3
  Depends on [n]: !BR2_PACKAGE_PYTHON [=y] && BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]
  Selected by [y]:
  - BR2_PACKAGE_SELINUX_PYTHON [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: add dependency on MMU]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/selinux-python/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 1a610b29f0..0f1c281777 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SELINUX_PYTHON
 	bool "selinux-python"
+	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -37,6 +38,10 @@ config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
 
 endif
 
+comment "selinux-python needs python3"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_PYTHON
+
 comment "selinux-python packages needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
