From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 22:13:57 +0200
Subject: [Buildroot] [git commit] package/libclc: disable ccache
Message-ID: <20200406200041.E161F8CA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bffce31ec19842c99a5f32891c3fba790d04349e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure.py extracts arch, vendor, and os from the passed
toolchain string on line 180. When using ccache, the passed path string is
"/usr/lib64/ccache/g++" which breaks the logic, causing the following error:

Traceback (most recent call last):
  File "./configure.py", line 180, in <module>
    (t_arch, t_vendor, t_os) = target.split('-')
ValueError: not enough values to unpack (expected 3, got 1)

Use --with-cxx-compiler=$(HOSTCXX_NOCCACHE) instead of $(HOSTCXX) to fix the
above error.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libclc/libclc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
index 52249a7087..630616905c 100644
--- a/package/libclc/libclc.mk
+++ b/package/libclc/libclc.mk
@@ -25,7 +25,7 @@ LIBCLC_CONF_OPTS = \
 	--prefix=/usr \
 	--includedir=/usr/share \
 	--pkgconfigdir=/usr/lib/pkgconfig \
-	--with-cxx-compiler=$(HOSTCXX)
+	--with-cxx-compiler=$(HOSTCXX_NOCCACHE)
 
 define LIBCLC_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
