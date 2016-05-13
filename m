From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 23:31:48 +0200
Subject: [Buildroot] [git commit branch/next] lft: new package
Message-ID: <20160513213322.B577781F9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d033022f593f297026a5babb19da79010d8c77f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: use complete license name in <pkg>_LICENSE, i.e "VOSTROM Public
License for Open Source".]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/lft/0001-no-strip.patch  | 19 +++++++++++++++++++
 package/lft/0002-no-incdir.patch | 27 +++++++++++++++++++++++++++
 package/lft/Config.in            | 10 ++++++++++
 package/lft/lft.hash             |  2 ++
 package/lft/lft.mk               | 19 +++++++++++++++++++
 6 files changed, 78 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 804df8b..8668612 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1426,6 +1426,7 @@ endif
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
 	source "package/leafnode2/Config.in"
+	source "package/lft/Config.in"
 	source "package/lftp/Config.in"
 	source "package/lighttpd/Config.in"
 	source "package/linknx/Config.in"
diff --git a/package/lft/0001-no-strip.patch b/package/lft/0001-no-strip.patch
new file mode 100644
index 0000000..f1bd700
--- /dev/null
+++ b/package/lft/0001-no-strip.patch
@@ -0,0 +1,19 @@
+Don't forcibly strip binaries, we do so on our own.
+Also using strip rather than $(STRIP) is bad when cross-compiling.
+
+Patch status: notified upstream.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura lft-3.74.orig/Makefile.in lft-3.74/Makefile.in
+--- lft-3.74.orig/Makefile.in	2016-05-03 14:11:30.965530923 -0300
++++ lft-3.74/Makefile.in	2016-05-03 14:11:42.120918849 -0300
+@@ -50,8 +50,6 @@
+ 
+ install: lft lft.8 whob whob.8
+ 	@echo "LFT and WhoB"
+-	@echo "  \_Stripping binaries"
+-	@strip lft whob
+ 	@echo "  \_Copying files to their intended destinations"
+ 	@test -d $(DESTDIR)$(bindir)/. || $(MKDIR) $(DESTDIR)$(bindir)
+ 	$(INSTALL) lft $(DESTDIR)$(bindir)/lft
diff --git a/package/lft/0002-no-incdir.patch b/package/lft/0002-no-incdir.patch
new file mode 100644
index 0000000..dbfaad5
--- /dev/null
+++ b/package/lft/0002-no-incdir.patch
@@ -0,0 +1,27 @@
+Don't pollute incdir with absolute directories, it's bad when
+cross-compiling.
+Patch configure directly since autoreconf isn't clean.
+
+Patch status: notified upstream.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura lft-3.74.orig/configure lft-3.74/configure
+--- lft-3.74.orig/configure	2016-05-03 14:11:30.964530888 -0300
++++ lft-3.74/configure	2016-05-03 14:12:45.038106775 -0300
+@@ -5732,15 +5732,6 @@
+ 
+ 
+ 
+-for incdir in /usr/local/include /usr/include
+-do
+-  if test -d $incdir/pcap
+-  then
+-    CFLAGS="$CFLAGS -I$incdir/pcap"
+-    CPPFLAGS="$CFLAGS -I$incdir/pcap"
+-  fi
+-done
+-
+ cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+ _ACEOF
diff --git a/package/lft/Config.in b/package/lft/Config.in
new file mode 100644
index 0000000..9ed7b8b
--- /dev/null
+++ b/package/lft/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LFT
+	bool "lft"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  LFT, short for Layer Four Traceroute, is a sort of
+	  'traceroute' that often works much faster (than the
+	  commonly-used Van Jacobson method) and goes through many
+	  configurations of packet-filters (firewalls).
+
+	  http://pwhois.org/lft/
diff --git a/package/lft/lft.hash b/package/lft/lft.hash
new file mode 100644
index 0000000..dc3945c
--- /dev/null
+++ b/package/lft/lft.hash
@@ -0,0 +1,2 @@
+# Locally calculated, matches download from fossies.org and pwhois.org
+sha256	d7f142b9198162a48dd41261f5982e5189b951e7746e171d6b2c5b9581f26000	lft-3.74.tar.gz
diff --git a/package/lft/lft.mk b/package/lft/lft.mk
new file mode 100644
index 0000000..0779300
--- /dev/null
+++ b/package/lft/lft.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# lft
+#
+################################################################################
+
+LFT_VERSION = 3.74
+# Download from pwhois.org is form-wrapped resulting in ugly filename
+LFT_SITE = https://fossies.org/linux/privat
+LFT_DEPENDENCIES = libpcap
+LFT_LICENSE = VOSTROM Public License for Open Source
+LFT_LICENSE_FILES = COPYING
+LFT_CONF_OPTS = --with-pcap=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LFT_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+endif
+
+$(eval $(autotools-package))
