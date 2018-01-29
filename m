From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 20:52:07 +0100
Subject: [Buildroot] [git commit] package/berkeleydb: add security fix for
 CVE-2017-10140
Message-ID: <20180129195543.437F287F9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b368023f7e166648f136244960608a0e009332d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-10140: Berkeley DB reads DB_CONFIG from cwd

For more details, see:
https://security-tracker.debian.org/tracker/CVE-2017-10140

And add license hash while we are at it.

[Peter: extend commit message]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/berkeleydb/0001-cwd-db_config.patch | 21 +++++++++++++++++++++
 package/berkeleydb/berkeleydb.hash          |  1 +
 2 files changed, 22 insertions(+)

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
