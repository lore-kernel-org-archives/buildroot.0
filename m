From: John Keeping <john@metanate.com>
Date: Mon, 2 Apr 2018 15:02:49 +0100
Subject: [Buildroot] [PATCH v2] linux-tool-perf: permit TUI build
In-Reply-To: <20180402130716.GM3625@scaer>
References: <20180402125145.13431-1-john@metanate.com>
 <20180402130716.GM3625@scaer>
Message-ID: <20180402150249.7f4e70f1.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Linux 3.10, perf's NO_NEWT configuration option simply sets
NO_SLANG=1 and there is no dependency on libnewt.

We already handle NO_SLANG correctly based on whether or not
BR2_PACKAGE_SLANG is selected, so all we accomplish by setting NO_NEWT=1
is disabling perf's TUI when all of the dependencies are available.

To simplify all of this, introduce a new config option to enable the
perf TUI which depends on slang and add a check to prevent building the
TUI on versions which are too old.  The check for NO_SLANG is equivalent
to checking if NO_NEWT is required as NO_SLANG was added in the same
commit that removed the libnewt dependency and deprecated NO_NEWT
(6692c262df4f, "perf tools: Remove dependency on libnewt", 2013-03-28).

Signed-off-by: John Keeping <john@metanate.com>
---
On Mon, 2 Apr 2018 15:07:16 +0200, Yann E. MORIN wrote:

> On 2018-04-02 13:51 +0100, John Keeping spake thusly:
> > Since Linux 3.10, perf's NO_NEWT configuration option simply sets
> > NO_SLANG=1 and there is no dependency on libnewt.
> > 
> > We already handle NO_SLANG correctly based on whether or not
> > BR2_PACKAGE_SLANG is selected, so all we accomplish by setting NO_NEWT=1
> > is disabling perf's TUI when all of the dependencies are available.
> > 
> > Linux 3.10 is almost 5 years old now, so there doesn't seem to be any
> > point in jumping through additional hoops to make perf from older kernel
> > versions build when the newt package is not available.  
> 
> But we still support kernels back to 3.0...
> 
> I would instead suggest you add an option in
> package/linux-tools/Config.in:
> 
>     config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
> 
> And do a check in package/linux-tools/linux-tool-perf.mk.in whether it
> is valid o not, if needed.

Something like this?  I can't see a neater way of checking the version
dependency and this matches the existing handling of the elfutils
dependency.

 package/linux-tools/Config.in             | 12 ++++++++++++
 package/linux-tools/linux-tool-perf.mk.in | 12 +++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index e3ccd850f9..1d31ce84f1 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -54,6 +54,18 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
 
 	  https://perf.wiki.kernel.org/
 
+if BR2_PACKAGE_LINUX_TOOLS_PERF
+
+config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
+	bool "enable perf TUI"
+	select BR2_PACKAGE_SLANG
+	help
+	  Enable the TUI interface for perf which requires a TTY and
+	  enables zooming into DSOs and threads as well as other
+	  features.
+
+endif
+
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 69492ba8da..80e00c3c56 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -22,7 +22,6 @@ PERF_MAKE_FLAGS = \
 	prefix=/usr \
 	WERROR=0 \
 	NO_LIBAUDIT=1 \
-	NO_NEWT=1 \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
@@ -59,10 +58,10 @@ ifeq ($(BR2_arc),y)
 PERF_MAKE_FLAGS += NO_BACKTRACE=1
 endif
 
-ifeq ($(BR2_PACKAGE_SLANG),y)
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_TUI),y)
 PERF_DEPENDENCIES += slang
 else
-PERF_MAKE_FLAGS += NO_SLANG=1
+PERF_MAKE_FLAGS += NO_NEWT=1 NO_SLANG=1
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
@@ -128,6 +127,13 @@ define PERF_BUILD_CMDS
 			fi \
 		fi \
 	fi
+	$(Q)if test "$(BR2_PACKAGE_LINUX_TOOLS_PERF_TUI)" = "y" ; then \
+		if ! grep -q NO_SLANG $(LINUX_DIR)/tools/perf/Makefile* ; then \
+			echo "The perf tool in your kernel cannot be build with the TUI." ; \
+			echo "Either upgrade your kernel to >= 3.10, or disable the TUI." ; \
+			exit 1 ; \
+		fi \
+	fi
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
 		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/
 endef
-- 
2.16.3
