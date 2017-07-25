From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 23:45:34 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] libmemcached: fix build
	with gcc 7.x
Message-ID: <20170725222211.45C3682147@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96e67282fc7958937794d43dacaf285df5516e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

This commit adds a patch to the libmemcached package that fixes the
build with gcc 7.x. Since libmemcached is barely maintained upstream,
the patch comes from the Fedora packages.

Fixes:

  http://autobuild.buildroot.net/results/872b8e0e6a24cbc96e3ad9e0b8b47acdf6160ce0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8786ac28058aa553cfa8adc176952143af630af6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-fix-pointer-comparaison.patch             | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libmemcached/0005-fix-pointer-comparaison.patch b/package/libmemcached/0005-fix-pointer-comparaison.patch
new file mode 100644
index 0000000..c9f8dd1
--- /dev/null
+++ b/package/libmemcached/0005-fix-pointer-comparaison.patch
@@ -0,0 +1,30 @@
+Fix pointer comparaison
+
+opt_servers is a pointer, not a boolean, so testing against false to
+know if the pointer is NULL no longer works with the more strict gcc
+7.x checks.
+
+[Taken from http://pkgs.fedoraproject.org/cgit/rpms/libmemcached.git/plain/libmemcached-build.patch.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff -up ./clients/memflush.cc.old ./clients/memflush.cc
+--- ./clients/memflush.cc.old	2017-02-12 10:12:59.615209225 +0100
++++ ./clients/memflush.cc	2017-02-12 10:13:39.998382783 +0100
+@@ -39,7 +39,7 @@ int main(int argc, char *argv[])
+ {
+   options_parse(argc, argv);
+ 
+-  if (opt_servers == false)
++  if (!opt_servers)
+   {
+     char *temp;
+ 
+@@ -48,7 +48,7 @@ int main(int argc, char *argv[])
+       opt_servers= strdup(temp);
+     }
+ 
+-    if (opt_servers == false)
++    if (!opt_servers)
+     {
+       std::cerr << "No Servers provided" << std::endl;
+       exit(EXIT_FAILURE);
