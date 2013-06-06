From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 09:35:22 +0200
Subject: [Buildroot] [git commit] package/libbsd: depends on architectures
	providing a.out.h
Message-ID: <20130606073809.75C359A975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29b071077f66de1d9a257e7c5c6983dcce1fc65d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libbsd requires a.out.h, which is only available in a select subset
of the architectures Buildroot supports.

Propagate these new dependencies down to libedit.

Fixes:
    http://autobuild.buildroot.org/results/019/019091312ec547520370ffad967b53e23f54a14b
    http://autobuild.buildroot.org/results/87c/87c3a8bf2248606d80ddcfd96132de4c5fe869ed
    http://autobuild.buildroot.org/results/589/5891f539ce3f3ff2e3411228472c8833fdd0d7c0
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libbsd/Config.in  |    3 +++
 package/libedit/Config.in |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

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
index b49c23c..34160f4 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEDIT
 	bool "libedit"
+	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )  # libbsd
 	select BR2_PACKAGE_LIBBSD
 	select BR2_PACKAGE_NCURSES
 	help
