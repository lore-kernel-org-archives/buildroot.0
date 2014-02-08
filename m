From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Feb 2014 15:34:51 +0100
Subject: [Buildroot] [PATCH v1 2/6] vlc: fix bonjour support
In-Reply-To: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
References: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391870095-3738-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bonjour support checks for avahi-client, which requires avahi-daemon and
dbus enabled.

Fixes:
  http://autobuild.buildroot.org/results/f8b/f8bed9a42f1853db8aa81161d7be5a7cb67afe8f/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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
-- 
1.8.5.4
