From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:54:47 +0200
Subject: [Buildroot] [git commit] gcc: disable C++ support for Blackfin
Message-ID: <20160810125622.70F72818F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ca80d92e06694241fca95ed85f1883dd0f500c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed with Waldemar, the C++ support for Blackfin is currently
broken, and we don't have a fix in sight for the 2016.08
release. Therefore, this commit disables C++ support entirely on the
Blackfin architecture in the internal toolchain backend.

This will avoid a significant number of Blackfin build failures, that
occur when building C++ packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b54959..761a749 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -120,6 +120,9 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 config BR2_TOOLCHAIN_BUILDROOT_CXX
 	bool "Enable C++ support"
 	select BR2_INSTALL_LIBSTDCPP
+	# C++ support currently broken for Blackfin, under
+	# investigation.
+	depends on !BR2_bfin
 	help
 	  Enable this option if you want your toolchain to support the
 	  C++ language and you want C++ libraries to be installed on
