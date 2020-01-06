From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:36:45 +0100
Subject: [Buildroot] [git commit] package/coreutils: introduce a host variant
Message-ID: <20200106203440.0598780E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=885e6fdb8a40499804101a70998a4566ed3e6193
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

More and more packages are now depending on ln --relative, some require
realpath, both of which only got introduced in "recent" versions of
coreutils; older distros had a separate realpath, though, but that is
not in the list of our required dependencies, and was not installed by
default.

So, we introduce a minimal host variant of coreutils to provide those
programs.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index d312197e7e..a8137d1687 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -148,4 +148,18 @@ endef
 endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
 
+# Explicitly install ln and realpath, which we *are* insterested in.
+# A lot of other programs still get installed, however, but disabling
+# them does not gain much at build time, and is a loooong list that is
+# difficult to maintain...
+HOST_COREUTILS_CONF_OPTS = \
+	--disable-acl \
+	--disable-libcap \
+	--disable-rpath \
+	--disable-single-binary \
+	--disable-xattr \
+	--without-gmp \
+	--enable-install-program=ln,realpath
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
