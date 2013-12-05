From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  5 Dec 2013 08:08:22 +0000
Subject: [Buildroot] [PATCH] gpsd: switch to Git snapshot
Message-ID: <1386230902-10012-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Since the gpsd version bump from 3.9 to 3.10, gpsd has been generating a lot
of autobuild failures. See, for example, the following.

  http://autobuild.buildroot.net/results/c8f/c8f2eed70cfbdcb7e7af820977aa531b59f0575a/

A 3.11 release is expected shortly; in the interim, switch to a recent Git
snapshot in which the most serious build problems appear to have been fixed.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/gpsd-02-sconstruct-disable-rpath.patch | 10 +++++-----
 package/gpsd/gpsd.mk                                |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
index eca3cbf..8d2d31e 100644
--- a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
+++ b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
@@ -5,11 +5,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 diff -Nurp a/SConstruct b/SConstruct
 --- a/SConstruct	2013-11-22 13:10:01.000000000 +0000
 +++ b/SConstruct	2013-11-23 11:26:57.698486777 +0000
-@@ -287,8 +287,6 @@ def installdir(dir, add_destdir=True):
- # Honor the specified installation prefix in link paths.
- if env["sysroot"]:
-     env.Prepend(LIBPATH=[env["sysroot"] + installdir('libdir', add_destdir=False)])
--if env["shared"]:
+@@ -299,8 +299,6 @@ if env["sysroot"]:
+ # prefix=/usr/local build want to put our libraries there. Ideally
+ # we'd query the default load path here and test against wharever it
+ # is, but we haven't found a way to do that.
+-if env["shared"] and env["libdir"] not in {"/lib","/usr/lib","/usr/local/lib"}:
 -    env.Prepend(RPATH=[installdir('libdir')])
  
  # Give deheader a way to set compiler flags
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 92db00e..43c945a 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.10
-GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd/
+GPSD_VERSION = 327a3ef7c83c1b3b2cf7cdfcddf0c6fd7aaa8963
+GPSD_SITE = git://git.savannah.nongnu.org/gpsd.git
 GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
-- 
1.8.3.2
