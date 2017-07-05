From: Romain Naour <romain.naour@smile.fr>
Date: Wed,  5 Jul 2017 09:55:57 +0200
Subject: [Buildroot] [PATCH] package/kvazaar: disable on PowerPC
Message-ID: <20170705075557.20288-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a build issue with kvazaar on PowerPC due to deprecated vec_lvsl()
function:

strategies/altivec/picture-altivec.c: In function ?reg_sad_altivec?:
strategies/altivec/picture-altivec.c:43:5: error: vec_lvsl is deprecated for little endian; use assignment for unaligned loads and stores [-Werror=deprecated]
perm1 = vec_lvsl(0, &data1[y * stride1]);
^~~~~

Fixes:
http://autobuild.buildroot.net/results/486/486757f04bc73736b64d18c3298216280be897b1

Upstream status:
https://github.com/ultravideo/kvazaar/issues/172

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/kvazaar/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
index fb97369..558d161 100644
--- a/package/kvazaar/Config.in
+++ b/package/kvazaar/Config.in
@@ -3,11 +3,14 @@ config BR2_PACKAGE_KVAZAAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	# use deprecated altivec vec_lvsl()
+	depends on !BR2_powerpc && !BR2_powerpc64 && !BR2_powerpc64le
 	help
 	  An open-source HEVC encoder licensed under LGPLv2.1
 
 	  https://github.com/ultravideo/kvazaar
 
 comment "kvazaar needs a toolchain w/ C++, threads"
+	depends on !BR2_powerpc && !BR2_powerpc64 && !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.9.4
