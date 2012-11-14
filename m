From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:30:35 +0100
Subject: [Buildroot] [git commit] bluez-utils: disable on avr32
Message-ID: <20121114214722.B0C3B99FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bebca0c550a795350d90c33a09be5820dff616f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bluez-utils package does not build for the avr32 architecture; this
results in autobuilder failures such as the following.

  http://autobuild.buildroot.net/results/d737d1220d7566289eee802fd580a49d8c456c97/build-end.log

The underlying problem is with the <sys/epoll.h> header provided by the
antiquated avr32 toolchain; this header lacks definitions for
epoll_create1() and EPOLL_CLOEXEC.

This patch disables support for the bluez-utils package on the avr32
architecture.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bluez_utils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 9836b21..c06f8cd 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
+	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
 	select BR2_PACKAGE_DBUS
