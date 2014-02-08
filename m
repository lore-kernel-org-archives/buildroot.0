From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:03:09 +0100
Subject: [Buildroot] [git commit] vlc: fix bonjour support
Message-ID: <20140208212129.C4F539C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efa9a3f25e9db265a95d51b33a49d4556d45e713
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bonjour support checks for avahi-client, which requires avahi-daemon and
dbus enabled.

Fixes:
  http://autobuild.buildroot.org/results/f8b/f8bed9a42f1853db8aa81161d7be5a7cb67afe8f/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 5c10275..1027151 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -38,9 +38,10 @@ else
 VLC_CONF_OPT += --disable-alsa
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+# bonjour support needs avahi-client, which needs avahi-daemon and dbus
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
 VLC_CONF_OPT += --enable-bonjour
-VLC_DEPENDENCIES += avahi
+VLC_DEPENDENCIES += avahi dbus
 else
 VLC_CONF_OPT += --disable-bonjour
 endif
