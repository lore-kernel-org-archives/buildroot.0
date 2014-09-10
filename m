From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 22:44:04 +0200
Subject: [Buildroot] [PATCH] coreutils: get the uptime program to work
Message-ID: <1410381844-14466-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

coreutils configure script needs to know whether /proc/uptime is
available, but this is not possible in a cross-compilation
context. This leads to an uptime program that fails to work on the
target, as it has been compiled without /proc/uptime reading support.

This commit fixes that by telling coreutils at configure time that
/proc/uptime will be available on the target (which seems to be a
reasonable assumption on Linux systems).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/coreutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 07a1347..e6af7e2 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -57,6 +57,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		gl_cv_func_working_mkstemp=yes \
 		gl_cv_func_working_utimes=yes \
 		gl_getline_needs_run_time_check=no \
+		gl_cv_have_proc_uptime=yes \
 		utils_cv_localtime_cache=no \
 		PERL=missing
 
-- 
2.0.0
