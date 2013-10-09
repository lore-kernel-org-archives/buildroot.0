From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  9 Oct 2013 11:15:09 +0200
Subject: [Buildroot] [PATCH v2] Fix compilation of busybox 1.21.1
Message-ID: <1381310110-7183-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems patches previously applied on busybox 1.20.2 are also needed
for version 1.21.1.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 ...ersion_code-don-t-fail-on-Linux-version-s.patch |   46 ++++++++
 ...correct-m_status-field-in-outgoing-packet.patch |   40 +++++++
 .../1.21.1/busybox-1.21.1-pkg-config-selinux.patch |   67 +++++++++++
 .../1.21.1/busybox-1.21.1-sys-resource.patch       |  123 ++++++++++++++++++++
 4 files changed, 276 insertions(+)
 create mode 100644 package/busybox/1.21.1/busybox-1.21.1-get_linux_version_code-don-t-fail-on-Linux-version-s.patch
 create mode 100644 package/busybox/1.21.1/busybox-1.21.1-ntpd-fix-incorrect-m_status-field-in-outgoing-packet.patch
 create mode 100644 package/busybox/1.21.1/busybox-1.21.1-pkg-config-selinux.patch
 create mode 100644 package/busybox/1.21.1/busybox-1.21.1-sys-resource.patch

