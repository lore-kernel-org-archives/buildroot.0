From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Apr 2014 17:25:10 -0300
Subject: [Buildroot] [PATCH] nmap: make ndiff conditional on python2
Message-ID: <1397766310-27745-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ndiff only works when target python2 is available, so disable it
completely when it's not. Fixes:
http://autobuild.buildroot.net/results/402/40269fd96a3b62fa187e9b26e5ab4ce4e7711f95/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nmap/nmap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 4ed39bf..c7e2225 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -21,4 +21,11 @@ else
 NMAP_CONF_OPT += --without-openssl
 endif
 
+# ndiff only works with python2.x
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+NMAP_DEPENDENCIES += python
+else
+NMAP_CONF_OPT += --without-ndiff
+endif
+
 $(eval $(autotools-package))
-- 
1.8.3.2
