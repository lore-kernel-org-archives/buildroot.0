From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Sep 2018 23:38:07 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linuxptp: needs NPTL
Message-ID: <20180920214642.7108D8880F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e6ea0d0436b452ce0cc0aae9183f6e3836e4c7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

/home/buildroot/autobuild/run/instance-1/output/host/bin/or1k-linux-gcc   phc_ctl.o phc.o sk.o util.o clockadj.o sysoff.o print.o version.o  -lm -lrt  -o phc_ctl
phc2sys.o: In function `do_loop':
phc2sys.c:(.text+0x18bc): undefined reference to `clock_nanosleep'

Fixes:
 - http://autobuild.buildroot.org/results/a31e0a5ae15e1164115e4e5981ef5fb3c3284bcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linuxptp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
index 3e18a0cb13..a32dbde2e1 100644
--- a/package/linuxptp/Config.in
+++ b/package/linuxptp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LINUXPTP
 	bool "linuxptp"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	help
 	  The Linux PTP Project is the Precision Time Protocol
 	  implementation according to IEEE standard 1588 for Linux.
@@ -11,3 +12,6 @@ config BR2_PACKAGE_LINUXPTP
 	  not a goal.
 
 	  http://linuxptp.sourceforge.net/
+
+comment "linuxptp needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
