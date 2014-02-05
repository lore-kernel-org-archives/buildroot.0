From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 14:51:00 +0100
Subject: [Buildroot] [PATCH 8 of 8 v2] infra: remove separate definition of
 DISABLE_DOCUMENTATION
In-Reply-To: <patchbomb.1391608252@argentina>
References: <patchbomb.1391608252@argentina>
Message-ID: <2c0482e0d65779af52cf.1391608260@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we now always disable documentation on target, there is no need to
have a separate variable DISABLE_DOCUMENTATION anymore.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: new patch

Note: I'm not 100% convinced by this patch, but I post it to ignite the
discussion. The advantage of the separate variable is the grouping of the
options. Without it, it is not so clear that --with-fop is related to
documentation, unless you already know what fop is. Also, there is no clear
place to put the comment regarding passing multiple options, so I just
removed it (losing some information).
Both problems could be solved by keeping the variable but moving it to
autotools.mk, but this is then no longer consistent with the other
DISABLE_xxx variables.

diff --git a/package/Makefile.in b/package/Makefile.in
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -332,16 +332,6 @@ ifneq ($(BR2_LARGEFILE),y)
 DISABLE_LARGEFILE= --disable-largefile
 endif
 
-# The configure option varies, but since unknown options are ignored
-# we can pass all of them.
-DISABLE_DOCUMENTATION = \
-	--disable-gtk-doc \
-	--disable-doc \
-	--disable-docs \
-	--disable-documentation \
-	--with-xmlto=no \
-	--with-fop=no
-
 ifeq ($(BR2_INET_IPV6),y)
 DISABLE_IPV6= --enable-ipv6
 else
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -110,7 +110,12 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--program-prefix="" \
-		$$(DISABLE_DOCUMENTATION) \
+		--disable-gtk-doc \
+		--disable-doc \
+		--disable-docs \
+		--disable-documentation \
+		--with-xmlto=no \
+		--with-fop=no
 		$$(DISABLE_NLS) \
 		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
