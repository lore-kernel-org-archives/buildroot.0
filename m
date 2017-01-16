From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:17:20 +0100
Subject: [Buildroot] [git commit] tslib: disable raw input plugin under
	kernel < v3.12
Message-ID: <20170116124620.D44417FB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46d6aa520f2490928f27da716356b00da357cc99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SYN_CNT input code was added in kernel v3.12.

Fixes:
http://autobuild.buildroot.net/results/5cd/5cdb9d22092e9222cc7e8fe8dd3936305a5d371d/
http://autobuild.buildroot.net/results/211/2115038caff1e036cbc9dcb5cb6905abe643552a/
http://autobuild.buildroot.net/results/c79/c79de6fdd5cfe406979941790276296b6d1ec0b8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index d6e66b7..7f74ca5 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -13,4 +13,8 @@ TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12),)
+TSLIB_CONF_OPTS += --disable-input
+endif
+
 $(eval $(autotools-package))
