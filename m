From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  2 May 2018 21:33:19 +0300
Subject: [Buildroot] [PATCH] python-subprocess32: needs kernel headers v3.10
 on MIPS N64
Message-ID: <6d664294ed5afa0b91e3cf3c32c30fac38d573f0.1525285999.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS N64 ABI has been missing getdents64 wire up until kernel version
3.10. Make python-subprocess32 depend on newer headers for MIPS N64.

Fixes:
http://autobuild.buildroot.net/results/af1/af1c0dbfcc27fa93992de57f986657d65163800e/
http://autobuild.buildroot.net/results/e5f/e5f9e96d02512359348886a9db3aa4cea9db2081/
http://autobuild.buildroot.net/results/8ba/8ba4c75d724b45c4fe10b4b6c90602b68a811fac/

Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/python-subprocess32/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-subprocess32/Config.in b/package/python-subprocess32/Config.in
index a936b064b0e6..d7fe84f1e621 100644
--- a/package/python-subprocess32/Config.in
+++ b/package/python-subprocess32/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_PYTHON_SUBPROCESS32
 	bool "python-subprocess32"
 	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_MIPS_NABI64
 	help
 	  A backport of the Python 3 subprocess module for use
 	  on Python 2.
 
 	  https://github.com/google/python-subprocess32
+
+comment "python-subprocess32 needs a toolchain w/ headers >= 3.10 on MIPS N64"
+	depends on BR2_MIPS_NABI64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
-- 
2.17.0
