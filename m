From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:19:54 +0100
Subject: [Buildroot] [PATCH 1/6] linux/perf: really do not build the
	documentation
In-Reply-To: <cover.1457720152.git.yann.morin.1998@free.fr>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
Message-ID: <19827565229346e7383cfd437c174735cd7f6698.1457720152.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The perf buildsystem, inside the kernel, is not really amenable to be
easily used...

Regarding the documentation, it will forcefully try to detect asciidoc
and, with the latest versions, xmlto, completely disregarding what the
user may provide.

We currently pass ASCIIDOC= (the empty string) on the make command line,
as an attempt to disable building the documentation, but that has no
effect whatsoever on perf: that variable is not passed down to the
sub-sub-make (yes, a two-level depth) that is responsible for building
the documentation.

We really do not want to build any of the documentation (the user can
refer to the documentation on his own development machine), so we use a
little dirty trick: we provide a GNUmakefile beside the existing
Makefile for the documentation; GNUmakefile always takes precedence over
a Makefile when both are present. We only provide a catch-all-no-recipe
rule in that GNUmakefile, so it really does nothing useful, except avoid
building the documentation.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/linux-tool-perf.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index 1070a1c..f9b295f 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -24,8 +24,7 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPYTHON=1 \
 	DESTDIR=$(TARGET_DIR) \
 	prefix=/usr \
-	WERROR=0 \
-	ASCIIDOC=
+	WERROR=0
 
 # We need to pass an argument to ld for setting the endianness when
 # building it for MIPS architecture, otherwise the default one will
@@ -68,6 +67,19 @@ else
 PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
+# We really do not want to build the perf documentation, because it
+# has stringent requirement on the documentation generation tools,
+# like xmlto and asciidoc), which may be lagging behind on some
+# distributions.
+# We name it 'GNUmakefile' so that GNU make will use it instead of
+# the existing 'Makefile'.
+define PERF_DISABLE_DOCUMENTATION
+	if [ -f $(@D)/tools/perf/Documentation/Makefile ]; then \
+		printf "%%:\n\t@:\n" >$(@D)/tools/perf/Documentation/GNUmakefile; \
+	fi
+endef
+LINUX_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
+
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build perf in $(@D)/tools/perf/ and not just
 # $(@D) so that it isn't built in the root directory of the kernel
-- 
1.9.1
