From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Apr 2013 22:57:30 +0200
Subject: [Buildroot] [git commit] foomatic-filters: make location of
	enscript very clear
Message-ID: <20130404205713.60F6B9B4BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b392cb4c743cce128c2c777f3b2116d546118ec6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Passing --with-file-converter=enscript isn't enough since the build
system will try the fallback options (a2ps, mpage, texttops) if it's not
found.
This has two bad effects: one of the tools leaking from the distribution
making foomatic-filters think everything will be the same on the target
(and failing when that's not the case), and failed builds when none is
found (enscript is installed in the target directory, the build system
doesn't look there).
So just avoid the test by stating explicitly where enscript will live in
the target. Fixes:
http://autobuild.buildroot.net/results/37ad3d2c5c35f00c644a2c572f1429bafa4b7cf4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/foomatic-filters/foomatic-filters.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/foomatic-filters/foomatic-filters.mk b/package/foomatic-filters/foomatic-filters.mk
index ad7ab7a..6e13486 100644
--- a/package/foomatic-filters/foomatic-filters.mk
+++ b/package/foomatic-filters/foomatic-filters.mk
@@ -9,8 +9,8 @@ FOOMATIC_FILTERS_SITE = http://www.openprinting.org/download/foomatic
 FOOMATIC_FILTERS_LICENSE = GPLv2+
 FOOMATIC_FILTERS_LICENSE_FILES = COPYING
 FOOMATIC_FILTERS_DEPENDENCIES = cups libusb enscript
-
 FOOMATIC_FILTERS_CONF_OPT = --with-file-converter=enscript
+FOOMATIC_FILTERS_CONF_ENV = ac_cv_path_ENSCRIPT="/usr/bin/enscript"
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 FOOMATIC_FILTERS_CONF_OPT += --enable-dbus
