From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 16:22:20 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/swupdate: add
 optional systemd dependency
Message-ID: <20200408141053.898508DFA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ec50fbee5e27dbaa082da9636ee03c77213392a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
(cherry picked from commit bea0d20c7885df962bdb800189522931a3b129c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
