From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 10:08:29 +0100
Subject: [Buildroot] [git commit] linknx: argp-standalone also needed with
	musl
Message-ID: <20160122090837.2283F7FBF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=febab8d9de742bdf190939ac723c140f5a5546ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linknx package needs the argp functionality, which is provided
built-in by glibc, but not by uClibc and musl. In uClibc
configurations, it correctly selects the argp-standalone package to
compensate this, but forgets to do so in musl-based
configurations. This commit fixes that by selecting the
argp-standalone package.

Found by checking all packages having an argp-standalone
dependency. Note that this commit is not sufficient to make linknx
build properly with musl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linknx/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 9982f31..36838fe 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_LINKNX
 	bool "linknx"
 	select BR2_PACKAGE_LIBPTHSEM
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE \
+	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libpthsem
 	help
