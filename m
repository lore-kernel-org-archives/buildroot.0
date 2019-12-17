From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 17 Dec 2019 18:26:57 -0500
Subject: [Buildroot] [PATCH] package/openocd: bump to version 104a5cb
Message-ID: <20191217232657.6582-1-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OpenOCD project hasn't made a release since January 2017. Much work
has happened since then and now. This bumps the version to the latest
commit and removes a patch that has been applied upstream.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 ...event-some-forms-of-Cross-Protocol-S.patch | 50 -------------------
 package/openocd/openocd.hash                  |  5 +-
 package/openocd/openocd.mk                    |  7 +--
 3 files changed, 6 insertions(+), 56 deletions(-)
 delete mode 100644 package/openocd/0003-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch

diff --git a/package/openocd/0003-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch b/package/openocd/0003-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch
deleted file mode 100644
index ba19bf5735..0000000000
--- a/package/openocd/0003-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3a223ca3ebc7ac24d7726a0cd58e5695bc813657 Mon Sep 17 00:00:00 2001
-From: Andreas Fritiofson <andreas.fritiofson@gmail.com>
-Date: Sat, 13 Jan 2018 21:00:47 +0100
-Subject: [PATCH] CVE-2018-5704: Prevent some forms of Cross Protocol Scripting
- attacks
-
-OpenOCD can be targeted by a Cross Protocol Scripting attack from
-a web browser running malicious code, such as the following PoC:
-
-var x = new XMLHttpRequest();
-x.open("POST", "http://127.0.0.1:4444", true);
-x.send("exec xcalc\r\n");
-
-This mitigation should provide some protection from browser-based
-attacks and is based on the corresponding fix in Redis:
-
-https://github.com/antirez/redis/blob/8075572207b5aebb1385c4f233f5302544439325/src/networking.c#L1758
-
-
-Upstream-status: Under review: http://openocd.zylin.com/#/c/4335/
-Change-Id: Ia96ebe19b74b5805dc228bf7364c7971a90a4581
-Signed-off-by: Andreas Fritiofson <andreas.fritiofson@gmail.com>
-Reported-by: Josef Gajdusek <atx@atx.name>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/server/startup.tcl | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/src/server/startup.tcl b/src/server/startup.tcl
-index 64ace407..dd1b31e4 100644
---- a/src/server/startup.tcl
-+++ b/src/server/startup.tcl
-@@ -8,3 +8,14 @@ proc ocd_gdb_restart {target_id} {
- 	# one target
- 	reset halt
- }
-+
-+proc prevent_cps {} {
-+	echo "Possible SECURITY ATTACK detected."
-+	echo "It looks like somebody is sending POST or Host: commands to OpenOCD."
-+	echo "This is likely due to an attacker attempting to use Cross Protocol Scripting"
-+	echo "to compromise your OpenOCD instance. Connection aborted."
-+	exit
-+}
-+
-+proc POST {args} { prevent_cps }
-+proc Host: {args} { prevent_cps }
--- 
-2.11.0
-
diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index 3fb817b4a2..8575cd825d 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,4 +1,3 @@
-# From http://sourceforge.net/projects/openocd/files/openocd/0.10.0/
-sha1 3245d43d60a1a93f8b0f6b1ce20b53e38cab7a4a  openocd-0.10.0.tar.bz2
-md5 b412bdef0481a3859c6585eb69f6f6ba  openocd-0.10.0.tar.bz2
+# Locally calculated
+sha256 a88acc1e7fc9af0d91d56041923b80563be7b17b2198a21c6c2656ce596ccd16  openocd-104a5cbef8965d47b9111f7e010f96ebb5fdf06c.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index d35ed77cd1..0a3f1c9a21 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.10.0
-OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
-OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
+OPENOCD_VERSION = 104a5cbef8965d47b9111f7e010f96ebb5fdf06c
+OPENOCD_SITE = git://git.code.sf.net/p/openocd/code
+OPENOCD_METHOD = git
+OPENOCD_GIT_SUBMODULES = YES
 OPENOCD_LICENSE = GPL-2.0+
 OPENOCD_LICENSE_FILES = COPYING
 # 0002-configure-enable-build-on-uclinux.patch patches configure.ac
-- 
2.20.1
