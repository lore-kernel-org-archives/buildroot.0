From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:39:03 +0100
Subject: [Buildroot] [PATCH 1/5] package/coreutils: introduce a host variant
In-Reply-To: <cover.1576701539.git.yann.morin.1998@free.fr>
References: <cover.1576701539.git.yann.morin.1998@free.fr>
Message-ID: <447ec97983b75938b041918f436ba1ab5657093b.1576701539.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

More and more packages are now depending on ln --relative, some require
realpath, both of which only got introduced in "recent" versions of
coreutils; older distros had a separate realpath, though, but that is
not in the list of our required dependencies, and was not installed by
default.

So, we introduce a minimal host variant of coreutils to provide those
programs.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
-- 
2.20.1
