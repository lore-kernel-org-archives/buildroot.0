From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Mar 2014 22:59:07 +0100
Subject: [Buildroot] [git commit] libesmtp: not available for static builds
Message-ID: <20140313220037.72C5D9BDDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5dc0e606b554c494a76ffcc216eb8911d2d71dfa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package requires libltdl and checks for it in the configure phase.
If it's not present, then the build process is stopped.

Fixes:
   http://autobuild.buildroot.net/results/5cf/5cf145d3f9c78bef1f66fe9b1831723de8b4969f/

[Peter: dependency should only apply to COLLECTD_NOTIFY_EMAIL suboption]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in |    4 ++++
 package/libesmtp/Config.in |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 70b0439..daa9603 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -58,12 +58,16 @@ config BR2_PACKAGE_COLLECTD_LOGFILE
 
 config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	bool "notify_email"
+	depends on !BR2_PREFER_STATIC_LIB # libesmtp
 	select BR2_PACKAGE_LIBESMTP
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Send an E-mail with the notification message to the
 	  configured recipients.
 
+comment "notify_email needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_COLLECTD_SYSLOG
 	bool "syslog"
 	default y
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
