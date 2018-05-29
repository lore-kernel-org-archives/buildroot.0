From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:43:59 +0200
Subject: [Buildroot] [git commit] package/dash: don't build in paralle
Message-ID: <20180529194327.E926E7F92D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50d443cbf72fc7940c2970b309de535004173966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dash has races in its Makefile, but upstream is not too keen in fixing
those, and just suggests that dash not be built in parallel:

    https://www.mail-archive.com/dash at vger.kernel.org/msg01675.html

Fixes:
    http://autobuild.buildroot.org/results/793/7934c815a3009af688c2f1183e67dfe542c9a009/
    http://autobuild.buildroot.org/results/fc4/fc4e4ab47455ac47dd4a3a60083cec2848e74dbb/
    http://autobuild.buildroot.org/results/6bf/6bfdd44ea5d55a6ca3ef92254eab18c7c0416b7b/
    [...]

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dash/dash.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 9a26ebb642..80f0ea8cf3 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -9,6 +9,9 @@ DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
 
+# dash does not build in parallel
+DASH_MAKE = $(MAKE1)
+
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 DASH_DEPENDENCIES += libedit host-pkgconf
 DASH_CONF_OPTS += --with-libedit
