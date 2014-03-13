From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 13 Mar 2014 13:55:21 +0000
Subject: [Buildroot] [PATCH] libesmtp: not available for static builds
Message-ID: <1394718921-59546-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package requires libltdl and checks for it in the configure phase.
If it's not present, then the build process is stopped.

Fixes:
   http://autobuild.buildroot.net/results/5cf/5cf145d3f9c78bef1f66fe9b1831723de8b4969f/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/collectd/Config.in |    5 +++--
 package/libesmtp/Config.in |    4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 70b0439..ad44842 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_COLLECTD
 	depends on BR2_USE_MMU
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB # libesmtp
 	help
 	  collectd is a daemon which collects system performance
 	  statistics periodically and provides mechanisms to store
@@ -435,6 +436,6 @@ endmenu
 
 endif
 
-comment "collectd needs a toolchain w/ IPv6, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+comment "collectd needs a toolchain w/ IPv6, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
diff --git a/package/libesmtp/Config.in b/package/libesmtp/Config.in
index 4e9e455..42a1c08 100644
--- a/package/libesmtp/Config.in
+++ b/package/libesmtp/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBESMTP
 	bool "libesmtp"
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Library for sending emails through SMTP.
 
 	  http://www.stafford.uklinux.net/libesmtp
+
+comment "libesmtp needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.7.1
