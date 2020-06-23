From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Tue, 23 Jun 2020 16:01:53 -0400
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: new package
Message-ID: <20200623200153.1112888-1-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Babeltrace 2 is a trace manipulation toolkit.

The Babeltrace 2 project offers a library with a C API, Python 3
bindings, and a command-line tool which makes it very easy for mere
mortals to view, convert, transform, and analyze traces.

See <https://babeltrace.org/> for more details.

Babeltrace 2 is a major update of Babeltrace 1 (Buildroot package
`lttng-babeltrace`). Both projects are coinstallable. Except for the
command-line tool (named `babeltrace2`), the Babeltrace 2 project is not
backward compatible with Babeltrace 1.

I'm naming this package `babeltrace2` instead of `lttng-babeltrace2`
because, although it can read LTTng traces, the two projects are
independent. All major distributions use `babeltrace2` as the
Babeltrace 2 package's name.

I'm keeping the `lttng-babeltrace` package because, as of this date, we
still add bug and security fixes from time to time, therefore the
project is not in EOL stage. Some external, custom packages could still
depend on the Babeltrace 1 library, for example.

As with `lttng-babeltrace`, you can build and install the host version
of Babeltrace 2 for the workflow where you trace the target, download
the resulting trace (or receive it during the tracing process), and then
read and analyze it with Babeltrace 2.

If you enable the `elfutils` package (`BR2_PACKAGE_ELFUTILS`), then you
can also build and install the Babeltrace 2 project's debugging
information filter component class for LTTng traces
(`BR2_PACKAGE_BABELTRACE2_DEBUG_INFO_COMP_CLS`).

Tested with glibc, uClibc-ng, and musl.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/Config.in.host               |  1 +
 package/babeltrace2/Config.in        | 45 ++++++++++++++++++++++++++++
 package/babeltrace2/Config.in.host   | 16 ++++++++++
 package/babeltrace2/babeltrace2.hash |  8 +++++
 package/babeltrace2/babeltrace2.mk   | 28 +++++++++++++++++
 7 files changed, 100 insertions(+)
 create mode 100644 package/babeltrace2/Config.in
 create mode 100644 package/babeltrace2/Config.in.host
 create mode 100644 package/babeltrace2/babeltrace2.hash
 create mode 100644 package/babeltrace2/babeltrace2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fb6d4cec64..cafde73db9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2062,6 +2062,7 @@ N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
 
 N:	Philippe Proulx <eeppeliteloop@gmail.com>
+F:	package/babeltrace2/
 F:	package/lttng-babeltrace/
 F:	package/lttng-libust/
 F:	package/lttng-modules/
diff --git a/package/Config.in b/package/Config.in
index e2bb004015..ca23dee441 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -84,6 +84,7 @@ menu "Compressors and decompressors"
 endmenu
 
 menu "Debugging, profiling and benchmark"
