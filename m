From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:04:10 +0100
Subject: [Buildroot] [git commit] dhcpcd: do not pass --target option
Message-ID: <20141106233446.E21B7B12A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04a586ecb31cde9db1eceef9b64e2f5f214a9ac6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
