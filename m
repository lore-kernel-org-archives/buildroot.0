From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:26 +0200
Subject: [Buildroot] [PATCH 01/12] iconv: disallow selection when
	BR2_ENABLE_LOCALE is enabled
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6d15ad79b935d29ef929f1f66148acdac6712834.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
