From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:41:23 +0100
Subject: [Buildroot] [git commit] package/iproute2: add optional support for
	elfutils
Message-ID: <20160221114127.BF664803C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5da3186efbeeff49ea4dc1774280d7cc2899c27f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When elfutils was compiled before, iproute2 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/sbin/tc | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libelf.so.1]
[...]

The build system offers no option to en-/disable elfutils support:
http://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/configure#n252

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6789c52..6fa68c2 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -18,6 +18,10 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 IPROUTE2_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+IPROUTE2_DEPENDENCIES += elfutils
+endif
+
 # If we've got iptables enable xtables support for tc
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
