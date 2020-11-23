From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Nov 2020 22:48:13 +0100
Subject: [Buildroot] [git commit] package/thermald: fix time_t related
 compile failure
Message-ID: <20201123215719.771A780741@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1672e250106d5c9a2003f40685e57610238a732e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch [1] to fix (musl) time_t related compile failure.

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13336

  src/thd_trip_point.cpp: In member function ???bool cthd_trip_point::thd_trip_point_check(int, unsigned int, int, bool*)???:
  src/thd_trip_point.cpp:250:19: error: format ???%ld??? expects argument of type ???long int???, but argument 6 has type ???time_t??? {aka ???long long int???} [-Werror=format=]
    250 |      thd_log_info("Too early to act zone:%d index %d tm %ld\n",
        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    251 |        zone_id, cdev->thd_cdev_get_index(),
    252 |        tm - cdevs[i].last_op_time);
        |        ~~~~~~~~~~~~~~~~~~~~~~~~~~
        |           |
        |           time_t {aka long long int}
  src/thermald.h:82:57: note: in definition of macro ???thd_log_info???
     82 | #define thd_log_info(...) g_log(NULL, G_LOG_LEVEL_INFO, __VA_ARGS__)
        |                                                         ^~~~~~~~~~~
  src/thd_trip_point.cpp:250:59: note: format string is defined here
    250 |      thd_log_info("Too early to act zone:%d index %d tm %ld\n",
        |                                                         ~~^
        |                                                           |
        |                                                           long int
        |                                                         %lld

[1] https://github.com/intel/thermal_daemon/commit/a7136682b9e6ebdb53c3c8b472bcd5039d62dc78.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...int-fix-32-bit-build-error-with-musl-v1.2.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch b/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch
new file mode 100644
index 0000000000..db5bc99a91
--- /dev/null
+++ b/package/thermald/0001-thd_trip_point-fix-32-bit-build-error-with-musl-v1.2.patch
@@ -0,0 +1,53 @@
+From 074575bf3640485ab6d43ae1efed3eff9cebae13 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Thu, 5 Mar 2020 13:45:57 +0800
+Subject: [PATCH] thd_trip_point: fix 32-bit build error with musl v1.2.0
+
+Error log:
+ ../git/src/thd_trip_point.cpp: In member function 'bool cthd_trip_point::thd_trip_point_check(int, unsigned int, int, bool*)':
+| ../git/src/thd_trip_point.cpp:250:19: error: format '%ld' expects argument of type 'long int', but argument 6 has type 'time_t' {aka 'long long int'} [-Werror=format=]
+|   250 |      thd_log_info("Too early to act zone:%d index %d tm %ld\n",
+
+musl 1.2.0 have new feature:
+time_t is now 64-bit on all archs (not just 64-bit archs)
+
+Commit id:
+https://git.musl-libc.org/cgit/musl/commit/?id=38143339646a4ccce8afe298c34467767c899f51
+
+Release note link for musl 1.2.0:
+https://git.musl-libc.org/cgit/musl/diff/
+
+use %jd and typecast with intmax_t which is maximum width integer type
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+[Upstream: https://github.com/intel/thermal_daemon/commit/a7136682b9e6ebdb53c3c8b472bcd5039d62dc78.patch]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/thd_trip_point.cpp | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/src/thd_trip_point.cpp b/src/thd_trip_point.cpp
+index 46f692d..6358c27 100644
+--- a/src/thd_trip_point.cpp
++++ b/src/thd_trip_point.cpp
+@@ -242,15 +242,9 @@ bool cthd_trip_point::thd_trip_point_check(int id, unsigned int read_temp,
+ 				time_t tm;
+ 				time(&tm);
+ 				if ((tm - cdevs[i].last_op_time) < cdevs[i].sampling_priod) {
+-#if defined __x86_64__ && defined __ILP32__
+-					thd_log_info("Too early to act zone:%d index %d tm %lld\n",
++					thd_log_info("Too early to act zone:%d index %d tm %jd\n",
+ 							zone_id, cdev->thd_cdev_get_index(),
+-							tm - cdevs[i].last_op_time);
+-#else
+-					thd_log_info("Too early to act zone:%d index %d tm %ld\n",
+-							zone_id, cdev->thd_cdev_get_index(),
+-							tm - cdevs[i].last_op_time);
+-#endif
++							(intmax_t)tm - cdevs[i].last_op_time);
+ 					break;
+ 				}
+ 				cdevs[i].last_op_time = tm;
+-- 
+2.29.2
+
