From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:17 -0700
Subject: [Buildroot] [PATCH 09/15 v6] package/libdrm: can also use only
	libudev
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <d51d4ef7ab59a9d55f0e2895770cc53490155381.1414442699.git.yann.morin.1998@free.fr>
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
index 28a801f..17439c9 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -62,9 +62,9 @@ else
 LIBDRM_CONF_OPTS += --disable-freedreno-experimental-api
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 LIBDRM_CONF_OPTS += --enable-udev
-LIBDRM_DEPENDENCIES += udev
+LIBDRM_DEPENDENCIES += libudev
 else
 LIBDRM_CONF_OPTS += --disable-udev
 endif
-- 
1.9.1
