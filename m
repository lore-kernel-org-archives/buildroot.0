From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 14:11:13 +0100
Subject: [Buildroot] [git commit] package/wine: add gettext dependency for
 host-wine only with NLS enabled
Message-ID: <20190206131005.E1AD7867CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb0f65099b62fc51e920a2b974615536e944ec70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Checked that host-wine compiles ok without host-gettext, so no needs
to specify this dependency.

libgettextpo is required by tools/wrc
(https://linux.die.net/man/1/wrc) which allows to convert windows
resources also to *.po format, which is not needed if NLS is disabled.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/wine.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 78c8e6ab63..7e44e3c81d 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -307,8 +307,12 @@ WINE_CONF_OPTS += --without-zlib
 endif
 
 # host-gettext is essential for .po file support in host-wine wrc
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 HOST_WINE_DEPENDENCIES += host-gettext
 HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
+else
+HOST_WINE_CONF_OPTS += --without-gettext --without-gettextpo
+endif
 
 # Wine needs to enable 64-bit build tools on 64-bit host
 ifeq ($(HOSTARCH),x86_64)
