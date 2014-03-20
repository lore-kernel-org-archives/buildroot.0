From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Mar 2014 16:46:29 +0100
Subject: [Buildroot] [git commit] Fix microblize little endian toolchain
Message-ID: <20140320155006.1541C9BCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c220581c789a49e6e00e7125301bd23d1651224a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot toolchain creates big endian binaries instead of little endian
ones for microblaze architecture. The reason is wrong BR2_ARCH string.
KERNEL_ARCH must contain microblaze in both cases.

Signed-off-by: Jan Drazil <xdrazi00@stud.fit.vutbr.cz>
Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                  |    3 ++-
 arch/Config.in.microblaze |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 011af57..d49d7bf 100644
--- a/Makefile
+++ b/Makefile
@@ -318,7 +318,8 @@ KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
-	-e s/sh.*/sh/)
+	-e s/sh.*/sh/ \
+	-e s/microblazeel/microblaze/)
 
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
index dbdd99a..2d4c1fe 100644
--- a/arch/Config.in.microblaze
+++ b/arch/Config.in.microblaze
@@ -1,5 +1,6 @@
 config BR2_ARCH
-	default "microblaze"
+	default "microblazeel"  if BR2_microblazeel
+	default "microblaze"    if BR2_microblazebe
 
 config BR2_ENDIAN
 	default "LITTLE" if BR2_microblazeel
