From: jeroen.de.wachter at telenet.be <jeroen.de.wachter@telenet.be>
Date: Fri, 22 Nov 2013 19:10:19 +0100 (CET)
Subject: [Buildroot] [PATCH 1/1] Add support to set the default port for
 dropbear to listen on
Message-ID: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A menu entry has been added to set the port. This menu entry
is processed like entries that were already present and will
rewrite one line of the options.h file that is used by
dropbear during compilation.

Signed-off-by: Jeroen De Wachter <jeroen.de_wachter@alcatel-lucent.com>
---
 package/dropbear/Config.in   |   11 +++++++++++
 package/dropbear/dropbear.mk |    6 ++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 68c3b71..f266567 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -36,4 +36,15 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
          Enable logging of dropbear access to lastlog. Notice that
          Buildroot does not generate lastlog by default.

+config BR2_PACKAGE_DROPBEAR_DEFPORT
+       int "Default port"
+       default "22"
+       depends on BR2_PACKAGE_DROPBEAR
+       help
+         Default port for dropbear to listen on. Can be overruled
+         by command line option. The default init script calls the
+         binary without parameters so if you want to use the
+         default script, this is a good way of setting a
+         non-standard port.
+
 endif
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 7fa9273..84c34be 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -39,6 +39,10 @@ define DROPBEAR_BUILD_FEATURED
        $(SED) 's:.*\(#define DROPBEAR_SHA2_512_HMAC\).*:\1:' $(@D)/options.h
 endef

+define DROPBEAR_SET_DEFPORT
+       $(SED) 's:.*\(#define DROPBEAR_DEFPORT\).*:\1 "$(BR2_PACKAGE_DROPBEAR_DEFPORT)":' $(@D)/options.h
+endef
+
 define DROPBEAR_DISABLE_STANDALONE
        $(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
 endef
@@ -72,6 +76,8 @@ ifneq ($(BR2_PACKAGE_DROPBEAR_LASTLOG),y)
 DROPBEAR_CONF_OPT += --disable-lastlog
 endif

+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SET_DEFPORT
+
 define DROPBEAR_INSTALL_TARGET_CMDS
        $(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
        for f in $(DROPBEAR_TARGET_BINS); do \
--
1.7.1
