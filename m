From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 28 May 2020 23:59:12 +0200
Subject: [Buildroot] [PATCH v2] package/cvs: fix mktime related compile
 failure
Message-ID: <20200528215912.30258-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use ac_cv_func_working_mktime=yes to force the use of a provided
mktime implementation instead of compiling the failing own one.

Fixes:

  http://autobuild.buildroot.net/results/5bcd8f4235002da682cc900f866116d2fe87f1c8

  mktime.c: In function 'ydhms_diff':
  mktime.c:106:52: error: size of array 'a' is negative
   #define verify(name, assertion) struct name { char a[(assertion) ? 1 : -1]; }
                                                      ^
  mktime.c:170:3: note: in expansion of macro 'verify'
     verify (long_int_year_and_yday_are_wide_enough,
     ^~~~~~

with the failure/assert comming from the lines:

  verify (long_int_year_and_yday_are_wide_enough,
          INT_MAX <= LONG_MAX / 2 || TIME_T_MAX <= UINT_MAX);

which fails since the y2038 time_t conversion from 32bit to 64bit
(musl libc).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - enhance commit log (as suggested by Thomas Petazzoni)
---
 package/cvs/cvs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 563802cc9d..6f83ca6408 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -12,7 +12,9 @@ CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
 CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
 CVS_DEPENDENCIES = ncurses
 
-CVS_CONF_ENV = cvs_cv_func_printf_ptr=yes
+CVS_CONF_ENV = \
+	ac_cv_func_working_mktime=yes \
+	cvs_cv_func_printf_ptr=yes
 
 CVS_CONFIGURE_ARGS = --disable-old-info-format-support
 ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
-- 
2.26.2
