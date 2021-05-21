From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 May 2021 10:54:39 +0200
Subject: [Buildroot] [git commit] package/mender: the dbus plugin requires
 libglib2
Message-ID: <20210521082728.7E0CF88666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c7222ad038a4b83e69733353ba3219815ac66d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libglib2 is not build before building the dbus plugin, mender fails to
compile with the following error:
Package 'gio-2.0', required by 'virtual:world', not found

 - Add a check for libglib2 in addition to dbus when enabling the dbus plugin.
 - Depend on libglib2 if both packages are selected.

Fixes:
http://autobuild.buildroot.org/results/1bc5893b88db08612059ad899c2bc3b2abb291fb

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mender/mender.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index b4c5761151..a110caf551 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -87,7 +87,8 @@ else
 MENDER_TAGS += nolzma
 endif
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
+ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)
+MENDER_DEPENDENCIES += libglib2
 define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
 		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
