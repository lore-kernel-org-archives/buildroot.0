From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 Jun 2019 20:20:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: bump to version 1.5.0
Message-ID: <20190620182036.28407-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first and third patches (already in version)
- Disable yaml which is enabled by default and has been added with
  https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=c86da84d30e4b72cfb4fee22b62bea4257bc14bf
- Move CFLAGS in {DTC,HOST_DTC}_MAKE_OPTS for readability
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rds-for-older-kernel-u-boot-sources.patch} |   0
 ...001-Kill-bogus-TYPE_BLOB-marker-type.patch | 138 ------------------
 ...s-fix-simple-bus-compatible-matching.patch | 120 ---------------
 package/dtc/dtc.hash                          |   6 +-
 package/dtc/dtc.mk                            |   8 +-
 5 files changed, 10 insertions(+), 262 deletions(-)
 rename package/dtc/{0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch => 0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch} (100%)
 delete mode 100644 package/dtc/0001-Kill-bogus-TYPE_BLOB-marker-type.patch
 delete mode 100644 package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch

diff --git a/package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
similarity index 100%
rename from package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch
rename to package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
diff --git a/package/dtc/0001-Kill-bogus-TYPE_BLOB-marker-type.patch b/package/dtc/0001-Kill-bogus-TYPE_BLOB-marker-type.patch
deleted file mode 100644
index d9c660ef51..0000000000
--- a/package/dtc/0001-Kill-bogus-TYPE_BLOB-marker-type.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 9619c8619c37b9aea98100bcc15c51a5642e877e Mon Sep 17 00:00:00 2001
-From: Greg Kurz <groug@kaod.org>
-Date: Thu, 30 Aug 2018 12:01:59 +0200
-Subject: [PATCH] Kill bogus TYPE_BLOB marker type
-
-Since commit 32b9c6130762 "Preserve datatype markers when emitting dts
-format", we no longer try to guess the value type. Instead, we reuse
-the type of the datatype markers when they are present, if the type
-is either TYPE_UINT* or TYPE_STRING.
-
-This causes 'dtc -I fs' to crash:
-
-Starting program: /root/dtc -q -f -O dts -I fs /proc/device-tree
-/dts-v1/;
-
-/ {
-
-Program received signal SIGSEGV, Segmentation fault.
-__strlen_power8 () at ../sysdeps/powerpc/powerpc64/power8/strlen.S:47
-47              ld      r12,0(r4)     /* Load doubleword from memory.  */
-(gdb) bt
-#0  __strlen_power8 () at ../sysdeps/powerpc/powerpc64/power8/strlen.S:47
-#1  0x00007ffff7de3d10 in __GI__IO_fputs (str=<optimized out>,
-    fp=<optimized out>) at iofputs.c:33
-#2  0x000000001000c7a0 in write_propval (prop=0x100525e0,
-    f=0x7ffff7f718a0 <_IO_2_1_stdout_>) at treesource.c:245
-
-The offending line is:
-
-                fprintf(f, "%s", delim_start[emit_type]);
-
-where emit_type is TYPE_BLOB and:
-
-static const char *delim_start[] = {
-        [TYPE_UINT8] = "[",
-        [TYPE_UINT16] = "/bits/ 16 <",
-        [TYPE_UINT32] = "<",
-        [TYPE_UINT64] = "/bits/ 64 <",
-        [TYPE_STRING] = "",
-};
-
-/* Data blobs */
-enum markertype {
-        TYPE_NONE,
-        REF_PHANDLE,
-        REF_PATH,
-        LABEL,
-        TYPE_UINT8,
-        TYPE_UINT16,
-        TYPE_UINT32,
-        TYPE_UINT64,
-        TYPE_BLOB,
-        TYPE_STRING,
-};
-
-Because TYPE_BLOB < TYPE_STRING and delim_start[] is a static array,
-delim_start[emit_type] is 0x0. The glibc usually prints out "(null)"
-when one passes 0x0 to %s, but it seems to call fputs() internally if
-the format is exactly "%s", hence the crash.
-
-TYPE_BLOB basically means the data comes from a file and we don't know
-its type. We don't care for the former, and the latter is TYPE_NONE.
-
-So let's drop TYPE_BLOB completely and use TYPE_NONE instead when reading
-the file. Then, try to guess the data type@emission time, like the
-code already does for refs and labels.
-
-Instead of adding yet another check for TYPE_NONE, an helper is introduced
-to check if the data marker has type information, ie, >= TYPE_UINT8.
-
-Fixes: 32b9c61307629ac76c6ac0bead6f926d579b3d2c
-Suggested-by: David Gibson <david@gibson.dropbear.id.au>
-Signed-off-by: Greg Kurz <groug@kaod.org>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- data.c       | 2 +-
- dtc.h        | 1 -
- treesource.c | 9 +++++++--
- 3 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/data.c b/data.c
-index accdfaef6668..4a204145cc7b 100644
---- a/data.c
-+++ b/data.c
-@@ -95,7 +95,7 @@ struct data data_copy_file(FILE *f, size_t maxlen)
- {
- 	struct data d = empty_data;
- 
--	d = data_add_marker(d, TYPE_BLOB, NULL);
-+	d = data_add_marker(d, TYPE_NONE, NULL);
- 	while (!feof(f) && (d.len < maxlen)) {
- 		size_t chunksize, ret;
- 
-diff --git a/dtc.h b/dtc.h
-index 303c2a6a73b7..51c03ef64dbe 100644
---- a/dtc.h
-+++ b/dtc.h
-@@ -82,7 +82,6 @@ enum markertype {
- 	TYPE_UINT16,
- 	TYPE_UINT32,
- 	TYPE_UINT64,
--	TYPE_BLOB,
- 	TYPE_STRING,
- };
- extern const char *markername(enum markertype markertype);
-diff --git a/treesource.c b/treesource.c
-index f99544d72344..53e62036ad0e 100644
---- a/treesource.c
-+++ b/treesource.c
-@@ -133,9 +133,14 @@ static void write_propval_int(FILE *f, const char *p, size_t len, size_t width)
- 	}
- }
- 
-+static bool has_data_type_information(struct marker *m)
-+{
-+	return m->type >= TYPE_UINT8;
-+}
-+
- static struct marker *next_type_marker(struct marker *m)
- {
--	while (m && (m->type == LABEL || m->type == REF_PHANDLE || m->type == REF_PATH))
-+	while (m && !has_data_type_information(m))
- 		m = m->next;
- 	return m;
- }
-@@ -225,7 +230,7 @@ static void write_propval(FILE *f, struct property *prop)
- 		size_t chunk_len;
- 		const char *p = &prop->val.val[m->offset];
- 
--		if (m->type < TYPE_UINT8)
-+		if (!has_data_type_information(m))
- 			continue;
- 
- 		chunk_len = type_marker_length(m);
--- 
-2.17.1
-
diff --git a/package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch b/package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch
deleted file mode 100644
index ab95214a53..0000000000
--- a/package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 5277449e5fd13a2f3778ed3380ba157cb9d4ea55 Mon Sep 17 00:00:00 2001
-From: Rob Herring <robh@kernel.org>
-Date: Thu, 20 Sep 2018 14:30:03 -0700
-Subject: [PATCH] checks: fix simple-bus compatible matching
-
-Since commit 7975f6422260 ("Fix widespread incorrect use of strneq(),
-replace with new strprefixeq()") simple-bus checks have been silently
-skipped. The problem was 'end - str' is one more than the string length
-and the strnlen in strprefixeq fails. This can't be fixed simply by
-subtracting one as it is possible to have multiple '\0' at the end of
-the property. Fix this by making the 'compatible' property string list
-check a dependency, and then we can assume the property is null
-terminated and we can just use streq() for comparisons.
-
-Add some tests so the problem doesn't happen again.
-
-Fixes: 7975f6422260 ("Fix widespread incorrect use of strneq(), replace with new strprefixeq()")
-Reported-by: Kumar Gala <kumar.gala@linaro.org>
-Signed-off-by: Rob Herring <robh@kernel.org>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
-[Backport from upstream commit e84742aa7b934cd6603e3a64f8c0966f683c5711]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- checks.c                                    |  5 +++--
- tests/run_tests.sh                          |  4 ++++
- tests/unit-addr-simple-bus-compatible.dts   | 18 ++++++++++++++++++
- tests/unit-addr-simple-bus-reg-mismatch.dts | 18 ++++++++++++++++++
- 4 files changed, 43 insertions(+), 2 deletions(-)
- create mode 100644 tests/unit-addr-simple-bus-compatible.dts
- create mode 100644 tests/unit-addr-simple-bus-reg-mismatch.dts
-
-diff --git a/checks.c b/checks.c
-index a2cc103..acf91c3 100644
---- a/checks.c
-+++ b/checks.c
-@@ -910,7 +910,7 @@ static bool node_is_compatible(struct node *node, const char *compat)
- 
- 	for (str = prop->val.val, end = str + prop->val.len; str < end;
- 	     str += strnlen(str, end - str) + 1) {
--		if (strprefixeq(str, end - str, compat))
-+		if (streq(str, compat))
- 			return true;
- 	}
- 	return false;
-@@ -921,7 +921,8 @@ static void check_simple_bus_bridge(struct check *c, struct dt_info *dti, struct
- 	if (node_is_compatible(node, "simple-bus"))
- 		node->bus = &simple_bus;
- }
--WARNING(simple_bus_bridge, check_simple_bus_bridge, NULL, &addr_size_cells);
-+WARNING(simple_bus_bridge, check_simple_bus_bridge, NULL,
-+	&addr_size_cells, &compatible_is_string_list);
- 
- static void check_simple_bus_reg(struct check *c, struct dt_info *dti, struct node *node)
- {
-diff --git a/tests/run_tests.sh b/tests/run_tests.sh
-index 7348c9c..c4354d2 100755
---- a/tests/run_tests.sh
-+++ b/tests/run_tests.sh
-@@ -652,6 +652,10 @@ dtc_tests () {
-     check_tests pci-bridge-bad1.dts pci_bridge
-     check_tests pci-bridge-bad2.dts pci_bridge
- 
-+    check_tests unit-addr-simple-bus-reg-mismatch.dts simple_bus_reg
-+    check_tests unit-addr-simple-bus-compatible.dts simple_bus_reg
-+
-+
-     # Check warning options
-     run_sh_test dtc-checkfails.sh address_cells_is_cell interrupt_cells_is_cell -n size_cells_is_cell -- -Wno_size_cells_is_cell -I dts -O dtb bad-ncells.dts
-     run_sh_test dtc-fails.sh -n test-warn-output.test.dtb -I dts -O dtb bad-ncells.dts
-diff --git a/tests/unit-addr-simple-bus-compatible.dts b/tests/unit-addr-simple-bus-compatible.dts
-new file mode 100644
-index 0000000..c8f9341
---- /dev/null
-+++ b/tests/unit-addr-simple-bus-compatible.dts
-@@ -0,0 +1,18 @@
-+/dts-v1/;
-+
-+/ {
-+	#address-cells = <1>;
-+	#size-cells = <1>;
-+
-+	bus at 10000000 {
-+		#address-cells = <1>;
-+		#size-cells = <1>;
-+		compatible = "foo-bus", "simple-bus";
-+		ranges = <0x0 0x10000000 0x10000>;
-+
-+		node at 100 {
-+			reg = <0x1000 1>;
-+		};
-+	};
-+
-+};
-diff --git a/tests/unit-addr-simple-bus-reg-mismatch.dts b/tests/unit-addr-simple-bus-reg-mismatch.dts
-new file mode 100644
-index 0000000..2823377
---- /dev/null
-+++ b/tests/unit-addr-simple-bus-reg-mismatch.dts
-@@ -0,0 +1,18 @@
-+/dts-v1/;
-+
-+/ {
-+	#address-cells = <1>;
-+	#size-cells = <1>;
-+
-+	bus at 10000000 {
-+		#address-cells = <1>;
-+		#size-cells = <1>;
-+		compatible = "simple-bus";
-+		ranges = <0x0 0x10000000 0x10000>;
-+
-+		node at 100 {
-+			reg = <0x1000 1>;
-+		};
-+	};
-+
-+};
--- 
-2.19.1
-
diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index b402c2249b..188612d6f8 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,2 +1,6 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256 6643e8f00ff86350f465bb54b2185058b5b1b7bac01a0842c81a52b86589cde7 dtc-1.4.7.tar.xz
+sha256 c672e443c9f7e39f5a7c8e602da6777f9ad55ad70de87de300a43828c8050172 dtc-1.5.0.tar.xz
+
+# Hash for license files
+sha256 171ce1c292cf148a5be9ff95ce7e5c3d79a002721ab8e119eae3c0f5336d2b3d README.license
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 GPL
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 7cb879bff4..9a8211ae95 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.4.7
+DTC_VERSION = 1.5.0
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
@@ -14,10 +14,12 @@ DTC_DEPENDENCIES = host-bison host-flex
 HOST_DTC_DEPENDENCIES = host-bison host-flex
 
 DTC_MAKE_OPTS = \
+	CFLAGS="$(TARGET_CFLAGS) -fPIC -DNO_YAML" \
 	PREFIX=/usr \
 	NO_PYTHON=1
 
 HOST_DTC_MAKE_OPTS = \
+	CFLAGS="$(HOST_CFLAGS) -fPIC -DNO_YAML" \
 	PREFIX=$(HOST_DIR) \
 	NO_PYTHON=1
 
@@ -40,7 +42,7 @@ DTC_INSTALL_GOAL = install-lib
 endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y
 
 define DTC_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) $(DTC_MAKE_OPTS)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(DTC_MAKE_OPTS)
 endef
 
 # For staging, only the library is needed
@@ -55,7 +57,7 @@ endef
 
 # host build
 define HOST_DTC_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) CFLAGS="$(HOST_CFLAGS) -fPIC" -C $(@D) $(HOST_DTC_MAKE_OPTS)
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_DTC_MAKE_OPTS)
 endef
 
 define HOST_DTC_INSTALL_CMDS
-- 
2.20.1
