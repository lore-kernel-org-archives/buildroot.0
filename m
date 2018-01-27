From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Jan 2018 23:41:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/berkeleydb: add security fix for
 CVE-2017-10140
Message-ID: <20180127224121.18181-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details read
https://security-tracker.debian.org/tracker/CVE-2017-10140

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/berkeleydb/0001-cwd-db_config.patch | 21 +++++++++++++++++++++
 package/berkeleydb/berkeleydb.hash          |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 package/berkeleydb/0001-cwd-db_config.patch

diff --git a/package/berkeleydb/0001-cwd-db_config.patch b/package/berkeleydb/0001-cwd-db_config.patch
new file mode 100644
index 0000000000..08ce5a3931
--- /dev/null
+++ b/package/berkeleydb/0001-cwd-db_config.patch
@@ -0,0 +1,21 @@
+Do not access DB_CONFIG when db_home is not set
+
+Fixes CVE-2017-10140:
+https://bugzilla.redhat.com/show_bug.cgi?id=1464032#c9
+
+Downloaded from
+http://pkgs.fedoraproject.org/cgit/rpms/libdb.git/commit/?id=8047fa8580659fcae740c25e91b490539b8453eb
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- db-5.3.28/src/env/env_open.c.old	2017-06-26 10:32:11.011419981 +0200
++++ db-5.3.28/src/env/env_open.c	2017-06-26 10:32:46.893721233 +0200
+@@ -473,7 +473,7 @@
+ 	env->db_mode = mode == 0 ? DB_MODE_660 : mode;
+ 
+ 	/* Read the DB_CONFIG file. */
+-	if ((ret = __env_read_db_config(env)) != 0)
++	if (env->db_home != NULL && (ret = __env_read_db_config(env)) != 0)
+ 		return (ret);
+ 
+ 	/*
diff --git a/package/berkeleydb/berkeleydb.hash b/package/berkeleydb/berkeleydb.hash
index e47c578cbe..7529329748 100644
--- a/package/berkeleydb/berkeleydb.hash
+++ b/package/berkeleydb/berkeleydb.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	76a25560d9e52a198d37a31440fd07632b5f1f8f9f2b6d5438f4bc3e7c9013ef  db-5.3.28.NC.tar.gz
+sha256	b78815181a53241f9347c6b47d1031fd669946f863e1edc807a291354cec024b  LICENSE
-- 
2.11.0
