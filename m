From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 21 Apr 2017 23:31:04 +0200
Subject: [Buildroot] [PATCH] package/expedite: fix build issue with C89
Message-ID: <20170421213104.1477-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The code use for loop initial declarations which are only allowed in
C99 mode. Use the default compiler version (gnu99) used by gcc 5+ to
workaround some build issues with C99.

Fixes:
http://autobuild.buildroot.net/results/ed8/ed840755e8e486e48eab8c13a8bb5e9a448199ce

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/expedite/expedite.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index d49e87a..9aa6a4a 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -15,6 +15,11 @@ EXPEDITE_DEPENDENCIES = host-efl host-pkgconf efl
 # There is no configure script in the git tree.
 EXPEDITE_AUTORECONF = YES
 
+# The code use for loop initial declarations which are only allowed in
+# C99 mode. Use the default compiler version (gnu99) used by gcc 5+ to
+# workaround some build issues with C99.
+EXPEDITE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
 ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
 EXPEDITE_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
-- 
2.9.3
