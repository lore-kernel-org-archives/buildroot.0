From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Thu, 20 Oct 2011 01:13:21 +0200
Subject: [Buildroot] [PATCH] New package : parted
Message-ID: <1319066001-14306-1-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, since I really needed parted quickly, i went ahead and pulled the
recipe from OE. It's not using the latest parted, but that's a first attempt,
the package can always be updated later.

tested on PandaBoard.

---
Using parted-2.3 for now, using recipes/patches from OpenEmbedded

TODO: migrate to parted-3.0

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
---
 package/Config.in                       |    1 +
 package/parted/Config.in                |    8 ++
 package/parted/fix-MiB-handling.patch   |  130 +++++++++++++++++++++++++++++++
 package/parted/parted.mk                |   16 ++++
 package/parted/use_llseek_syscall.patch |   28 +++++++
 5 files changed, 183 insertions(+), 0 deletions(-)
 create mode 100644 package/parted/Config.in
 create mode 100644 package/parted/fix-MiB-handling.patch
 create mode 100644 package/parted/parted.mk
 create mode 100644 package/parted/use_llseek_syscall.patch

diff --git a/package/Config.in b/package/Config.in
index 3b2769d..710b832 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -194,6 +194,7 @@ source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
 source "package/openocd/Config.in"
+source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
 source "package/rng-tools/Config.in"
