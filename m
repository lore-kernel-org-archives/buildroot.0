From: Aaron Sierra <asierra@xes-inc.com>
Date: Mon, 13 Jul 2020 20:24:59 -0500
Subject: [Buildroot] [PATCH v2] package/x11r7/xfont_font-*: make outputs
 reproducible
In-Reply-To: <20200713184751.23534-1-asierra@xes-inc.com>
References: <20200713184751.23534-1-asierra@xes-inc.com>
Message-ID: <20200714012459.21451-1-asierra@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to gzip 1.10, the compression pipeline used with PCF fonts was
not reproducible due to the implicit -N/--name injecting a timestamp:

  $ cat /path/to/file | gzip > /path/to/file.gz

This updates Portable Compiled Format font packages to have a host-gzip
dependency, so gzip version 1.10 or newer will reliably be used.

This change does not affect encodings, which use a seemingly synonymous
compression pipeline that happens to be reproducible with gzip versions
at least as old as version 1.3.13:

  $ gzip < /path/to/file > /path/to/file.gz

Reported-by: Jordan Speicher <jspeicher@xes-inc.com>
Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
Changes v1 -> v2:
  - Use host-gzip instead of converting to bzip2 for reproducibility

 .../xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk     | 7 ++++++-
 .../x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk | 7 ++++++-
 .../xfont_font-adobe-utopia-100dpi.mk                      | 7 ++++++-
 .../xfont_font-adobe-utopia-75dpi.mk                       | 7 ++++++-
 .../x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk | 7 ++++++-
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk | 7 ++++++-
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk   | 7 ++++++-
 .../xfont_font-bh-lucidatypewriter-100dpi.mk               | 7 ++++++-
 .../xfont_font-bh-lucidatypewriter-75dpi.mk                | 7 ++++++-
 .../xfont_font-bitstream-100dpi.mk                         | 7 ++++++-
 .../xfont_font-bitstream-75dpi.mk                          | 7 ++++++-
 .../xfont_font-cronyx-cyrillic.mk                          | 7 ++++++-
 .../x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk | 7 ++++++-
 .../x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk | 7 ++++++-
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk   | 7 ++++++-
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk | 7 ++++++-
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk   | 7 ++++++-
 .../x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk   | 7 ++++++-
 .../xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk   | 7 ++++++-
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk | 7 ++++++-
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk | 7 ++++++-
 .../xfont_font-schumacher-misc.mk                          | 7 ++++++-
 .../xfont_font-screen-cyrillic.mk                          | 7 ++++++-
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk | 7 ++++++-
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk   | 7 ++++++-
 .../xfont_font-winitzki-cyrillic.mk                        | 7 ++++++-
 26 files changed, 156 insertions(+), 26 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index bc05a2165c..2418769808 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_ADOBE_100DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index f77c1706cd..90e94d27cb 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_ADOBE_75DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 1c157dd4cf..83157f5c67 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index cd60b34fce..ac3bf2e230 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index e8f6f3d2e6..c867a60233 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_ARABIC_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_ARABIC_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index d1176d54e5..cc15738692 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_BH_100DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_BH_100DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 5b05f5f797..788a76a2b9 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_BH_75DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_BH_75DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index 4afec6ce69..2f055ddab9 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 7a36c11053..4166b2d741 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 9812ddc1b7..90d9e5bbb4 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_BITSTREAM_100DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index 91dfeb2ac8..deb99aa596 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -12,6 +12,11 @@ XFONT_FONT_BITSTREAM_75DPI_LICENSE_FILES = COPYING
 
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 28329a36bb..caca639c25 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -12,6 +12,11 @@ XFONT_FONT_CRONYX_CYRILLIC_LICENSE_FILES = COPYING
 
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 9e8852aeee..e752803086 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_CURSOR_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_CURSOR_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index f591b8b80b..f5bd941383 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -11,6 +11,11 @@ XFONT_FONT_DAEWOO_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index 10d24c6c57..1642b41352 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_DEC_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_DEC_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 721f93d80f..1393d67eae 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_ISAS_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_ISAS_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 1736aed179..78a5bbbf8e 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -11,6 +11,11 @@ XFONT_FONT_JIS_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_JIS_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 60105427df..b5da83f398 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_MICRO_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_MICRO_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 2263972084..8fa30ea314 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -12,6 +12,11 @@ XFONT_FONT_MISC_CYRILLIC_LICENSE_FILES = COPYING
 
 XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index dd62f05026..e03da6f1b5 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_MISC_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_MISC_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 475fc68b2a..6fcaa5dadc 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_MUTT_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_MUTT_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index b50ed57688..e07569d4b4 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_SCHUMACHER_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index dd444594ed..a254d4a756 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -12,6 +12,11 @@ XFONT_FONT_SCREEN_CYRILLIC_LICENSE_FILES = COPYING
 
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index ae4444e597..6e580fd922 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_SONY_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_SONY_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index c1e2dac72e..737cfb5c9b 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -12,6 +12,11 @@ XFONT_FONT_SUN_MISC_LICENSE_FILES = COPYING
 
 XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_SUN_MISC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 8e83d44665..e43cd1150f 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -12,6 +12,11 @@ XFONT_FONT_WINITZKI_CYRILLIC_LICENSE_FILES = COPYING
 
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/bin/mkfontdir install-data
-XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_bdftopcf
+XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = \
+	xfont_font-util \
+	host-xfont_font-util \
+	host-xapp_mkfontscale \
+	host-xapp_bdftopcf \
+	host-gzip
 
 $(eval $(autotools-package))
-- 
2.17.1
