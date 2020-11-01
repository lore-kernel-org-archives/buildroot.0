From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Nov 2020 13:15:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix util-linux-libs
 dependency
Message-ID: <20201101121536.1089498-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 2acaa86ce630f616b12aa92493e0269421c5bc97 replaced util-linux by
util-linux-libs but this raises the following build failure:

Makefile:585: *** util-linux-libs is in the dependency chain of libglib2 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

To fix this build failure, use util-linux or util-linux-libs depending
on BR2_PACKAGE_UTIL_LINUX_LIBS

Fixes:
 - http://autobuild.buildroot.org/results/8bf6360a343edd10c73a756ab86cdba727f9ea43

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglib2/libglib2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 43fcb27fae..6e9dbd7b26 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -86,8 +86,12 @@ endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
 LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS),y)
 LIBGLIB2_DEPENDENCIES += util-linux-libs
 else
+LIBGLIB2_DEPENDENCIES += util-linux
+endif
+else
 LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
 endif
 
-- 
2.28.0
