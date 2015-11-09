From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  9 Nov 2015 20:00:21 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
Message-ID: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we set HOSTARCH to the output of `uname -m`. This gives us
the architecture as seen by the running kernel. For example, we would
end up with 'x86_64' for a 64-bit kernel running on an x86_64 processor.

We use that value to determine whether we can run some binary tools,
like our pre-configured external toolchains.

However, one may be running a userland in a different bitness than that
of the running kernel. For example, one may run in a 32-bit chroot, even
though the kernel is running in 64-bit.

Up until recently, this was not an issue because the pre-configured
external toolchains were all requiring an i386 (x86 in Buildroot
parlance).

But since w eintroduced the latest Linaro toolchains, we now have
toolchains that require a 64-bit userland.

So, when running on a 64-bit kernel, we believe those toolchains are
available, even when the user is running a 32-bit userland. This causes
build failures for our autobuilders, like so:

    http://autobuild.buildroot.org/results/9cd/9cdf10ec5b31144b2e03ea09cf128702339895b3/

with the following symptoms:

    >>> toolchain-external undefined Configuring
    Cannot execute cross-compiler '/home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bin/aarch64-linux-gnu-gcc'

So, instead of relying on the output of `uname -r`, look for the host
gcc and extract the target it was configured to generate code for.

Fixes:
    http://autobuild.buildroot.org/results/9cd/9cdf10ec5b31144b2e03ea09cf128702339895b3/  (aarch64)
    http://autobuild.buildroot.org/results/888/8889aa7d9fb48370e4760a6edbc6d3ae945f02f2/  (arm)
    and many more...

Besides fixing those issues, it will also allow us to add the 64-bit
variants of toolchains when they exist, like the upcoming Codescape
MTI and IMG toolchains for MIPS from Imagination Technologies.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 Makefile | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 80c264f..4c7ddf5 100644
--- a/Makefile
+++ b/Makefile
@@ -52,15 +52,31 @@ ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MA
 $(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
 endif
 
-export HOSTARCH := $(shell uname -m | \
-	sed -e s/i.86/x86/ \
-	    -e s/sun4u/sparc64/ \
-	    -e s/arm.*/arm/ \
-	    -e s/sa110/arm/ \
-	    -e s/ppc64/powerpc64/ \
-	    -e s/ppc/powerpc/ \
-	    -e s/macppc/powerpc/\
-	    -e s/sh.*/sh/)
+# Determine the userland we are running on.
+#
+# Note that, despite its name, we are not interested in the actual
+# architecture name. This is mostly used to determine whether some
+# of the binary tools (e.g. pre-built external toolchains) can run
+# on the current host. So we need to know if the userland we're
+# running on can actually run those toolchains.
+#
+# For example, a 64-bit prebuilt toolchain will not run on a 64-bit
+# kernel if the userland is 32-bit (e.g. in a chroot for example).
+#
+# So, we extract the first part of the tuple the host gcc was
+# configured to generate code for; we assume this is our userland.
+#
+export HOSTARCH := $(shell gcc -v 2>&1 | \
+	sed -e '/^Target: \([^-]*\).*/!d' \
+	    -e 's//\1/' \
+	    -e 's/i.86/x86/' \
+	    -e 's/sun4u/sparc64/' \
+	    -e 's/arm.*/arm/' \
+	    -e 's/sa110/arm/' \
+	    -e 's/ppc64/powerpc64/' \
+	    -e 's/ppc/powerpc/' \
+	    -e 's/macppc/powerpc/' \
+	    -e 's/sh.*/sh/' )
 
 # Parallel execution of this Makefile is disabled because it changes
 # the packages building order, that can be a problem for two reasons:
-- 
1.9.1
