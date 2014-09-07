From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Sep 2014 21:56:04 +0200
Subject: [Buildroot] [git commit] enlightenment: disable ptrace for ppc &
	sparc
Message-ID: <20140907195715.7DE0B9D5B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37acd25ee1376de5734415ac60be16991ee6d150
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sys/ptrace.h header for uclibc <= 0.9.33.2 is incomplete and lacks
required definitions for powerpc and sparc.
Fixes:
http://autobuild.buildroot.net/results/a7f/a7f95353f5592a9399c542d8d56c3ca040f8a61a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/enlightenment.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 389636d..64e3d9e 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -28,6 +28,11 @@ ENLIGHTENMENT_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 			 --disable-rpath
 
+# uClibc has an old incomplete sys/ptrace.h for powerpc & sparc
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
+ENLIGHTENMENT_CONF_ENV += ac_cv_header_sys_ptrace_h=no
+endif
+
 # alsa backend needs mixer support
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 ENLIGHTENMENT_DEPENDENCIES += alsa-lib
