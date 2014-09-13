From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 23:55:51 +0200
Subject: [Buildroot] [git commit] procps-ng: Fix installation and take
	precedence over busybox
Message-ID: <20140913215639.2602A9D68A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b33a9531c4e64a53bfe9fbd59ef454ebd5128e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently procps-ng binaries are installed under $(TARGET_DIR)/usr/usr
instead of $(TARGET_DIR)/usr, which would be the expected. This is
caused because the default value of the --exec-prefix configure option
is /usr, and Buildroot always adds --prefix=/usr to the configure
option. We fix this by setting --exec-prefix to an empty value.

At the same time we make sure the procps-ng binaries have precedence
over the busybox ones.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos.Chandras <Markos.Chandras@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procps-ng/procps-ng.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index c327b4f..cedd667 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -13,9 +13,19 @@ PROCPS_NG_INSTALL_STAGING = YES
 
 PROCPS_NG_DEPENDENCIES = ncurses
 
+# If both procps-ng and busybox are selected, make certain procps-ng
+# wins the fight over who gets to have their utils actually installed.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+PROCPS_NG_DEPENDENCIES += busybox
+endif
+
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 PROCPS_NG_DEPENDENCIES += gettext
 PROCPS_NG_CONF_OPT += LIBS=-lintl
 endif
 
+# We need this to make procps-ng binaries installed in $(TARGET_DIR)/usr
+# instead of $(TARGET_DIR)/usr/usr
+PROCPS_NG_CONF_OPT += --exec-prefix=
+
 $(eval $(autotools-package))
