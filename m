From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Mar 2014 21:15:30 +0100
Subject: [Buildroot] [git commit] host-mtools: Fix build failure introduced
	by libiconv dependency
Message-ID: <20140324202034.DA4A39BFEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=482757f537bc0364bf765f0da02310b6a48bf06e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/8ff/8ff7fc94cc3e54f5608f7b4d2e6ccba5fd8e4177/

Also disable parallel make because "make install" is broken, see
http://lists.openembedded.org/pipermail/openembedded-commits/2011-October/134396.html

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtools/mtools.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 8649325..9dc72f3 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -16,7 +16,12 @@ MTOOLS_CONF_OPT = --without-x
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MTOOLS_DEPENDENCIES += libiconv
 MTOOLS_CONF_ENV += LIBS=-liconv
+# We have no host dependencies
+HOST_MTOOLS_DEPENDENCIES =
 endif
 
+#??Package does not build in parallel due to improper make rules
+MTOOLS_MAKE = $(MAKE1)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
