From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:38:37 +0200
Subject: [Buildroot] [git commit] package/openssl: bin/openssl depends on
	dynamic linking
Message-ID: <20150419093855.56AAB804F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffd5125be14dbd1293571267a76a76eea3ede188
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
/home/br/br3/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.8.4/../../../../i586-buildroot-linux-uclibc/bin/ld: cannot find -ldl

using this defconfig

BR2_STATIC_LIBS=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_OPENSSL_BIN=y

Quoting PROBLEMS:
"We don't have framework to associate -ldl with no-dso, therefore the only
way is to edit Makefile right after ./config no-dso and remove -ldl from
EX_LIBS line."

To not make the build procedure more complicated disable static building of
bin/openssl.

[Thomas: add corresponding kconfig comment.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index a9990e8..07859ca 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -15,10 +15,15 @@ config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
 	help
 	  Install the openssl binary to the target file system. This is a
 	  command line tool for doing various crypthographic stuff.
 
+comment "openssl binary needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_OPENSSL_ENGINES
 	bool "openssl additional engines"
 	help
