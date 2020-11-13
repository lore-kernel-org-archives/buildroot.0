From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri, 13 Nov 2020 16:15:58 +0100
Subject: [Buildroot] [PATCH] package/rauc: disable systemd for host build
Message-ID: <20201113151558.1041972-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since there is no necessity to have the support of systemd
within the host variant let's disable it unconditionally
to solve the following errors:

/usr/bin/install -c -m 644 data/rauc.service '/usr/lib/systemd/system'
/usr/bin/install: cannot create regular file '/usr/lib/systemd/system/rauc.service': Permission denied
/usr/bin/install -c -m 644 data/de.pengutronix.rauc.conf 'no'
make[4]: *** [Makefile:1700: install-nodist_systemdunitDATA] Error 1
make[4]: *** Waiting for unfinished jobs....

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/rauc/rauc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 61c50ab316..a6c7c01095 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -46,7 +46,8 @@ HOST_RAUC_CONF_OPTS += \
 	--disable-network \
 	--disable-json \
 	--disable-service \
-	--without-dbuspolicydir
+	--without-dbuspolicydir \
+	--with-systemdunitdir=no
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.29.2
