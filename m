From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 15 Jan 2018 15:00:55 -0500
Subject: [Buildroot] [PATCH 1/1] libpqxx: apply upstream compilation fix
Message-ID: <20180115200055.6404-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply an upstream patch which addresses a compilation issue with respect
to an undefined 'timeval' structure. This issue exists in at least v6.0.
It is expected that this patch can be removed when libpqxx provides a
new releases (either v6.0.1 or v6.1).

Fixes:
http://autobuild.buildroot.net/results/48b015650ede4e55e199538072c7228cccf64422

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/libpqxx/libpqxx.hash | 1 +
 package/libpqxx/libpqxx.mk   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 372be603c5..6fc388fc89 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256	81cac92458efd799fadb0374107464320d93eba71de05aedf21afb9c8dda7c3a	libpqxx-6.0.0.tar.gz
 sha256	9e1c78fa302e4e9738bf3315b130429035c03fcb0f046531ccd977cb474f6b31	COPYING
+sha256	85881a11caab61f0c8d10cfef673e48c86e701f5a9fdd6cb344aa4f4beb1f2bf	44970d7331e4f369e160af0135a2d1fc16f27a21.patch
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index ccafa9ce71..23b0953735 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -11,6 +11,13 @@ LIBPQXX_DEPENDENCIES = postgresql
 LIBPQXX_LICENSE = BSD-3-Clause
 LIBPQXX_LICENSE_FILES = COPYING
 
+# pull build-fix patch from upstream to address timeval issues (until ~v6.0.1)
+#
+# fixes:
+#  http://autobuild.buildroot.net/results/48b015650ede4e55e199538072c7228cccf64422
+LIBPQXX_PATCH = \
+    https://github.com/jtv/libpqxx/commit/44970d7331e4f369e160af0135a2d1fc16f27a21.patch
+
 LIBPQXX_CONF_ENV += ac_cv_path_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
 
 $(eval $(autotools-package))
-- 
2.13.3.windows.1
