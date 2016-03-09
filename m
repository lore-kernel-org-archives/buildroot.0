From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:48 +0100
Subject: [Buildroot] [PATCH v7 07/18] package/pkgconf: make the pkg-config
	wrapper relocatable
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change refactors the pkg-config wrapper template and the way it is filled
in a way there is no longer hard-coded paths to the staging directory; so it
is now fully relocatable.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
change v6->v7:
- new patch
---
 package/pkgconf/pkg-config.in | 4 +++-
 package/pkgconf/pkgconf.mk    | 8 ++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)
 mode change 100644 => 100755 package/pkgconf/pkg-config.in

diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
old mode 100644
new mode 100755
index 4dec487..aa4e484
--- a/package/pkgconf/pkg-config.in
+++ b/package/pkgconf/pkg-config.in
@@ -1,2 +1,4 @@
 #!/bin/sh
-PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf @STATIC@ $@
+STAGING_DIR="$(readlink -f "$(dirname "$0")/../..")/@STAGING_SUBDIR@"
+TARGET_PKG_CONFIG_LIBDIR="$( echo @PKG_CONFIG_LIBDIR@ | sed -e "s@^@${STAGING_DIR}/@ ; s@:@:${STAGING_DIR}/@g" )"
+PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${TARGET_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${STAGING_DIR}} $(dirname $0)/pkgconf @STATIC@ $@
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index c8b0cba..d27672c 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -19,8 +19,12 @@ endef
 define HOST_PKGCONF_INSTALL_WRAPPER
 	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
 		$(HOST_DIR)/usr/bin/pkg-config
-	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
-		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
+	# @PKG_CONFIG_LIBDIR@ is a colon-separated list of paths to search.
+	# These paths are relative to the root of the staging directory; they will
+	# be automatically prefixed with the staging directory path by the wrapper
+	# at runtime to ensure its relocatability.
+	$(SED) 's, at PKG_CONFIG_LIBDIR@,/usr/lib/pkgconfig:/usr/share/pkgconfig,' \
+		-e 's, at STAGING_SUBDIR@,$(STAGING_SUBDIR),' \
 		$(HOST_DIR)/usr/bin/pkg-config
 endef
 
-- 
2.7.2
