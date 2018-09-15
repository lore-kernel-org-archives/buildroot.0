From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Sep 2018 21:20:05 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: needs NPTL
Message-ID: <20180915192005.29373-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/home/buildroot/autobuild/run/instance-1/output/host/bin/or1k-linux-gcc   phc_ctl.o phc.o sk.o util.o clockadj.o sysoff.o print.o version.o  -lm -lrt  -o phc_ctl
phc2sys.o: In function `do_loop':
phc2sys.c:(.text+0x18bc): undefined reference to `clock_nanosleep'

Fixes:
 - http://autobuild.buildroot.org/results/a31e0a5ae15e1164115e4e5981ef5fb3c3284bcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.17.1
