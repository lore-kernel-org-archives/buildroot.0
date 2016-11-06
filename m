From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 15:00:43 +0100
Subject: [Buildroot] [git commit] privoxy: needs thread support
Message-ID: <20161106140201.E4998818BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=271756da6749a2d88ca9744cb56f25a8c822123e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though privoxy has some conditional code to handle configurations
without threads, it is not properly handled everywhere, leading to a
build failure. Since this package is unlikely to be used in
non-threaded environment, just disable it for non-threaded
configurations.

Fixes:

  http://autobuild.buildroot.net/results/fae7a41d110ed6c4d62c77873229d069d8b65986

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/privoxy/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/privoxy/Config.in b/package/privoxy/Config.in
index 8d8d01a..accb48d 100644
--- a/package/privoxy/Config.in
+++ b/package/privoxy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PRIVOXY
 	bool "privoxy"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	help
@@ -10,3 +11,7 @@ config BR2_PACKAGE_PRIVOXY
 	  obnoxious Internet junk.
 
 	  http://www.privoxy.org/
+
+comment "privoxy needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
