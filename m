From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:03:13 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] ntp: fix build without
 libcap and no threads
Message-ID: <20181023230146.0D18A81356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb10a0ca4145c2e68a6c28f80e9205aceea28623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

When threads support is missing the ntp build system builds the
work_fork code. This code added call to set_user_group_ids() that is
under HAVE_DROPROOT, which is disabled when libcap is not built.

Add a patch fixing that.

Fixes:
http://autobuild.buildroot.net/results/ab9/ab9ceff1151b8b5e6b9fa77d39c0f9b0cac1a080/

Cc: Artyom Panfilov <apanfilov@spectracom.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 13dcc69a39da97f615627553e88113ba455875ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../ntp/0004-fix-work-fork-without-droproot.patch  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/ntp/0004-fix-work-fork-without-droproot.patch b/package/ntp/0004-fix-work-fork-without-droproot.patch
new file mode 100644
index 0000000000..cb6fec0125
--- /dev/null
+++ b/package/ntp/0004-fix-work-fork-without-droproot.patch
@@ -0,0 +1,26 @@
+Fix work_fork build when droproot is disabled
+
+The set_user_group_ids() depends on HAVE_DROPROOT. When HAVE_DROPROOT is not
+enabled, work_fork.c code causes a link failure:
+
+../libntp/libntp.a(work_fork.o): In function `send_blocking_req_internal':
+work_fork.c:(.text+0x498): undefined reference to `set_user_group_ids'
+
+Make the set_user_group_ids() call depend on HAVE_DROPROOT.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: http://bugs.ntp.org/show_bug.cgi?id=3539
+
+--- ntp-4.2.8p12.orig/libntp/work_fork.c	2018-08-14 14:51:06.000000000 +0300
++++ ntp-4.2.8p12/libntp/work_fork.c	2018-10-15 21:10:54.580917962 +0300
+@@ -594,7 +594,9 @@
+ 	init_logging("ntp_intres", 0, FALSE);
+ 	setup_logfile(NULL);
+ 
++#if defined(HAVE_DROPROOT)
+ 	(void) set_user_group_ids();
++#endif
+ 
+ 	/*
+ 	 * And now back to the portable code
