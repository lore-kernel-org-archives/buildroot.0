From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:56:58 +0100
Subject: [Buildroot] [git commit] package/polkit: support different
 authentication frameworks
Message-ID: <20191208145140.4501F88972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cd65cdbbd591a3120fb4053887261857c57e1c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pam if available, otherwise use shadow.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/polkit.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 507d1865fa..7791d23d19 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -13,13 +13,17 @@ POLKIT_INSTALL_STAGING = YES
 
 POLKIT_DEPENDENCIES = libglib2 host-intltool expat spidermonkey
 
-# We could also support --with-authfw=pam
 POLKIT_CONF_OPTS = \
-	--with-authfw=shadow \
 	--with-os-type=unknown \
 	--disable-man-pages \
 	--disable-examples \
 	--disable-libelogind \
 	--disable-libsystemd-login
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+POLKIT_CONF_OPTS += --with-authfw=pam
+else
+POLKIT_CONF_OPTS += --with-authfw=shadow
+endif
+
 $(eval $(autotools-package))
