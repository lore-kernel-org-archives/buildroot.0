From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Nov 2017 22:41:41 +0100
Subject: [Buildroot] [git commit] oracle-mysql: fix build with gcc 7.x
Message-ID: <20171120213453.CA0B280DF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=317b72f469867bd3e1765418e325515d6065d45f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adjusts an existing patch to also fix gcc 7.x build issues on the
server side of MySQL.

Fixes:

  http://autobuild.buildroot.net/results/9e3a0b5b8f2506fb2ce2fcc3d5d3a494a14439cb

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oracle-mysql/0008-gcc7.patch | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/package/oracle-mysql/0008-gcc7.patch b/package/oracle-mysql/0008-gcc7.patch
index 2cf6d26..321112d 100644
--- a/package/oracle-mysql/0008-gcc7.patch
+++ b/package/oracle-mysql/0008-gcc7.patch
@@ -4,15 +4,17 @@ mysql.cc: In function 'void build_completion_hash(bool, bool)':
 mysql.cc:2687:37: error: invalid conversion from 'char' to 'char*' [-fpermissive]
        field_names[i][num_fields*2]= '\0';
                                      ^~~~
-
 Patch was partly backported from upstream commit:
 https://github.com/mysql/mysql-server/commit/ae21683d980d5fe9e39bd0193827ea3604256eb9
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Thomas: add more gcc 7.x fixes in instance_map.cc.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-diff -uNr mysql-5.1.73.org/client/mysql.cc mysql-5.1.73/client/mysql.cc
---- mysql-5.1.73.org/client/mysql.cc	2013-11-04 19:52:27.000000000 +0100
-+++ mysql-5.1.73/client/mysql.cc	2017-05-13 19:52:10.125101101 +0200
+Index: b/client/mysql.cc
+===================================================================
+--- a/client/mysql.cc
++++ b/client/mysql.cc
 @@ -2684,7 +2684,7 @@
          mysql_free_result(fields);
          break;
@@ -22,3 +24,22 @@ diff -uNr mysql-5.1.73.org/client/mysql.cc mysql-5.1.73/client/mysql.cc
        j=0;
        while ((sql_field=mysql_fetch_field(fields)))
        {
+Index: b/server-tools/instance-manager/instance_map.cc
+===================================================================
+--- a/server-tools/instance-manager/instance_map.cc
++++ b/server-tools/instance-manager/instance_map.cc
+@@ -526,12 +526,12 @@
+              Options::Main::config_file);
+ 
+     argv_options[1]= defaults_file_arg;
+-    argv_options[2]= '\0';
++    argv_options[2]= NULL;
+ 
+     argc= 2;
+   }
+   else
+-    argv_options[1]= '\0';
++    argv_options[1]= NULL;
+ 
+   /*
+     If the routine failed, we'll simply fallback to defaults in
