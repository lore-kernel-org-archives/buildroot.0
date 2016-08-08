From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 8 Aug 2016 22:41:51 +0530
Subject: [Buildroot] [PATCH 2/2] lftp: fix static link with readline
In-Reply-To: <1470676311-12729-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470676311-12729-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1470676311-12729-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When readline is static library, we need to link against ncurses,
it is because, dependent library's symbols are not resolved when
static library is built. Those symbols are resolved when binary tries
to link with static library.

We can't pass linker flags for ncurses by setting LIBS environment
variable via <PKG>_CONF_ENV because it looks like build system is not
taking that into account and even though it would have been, order of
linking is important.

We can't also pass linker flags for ncurses via --with-readline-libs
conf options because it causes lftp_LIB_READLINE macro to take readline
headers from host machine if available. To use --with-readline-libs
we need to set --with-readline=yes and --with-readline-inc to include
dir. But when --with-readline=yes, readline_prefix is computed based
on if headers can be found in /usr/local or /usr. If readline is
installed on host machine, then configure fails since we are using
headers for host machine. If headers are not found in /usr/local or /usr
then only path specified --with-readline-inc is taken into account.
So specifying linker flags for ncurses via --with-readline-libs will
not work in all cases.

So it looks like, updating linker flags directly is only option to fix
static link issue against readline.

Fixes:
http://autobuild.buildroot.net/results/ae9/ae93bd1b4f6e1ed8f386830d4a51f00d9466f267/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 .../lftp/0001-fix-static-link-with-readline.patch  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/lftp/0001-fix-static-link-with-readline.patch

diff --git a/package/lftp/0001-fix-static-link-with-readline.patch b/package/lftp/0001-fix-static-link-with-readline.patch
new file mode 100644
index 0000000..3392396
--- /dev/null
+++ b/package/lftp/0001-fix-static-link-with-readline.patch
@@ -0,0 +1,40 @@
+fix static link with readline
+
+When readline is static library, we need to link against ncurses
+because readline needs ncurses. It is because, dependent library's
+symbols are not resolved when static library is built. Those symbols
+are resolved program tries to link with static library.
+
+We can't pass linker flags for ncurses by setting LIBS environment
+variable via <PKG>_CONF_ENV because it looks like build system is not
+taking that into account and even though it would have been, order of
+linking is important.
+
+We can't also pass linker flags for ncurses via --with-readline-libs
+conf options because it causes lftp_LIB_READLINE macro to take readline
+headers from host machine if available. To use --with-readline-libs
+we need to set --with-readline=yes and --with-readline-inc to include
+dir. But when --with-readline=yes, readline_prefix is computed based
+on if headers can be found in /usr/local or /usr. If readline is
+installed on host machine, then configure fails since we are using
+headers for host machine. If headers are not found in /usr/local or /usr
+then only path specified --with-readline-inc is taken into account.
+So specifying linker flags for ncurses via --with-readline-libs will
+not work in all cases.
+
+So it looks like, updating linker flags directly is only option to fix
+static link issue against readline.
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+
+--- lftp-4.7.3/m4/lftp_lib_readline.m4.old	2016-08-08 19:49:12.217596470 +0530
++++ lftp-4.7.3/m4/lftp_lib_readline.m4	2016-08-08 19:49:46.265596398 +0530
+@@ -108,7 +108,7 @@ AC_DEFUN([lftp_LIB_READLINE],
+ 	    readline_include_dir="$readline_include_dir/readline"
+ 	fi
+         readline_ld_flags="-L$readline_prefix/lib"
+-        readline_lib_flags="-lreadline"
++        readline_lib_flags="-lreadline -lncurses"
+         run_readline_test="yes"
+     elif test "$readline_requested" = "yes"; then
+         if test -n "$readline_include_dir" -a -n "$readline_lib_flags"; then
-- 
2.6.2
