From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 22:25:30 +0200
Subject: [Buildroot] [git commit branch/next] package/iptraf-ng: add
 dependency on Linux headers >= 3.14
Message-ID: <20200827201830.8EA6385164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9f551a9d0c2523337e9aafb667ddf3631509636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

iptraf-ng uses a number of definitions (like PACKET_KERNEL and
PACKET_USERSPACE) provided by the Linux kernel headers, which were
introduced in Linux 3.14 [1], so we need to add a dependency on
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14.

[1] https://elixir.bootlin.com/linux/v3.14-rc1/source/include/uapi/linux/if_packet.h

Fixes:

  http://autobuild.buildroot.net/results/480b00b4b264cfe1da533c762595d21b72fa8211/

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iptraf-ng/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
index f240daf93d..5c61b7c0e2 100644
--- a/package/iptraf-ng/Config.in
+++ b/package/iptraf-ng/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IPTRAF_NG
 	bool "iptraf-ng"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	select BR2_PACKAGE_NCURSES
 	help
 	  IPTraf-ng is a console-based network monitoring program for
@@ -10,3 +11,7 @@ config BR2_PACKAGE_IPTRAF_NG
 
 	  IPTraf-ng is a fork of original IPTraf v3.0.0
 	  (http://iptraf.seul.org).
+
+comment "iptraf-ng needs a toolchain w/ kernel headers >= 3.14"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
