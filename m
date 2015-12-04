From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Dec 2015 12:11:34 -0300
Subject: [Buildroot] [PATCH] fakeroot: disable capabilities
Message-ID: <1449241894-8016-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These don't autodetect consistently and are process rather than file
capabilities, so not very useful in the buildroot context.
Otherwise we'd have to unconditionally pull host-libcap (or fix the
detection, but again, not useful so there's no need).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fakeroot/fakeroot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 8bb9294..837c2b9 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -7,6 +7,10 @@
 FAKEROOT_VERSION = 1.20.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
+# Force capabilities detection off
+# For now these are process capabilities (faked) rather than file
+# so they're of no real use
+HOST_FAKEROOT_CONF_ENV = ac_cv_func_capset=no
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
-- 
2.4.10
