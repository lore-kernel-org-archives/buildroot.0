From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 17 May 2013 20:42:40 +0100
Subject: [Buildroot] [PATCH] Makefile: Set default emulation for
	MIPS64/MIPS64el n64
Message-ID: <1368819760-11931-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

binutils set the default emulation for MIPS64/MIPS64el to
elf32btsmipn32 and elf32ltsmipn3 respectively. This breaks
linking for programs calling the linker directly without passing
the appropriate emulation parameter (-m). Unfortunately,
binutils do not provide a way to set the default emulation when
building the linker therefore we export the LDEMULATION variable
to set the preferred emulation ourselves. This fixes

http://autobuild.buildroot.net/results/0f2a760b94069ac915d856cd1ae1998e5483807a/

and possibly other build failures as well.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 5d2a7ae..d80d12d 100644
--- a/Makefile
+++ b/Makefile
@@ -354,6 +354,10 @@ ifeq ($(BR2_ECLIPSE_REGISTER),y)
 TARGETS+=toolchain-eclipse-register
 endif
 
+ifeq ($(BR2_MIPS_NABI64),y)
+export LDEMULATION=elf64btsmip
+endif
+
 include fs/common.mk
 
 TARGETS+=target-post-image
-- 
1.8.2.1
