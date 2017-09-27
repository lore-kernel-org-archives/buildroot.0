From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:56:11 +0200
Subject: [Buildroot] [git commit] package/diffutils: disable getopt_long
	replacement with glibc
Message-ID: <20170927205504.7D58F80330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=498477a32168218ce311be0ec519271f16683061
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since glibc >= 2.26, don't try to use getopt_long replacement bundled
with diffutils. It will conflict with the one from glibc.
The getopt copy bundled in glibc has been updated with the one from gnulib.

After a lot of warnings...
Fixes:
xstrtol-error.c: In function 'xstrtol_error':
xstrtol-error.c:84:26: error: invalid use of undefined type 'struct rpl_option'
     option = long_options[opt_idx].name;
                          ^
xstrtol-error.c:84:26: error: dereferencing pointer to incomplete type 'const struct rpl_option'

[...]

xstrtol-error.c:92:1: error: conflicting types for 'xstrtol_fatal'
 xstrtol_fatal (enum strtol_error err,
 ^~~~~~~~~~~~~
In file included from xstrtol-error.c:20:0:
xstrtol.h:69:16: note: previous declaration of 'xstrtol_fatal' was here
 _Noreturn void xstrtol_fatal (enum strtol_error,
                ^~~~~~~~~~~~~

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/diffutils/diffutils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6e5b9b6..79785d6 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -11,6 +11,12 @@ DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
 
+# Since glibc >= 2.26, don't try to use getopt_long replacement bundled
+# with diffutils. It will conflict with the one from glibc.
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+DIFFUTILS_CONF_ENV += gl_cv_func_getopt_gnu=yes
+endif
+
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 DIFFUTILS_DEPENDENCIES += busybox
 endif
