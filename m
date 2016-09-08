From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  8 Sep 2016 10:51:07 +0200
Subject: [Buildroot] [PATCH] package/mono: fix undefined reference to tls
Message-ID: <1473324667-31678-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes the nasty undefined reference to tls bug experienced with musl.

Fixes:
http://autobuild.buildroot.net/results/048f04488cb8c7f4c32b828aa5214ebc22ba0153
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 3d0b9bc..de4f16b 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -26,6 +26,10 @@ MONO_CONF_OPTS = --disable-gtk-doc \
 	--disable-mcs-build \
 	--enable-static
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+MONO_CONF_OPTS += --with-tls=pthread
+endif
+
 # The libraries have been built by the host-mono build. Since they are
 # architecture-independent, we simply copy them to the target.
 define MONO_INSTALL_LIBS
-- 
1.9.1
