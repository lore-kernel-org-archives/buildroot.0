From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2014 00:15:07 +0100
Subject: [Buildroot] [git commit] ltrace: narrow down available architectures
Message-ID: <20140110231551.EA1109C43A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5c5dd1afe683d0b9147572608c579c748584acc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

First switch the architecture availability to positive logic since it's
cleaner and avoids issues when new ones are introduced.
Then look at the source for the available ones at sysdeps/linux-gnu/...

aarch64 -> NULL
arc -> NULL
arm -> hardcoded to little endian, so no armeb
avr32 -> NULL
blackfin -> NULL
microblaze -> NULL
mips -> little/big endian handled but not for 64 bits
nios2 -> NULL
ppc -> OK
sh -> NULL
sparc -> OK
x86 -> Both i386 and x86_64 handled
xtensa -> NULL

Fixes:
http://autobuild.buildroot.net/results/cd2/cd24e7b6f863ab413d76ca7a81bd357ddf1dc4f7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltrace/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 943af8d..3448342 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on !(BR2_avr32 || BR2_sh || BR2_sh64 || BR2_xtensa || BR2_aarch64 || BR2_arc)
+	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
+		|| BR2_powerpc || BR2_sparc || BR2_x86_64)
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
