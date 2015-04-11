From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 09:52:16 +0200
Subject: [Buildroot] [PATCH 2/3] package/rsyslog: Fix linking against
	postgresql
In-Reply-To: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configure misses libm and libpthread when checking for postgresql.
Patching configure.ac did not fix the problem so we patch configure directly,
therefore autoreconf is not necessary.

Fixes
http://autobuild.buildroot.net/results/81e/81e6dd9d5bce3ecaa11765fb94ca538991b1e174/
http://autobuild.buildroot.net/results/0bd/0bdde92bd0e0fa163c4b6579ff69b7f6e61a8b19/
http://autobuild.buildroot.net/results/cab/cabf2352307de58ff357ee59bf273ee487a2b716/
http://autobuild.buildroot.net/results/8a3/8a31c815f113f610fb2cdbc4d27e5ade492be354/
http://autobuild.buildroot.net/results/d0f/d0fe409d23117ea2cea640b8d7ff6dbb7c33943a/
http://autobuild.buildroot.net/results/3ca/3ca2a7a38cf48e69fed888aecb8782687ad48c99/
http://autobuild.buildroot.net/results/3d3/3d326ba195682b6650ebabcedbe4b5d4fb5cf116/
http://autobuild.buildroot.net/results/456/456e75367b3a8e2eb9ad82478f3522e89f658912/
http://autobuild.buildroot.net/results/1b7/1b745408187b7655ae22942572367d7ed911973b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rsyslog/0001-pgsql.patch |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/rsyslog/0001-pgsql.patch

diff --git a/package/rsyslog/0001-pgsql.patch b/package/rsyslog/0001-pgsql.patch
new file mode 100644
index 0000000..15b1b93
--- /dev/null
+++ b/package/rsyslog/0001-pgsql.patch
@@ -0,0 +1,12 @@
+diff -uNr rsyslog-8.9.0.org/configure rsyslog-8.9.0/configure
+--- rsyslog-8.9.0.org/configure	2015-04-07 15:08:47.000000000 +0200
++++ rsyslog-8.9.0/configure	2015-04-11 09:44:23.649214912 +0200
+@@ -17385,7 +17385,7 @@
+   $as_echo_n "(cached) " >&6
+ else
+   ac_check_lib_save_LIBS=$LIBS
+-LIBS="-lpq -L`$PG_CONFIG --libdir`
++LIBS="-lm -lpthread -lpq -L`$PG_CONFIG --libdir`
+    $LIBS"
+ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
-- 
1.7.10.4
