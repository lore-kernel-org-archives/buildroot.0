From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 11:32:18 -0300
Subject: [Buildroot] [PATCH 1/7] mplayer: switch it to samba4
Message-ID: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

samba(3) has been deprecated for quite some time so switch mplayer to
use samba4 if available.
It needs a little extra tweak to pick up the proper cflags since the odd
configure script doesn't do it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mplayer/mplayer.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 2082f25..cbbd1e7 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -98,9 +98,11 @@ else
 MPLAYER_CONF_OPTS += --disable-termcap
 endif
 
-ifeq ($(BR2_PACKAGE_SAMBA_SMBCLIENT),y)
+# mplayer doesn't pick up libsmbclient cflags
+ifeq ($(BR2_PACKAGE_SAMBA4),y)
+MPLAYER_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags smbclient`
 MPLAYER_CONF_OPTS += --enable-smb
-MPLAYER_DEPENDENCIES += samba
+MPLAYER_DEPENDENCIES += samba4
 else
 MPLAYER_CONF_OPTS += --disable-smb
 endif
-- 
2.4.10
