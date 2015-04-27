From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Apr 2015 22:35:57 +0200
Subject: [Buildroot] [git commit] civetweb: use TARGET_CONFIGURE_OPTS
Message-ID: <20150427203640.9AD5F819D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea94747798a6c0c61c261bc3296417bb12d43d98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of explicitly handling CC/LD/CFLAGS. No functional change, but it is
cleaner like this.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/civetweb/civetweb.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 496eef8..d29765b 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -10,7 +10,7 @@ CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 
 CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1
-CIVETWEB_COPT = $(TARGET_CFLAGS) -DHAVE_POSIX_FALLOCATE=0
+CIVETWEB_COPT = -DHAVE_POSIX_FALLOCATE=0
 CIVETWEB_LIBS = -lpthread -lm
 CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
@@ -29,13 +29,13 @@ CIVETWEB_COPT += -DNO_SSL
 endif
 
 define CIVETWEB_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) build \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) build \
 		$(CIVETWEB_CONF_OPTS) \
 		COPT="$(CIVETWEB_COPT)" LIBS="$(CIVETWEB_LIBS)"
 endef
 
 define CIVETWEB_INSTALL_TARGET_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D) install \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
 		DOCUMENT_ROOT="$(CIVETWEB_HTMLDIR)" \
 		CONFIG_FILE2="$(CIVETWEB_SYSCONFDIR)/civetweb.conf" \
 		HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
