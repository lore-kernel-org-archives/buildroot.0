From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jun 2016 21:10:07 +0200
Subject: [Buildroot] [git commit] lft: bump to version 3.76
Message-ID: <20160623191635.DB473802A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb91add36b677079be75c5706eddb748e7a19880
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches, and disable strip via the STRIP make environment
variable.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lft/0001-no-strip.patch  | 19 -------------------
 package/lft/0002-no-incdir.patch | 27 ---------------------------
 package/lft/lft.hash             |  2 +-
 package/lft/lft.mk               |  3 ++-
 4 files changed, 3 insertions(+), 48 deletions(-)

diff --git a/package/lft/0001-no-strip.patch b/package/lft/0001-no-strip.patch
deleted file mode 100644
index f1bd700..0000000
--- a/package/lft/0001-no-strip.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Don't forcibly strip binaries, we do so on our own.
-Also using strip rather than $(STRIP) is bad when cross-compiling.
-
-Patch status: notified upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura lft-3.74.orig/Makefile.in lft-3.74/Makefile.in
---- lft-3.74.orig/Makefile.in	2016-05-03 14:11:30.965530923 -0300
-+++ lft-3.74/Makefile.in	2016-05-03 14:11:42.120918849 -0300
-@@ -50,8 +50,6 @@
- 
- install: lft lft.8 whob whob.8
- 	@echo "LFT and WhoB"
--	@echo "  \_Stripping binaries"
--	@strip lft whob
- 	@echo "  \_Copying files to their intended destinations"
- 	@test -d $(DESTDIR)$(bindir)/. || $(MKDIR) $(DESTDIR)$(bindir)
- 	$(INSTALL) lft $(DESTDIR)$(bindir)/lft
diff --git a/package/lft/0002-no-incdir.patch b/package/lft/0002-no-incdir.patch
deleted file mode 100644
index dbfaad5..0000000
--- a/package/lft/0002-no-incdir.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Don't pollute incdir with absolute directories, it's bad when
-cross-compiling.
-Patch configure directly since autoreconf isn't clean.
-
-Patch status: notified upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura lft-3.74.orig/configure lft-3.74/configure
---- lft-3.74.orig/configure	2016-05-03 14:11:30.964530888 -0300
-+++ lft-3.74/configure	2016-05-03 14:12:45.038106775 -0300
-@@ -5732,15 +5732,6 @@
- 
- 
- 
--for incdir in /usr/local/include /usr/include
--do
--  if test -d $incdir/pcap
--  then
--    CFLAGS="$CFLAGS -I$incdir/pcap"
--    CPPFLAGS="$CFLAGS -I$incdir/pcap"
--  fi
--done
--
- cat >conftest.$ac_ext <<_ACEOF
- /* confdefs.h.  */
- _ACEOF
diff --git a/package/lft/lft.hash b/package/lft/lft.hash
index dc3945c..714b7bd 100644
--- a/package/lft/lft.hash
+++ b/package/lft/lft.hash
@@ -1,2 +1,2 @@
 # Locally calculated, matches download from fossies.org and pwhois.org
-sha256	d7f142b9198162a48dd41261f5982e5189b951e7746e171d6b2c5b9581f26000	lft-3.74.tar.gz
+sha256	fa163f8eaa9c27e12ecf533e79d8606895a301d2a75b9a77f0df29ef9a20c561	lft-3.76.tar.gz
diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index 24e6a10..d2b82b2 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LFT_VERSION = 3.74
+LFT_VERSION = 3.76
 LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM Public License for Open Source
 LFT_LICENSE_FILES = COPYING
 LFT_CONF_OPTS = --with-pcap=$(STAGING_DIR)/usr
+LFT_MAKE_ENV = STRIP=true
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LFT_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
