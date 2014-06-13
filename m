From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 01:02:37 +0200
Subject: [Buildroot] [PATCH 13/20 RFC] package/libdrm: can also use only
	libudev
In-Reply-To: <cover.1402699915.git.yann.morin.1998@free.fr>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <36963ae870f6849e40682c2ad88cd22afe1c52e4.1402699915.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Even if a udev daemon is missing, libdrm can still use just libudev to
enumerate devices.

In case both udev and libudev are enabled, depending on just udev would
be enough to also get libudev (since any udev provider is also a libudev
provider). But it is more logical to have separate conditions for udev
and libudev.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libdrm/libdrm.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index b3e4d7a..10d38e4 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -69,4 +69,8 @@ else
 LIBDRM_CONF_OPT += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LIBDRM_DEPENDENCIES += libudev
+endif
+
 $(eval $(autotools-package))
-- 
1.8.3.2
