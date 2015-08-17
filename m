From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 22:28:00 +0200
Subject: [Buildroot] [git commit] package/oprofile: fix static linking
Message-ID: <20150817202840.7E3FD81D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=123c41ff72cd34e186074cf61ca087317096a699
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When getext is enabled, popt links with -lintl, specifies it in its
popt.pc and has done so for the past 6+ years. But oprofile does not
use pkconfig to find popt, so misses -lintl, which is important for
a static build. We have to do the call to pkgconfig manually...

Fixes:
    http://autobuild.buildroot.org/results/a48/a485f2171a3fcbfa2e0e5aec8e653cf88512615d/
    http://autobuild.buildroot.org/results/b37/b374874f1915ab1d7aa6262604ccc8db102bb0b0/
    http://autobuild.buildroot.org/results/261/2616a63081ed8c55c7ca1a6879b1a6a14e19f918/
    http://autobuild.buildroot.org/results/73f/73f34ab59d54ded68ff60608a0212a6e5a5190e5/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/oprofile.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 5876307..ba36640 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -41,6 +41,12 @@ ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
 endif
 
+# When getext is enabled, popt links with -lintl, specifies it in its
+# popt.pc and has done so for the past 6+ years. But oprofile does not
+# use pkconfig to find popt, so misses -lintl, which is important for
+# a static build. We have to do the call to pkgconfig manually...
+OPROFILE_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
+
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
