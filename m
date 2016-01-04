From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon,  4 Jan 2016 16:33:56 -0200
Subject: [Buildroot] [alternative PATCH] fakeroot: fix build when libcap-dev
	is installed
Message-ID: <1451932436-27742-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes https://bugs.busybox.net/show_bug.cgi?id=8541

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Alternative patch to https://patchwork.ozlabs.org/patch/562348/

We don't need libcap for buildroot, as Gustavo Zacarias explained in the past.
It seems reasonable to me to disable this detection too.

I can reproduce the original bug with libcap-dev in my Ubuntu 14.04.
Using this patch I cannot reproduce the bug anymore.
---
 package/fakeroot/fakeroot.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 837c2b9..168cd13 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -10,7 +10,10 @@ FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/
 # Force capabilities detection off
 # For now these are process capabilities (faked) rather than file
 # so they're of no real use
-HOST_FAKEROOT_CONF_ENV = ac_cv_func_capset=no
+HOST_FAKEROOT_CONF_ENV = \
+	ac_cv_header_sys_capability_h=no \
+	ac_cv_func_capset=no
+
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
-- 
1.9.1
