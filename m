From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 19 Dec 2016 09:52:47 +0100
Subject: [Buildroot] [PATCH] can-utils: add dependency on NPTL
Message-ID: <1482137567-19582-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

canfdtest.c assumes that clock_nanosleep() is always available. But it
is only available with NPTL. Since it unconditionally uses it, we add
dependency on NPTL.

Fixes:
http://autobuild.buildroot.net/results/fd97aa57747a546c799caf094aafe0d1d1225863
http://autobuild.buildroot.net/results/1313f91df134035159e677c6b4a63838c75d074c
http://autobuild.buildroot.net/results/a1ac495c5e38e5d0777c431fc6a2e4b5bff7c2ad
http://autobuild.buildroot.net/results/978bee40049896bd6e093fa31c5eb7673e05a6b8
http://autobuild.buildroot.net/results/c692e96de1b4fdadf720ead8249a44c21fe945f1

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/can-utils/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index 307f069..bfa522d 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_CAN_UTILS
 	bool "can-utils"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	help
 	  SocketCAN is a set of open source CAN drivers and a
 	  networking stack.
 	  This package provides various tools for this stack.
 
 	  http://elinux.org/Can-utils
+
+comment "can-utils needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU
-- 
2.1.4
