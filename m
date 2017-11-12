From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Nov 2017 15:17:51 +0100
Subject: [Buildroot] [PATCH 2/2] python-numpy: also disable ARC HS with glibc
In-Reply-To: <20171112141751.11051-1-thomas.petazzoni@free-electrons.com>
References: <20171112141751.11051-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171112141751.11051-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building python-numpy on ARC HS with glibc fails due to missing FE_*
definitions in <fenv.h>. Therefore, python-numpy is only available on
ARC HS with a C library other than glibc.

Fixes:

  http://autobuild.buildroot.net/results/6b9a3310bb4f8c1fd7db0ef4476458b3eec2bf2e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-numpy/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index aa47087d28..067085bf41 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	bool
 	# Numpy has some CPU specific code
-	# ARC toolchain issues for ARCompact
-	default y if BR2_arc && !(BR2_arc770d || BR2_arc750d)
+	# ARCompact build fails due to toolchain issue
+	# ARC HS38 build fails on glibc due to missing FE_* definitions
+	default y if BR2_arc && BR2_archs38 && !BR2_TOOLCHAIN_USES_GLIBC
 	default y if BR2_aarch64
 	default y if BR2_arm
 	default y if BR2_armeb
-- 
2.13.6
