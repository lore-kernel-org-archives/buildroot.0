From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  1 Jan 2015 12:39:56 +0100
Subject: [Buildroot] [PATCH] libevent: add optional dependency on OpenSSL
Message-ID: <1420112396-7686-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libevent can optionally use OpenSSL, so add an optional dependency on
this package to explicit this possibility. This makes sure libevent
always gets built with OpenSSL support when the OpenSSL package is
enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevent/libevent.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 607b7b2..30fcb5a 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -22,5 +22,12 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBEVENT_DEPENDENCIES += openssl
+LIBEVENT_CONF_OPTS += --enable-openssl
+else
+LIBEVENT_CONF_OPTS += --disable-openssl
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0