+	source "package/babeltrace2/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index f1246c708f..12a8a9da60 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/babeltrace2/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
diff --git a/package/babeltrace2/Config.in b/package/babeltrace2/Config.in
new file mode 100644
index 0000000000..4b9b423b8c
--- /dev/null
+++ b/package/babeltrace2/Config.in
@@ -0,0 +1,45 @@
+config BR2_PACKAGE_BABELTRACE2
+	bool "babeltrace2"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Babeltrace 2 is an open-source trace manipulation toolkit.
+
+	  The Babeltrace 2 project offers a library with a C API, Python 3
+	  bindings, and a command-line tool which makes it very easy for
+	  mere mortals to view, convert, transform, and analyze traces.
+
+	  Babeltrace 2 is also the reference parser implementation of the
+	  Common Trace Format (CTF), a very versatile trace format followed
+	  by various tracers and tools such as LTTng and barectf. The
+	  Babeltrace 2 library and its Python bindings can read and write
+	  CTF traces.
+
+	  https://babeltrace.org/
+
+if BR2_PACKAGE_BABELTRACE2
+
+config BR2_PACKAGE_BABELTRACE2_DEBUG_INFO_COMP_CLS
+	bool "Debugging information filter component class"
+	depends on BR2_PACKAGE_ELFUTILS
+	help
+	  Build and install the Babeltrace 2 debugging information filter
+	  component class.
+
+	  A Babeltrace 2 `filter.lttng-utils.debug-info` message iterator
+	  creates and emits copies of upstream messages, augmenting LTTng
+	  event messages with debugging information when it's available and
+	  possible.
+
+	  https://babeltrace.org/docs/v2.0/man7/babeltrace2-filter.lttng-utils.debug-info.7/
+
+comment "Babeltrace 2's debug. info. filter component class needs elfutils"
+	depends on !BR2_PACKAGE_ELFUTILS
+
+endif # BR2_PACKAGE_BABELTRACE2
+
+comment "babeltrace2 needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/babeltrace2/Config.in.host b/package/babeltrace2/Config.in.host
new file mode 100644
index 0000000000..fb56089eb1
--- /dev/null
+++ b/package/babeltrace2/Config.in.host
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_HOST_BABELTRACE2
+	bool "host babeltrace2"
+	help
+	  Babeltrace 2 is an open-source trace manipulation toolkit.
+
+	  The Babeltrace 2 project offers a library with a C API, Python 3
+	  bindings, and a command-line tool which makes it very easy for
+	  mere mortals to view, convert, transform, and analyze traces.
+
+	  Babeltrace 2 is also the reference parser implementation of the
+	  Common Trace Format (CTF), a very versatile trace format followed
+	  by various tracers and tools such as LTTng and barectf. The
+	  Babeltrace 2 library and its Python bindings can read and write
+	  CTF traces.
+
+	  https://babeltrace.org/
diff --git a/package/babeltrace2/babeltrace2.hash b/package/babeltrace2/babeltrace2.hash
new file mode 100644
index 0000000000..27c47ba26f
--- /dev/null
+++ b/package/babeltrace2/babeltrace2.hash
@@ -0,0 +1,8 @@
+# From https://www.efficios.com/files/babeltrace/babeltrace2-2.0.3.tar.bz2.sha256
+sha256 a53625152554102d868ba8395347d0daba0bec9c4b854c3e9bd97c77b0bf04a0  babeltrace2-2.0.3.tar.bz2
+
+# Hash for license files
+sha256 d919c6347409efde6dea63c6f349fb06bc060a2b721fc3df07b5f720b5f1d60e  LICENSE
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
+sha256 c68fd1ffc1623ea0dace21abf57305818e4998a4ae0c79010aaaa943eb660b55  lgpl-2.1.txt
+sha256 2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
new file mode 100644
index 0000000000..2ffb3493c8
--- /dev/null
+++ b/package/babeltrace2/babeltrace2.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# babeltrace2
+#
+################################################################################
+
+BABELTRACE2_SITE = https://www.efficios.com/files/babeltrace
+BABELTRACE2_VERSION = 2.0.3
+BABELTRACE2_SOURCE = babeltrace2-$(BABELTRACE2_VERSION).tar.bz2
+BABELTRACE2_LICENSE = MIT, LGPL-2.1 (src/common/list.h), GPL-2.0 (test code)
+BABELTRACE2_LICENSE_FILES = mit-license.txt lgpl-2.1.txt gpl-2.0.txt LICENSE
+BABELTRACE2_CONF_OPTS += --disable-man-pages
+BABELTRACE2_DEPENDENCIES = libglib2 host-pkgconf
+# The host-elfutils dependency is optional, but since we don't have
+# options for host packages, just build support for it unconditionally.
+HOST_BABELTRACE2_DEPENDENCIES = host-libglib2 host-pkgconf host-elfutils
+HOST_BABELTRACE2_CONF_OPTS += --enable-debug-info
+
+ifeq ($(BR2_PACKAGE_BABELTRACE2_DEBUG_INFO_COMP_CLS),y)
+BABELTRACE2_DEPENDENCIES += elfutils
+BABELTRACE2_CONF_OPTS += --enable-debug-info
+BABELTRACE2_CONF_ENV += bt_cv_lib_elfutils=yes
+else
+BABELTRACE2_CONF_OPTS += --disable-debug-info
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.26.2
