From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:33:10 +0200
Subject: [Buildroot] [git commit] sngrep: fix ncurses wchar detection
Message-ID: <20170608193502.DA61C80407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cb4ab5cf99fe0b3a067fc89104f94c2d382da02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds an upstream patch to the sngrep package that fixes the
detection of wchar capable ncurses.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sngrep/sngrep.hash | 2 ++
 package/sngrep/sngrep.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index bc28545..5966d63 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1 +1,3 @@
+# Locally computed
 sha256 7385ac202de6d6a1feffb2fd514600563133d9dfa7fb47be052de839abcc1d52 sngrep-v1.4.3.tar.gz
+sha256 a3376abe20cca95a13ee88188ba5ba50425c93afc927cca018c50b0309ad21f9  4740f3341a99eaec105dee202a6fa7828212cdf1.patch
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 560872f..9dda158 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -14,8 +14,15 @@ SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 SNGREP_CONF_ENV += \
 	$(if $(BR2_STATIC_LIBS),LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --libs`")
 
-# our ncurses wchar support is not properly detected
+# This patch fixes ncurses wchar detection
+SNGREP_PATCH = \
+	https://github.com/irontec/sngrep/pull/191/commits/4740f3341a99eaec105dee202a6fa7828212cdf1.patch
+
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+SNGREP_CONF_OPTS += --enable-unicode
+else
 SNGREP_CONF_OPTS += --disable-unicode
+endif
 
 # openssl and gnutls can't be enabled at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
