From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:42:37 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libfuse: security bump to
 version 2.9.8
Message-ID: <20180824083456.3E9488E5EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6989413b9582f9cd1caf6eadcfd12d59d1cc774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-10906 - In fuse before versions 2.9.8 and 3.x before 3.2.5,
fusermount is vulnerable to a restriction bypass when SELinux is active.
This allows non-root users to mount a FUSE file system with the
'allow_other' mount option regardless of whether 'user_allow_other' is set
in the fuse configuration.  An attacker may use this flaw to mount a FUSE
file system, accessible by other users, and trick them into accessing files
on that file system, possibly causing Denial of Service or other unspecified
effects.

And additionally:

- libfuse no longer segfaults when fuse_interrupted() is called outside the
  event loop.

- The fusermount binary has been hardened in several ways to reduce
  potential attack surface.  Most importantly, mountpoints and mount options
  must now match a hard-coded whitelist.  It is expected that this whitelist
  covers all regular use-cases.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9c2bbc3fc9a6193ac866c06d474e99f6e428efbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.hash | 2 +-
 package/libfuse/libfuse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index f02c78418e..3d1b973071 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3358874	fuse-2.9.7.tar.gz
+sha256	5e84f81d8dd527ea74f39b6bc001c874c02bad6871d7a9b0c14efb57430eafe3	fuse-2.9.8.tar.gz
 
 # Hash for license files:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index dc177d03c1..e8a79a3166 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE_VERSION = 2.9.7
+LIBFUSE_VERSION = 2.9.8
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
