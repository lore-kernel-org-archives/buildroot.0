From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:21 +0200
Subject: [Buildroot] [PATCH 05/30] package/policycoreutils: don't pass
 DESTDIR when building host variant
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DESTDIR was needed before upstream commit
6b901a4fb80cc61c46f75144b5bb366b8da38e82 ("policycoreutils: build:
follow standard semantics for DESTDIR and PREFIX"), but now the proper
semantic is used for DESTDIR and PREFIX.

However, in addition to the PREFIX that is already passed, we also
need to pass ETCDIR and SBINDIR, which are not defined in terms of
PREFIX.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/policycoreutils.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 9c50b02a9e..9114b152eb 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -64,15 +64,14 @@ HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
 # See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
-# We need to pass DESTDIR at build time because it's used by
-# policycoreutils build system to find headers and libraries.
 # We also need to pass PREFIX because it defaults to $(DESTDIR)/usr
 HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
 	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
-	DESTDIR=$(HOST_DIR) \
-	PREFIX=$(HOST_DIR)
+	PREFIX=$(HOST_DIR) \
+	ETCDIR=$(HOST_DIR)/etc \
+	SBINDIR=$(HOST_DIR)/sbin
 
 # Note: We are only building the programs required by the refpolicy build
 HOST_POLICYCOREUTILS_MAKE_DIRS = \
-- 
2.21.0
