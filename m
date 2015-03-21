From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Mar 2015 09:39:22 +0100
Subject: [Buildroot] [git commit] powertop: only link against -lintl when
	needed
Message-ID: <20150321084705.51FD08078F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=198734f00ba858bd9d562aaa2e71ae76248b899e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_GETTEXT=y might be enabled even if BR2_NEEDS_GETTEXT is
not set, and in this case, we should not link against libintl, because
it may not exist, for example with glibc toolchains.

Fixes:

  http://autobuild.buildroot.net/results/270/270018e2c9e3845a4015faa155325eea2cabe3d9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powertop/powertop.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index 43d70a3..b253a56 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -12,7 +12,7 @@ POWERTOP_LICENSE_FILES = COPYING
 # We're patching Makefile.am
 POWERTOP_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT),y)
 POWERTOP_DEPENDENCIES += gettext
 POWERTOP_CONF_ENV += LIBS='-lintl'
 endif