diff --git a/package/busybox/1.21.1/busybox-1.21.1-get_linux_version_code-don-t-fail-on-Linux-version-s.patch b/package/busybox/1.21.1/busybox-1.21.1-get_linux_version_code-don-t-fail-on-Linux-version-s.patch
new file mode 100644
index 0000000..2b81279
--- /dev/null
+++ b/package/busybox/1.21.1/busybox-1.21.1-get_linux_version_code-don-t-fail-on-Linux-version-s.patch
@@ -0,0 +1,46 @@
+From 556ac3633ce3e7bd51c93b78827ae3874d856257 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Sat, 5 May 2012 17:47:23 +0200
+Subject: [PATCH] get_linux_version_code: don't fail on Linux version strints
+ like "3.0-foo"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+---
+ libbb/kernel_version.c |   11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/libbb/kernel_version.c b/libbb/kernel_version.c
+index a168a1e..738ed02 100644
+--- a/libbb/kernel_version.c
++++ b/libbb/kernel_version.c
+@@ -20,18 +20,15 @@
+ int FAST_FUNC get_linux_version_code(void)
+ {
+ 	struct utsname name;
+-	char *s;
++	char *s, *t;
+ 	int i, r;
+ 
+-	if (uname(&name) == -1) {
+-		bb_perror_msg("can't get system information");
+-		return 0;
+-	}
+-
++	uname(&name); /* never fails */
+ 	s = name.release;
+ 	r = 0;
+ 	for (i = 0; i < 3; i++) {
+-		r = r * 256 + atoi(strtok(s, "."));
++		t = strtok(s, ".");
++		r = r * 256 + (t ? atoi(t) : 0);
+ 		s = NULL;
+ 	}
+ 	return r;
+-- 
+1.7.9.5
+
diff --git a/package/busybox/1.21.1/busybox-1.21.1-ntpd-fix-incorrect-m_status-field-in-outgoing-packet.patch b/package/busybox/1.21.1/busybox-1.21.1-ntpd-fix-incorrect-m_status-field-in-outgoing-packet.patch
new file mode 100644
index 0000000..4ba61f1
--- /dev/null
+++ b/package/busybox/1.21.1/busybox-1.21.1-ntpd-fix-incorrect-m_status-field-in-outgoing-packet.patch
@@ -0,0 +1,40 @@
+From b7841cf7b919b16d1bd4619154bf7cb4c22b4ccd Mon Sep 17 00:00:00 2001
+From: Paul Marks <paul@pmarks.net>
+Date: Mon, 14 Jan 2013 02:39:10 +0100
+Subject: [PATCH] ntpd: fix incorrect m_status field in outgoing packets.
+ Closes 5120
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When using busybox ntpd with an NTPv3 client and NTPv4 server (or vice
+versa), the version numbers can be incorrectly ORed together, yielding
+the bogus value of "NTPv7".  This makes ntpd unusable with clients
+such as Chrony and Windows "Internet Time".
+
+This patch avoids the version mangling, by copying only the Leap
+Indicator bits from the server's status field.
+
+Signed-off-by: Paul Marks <paul@pmarks.net>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+---
+ networking/ntpd.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/networking/ntpd.c b/networking/ntpd.c
+index 45485c0..79b7c37 100644
+--- a/networking/ntpd.c
++++ b/networking/ntpd.c
+@@ -1851,7 +1851,7 @@ recv_and_process_client_pkt(void /*int fd*/)
+ 
+ 	/* Build a reply packet */
+ 	memset(&msg, 0, sizeof(msg));
+-	msg.m_status = G.stratum < MAXSTRAT ? G.ntp_status : LI_ALARM;
++	msg.m_status = G.stratum < MAXSTRAT ? (G.ntp_status & LI_MASK) : LI_ALARM;
+ 	msg.m_status |= (query_status & VERSION_MASK);
+ 	msg.m_status |= ((query_status & MODE_MASK) == MODE_CLIENT) ?
+ 			MODE_SERVER : MODE_SYM_PAS;
+-- 
+1.7.9.5
+
diff --git a/package/busybox/1.21.1/busybox-1.21.1-pkg-config-selinux.patch b/package/busybox/1.21.1/busybox-1.21.1-pkg-config-selinux.patch
new file mode 100644
index 0000000..f39250c
--- /dev/null
+++ b/package/busybox/1.21.1/busybox-1.21.1-pkg-config-selinux.patch
@@ -0,0 +1,67 @@
+From b1cec5003b73080a8aa7ea277621bf1c71c3e8d6 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sat, 20 Oct 2012 15:01:26 -0400
+Subject: [PATCH] build system: use pkg-config to look up selinux libs
+
+Newer versions of libselinux has started linking against more libs.
+Rather than continuing hardcoding things, switch to using pkg-config
+to query for its dependencies.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ Makefile       |  1 +
+ Makefile.flags | 12 +++++++++++-
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index fccde4a..3a0a5e1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -297,6 +297,7 @@ NM		= $(CROSS_COMPILE)nm
+ STRIP		= $(CROSS_COMPILE)strip
+ OBJCOPY		= $(CROSS_COMPILE)objcopy
+ OBJDUMP		= $(CROSS_COMPILE)objdump
++PKG_CONFIG	?= $(CROSS_COMPILE)pkg-config
+ AWK		= awk
+ GENKSYMS	= scripts/genksyms/genksyms
+ DEPMOD		= /sbin/depmod
+diff --git a/Makefile.flags b/Makefile.flags
+index c43c8dc..15dcc1f 100644
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -74,6 +74,12 @@ ARCH_FPIC ?= -fpic
+ ARCH_FPIE ?= -fpie
+ ARCH_PIE ?= -pie
+ 
++# Usage: $(eval $(call pkg_check_modules,VARIABLE-PREFIX,MODULES))
++define pkg_check_modules
++$(1)_CFLAGS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --cflags $(2))
++$(1)_LIBS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --libs $(2))
++endef
++
+ ifeq ($(CONFIG_BUILD_LIBBUSYBOX),y)
+ # on i386: 14% smaller libbusybox.so
+ # (code itself is 9% bigger, we save on relocs/PLT/GOT)
+@@ -85,6 +91,7 @@ endif
+ 
+ ifeq ($(CONFIG_STATIC),y)
+ CFLAGS_busybox += -static
++PKG_CONFIG_FLAGS += --static
+ endif
+ 
+ ifeq ($(CONFIG_PIE),y)
+@@ -127,7 +134,10 @@ LDLIBS += pam pam_misc pthread
+ endif
+ 
+ ifeq ($(CONFIG_SELINUX),y)
+-LDLIBS += selinux sepol
++SELINUX_PC_MODULES = libselinux libsepol
++$(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
++CPPFLAGS += $(SELINUX_CFLAGS)
++LDLIBS += $(if $(SELINUX_LIBS),$(SELINUX_LIBS:-l%=%),$(SELINUX_PC_MODULES:lib%=%))
+ endif
+ 
+ ifeq ($(CONFIG_EFENCE),y)
+-- 
+1.7.12
+
diff --git a/package/busybox/1.21.1/busybox-1.21.1-sys-resource.patch b/package/busybox/1.21.1/busybox-1.21.1-sys-resource.patch
new file mode 100644
index 0000000..7b18500
--- /dev/null
+++ b/package/busybox/1.21.1/busybox-1.21.1-sys-resource.patch
@@ -0,0 +1,123 @@
+From 5a5dfcad6ba96d12d68bd7b39279215a8fee70d3 Mon Sep 17 00:00:00 2001
+From: Tias Guns <tias@ulyssis.org>
+Date: Sun, 10 Jun 2012 14:19:01 +0200
+Subject: [PATCH] inetd: fix build failure in Android
+
+Signed-off-by: Tias Guns <tias@ulyssis.org>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 64f763b42a43cbf36e401690ff6767c25575e520)
+---
+ networking/inetd.c | 1 +
+ 1 file changed, 1 insertion(+)
+-- 
+1.7.12
+
+From 246ea72843d5b7e9d4cd902dc5e9d71359196303 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Thu, 5 Jul 2012 23:19:09 -0400
+Subject: [PATCH] include sys/resource.h where needed
+
+We use functions from sys/resource.h in misc applets, but don't include
+the header.  This breaks building with newer glibc versions, so add the
+include where needed.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+(cherry picked from commit c5fe9f7b723f949457263ef8e22ab807d5b549ce)
+---
+ loginutils/passwd.c      | 1 +
+ miscutils/time.c         | 1 +
+ networking/inetd.c       | 1 +
+ networking/ntpd.c        | 1 +
+ networking/ntpd_simple.c | 1 +
+ runit/chpst.c            | 1 +
+ shell/shell_common.c     | 1 +
+ 7 files changed, 7 insertions(+)
+
+diff --git a/loginutils/passwd.c b/loginutils/passwd.c
+index b83db00..a7006f0 100644
+--- a/loginutils/passwd.c
++++ b/loginutils/passwd.c
+@@ -15,6 +15,7 @@
+ 
+ #include "libbb.h"
+ #include <syslog.h>
++#include <sys/resource.h> /* setrlimit */
+ 
+ static void nuke_str(char *str)
+ {
+diff --git a/miscutils/time.c b/miscutils/time.c
+index 945f15f..ffed386 100644
+--- a/miscutils/time.c
++++ b/miscutils/time.c
+@@ -16,6 +16,7 @@
+ //usage:     "\n	-v	Verbose"
+ 
+ #include "libbb.h"
++#include <sys/resource.h> /* getrusage */
+ 
+ /* Information on the resources used by a child process.  */
+ typedef struct {
+diff --git a/networking/inetd.c b/networking/inetd.c
+index 1308d74..00baf69 100644
+--- a/networking/inetd.c
++++ b/networking/inetd.c
+@@ -165,6 +165,8 @@
+ //usage:     "\n		(default: 0 - disabled)"
+ 
+ #include <syslog.h>
++#include <sys/resource.h> /* setrlimit */
++#include <sys/socket.h> /* un.h may need this */
+ #include <sys/un.h>
+ 
+ #include "libbb.h"
+diff --git a/networking/ntpd.c b/networking/ntpd.c
+index 603801e..b885215 100644
+--- a/networking/ntpd.c
++++ b/networking/ntpd.c
+@@ -46,6 +46,7 @@
+ #include "libbb.h"
+ #include <math.h>
+ #include <netinet/ip.h> /* For IPTOS_LOWDELAY definition */
++#include <sys/resource.h> /* setpriority */
+ #include <sys/timex.h>
+ #ifndef IPTOS_LOWDELAY
+ # define IPTOS_LOWDELAY 0x10
+diff --git a/networking/ntpd_simple.c b/networking/ntpd_simple.c
+index 4ad44e4..1b7c66b 100644
+--- a/networking/ntpd_simple.c
++++ b/networking/ntpd_simple.c
+@@ -7,6 +7,7 @@
+  */
+ #include "libbb.h"
+ #include <netinet/ip.h> /* For IPTOS_LOWDELAY definition */
++#include <sys/resource.h> /* setpriority */
+ #ifndef IPTOS_LOWDELAY
+ # define IPTOS_LOWDELAY 0x10
+ #endif
+diff --git a/runit/chpst.c b/runit/chpst.c
+index ac296ba..ed72c8b 100644
+--- a/runit/chpst.c
++++ b/runit/chpst.c
+@@ -91,6 +91,7 @@ ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ //usage:     "\n			a SIGXCPU after N seconds"
+ 
+ #include "libbb.h"
++#include <sys/resource.h> /* getrlimit */
+ 
+ /*
+ Five applets here: chpst, envdir, envuidgid, setuidgid, softlimit.
+diff --git a/shell/shell_common.c b/shell/shell_common.c
+index 51c92d6..780e27e 100644
+--- a/shell/shell_common.c
++++ b/shell/shell_common.c
+@@ -18,6 +18,7 @@
+  */
+ #include "libbb.h"
+ #include "shell_common.h"
++#include <sys/resource.h> /* getrlimit */
+ 
+ const char defifsvar[] ALIGN1 = "IFS= \t\n";
+ 
+-- 
+1.7.12
+
-- 
1.7.9.5