diff --git a/package/parted/Config.in b/package/parted/Config.in
new file mode 100644
index 0000000..fbab164
--- /dev/null
+++ b/package/parted/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PARTED
+	bool "parted"
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_READLINE
+	help
+        parted, the GNU partition resizing program
+
+
diff --git a/package/parted/fix-MiB-handling.patch b/package/parted/fix-MiB-handling.patch
new file mode 100644
index 0000000..db4945f
--- /dev/null
+++ b/package/parted/fix-MiB-handling.patch
@@ -0,0 +1,130 @@
+Delivered-To: otavio.salvador at gmail.com
+Received: by 10.204.59.147 with SMTP id l19cs132424bkh;
+        Sun, 16 Jan 2011 04:26:09 -0800 (PST)
+Received: by 10.90.113.8 with SMTP id l8mr1322981agc.21.1295180768845;
+        Sun, 16 Jan 2011 04:26:08 -0800 (PST)
+Return-Path: <bug-parted-bounces+otavio=debian.org@gnu.org>
+Received: from master.debian.org (master.debian.org [70.103.162.29])
+        by mx.google.com with ESMTPS id c36si6867598ana.168.2011.01.16.04.26.08
+        (version=TLSv1/SSLv3 cipher=RC4-MD5);
+        Sun, 16 Jan 2011 04:26:08 -0800 (PST)
+Received-SPF: softfail (google.com: domain of transitioning bug-parted-bounces+otavio=debian.org at gnu.org does not designate 70.103.162.29 as permitted sender) client-ip=70.103.162.29;
+Authentication-Results: mx.google.com; spf=softfail (google.com: domain of transitioning bug-parted-bounces+otavio=debian.org at gnu.org does not designate 70.103.162.29 as permitted sender) smtp.mail=bug-parted-bounces+otavio=debian.org at gnu.org
+Received: from lists.gnu.org ([199.232.76.165])
+	by master.debian.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
+	(Exim 4.69)
+	(envelope-from <bug-parted-bounces+otavio=debian.org@gnu.org>)
+	id 1PeRgN-00069u-NM
+	for otavio.salvador at gmail.com; Sun, 16 Jan 2011 12:26:08 +0000
+Received: from localhost ([127.0.0.1]:34642 helo=lists.gnu.org)
+	by lists.gnu.org with esmtp (Exim 4.43)
+	id 1PeRgL-0007eS-Ku
+	for otavio at debian.org; Sun, 16 Jan 2011 07:26:05 -0500
+Received: from [140.186.70.92] (port=41438 helo=eggs.gnu.org)
+	by lists.gnu.org with esmtp (Exim 4.43) id 1PeRgG-0007cP-GQ
+	for bug-parted at gnu.org; Sun, 16 Jan 2011 07:26:01 -0500
+Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
+	(envelope-from <jim@meyering.net>) id 1PeRgF-0003PP-7D
+	for bug-parted at gnu.org; Sun, 16 Jan 2011 07:26:00 -0500
+Received: from mx.meyering.net ([82.230.74.64]:52182)
+	by eggs.gnu.org with esmtp (Exim 4.71)
+	(envelope-from <jim@meyering.net>) id 1PeRgF-0003PL-0K
+	for bug-parted at gnu.org; Sun, 16 Jan 2011 07:25:59 -0500
+Received: by rho.meyering.net (Acme Bit-Twister, from userid 1000)
+	id 5C38F60466; Sun, 16 Jan 2011 13:25:56 +0100 (CET)
+From: Jim Meyering <jim@meyering.net>
+To: bug-parted at gnu.org
+Date: Sun, 16 Jan 2011 13:25:56 +0100
+Message-ID: <8762tpox0r.fsf@meyering.net>
+Lines: 67
+MIME-Version: 1.0
+Content-Type: text/plain
+X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
+Subject: treat "1MiB" like "1048576B"
+X-BeenThere: bug-parted at gnu.org
+X-Mailman-Version: 2.1.5
+Precedence: list
+List-Id: Bug reports for the GNU Parted disk partition editor
+	<bug-parted.gnu.org>
+List-Unsubscribe: <http://lists.gnu.org/mailman/listinfo/bug-parted>,
+	<mailto:bug-parted-request@gnu.org?subject=unsubscribe>
+List-Archive: <http://lists.gnu.org/archive/html/bug-parted>
+List-Post: <mailto:bug-parted@gnu.org>
+List-Help: <mailto:bug-parted-request@gnu.org?subject=help>
+List-Subscribe: <http://lists.gnu.org/mailman/listinfo/bug-parted>,
+	<mailto:bug-parted-request@gnu.org?subject=subscribe>
+Sender: bug-parted-bounces+otavio=debian.org at gnu.org
+Errors-To: bug-parted-bounces+otavio=debian.org at gnu.org
+
+[ I noticed that using a starting address of "1MiB" evokes a warning,
+  along with the obviously unintended start sector of 34:
+
+    parted -s -- $dev mklabel gpt mkpart PARTITION-NAME 1MiB -34s
+    Warning: The resulting partition is not properly aligned for best performance.
+
+  While the following, with "1048576B", works fine and creates the partition
+  starting at the desired 1MiB address:
+
+    parted -s -- $dev mklabel gpt mkpart PARTITION-NAME 1048576B -34s
+  ]
+
+I made parted tell me why it was treating "1MiB" differently from
+"1048576B".  Bottom line is that if you use a large unit, like MiB, it
+assumes you're being sloppy, but if you specify bytes or sectors, you
+require exactness (radius = 0).  That may have made sense when people
+used sloppy units like MB (1,000,000), but obviously does not hold for
+most people who bother to type "MiB".
+
+Here's a proposed patch to make the command I gave work the way I
+intended.  Opinions welcome.  On one hand, I don't particularly like
+treating 1MiB differently from 1MB, but if someone is using 1MB and
+intends 1MiB, they need a little wake up call (or some RTFM).
+[the full patch will include a documentation update as well as
+a couple of tests to illustrate/exercise the difference. ]
+
+In the mean time, to get the proper 1MiB alignment, you'll have to
+use an explicit byte or sector count.  I prefer byte counts, in spite of
+the greater number of digits, because that works the same regardless
+of a disk's sector size:
+
+    dev=...
+    k=1024 m=$((k*k))
+    parted -s -- $dev mklabel gpt mkpart P-NAME ${m}B -34s
+
+
+diff --git a/libparted/unit.c b/libparted/unit.c
+index 2670c38..59a9644 100644
+--- a/libparted/unit.c
++++ b/libparted/unit.c
+@@ -480,6 +480,12 @@ parse_unit_suffix (const char* suffix, PedUnit suggested_unit)
+ 	return suggested_unit;
+ }
+
++static bool
++is_power_of_2 (long long n)
++{
++  return (n & (n - 1)) == 0;
++}
++
+ /**
+  * If \p str contains a valid description of a location on \p dev, then
+  * \p *sector is modified to describe the location and a geometry is created
+@@ -530,6 +536,13 @@ ped_unit_parse_custom (const char* str, const PedDevice* dev, PedUnit unit,
+ 	radius = ped_div_round_up (unit_size, dev->sector_size) - 1;
+ 	if (radius < 0)
+ 		radius = 0;
++	/* If the user specified units in a power of 2, e.g., 1MiB, as in
++	       parted -s -- $dev mklabel gpt mkpart P-NAME 1MiB -34s
++	   do not use 1MiB as the range.  Rather, presume that they
++	   are specifying precisely the starting or ending number,
++	   and treat "1MiB" just as we would treat "1048576B".  */
++	if (is_power_of_2 (unit_size))
++		radius = 0;
+
+ 	*sector = num * unit_size / dev->sector_size;
+ 	/* negative numbers count from the end */
+
+_______________________________________________
+bug-parted mailing list
+bug-parted at gnu.org
+http://lists.gnu.org/mailman/listinfo/bug-parted
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
new file mode 100644
index 0000000..f0a7d86
--- /dev/null
+++ b/package/parted/parted.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# parted
+#
+#############################################################
+
+PARTED_VERSION = 2.3
+PARTED_SOURCE = parted-$(PARTED_VERSION).tar.gz
+PARTED_SITE = $(BR2_GNU_MIRROR)/parted
+PARTED_DEPENDENCIES = readline util-linux lvm2
+PARTED_INSTALL_STAGING = YES
+PARTED_INSTALL_TARGET = YES
+PARTED_CONF_OPT = --disable-Werror ac_cv_func_calloc_0_nonnull=yes
+
+$(eval $(call AUTOTARGETS,package,parted))
+
diff --git a/package/parted/use_llseek_syscall.patch b/package/parted/use_llseek_syscall.patch
new file mode 100644
index 0000000..ce30563
--- /dev/null
+++ b/package/parted/use_llseek_syscall.patch
@@ -0,0 +1,28 @@
+--- a/libparted/arch/linux.c~	2009-02-06 17:22:22.000000000 -0200
++++ a/libparted/arch/linux.c	2009-02-06 17:39:28.000000000 -0200
+@@ -53,6 +53,11 @@
+ 
+ #define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
+ 
++#ifndef HAVE_LLSEEK
++#define _llseek(fd, offset_high, offset_low, result, origin) \
++        syscall(SYS__llseek, fd, offset_high, offset_low, result, origin)
++#endif
++
+ #ifndef __NR__llseek
+ #define __NR__llseek 140
+ #endif
+@@ -1362,13 +1367,6 @@
+ 
+ #if SIZEOF_OFF_T < 8
+ 
+-static _syscall5(int,_llseek,
+-                 unsigned int, fd,
+-                 unsigned long, offset_high,
+-                 unsigned long, offset_low,
+-                 loff_t*, result,
+-                 unsigned int, origin)
+-
+ loff_t
+ llseek (unsigned int fd, loff_t offset, unsigned int whence)
+ {
-- 
1.7.0.4
