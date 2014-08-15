From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 11:05:44 +0200
Subject: [Buildroot] [git commit] bandwidthd: incorporate fixes for
	autobuilders
Message-ID: <20140815090651.48A499D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b3f257cd7dbc7e1c127fc8d25ac77a9e4e862c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"The build failures of bandwidthd observed in the autobuilders in
	relation to libpng are caused by the usage of -L/usr/lib
	-L/usr/local/lib in the compiler flags, which leads the configure
	script to try to link against a host libpng library."

These issues are fixed by:

* Version bump to -r08
	"[patched] the configure.ac script to remove the hardcoded
	-L/usr/local/lib and -I/usr/local/include. The bandwidthd package
	-was already autoreconfigured, so there is no need to add it."

* "Adding the --without-x option, which ensures that the configure.ac
	script will not add -L/usr/lib to the compiler flags (and we anyway
	haven't added any sort of X.org support to bandwidthd for the
	moment)."
Both fixes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bandwidthd/bandwidthd.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index 9b1eb32..3e11d6a 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BANDWIDTHD_VERSION = v2.0.1-auto-r07
+BANDWIDTHD_VERSION = v2.0.1-auto-r08
 BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
 
 # Specified as "any version of the GPL that is current as of your
@@ -15,6 +15,8 @@ BANDWIDTHD_DEPENDENCIES = gd libpng libpcap
 
 BANDWIDTHD_AUTORECONF = YES
 
+BANDWIDTHD_CONF_OPT += --without-x
+
 ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
 BANDWIDTHD_DEPENDENCIES += postgresql
 BANDWIDTHD_CONF_OPT += --with-postgresql-logging=true
