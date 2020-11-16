From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 16:06:00 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/rauc: disable
 systemd for host build
Message-ID: <20201116145234.7460380DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=717537320544e484189096ddf358cceb60316f79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Since there is not necessary to have support of systemd within the host
variant let's disable it unconditionally to solve the following errors:

/usr/bin/install -c -m 644 data/rauc.service '/usr/lib/systemd/system'
/usr/bin/install: cannot create regular file '/usr/lib/systemd/system/rauc.service': Permission denied
/usr/bin/install -c -m 644 data/de.pengutronix.rauc.conf 'no'
make[4]: *** [Makefile:1700: install-nodist_systemdunitDATA] Error 1
make[4]: *** Waiting for unfinished jobs....

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit abeebe1ea84ef56608b09d07b724a39da4f35fa5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 8080180a48..7e09ba9a8d 100644
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
