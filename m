From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Aug 2020 23:28:34 +0200
Subject: [Buildroot] [git commit] package/dieharder: fix build with gcc 10
Message-ID: <20200819212509.D7E0782DBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbcab766dc944bab4ebc4a082a977ab8c2f9a589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -fno-common with dieharder, there is more than 100 variables to
fix and upstream seems dead.

Fixes:
 - http://autobuild.buildroot.org/results/ba70d111cd1f2029a193a88af3b44daf6ef27786

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dieharder/dieharder.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
index c3eee64553..cbf28922fd 100644
--- a/package/dieharder/dieharder.mk
+++ b/package/dieharder/dieharder.mk
@@ -36,4 +36,9 @@ endif
 # parallel build fail, disable it
 DIEHARDER_MAKE = $(MAKE1)
 
+# Too many fixes needed to build with -fno-common which is default since gcc 10
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10),y)
+DIEHARDER_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fcommon"
+endif
+
 $(eval $(autotools-package))
