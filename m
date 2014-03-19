From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Wed, 19 Mar 2014 13:01:05 +0100
Subject: [Buildroot] [PATCH 1/1] Fix microblize little endian toolchain
Message-ID: <1395230465-4421-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Drazil <xdrazi00@stud.fit.vutbr.cz>

Buildroot toolchain creates big endian binaries instead of little endian
ones for microblaze architecture. The reason is wrong BR2_ARCH string.
KERNEL_ARCH must contain microblaze in both cases.

Signed-off-by: Jan Drazil <xdrazi00@stud.fit.vutbr.cz>
Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
---
 Makefile                  | 3 ++-
 arch/Config.in.microblaze | 3 ++-
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
-- 
1.9.0
