From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 09:04:21 +0100
Subject: [Buildroot] [git commit] libsecret: not available on AVR32,
	compiler error
Message-ID: <20140224083844.5D5BD99B79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7740b32f6fd595dcd4bb51b5b51a50758141dcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsecret does built on AVR32 due an internal compiler error, and
since it's unlikely that gcc will ever be upgraded on AVR32, we simply
mark this package as not available. The only reverse dependency of
libsecret is webkit, which already cannot be selected on AVR32.

Fixes:

  http://autobuild.buildroot.org/results/2d4/2d41f97378f06d0f3922e078ec0d02549690d4c1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsecret/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
index 70f1fe7..9a21d2e 100644
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LIBSECRET
 	depends on BR2_USE_WCHAR # gettext dep in libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	# Triggers an internal compiler error on AVR32
+	depends on !BR2_avr32
 	help
 	  libsecret is a library for storing and retrieving passwords and other
 	  secrets. It communicates with the "Secret Service" using DBus.
@@ -13,5 +15,6 @@ config BR2_PACKAGE_LIBSECRET
 	  https://wiki.gnome.org/Libsecret
 
 comment "libsecret needs a toolchain w/ wchar, threads"
+	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
