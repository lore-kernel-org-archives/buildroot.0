From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 10:17:29 -0500
Subject: [Buildroot] [PATCH v2 1/7] package/libselinux: gcc at least 4.7
Message-ID: <20180813151735.5297-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both the host and target GCC must be at least 4.7 for the
use of ATOMICs.

Resolves.
label_file.h: In function 'compile_regex':
label_file.h:353: error: '__ATOMIC_ACQUIRE' undeclared (first use in this function)
label_file.h:353: error: (Each undeclared identifier is reported only once
label_file.h:353: error: for each function it appears in.)
label_file.h:405: error: '__ATOMIC_RELEASE' undeclared (first use in this function)

Fixes:
http://autobuild.buildroot.net/results/3d3/3d3ecf63236bb41abca7d1996619ba697a7cbdb8/
http://autobuild.buildroot.net/results/e98/e98789785a03e238e7cdca0ad07526d70fcfa30b/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--

Changes:
v1 -> v2
[Baruch
 - Propogated the libselinux kconfig dependencies for both host
   and target BR2_*_GCC_AT_LEAST_4_7
---
 package/libselinux/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 6be816db77..0b6ac52e03 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_LIBSELINUX
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# Toolchain issue: "fixup not contained within frag"
 	depends on !BR2_arc
+	# Uses __ATOMIC_*
+	depends on BR2_HOST_GCC_AT_LEAST_4_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_PCRE
 	help
-- 
2.17.0
