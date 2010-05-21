From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] iconv: disallow selection when
	BR2_ENABLE_LOCALE is enabled
Message-ID: <20100521184447.DFC419C148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2fae26486f86e9ed2b466ebc61a3521b60897a12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A C library compiled with locale support already has an iconv()
implementation. In that case, libiconv is useless. Therefore, disallow
the selection of libiconv when the configuration says that the
toolchain has locale support.

This fixes build issues similar to the one we had with gettext:
libiconv headers are installed, but -liconv is not added because the
./configure script detects that the C library supports iconv.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiconv/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libiconv/Config.in b/package/libiconv/Config.in
index b600944..ee4fd62 100644
--- a/package/libiconv/Config.in
+++ b/package/libiconv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBICONV
 	bool "libiconv"
+	depends on !BR2_ENABLE_LOCALE
 	help
 	  unicode conversion library
 
-- 
1.6.3.3
