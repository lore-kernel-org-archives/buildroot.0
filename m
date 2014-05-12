From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:11:03 +0200
Subject: [Buildroot] [git commit] radvd: not available on AVR32
Message-ID: <20140512204138.62F0D9CB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e37f97527e4aeb8a4b3b34002dadc5a55b808455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

radvd needs some C library definitions not available in old uClibc
versions. Since we don't care much about AVR32, we simply disallow the
radvd package on this architecture.

Fixes:

  http://autobuild.buildroot.org/results/f03/f0367a30e8d772eb5e955a85b853ec3e43fe54b3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 6edfd7c..71f2f34 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_RADVD
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_LIBDAEMON
 	depends on BR2_INET_IPV6
+	# uClibc too old, does not define ARPHRD_IEEE802154
+	depends on !BR2_avr32
 	help
 	  IPv6 Router Advertisement Daemon.
 
@@ -13,3 +15,4 @@ config BR2_PACKAGE_RADVD
 comment "radvd needs a toolchain w/ IPv6"
 	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
+	depends on !BR2_avr32
