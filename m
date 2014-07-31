From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 02:16:43 +0200
Subject: [Buildroot] [PATCH 08/14 v4] package/libdrm: can also use only
	libudev
In-Reply-To: <cover.1406765723.git.yann.morin.1998@free.fr>
References: <cover.1406765723.git.yann.morin.1998@free.fr>
Message-ID: <6e4323e0d76daa3612e9e4f8b7794f19b9d1ca43.1406765723.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even if a udev daemon is missing, libdrm can still use just libudev to
enumerate devices.

In case both udev and libudev are enabled, depending on just udev would
be enough to also get libudev (since any udev provider is also a libudev
provider). But it is more logical to have separate conditions for udev
and libudev.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libdrm/libdrm.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 1c6ae78..3b3957b 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -62,9 +62,9 @@ else
 LIBDRM_CONF_OPT += --disable-freedreno-experimental-api
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 LIBDRM_CONF_OPT += --enable-udev
-LIBDRM_DEPENDENCIES += udev
+LIBDRM_DEPENDENCIES += libudev
 else
 LIBDRM_CONF_OPT += --disable-udev
 endif
-- 
1.9.1
