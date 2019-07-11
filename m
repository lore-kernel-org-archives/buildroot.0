From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Jul 2019 14:36:54 -0500
Subject: [Buildroot] [PATCH] package/fakeroot: use TCP for msg passing
Message-ID: <20190711193654.2039-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fakeroot can be built to either use SYSV IPC or TCP for message passing.

Cases for which the SYSV IPC version fails or causes problems but for
which fakeroot-tcp has been observed to work well include the items
listed below.

  * Multithreaded applications (using pthread)
  * Running under realtime-preempt kernel
  * Microsoft Windows 10 Services for Linux

Link to readme capturing original upstream bug report #
https://salsa.debian.org/clint/fakeroot/commit/113c6320244c4261f7f7a9ce07cf7b5465573dfe

Fixes
https://bugs.busybox.net/show_bug.cgi?id=11366

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
I can't find a good reason to not make this the new default in the
Buildroot host build of fakeroot.  vs auto detecting which to build
depending on what the host env can support.

For good measure, in-addition to this change, I will submit an upstream
patch for the suggested configure.as update (pending a little cleanup
in that proposed patch). https://bugs.busybox.net/attachment.cgi?id=7791
---
 package/fakeroot/fakeroot.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 4aa27a1b0c..d8effc955e 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -16,6 +16,8 @@ HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
 
+HOST_FAKEROOT_CONF_OPTS = --with-ipc=tcp
+
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 
-- 
2.17.1
