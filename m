From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 13:02:04 +0100
Subject: [Buildroot] [git commit branch/next] htop: enable unicode if
	possible
Message-ID: <20161115120227.97CE581D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a75a1d36d235b8552e3f6989681d0a4f17acef64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
[Thomas:
 - use positive logic
 - use += instead of = in conditions.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/htop/htop.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 7409a78..adc5090 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -7,10 +7,15 @@
 HTOP_VERSION = 2.0.2
 HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-HTOP_CONF_OPTS = --disable-unicode
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/ncurses5-config
 HTOP_LICENSE = GPLv2
 HTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+HTOP_CONF_OPTS += --enable-unicode
+else
+HTOP_CONF_OPTS += --disable-unicode
+endif
+
 $(eval $(autotools-package))
