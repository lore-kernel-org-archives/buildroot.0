From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 13:07:18 +0100
Subject: [Buildroot] [git commit] libcap-ng: disable on avr32 which lacks TLS
Message-ID: <20131122145921.19BD29BD8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a80e3e06ed3d827cf29891a946059f3e595a6331
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap-ng needs TLS support, which is not available on avr32.
Also, disable reverse dependencies.

Fixes:
  http://autobuild.buildroot.net/results/73c/73c7c211a51c312bbe4eb6a540f3ad9c92c79ebe/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap-ng/Config.in |    1 +
 package/ofono/Config.in     |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index d1663cd..da5b447 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
+	depends on !BR2_avr32 # lacks TLS
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index b26b5e7..00df251 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	depends on !BR2_avr32 # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
@@ -15,5 +16,6 @@ config BR2_PACKAGE_OFONO
 	  http://ofono.org/
 
 comment "ofono needs a toolchain w/ wchar, threads"
+	depends on !BR2_avr32
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
