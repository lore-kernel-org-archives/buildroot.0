From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:07 +0200
Subject: [Buildroot] [PATCH v2 20/30] dhcpcd: do not pass --target option
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dhcpcd is using $(BR2_GCC_TARGET_ARCH) as the value of its --target
option. However, depending on the architecture, this value might be
empty.

After inspecting the dhcpcd configure script, it turns out that in
fact the --target option has the following semantic:

  --target=TARGET   configure for building compilers for TARGET [HOST]

So it is very much like the --target option of regular,
autoconf-based, configure scripts. Since dhcpcd is not a compiler,
passing --target is pointless. Moreover, as long as --os=linux is
passed, passing --host or --target is completely ignored by the
configure script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/dhcpcd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index f4b821a..3bb7a13 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -25,7 +25,6 @@ endif
 define DHCPCD_CONFIGURE_CMDS
 	(cd $(@D); \
 	$(TARGET_CONFIGURE_OPTS) ./configure \
-		--target=$(BR2_GCC_TARGET_ARCH) \
 		--os=linux \
 		$(DHCPCD_CONFIG_OPTS) )
 endef
-- 
2.0.0
