From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:08:05 +0200
Subject: [Buildroot] [git commit] linuxptp: refactor with LINUXPTP_MAKE_{ENV,
	OPTS} variables
Message-ID: <20170706190530.3A84C80AD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3692b63fb1b94fe93b40336f97657d77bf0011bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since there is quite some duplication in the variables to be passed in
the make environment and as make options between the build and install
steps, this commit introduces LINUXPTP_MAKE_ENV and LINUXPTP_MAKE_OPTS
to avoid the duplication.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linuxptp/linuxptp.mk | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index d8bcc2b..6516659 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -10,27 +10,23 @@ LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
 LINUXPTP_LICENSE = GPL-2.0+
 LINUXPTP_LICENSE_FILES = COPYING
 
-define LINUXPTP_BUILD_CMDS
+LINUXPTP_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	KBUILD_OUTPUT=$(STAGING_DIR) \
-	$(MAKE) \
-		prefix=/usr \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
-		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		-C $(@D) all
+
+LINUXPTP_MAKE_OPTS = \
+	prefix=/usr \
+	EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+
+define LINUXPTP_BUILD_CMDS
+	$(LINUXPTP_MAKE_ENV) $(MAKE) $(LINUXPTP_MAKE_OPTS) -C $(@D) all
 endef
 
 define LINUXPTP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) \
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-	KBUILD_OUTPUT=$(STAGING_DIR) \
-	$(MAKE) \
-		prefix=/usr \
-		DESTDIR=$(TARGET_DIR) \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
-		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
-		-C $(@D) install
+	$(LINUXPTP_MAKE_ENV) $(MAKE) $(LINUXPTP_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) -C $(@D) install
 
 	$(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp.cfg \
 		$(TARGET_DIR)/etc/linuxptp.cfg
