From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:38:21 +0200
Subject: [Buildroot] [PATCH 09/15 v5] package/libdrm: can also use only
	libudev
In-Reply-To: <cover.1409578332.git.yann.morin.1998@free.fr>
References: <cover.1409578332.git.yann.morin.1998@free.fr>
Message-ID: <970c4621d8e04dd8bcfba703dd7afafddc488866.1409578332.git.yann.morin.1998@free.fr>
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
index cb9d3a9..7fd01e5 100644
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
