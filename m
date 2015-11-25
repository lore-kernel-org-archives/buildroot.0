From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:19:35 +0100
Subject: [Buildroot] [git commit] guile: needs strtol_l,
	not available for musl
Message-ID: <20151125222250.53A5081EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=489d86616fe864b068c72e3583e3cafb9016c4b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/861/861c3038dff03ded6d97b8bb61ba8754dc21c7f8/
http://autobuild.buildroot.net/results/cd3/cd3377585e4fa5c7457c50e827d96adeceaac04b/
http://autobuild.buildroot.net/results/b45/b453c419292dba39aaa309ea057e56662e9af2f6/

Musl doesn't implement strtol_l, which is used by guile.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/guile/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index acb0974..e93d353 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GUILE
 	bool "guile"
+	depends on !BR2_TOOLCHAIN_USES_MUSL # no strtol_l
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc
 	depends on BR2_USE_WCHAR # libunistring
@@ -15,7 +16,7 @@ config BR2_PACKAGE_GUILE
 
 	  http://www.gnu.org/software/guile
 
-comment "guile needs a toolchain w/ threads, wchar, dynamic library"
+comment "guile needs a uClibc or (e)glibc toolchain w/ threads, wchar, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
