From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 23:58:52 +0200
Subject: [Buildroot] [git commit] glibc: Pass correct -mabi for MIPS
Message-ID: <20131001220021.E17A29B527@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dfa23fcc2d54e75eb80d14fc2b0045a3a24c355
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to glibc-2.18/ports/sysdeps/mips/preconfigure,
if no -mabi was passed to CFLAGS, then it defaults to -mabi=n32.
This breaks o32 and n64 builds for MIPS64. Therefore, it is
necessary to append -mabi to CFLAGS.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4dd2e63..68c4636 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -43,6 +43,16 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 GLIBC_EXTRA_CFLAGS += -marm
 endif
 
+# MIPS64 defaults to n32 so pass the correct -mabi if
+# we are using a different ABI. OABI32 is also used
+# in MIPS so we pass -mabi=32 in this case as well
+# even though it's not strictly necessary.
+ifeq ($(BR2_MIPS_NABI64),y)
+GLIBC_EXTRA_CFLAGS += -mabi=64
+else ifeq ($(BR2_MIPS_OABI32),y)
+GLIBC_EXTRA_CFLAGS += -mabi=32
+endif
+
 # Even though we use the autotools-package infrastructure, we have to
 # override the default configure commands for several reasons:
 #
