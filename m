From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Sep 2019 20:04:56 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: don't pass
 DESTDIR when building host variant
Message-ID: <20190922180710.AB4CF8F116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48f77b20c51c5eef0cca7dbc97d9c31be4c4d009
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DESTDIR was needed before upstream commit
6b901a4fb80cc61c46f75144b5bb366b8da38e82 ("policycoreutils: build:
follow standard semantics for DESTDIR and PREFIX"), but now the proper
semantic is used for DESTDIR and PREFIX.

However, in addition to the PREFIX that is already passed, we also
need to pass ETCDIR and SBINDIR, which are not defined in terms of
PREFIX.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
