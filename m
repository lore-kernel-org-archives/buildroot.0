From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 16:37:48 +0100
Subject: [Buildroot] [git commit] libevent: add optional dependency on
	OpenSSL
Message-ID: <20150102153754.75F9180D94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81cbf0bf84bb62d1b40f9ea4e30296b5ef495556
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libevent can optionally use OpenSSL, so add an optional dependency on
this package to explicit this possibility. This makes sure libevent
always gets built with OpenSSL support when the OpenSSL package is
enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libevent/libevent.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
