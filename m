From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 09:50:14 +0100
Subject: [Buildroot] [git commit branch/next]
 package/gstreamer1/gst1-plugins-bad: explicitly enable _GNU_SOURCE for
 festival/glibc 2.18
Message-ID: <20201117203827.234EE813C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d1cf2317749868a0097f8a41a80779283664e28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

festival fails to built with glibc 2.18 due to fopen and the h_addr field in
struct hostent:

../gst/festival/gstfestival.c: In function 'gst_festival_chain':
../gst/festival/gstfestival.c:273:3: warning: implicit declaration of function 'fdopen' [-Wimplicit-function-declaration]
   fd = fdopen (f, "wb");
   ^
../gst/festival/gstfestival.c:273:6: warning: assignment makes pointer from integer without a cast [enabled by default]
   fd = fdopen (f, "wb");
      ^
../gst/festival/gstfestival.c: In function 'festival_socket_open':
../gst/festival/gstfestival.c:367:45: error: 'struct hostent' has no member named 'h_addr'
     memmove (&serv_addr.sin_addr, serverhost->h_addr, serverhost->h_length);
                                             ^

Both of which are hidden behind _GNU_SOURCE in glibc 2.18, so enable that to
fix this build issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 86aa345b00..a9111ebdb8 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -13,7 +13,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING
 GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+
 
-GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -std=c99
+GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE
 GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
