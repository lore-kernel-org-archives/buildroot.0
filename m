From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:01:39 +0200
Subject: [Buildroot] [git commit] package/swupdate: add optional systemd
 dependency
Message-ID: <20200404205003.394668B72B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bea0d20c7885df962bdb800189522931a3b129c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the swupdate SYSTEMD option is enabled, systemd needs to be built
before swupdate, otherwise the build fails with:

core/notifier.c:27:10: fatal error: systemd/sd-daemon.h: No such file or directory
   27 | #include <systemd/sd-daemon.h>
      |          ^~~~~~~~~~~~~~~~~~~~~

Of course, it remains up to the user to make sure that the systemd
package is enabled when systemd support is enabled in the swupdate
configuration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/swupdate.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 237a44e233..2b51edb66d 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -110,6 +110,10 @@ SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SWUPDATE_DEPENDENCIES += systemd
+endif
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS),y)
 SWUPDATE_DEPENDENCIES += uboot-tools
 SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
