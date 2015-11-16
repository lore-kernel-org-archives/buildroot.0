From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:02 +0100
Subject: [Buildroot] [PATCH 07/21 RFC] package/gcc: handle licensing
	information
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <f3b2a1958ec5d8edccfdb0b2af7e351bbf3575c0.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently install no licensing information for gcc. But the way we
build gcc makes it tricky to add licensing information:

  - we do not build host-gcc; rather, we build host-gcc-initial and
    host-gcc-final,

  - we do not want to save licensing information for host-gcc-initial
    and host-gcc-final, because what really makes sense from a user's
    point of view is really host-gcc.

So, we make gcc a real host-generic-package for which we do not define
any configure, build or install command, but for which we do have
licensing information.

Then for both host-gcc-initial and host-gcc-final, we fake them to be
non-redistributable, because the licensing information for them is not
needed, nor is it needed to save their archives.

Finally, we make both host-gcc-initial and host-gc-final depend on
host-gcc, so that host-gcc is handled by the legal-info framework.

Thus, legal-info will now save the gcc source and licensing information,
and ignore host-gcc-initial and host-gcc-final.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 6 ++++++
 package/gcc/gcc-initial/gcc-initial.mk | 6 ++++++
 package/gcc/gcc.mk                     | 5 +++++
 3 files changed, 17 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 7802855..dcbf7bf 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -8,6 +8,12 @@ GCC_FINAL_VERSION = $(GCC_VERSION)
 GCC_FINAL_SITE = $(GCC_SITE)
 GCC_FINAL_SOURCE = $(GCC_SOURCE)
 
+# We only need to redistribute the gcc sources once, and that is handled by
+# the host-gcc package, not host-gcc-final. So, we fake a non-redistribuale
+# package, even though it *is* redistributable, but is already redistributed
+# thanks to host-gcc.
+GCC_FINAL_REDISTRIBUTE = IGNORE
+
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	$(BR_LIBC)
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1e58d8b..19f8ced 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -8,6 +8,12 @@ GCC_INITIAL_VERSION = $(GCC_VERSION)
 GCC_INITIAL_SITE = $(GCC_SITE)
 GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 
+# We only need to redistribute the gcc sources once, and that is handled by
+# the host-gcc package, not host-gcc-initial. So, we fake a non-redistribuale
+# package, even though it *is* redistributable, but is already redistributed
+# thanks to host-gcc.
+GCC_INITIAL_REDISTRIBUTE = IGNORE
+
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1c847e0..fe984a7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -81,6 +81,7 @@ endef
 #
 
 HOST_GCC_COMMON_DEPENDENCIES = \
+	host-gcc \
 	host-binutils \
 	host-gmp \
 	host-mpfr \
@@ -310,4 +311,8 @@ define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
 endef
 
+$(eval $(host-generic-package))
+
+# We can include other files, now that we've called the package
+# infrastructure, above.
 include $(sort $(wildcard package/gcc/*/*.mk))
-- 
1.9.1
