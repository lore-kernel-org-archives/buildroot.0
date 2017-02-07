From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 17:40:15 +0100
Subject: [Buildroot] [git commit] logrotate: enable selinux support
Message-ID: <20170207164039.03F287FA9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61c8273e2357f6aab202f6c8653f85f21c3c4f7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Selinux is currently disabled staticly in logrotate. This patch fixes
this by checking for libselinux and adding it as a dependecy if it has
been selected.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/logrotate/logrotate.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 7828870..5fd779e 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -12,7 +12,13 @@ LOGROTATE_DEPENDENCIES = popt host-pkgconf
 # tarball does not have a generated configure script
 LOGROTATE_AUTORECONF = YES
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
-LOGROTATE_CONF_OPTS = --without-selinux
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LOGROTATE_CONF_OPTS += --with-selinux
+LOGROTATE_DEPENDENCIES += libselinux
+else
+LOGROTATE_CONF_OPTS += --without-selinux
+endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 LOGROTATE_DEPENDENCIES += acl
