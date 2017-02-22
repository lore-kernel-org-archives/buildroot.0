From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 21:33:21 +0100
Subject: [Buildroot] [git commit] berkeleydb: workaround m68k/coldfire issue
Message-ID: <20170222203346.DC2FD80401@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac8912579f469273b7163577ef71b5f76d7dba9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 http://autobuild.buildroot.net/results/40423aa6c8f6fe66c771cca3e09b21e15525eb5f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: rename BERKELEYDB_CONF_OPTS to BERKELEYDB_CONF_ENV.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/berkeleydb/berkeleydb.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e5c11bd..a315943 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -20,11 +20,18 @@ BERKELEYDB_BINARIES = db_archive db_checkpoint db_deadlock db_dump \
 	db_hotbackup db_load db_log_verify db_printlog db_recover db_replicate \
 	db_stat db_tuner db_upgrade db_verify
 
+# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
+ifeq ($(BR2_m68k_cf),y)
+BERKELEYDB_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
+endif
+
 # build directory can't be the directory where configure are there, so..
 define BERKELEYDB_CONFIGURE_CMDS
 	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		$(BERKELEYDB_CONF_ENV) \
 		../dist/configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
