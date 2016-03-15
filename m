From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:42:12 +0100
Subject: [Buildroot] [git commit] mplayer: switch it to samba4
Message-ID: <20160315214848.E91F9817E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8931e7159bb14dcf1f930f2d27124f5b56f232f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba(3) has been deprecated for quite some time so switch mplayer to
use samba4 if available.
It needs a little extra tweak to pick up the proper cflags since the odd
configure script doesn't do it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
