From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:44:45 +0100
Subject: [Buildroot] [git commit] package/openobex: fix broken download URL,
	add hash
Message-ID: <20160207144813.6E50E817D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c932f8d8d5d540fcfbe58d1b6c117ff12e022546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openobex/Config.in     |  2 +-
 package/openobex/openobex.hash |  3 +++
 package/openobex/openobex.mk   | 12 ++++++++++--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/openobex/Config.in b/package/openobex/Config.in
index 5f606fe..2b8cf38 100644
--- a/package/openobex/Config.in
+++ b/package/openobex/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_OPENOBEX
 	  Free open source implementation of the Object Exchange (OBEX)
 	  protocol.
 
-	  http://www.openobex.org
+	  http://sourceforge.net/projects/openobex
 
 if BR2_PACKAGE_OPENOBEX
 
diff --git a/package/openobex/openobex.hash b/package/openobex/openobex.hash
new file mode 100644
index 0000000..2aef981
--- /dev/null
+++ b/package/openobex/openobex.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/openobex/files/openobex/1.5/
+sha1	5332ef95bc8b321bda675cdb74379804c6c1a83f	openobex-1.5.0-Source.zip
+md5	f6d87af55a1d702d582173c81619176e		openobex-1.5.0-Source.zip
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
index 82bfd43..b50dbb7 100644
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-OPENOBEX_VERSION = 1.5
-OPENOBEX_SITE = http://ftp.osuosl.org/pub/linux/bluetooth
+OPENOBEX_VERSION_MAJOR = 1.5
+OPENOBEX_VERSION = $(OPENOBEX_VERSION_MAJOR).0
+OPENOBEX_SITE = http://downloads.sourceforge.net/project/openobex/openobex/$(OPENOBEX_VERSION_MAJOR)
+OPENOBEX_SOURCE = openobex-$(OPENOBEX_VERSION)-Source.zip
 # Libraries seems to be released under LGPLv2.1+,
 # while other material is under GPLv2+.
 OPENOBEX_LICENSE = GPLv2+/LGPLv2.1+
@@ -15,6 +17,12 @@ OPENOBEX_DEPENDENCIES = host-pkgconf
 OPENOBEX_AUTORECONF = YES
 OPENOBEX_INSTALL_STAGING = YES
 
+define OPENOBEX_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(OPENOBEX_SOURCE)
+	mv $(@D)/openobex-$(OPENOBEX_VERSION)-Source/* $(@D)
+	$(RM) -r $(@D)/openobex-$(OPENOBEX_VERSION)-Source
+endef
+
 OPENOBEX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOBEX_APPS),--enable-apps) \
 	$(if $(BR2_PACKAGE_OPENOBEX_SYSLOG),--enable-syslog) \
