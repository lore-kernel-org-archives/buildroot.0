From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 17:55:23 +0200
Subject: [Buildroot] [PATCH] botan: pass --prefix=/usr to fix .pc file
Message-ID: <1428681323-11414-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

botan uses a non-autotools build system. We currently don't pass any
--prefix=/usr, and by default the prefix is set to /usr/local. This
doesn't cause a lot of visible issues because at install time, we pass
DESTDIR=$(TARGET_DIR)/usr (the build system doesn't make the
difference between DESTDIR and prefix).

However, the generated pkg-config .pc file is wrong, as it contains
prefix=/usr/local instead of prefix=/usr, which doesn't match where
the botan library and headers are installed. By passing --prefix=/usr,
we make sure that the .pc file is in line with where botan is
installed.

Fixes bug #7760

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/botan/botan.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 70a0946..6ac3ce7 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -16,7 +16,8 @@ BOTAN_CONF_OPTS = \
 	--cpu=$(BR2_ARCH) \
 	--os=linux \
 	--cc=gcc \
-	--cc-bin="$(TARGET_CXX)"
+	--cc-bin="$(TARGET_CXX)" \
+	--prefix=/usr
 
 ifeq ($(BR2_STATIC_LIBS),y)
 BOTAN_CONF_OPTS += --disable-shared --no-autoload
-- 
2.1.0
