From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:26:43 +0200
Subject: [Buildroot] [git commit] linux: cpupower needs gettext
Message-ID: <20160819092713.58234820F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f55adea434876cf1ee2604abe367ed1b6c555faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cpupower linux tool needs gettext, always (even without locales).

We need to disable NLS, otherwise it tries to compile the .po files.
We also need to pass -lintl, otherwise it forgets to link with it
(because, the world is glibc-only, you did not know? And glibc does not
need we link with -lintl, so why would we? Oh, yes, we also reinvented
our super intelligent one-off Makefile rather than use one of the
standard buildsystems).

Fixes #9181:

      CC       utils/helpers/sysfs.o
    In file included from utils/helpers/amd.c:9:0: ./utils/helpers/helpers.h:13:21: fatal error: libintl.h: No such file or directory
     #include <libintl.h>
                         ^

Without NLS=false (yes, we could depend on host-gettext):

      MSGFMT   po/de.gmo
    make[3]: msgfmt: Command not found

Without LDFLAGS=-lintl:

      CC       cpupower
    ./utils/cpupower.o: In function `main':
    cpupower.c:(.text.startup+0x1a4): undefined reference to `libintl_textdomain'
    ./utils/idle_monitor/cpupower-monitor.o: In function `list_monitors':
    cpupower-monitor.c:(.text+0x5dc): undefined reference to `libintl_gettext'
    ./utils/cpupower-set.o: In function `cmd_set':
    cpupower-set.c:(.text+0x38): undefined reference to `libintl_textdomain'
    ./utils/cpupower-info.o: In function `cmd_info':
    cpupower-info.c:(.text+0x20): undefined reference to `libintl_textdomain'
    collect2: error: ld returned 1 exit status

Reported-by: Joergen Pihlflyckt <Jorgen.Pihlflyckt@ajeco.fi>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Joergen Pihlflyckt <Jorgen.Pihlflyckt@ajeco.fi>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.tools.in        | 6 ++++++
 linux/linux-tool-cpupower.mk | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux/Config.tools.in b/linux/Config.tools.in
index 09bcfab..5ada98d 100644
--- a/linux/Config.tools.in
+++ b/linux/Config.tools.in
@@ -3,11 +3,17 @@ menu "Linux Kernel Tools"
 config BR2_LINUX_KERNEL_TOOL_CPUPOWER
 	bool "cpupower"
 	depends on !BR2_bfin # pciutils
+	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT # gettext
 	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  cpupower is a collection of tools to examine and tune power
 	  saving related features of your processor.
 
+comment "cpupower needs a toolchain w/ wchar"
+	depends on !BR2_bfin
+	depends on !BR2_USE_WCHAR && BR2_NEEDS_GETTEXT
+
 config BR2_LINUX_KERNEL_TOOL_PERF
 	bool "perf"
 	help
diff --git a/linux/linux-tool-cpupower.mk b/linux/linux-tool-cpupower.mk
index 4551cda..095a5ef 100644
--- a/linux/linux-tool-cpupower.mk
+++ b/linux/linux-tool-cpupower.mk
@@ -6,10 +6,12 @@
 
 LINUX_TOOLS += cpupower
 
-CPUPOWER_DEPENDENCIES = pciutils
+CPUPOWER_DEPENDENCIES = pciutils $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 CPUPOWER_MAKE_OPTS = CROSS=$(TARGET_CROSS) \
 	CPUFREQ_BENCH=false \
+	NLS=false \
+	$(if $(BR2_NEEDS_GETTEXT),LDFLAGS=-lintl) \
 	DEBUG=false
 
 define CPUPOWER_BUILD_CMDS
