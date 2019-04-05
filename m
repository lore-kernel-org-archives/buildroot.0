From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:23:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/haproxy: disable
 on nios2 and microblaze
Message-ID: <20190405152520.19E7581810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8a3a2b40aff2af9a3fa2bb300033598e42cb41a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/4d7be00514f5276a9fd533adfdbc3d5183bb59ca
 - http://autobuild.buildroot.org/results/64706f96db793777de9d3ec63b0a47d776cf33fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d439d4428fa3228d71bbe8c2f24247fd48fda172)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/Config.in | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index 78cbf6e103..670de5a3ee 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -1,7 +1,16 @@
-config BR2_PACKAGE_HAPROXY
-	bool "haproxy"
+config BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
+	bool
+	default y
+	# internal compiler error: in do_output_reload, at reload1.c:7978
+	depends on !BR2_microblaze
+	# src/proto_http.c:6330:1: internal compiler error: Segmentation fault
+	depends on !BR2_nios2
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60040
 	depends on !(BR2_sh4 && !BR2_TOOLCHAIN_GCC_AT_LEAST_7)
+
+config BR2_PACKAGE_HAPROXY
+	bool "haproxy"
+	depends on BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	help
