From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Mar 2017 23:43:22 +0100
Subject: [Buildroot] [PATCH] putty: needs wchar support
Message-ID: <1488667402-13906-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

putty uses mbstate_t, which is a wchar related definition, so wchar
support is needed in the toolchain.

Fixes:

  http://autobuild.buildroot.net/results/0e3f4306513b79306d43338eced890205632c395/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/putty/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/putty/Config.in b/package/putty/Config.in
index fe5b9eb..420a753 100644
--- a/package/putty/Config.in
+++ b/package/putty/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_PUTTY
 	bool "putty"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
 	help
 	  PuTTY is a free SSH and Telnet client. Without GTK2 activated,
 	  only the commandline tools plink, pscp, psftp, and puttygen are
 	  built; enable GTK2 for the graphical client.
 
 	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
+
+comment "putty needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
-- 
2.7.4
