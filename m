From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 17:39:15 +0100
Subject: [Buildroot] [PATCH] opkg: fix configure step by adding host-pkgconf
	dependency
Message-ID: <1358267955-24060-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The opkg configure.ac uses the PKG_CHECK_MODULES() m4 macro, which is
provided by the .m4 files installed by host-pkgconf, so we must have
this package as a dependency.

Fixes:

  http://autobuild.buildroot.org/results/069fcab6e7dd5a1f07251ba6f52f65643a2f7594/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opkg/opkg.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 3ba61ae..9932d3f 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -11,6 +11,8 @@ OPKG_SITE_METHOD = svn
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPT = --disable-curl --disable-gpg
 OPKG_AUTORECONF = YES
+# Uses PKG_CHECK_MODULES() in configure.ac
+OPKG_DEPENDENCIES = host-pkgconf
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
-- 
1.7.9.5
