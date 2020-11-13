From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri, 13 Nov 2020 13:26:05 +0100
Subject: [Buildroot] [PATCH] package/rauc: fix host build with systemd
Message-ID: <20201113122605.901352-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, autotools pkg infra doesn't pass
DESTDIR variable to the host make env which causes
errors during the package install step because it
tries to install files into its own system
instead of host directory.

That fixes the following errors:
  /usr/bin/install -c -m 644 data/rauc.service '/usr/lib/systemd/system'
  /usr/bin/install: cannot create regular file '/usr/lib/systemd/system/rauc.service': Permission denied
  /usr/bin/install -c -m 644 data/de.pengutronix.rauc.conf 'no'
  make[4]: *** [Makefile:1700: install-nodist_systemdunitDATA] Error 1
  make[4]: *** Waiting for unfinished jobs....

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/rauc/rauc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 61c50ab316..3cd1c85ee7 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -36,6 +36,10 @@ define RAUC_INSTALL_INIT_SYSTEMD
 		>$(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d/buildroot-enable.conf
 endef
 
+HOST_RAUC_MAKE_ENV = \
+	$(HOST_MAKE_ENV) \
+	DESTDIR=$(STAGING_DIR)
+
 HOST_RAUC_DEPENDENCIES = \
 	host-pkgconf \
 	host-openssl \
-- 
2.29.2
