From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Sep 2016 21:05:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: use BR2_TOOLCHAIN_HAS_LIBATOMIC
Message-ID: <20160924190516.28092-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While fixing
http://autobuild.buildroot.net/results/d95/d9572bcafc1776eebe88bbcaf031a05cd6ee4b23/
by using http://patchwork.ozlabs.org/patch/674337/ the build stopped at
a later stage with

/home/buildroot/br4/output/build/vlc-2.2.4/src/.libs/libvlccore.so: undefined reference to `__atomic_fetch_add_4'
/home/buildroot/br4/output/build/vlc-2.2.4/src/.libs/libvlccore.so: undefined reference to `__atomic_fetch_sub_4'
/home/buildroot/br4/output/build/vlc-2.2.4/src/.libs/libvlccore.so: undefined reference to `__atomic_fetch_or_1'
/home/buildroot/br4/output/build/vlc-2.2.4/src/.libs/libvlccore.so: undefined reference to `__atomic_compare_exchange_4'
/home/buildroot/br4/output/build/vlc-2.2.4/src/.libs/libvlccore.so: undefined reference to `__atomic_exchange_1'
collect2: error: ld returned 1 exit status

so libatomic must be pulled in if necessary.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 8efbecb..cf0b557 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -56,6 +56,11 @@ VLC_CONF_OPTS += \
 	--disable-addonmanagermodules \
 	--enable-run-as-root \
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+VLC_CONF_ENV += LIBS="-latomic"
+endif
+
 # Building static and shared doesn't work, so force static off.
 ifeq ($(BR2_STATIC_LIBS),)
 VLC_CONF_OPTS += --disable-static
-- 
2.9.3
