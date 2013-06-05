From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Jun 2013 19:52:04 +0200
Subject: [Buildroot] [PATCH] package/libbsd: depends on architectures
	providing a.out.h
Message-ID: <1370454724-10594-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

libbsd requires a.out.h, which is only available in a select subset
of the architectures Buildroot supports.

This means libedit can no longer 'select' libbsd, so turn the 'select'
into a 'depends on'. And the dependency chain ends there.

Fixes:
    http://autobuild.buildroot.org/results/019/019091312ec547520370ffad967b53e23f54a14b
    http://autobuild.buildroot.org/results/87c/87c3a8bf2248606d80ddcfd96132de4c5fe869ed
    http://autobuild.buildroot.org/results/589/5891f539ce3f3ff2e3411228472c8833fdd0d7c0
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libbsd/Config.in  | 3 +++
 package/libedit/Config.in | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 0ed9dac..915a4bd 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
+	# libbsd requires a.out.h, which is only available for those
+	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
+	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )
 	help
 	  This library provides useful functions commonly found on BSD
 	  systems, and lacking on others like GNU systems, thus making
diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index b49c23c..86a70b4 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBEDIT
 	bool "libedit"
-	select BR2_PACKAGE_LIBBSD
+	depends on BR2_PACKAGE_LIBBSD
 	select BR2_PACKAGE_NCURSES
 	help
 	  The editline library (from BSD) provides generic line editing
-- 
1.8.1.2
