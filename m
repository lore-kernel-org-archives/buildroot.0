From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Feb 2011 14:34:28 +0100
Subject: [Buildroot] [git commit master 1/1] openssl: pass LDFLAGS to fix
	incorrect link
Message-ID: <20110207133512.A58A68F409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c761eafb021c2beaf52b2d1a383433deac5fc2b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already pass the LD variable to openssl in order to use gcc as the
driver for the link process, instead of directly using the ld
linker. However, we were not passing LDFLAGS so that the compiler
flags are passed, which means that with multilib toolchains, the
incorrect library variant could be used at link time, leading to
invalid binaries (partly ARMv4, partly ARMv5) or broken compilation
(when the build took place in soft-float, but the link stage takes
place against hard-float libraries).

This fixes a problem reported on IRC by amo-ej1 when compiling ssh on
PowerPC e500v2 with a CodeSourcery toolchain ("crtbegin.o uses hard
float, sshd uses soft float").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssh/openssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 82c64d6..3db7156 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -6,7 +6,7 @@
 
 OPENSSH_VERSION = 5.6p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_CONF_ENV = LD="$(TARGET_CC)"
+OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
-- 
1.7.3.4
