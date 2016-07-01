From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 17:25:35 +0200
Subject: [Buildroot] [git commit] package/gcc: use BR2_USE_WCHAR to set gcc
	libquadmath option
Message-ID: <20160701152634.42E2C80E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a694c548dfed94239dc82cc6f4398ea24c32cc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TOOLCHAIN_BUILDROOT_WCHAR is only defined when uclibc is selected,
whereas BR2_USE_WCHAR is always defined. Due to this, we were disabling
quadmath support even with glibc or musl.

So, use BR2_USE_WCHAR to drive the gcc libquadmath option.

In addition, invert the logic of the condition to use positive logic,
and rework the comment to no longer mention gcc 4.6: libquadmath still
exists, and it still requires wchar support.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 46f05ff..6e1c02d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -106,8 +106,8 @@ ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libitm
 endif
 
-# gcc 4.6.x quadmath requires wchar
-ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
+# quadmath support requires wchar
+ifeq ($(BR2_USE_WCHAR),)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 endif
 
