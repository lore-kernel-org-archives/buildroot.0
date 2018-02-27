From: Christopher McCrory <chrismcc@gmail.com>
Date: Tue, 27 Feb 2018 04:39:23 -0800
Subject: [Buildroot] [PATCH 2/3] bind config files
In-Reply-To: <20180227123924.20725-1-chrismcc@gmail.com>
References: <20180227123924.20725-1-chrismcc@gmail.com>
Message-ID: <20180227123924.20725-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Snag config files from FreeBSD ports and use those for a working DNS system

( Not sure what to add for Licensing )

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/bind/bind.hash |  4 ++++
 package/bind/bind.mk   | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 199db704fe..c98442423a 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,3 +1,7 @@
 # Verified from http://ftp.isc.org/isc/bind9/9.11.2-P1/bind-9.11.2-P1.tar.gz.sha256.asc
 sha256 cec31548832fca3f85d95178d4019b7d702039e8595d4c93914feba337df1212 bind-9.11.2-P1.tar.gz
 sha256 d3906dfe153e2c48440d3ca1d5319f5e89b4b820cdfc5d0779c23d7ac2b175e9 COPYRIGHT
+sha256 ba341abfa4066dd2b72442142f7fe2ccb9f3793cf29856b822545c2745ffa978 empty.db
+sha256 6b19177db479e2f5f287c9d1f83e2ae6a503e3fb1e74d1f19513dddf8c8aee75 named.conf.in
+sha256 c4894aa07da2b8460afd595694794708ad7753892c39c4177a2f89de2d72b945 named.root
+sha256 a13ccc8a9d6a5a0ee4b2cce34b927a60fc4b60216e172e660bb28c803f09d416 localhost-forward.db
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 392ef321c2..886cf5d66e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -6,6 +6,10 @@
 
 BIND_VERSION = 9.11.2-P1
 BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
+BIND_EXTRA_DOWNLOADS = https://svn.freebsd.org/ports/head/dns/bind912/files/empty.db
+BIND_EXTRA_DOWNLOADS += https://svn.freebsd.org/ports/head/dns/bind912/files/named.root https://svn.freebsd.org/ports/head/dns/bind912/files/localhost-forward.db https://svn.freebsd.org/ports/head/dns/bind912/files/named.conf.in
+BIND_EXTRA_DOWNLOADS += https://svn.freebsd.org/ports/head/dns/bind912/files/localhost-forward.db https://svn.freebsd.org/ports/head/dns/bind912/files/named.conf.in
+BIND_EXTRA_DOWNLOADS += https://svn.freebsd.org/ports/head/dns/bind912/files/named.conf.in
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
@@ -113,6 +117,34 @@ ifeq ($(BR2_PACKAGE_BIND_TOOLS),)
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
 endif
 
+define BIND_POST_DOWNLOAD_CONF_FILES
+	$(INSTALL) -m 0755 -d $(@D)/BR2
+	$(INSTALL) -m 0644 -D $(DL_DIR)/empty.db $(@D)/BR2/
+	$(INSTALL) -m 0644 -D $(DL_DIR)/named.root $(@D)/BR2/
+	$(INSTALL) -m 0644 -D $(DL_DIR)/localhost-forward.db $(@D)/BR2/
+	$(INSTALL) -m 0644 -D $(DL_DIR)/named.conf.in $(@D)/BR2/
+	sed -f $(BIND_PKGDIR)/configs.sed \
+	    $(@D)/BR2/named.conf.in > $(@D)/BR2/named.conf
+endef
+BIND_POST_DOWNLOAD_HOOKS += BIND_POST_DOWNLOAD_CONF_FILES
+
+define BIND_POST_INSTALL_CONFIG_FILES
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/bind/{,master}
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/named/{,slave,dynamic}
+	$(INSTALL) -m 0644 -D $(@D)/BR2/empty.db $(TARGET_DIR)/etc/bind/master
+	$(INSTALL) -m 0644 -D $(@D)/BR2/named.root $(TARGET_DIR)/etc/bind/master
+	$(INSTALL) -m 0644 -D $(@D)/BR2/localhost-forward.db $(TARGET_DIR)/etc/bind/master
+	$(INSTALL) -m 0644 -D $(@D)/BR2/named.conf.in $(TARGET_DIR)/etc/bind/
+	$(INSTALL) -m 0644 -D $(@D)/BR2/named.conf $(TARGET_DIR)/etc/bind/
+endef
+BIND_POST_INSTALL_TARGET_HOOKS += BIND_POST_INSTALL_CONFIG_FILES
+
+define BIND_PERMISSIONS
+	/var/named d 0755 named named - - - - -
+	/var/named/dynamic d 0755 named named - - - - -
+	/var/named/slave d 0755 named named - - - - -
+endef
+
 define BIND_USERS
 	named -1 named -1 * /etc/bind - - BIND daemon
 endef
-- 
2.14.3
