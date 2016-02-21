From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 10:50:08 +0100
Subject: [Buildroot] [PATCH 04/14] package/iproute2: add optional support
	for elfutils
In-Reply-To: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456048218-4061-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When elfutils was compiled before, iproute2 will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/sbin/tc | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libelf.so.1]
[...]

The build system offers no option to en-/disable elfutils support:
http://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/configure#n252

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.7.0
