From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:04:03 +0100
Subject: [Buildroot] [PATCH 2/2] package/dtc: backport upstream fix solving
 Assertion Error with some .dts files
In-Reply-To: <20181124090403.4045-1-thomas.petazzoni@bootlin.com>
References: <20181124090403.4045-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181124090403.4045-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build of U-Boot on Microchip (formerly Atmel) platforms currently
fails to build with an Assertion Error in dtc. This happens since we
bumped dtc from 1.4.4 to 1.4.7, as a regression was introduced in dtc
1.4.6, and fixed post-1.4.7. This commit backports the upstream commit
to resolve this Assertion Error.

The build error was:

dtc: livetree.c:438: propval_cell: Assertion `prop->val.len == sizeof(cell_t)' failed.
dtc: livetree.c:438: propval_cell: Assertion `prop->val.len == sizeof(cell_t)' failed.
Aborted (core dumped)

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/124434438
  (and numerous other similar build failures)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s-fix-simple-bus-compatible-matching.patch | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch

diff --git a/package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch b/package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch
new file mode 100644
index 0000000000..ab95214a53
--- /dev/null
+++ b/package/dtc/0003-checks-fix-simple-bus-compatible-matching.patch
@@ -0,0 +1,120 @@
+From 5277449e5fd13a2f3778ed3380ba157cb9d4ea55 Mon Sep 17 00:00:00 2001
+From: Rob Herring <robh@kernel.org>
+Date: Thu, 20 Sep 2018 14:30:03 -0700
+Subject: [PATCH] checks: fix simple-bus compatible matching
+
+Since commit 7975f6422260 ("Fix widespread incorrect use of strneq(),
+replace with new strprefixeq()") simple-bus checks have been silently
+skipped. The problem was 'end - str' is one more than the string length
+and the strnlen in strprefixeq fails. This can't be fixed simply by
+subtracting one as it is possible to have multiple '\0' at the end of
+the property. Fix this by making the 'compatible' property string list
+check a dependency, and then we can assume the property is null
+terminated and we can just use streq() for comparisons.
+
+Add some tests so the problem doesn't happen again.
+
+Fixes: 7975f6422260 ("Fix widespread incorrect use of strneq(), replace with new strprefixeq()")
+Reported-by: Kumar Gala <kumar.gala@linaro.org>
+Signed-off-by: Rob Herring <robh@kernel.org>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+[Backport from upstream commit e84742aa7b934cd6603e3a64f8c0966f683c5711]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ checks.c                                    |  5 +++--
+ tests/run_tests.sh                          |  4 ++++
+ tests/unit-addr-simple-bus-compatible.dts   | 18 ++++++++++++++++++
+ tests/unit-addr-simple-bus-reg-mismatch.dts | 18 ++++++++++++++++++
+ 4 files changed, 43 insertions(+), 2 deletions(-)
+ create mode 100644 tests/unit-addr-simple-bus-compatible.dts
+ create mode 100644 tests/unit-addr-simple-bus-reg-mismatch.dts
+
+diff --git a/checks.c b/checks.c
+index a2cc103..acf91c3 100644
+--- a/checks.c
++++ b/checks.c
+@@ -910,7 +910,7 @@ static bool node_is_compatible(struct node *node, const char *compat)
+ 
+ 	for (str = prop->val.val, end = str + prop->val.len; str < end;
+ 	     str += strnlen(str, end - str) + 1) {
+-		if (strprefixeq(str, end - str, compat))
++		if (streq(str, compat))
+ 			return true;
+ 	}
+ 	return false;
+@@ -921,7 +921,8 @@ static void check_simple_bus_bridge(struct check *c, struct dt_info *dti, struct
+ 	if (node_is_compatible(node, "simple-bus"))
+ 		node->bus = &simple_bus;
+ }
+-WARNING(simple_bus_bridge, check_simple_bus_bridge, NULL, &addr_size_cells);
++WARNING(simple_bus_bridge, check_simple_bus_bridge, NULL,
++	&addr_size_cells, &compatible_is_string_list);
+ 
+ static void check_simple_bus_reg(struct check *c, struct dt_info *dti, struct node *node)
+ {
+diff --git a/tests/run_tests.sh b/tests/run_tests.sh
+index 7348c9c..c4354d2 100755
+--- a/tests/run_tests.sh
++++ b/tests/run_tests.sh
+@@ -652,6 +652,10 @@ dtc_tests () {
+     check_tests pci-bridge-bad1.dts pci_bridge
+     check_tests pci-bridge-bad2.dts pci_bridge
+ 
++    check_tests unit-addr-simple-bus-reg-mismatch.dts simple_bus_reg
++    check_tests unit-addr-simple-bus-compatible.dts simple_bus_reg
++
++
+     # Check warning options
+     run_sh_test dtc-checkfails.sh address_cells_is_cell interrupt_cells_is_cell -n size_cells_is_cell -- -Wno_size_cells_is_cell -I dts -O dtb bad-ncells.dts
+     run_sh_test dtc-fails.sh -n test-warn-output.test.dtb -I dts -O dtb bad-ncells.dts
+diff --git a/tests/unit-addr-simple-bus-compatible.dts b/tests/unit-addr-simple-bus-compatible.dts
+new file mode 100644
+index 0000000..c8f9341
+--- /dev/null
++++ b/tests/unit-addr-simple-bus-compatible.dts
+@@ -0,0 +1,18 @@
++/dts-v1/;
++
++/ {
++	#address-cells = <1>;
++	#size-cells = <1>;
++
++	bus at 10000000 {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		compatible = "foo-bus", "simple-bus";
++		ranges = <0x0 0x10000000 0x10000>;
++
++		node at 100 {
++			reg = <0x1000 1>;
++		};
++	};
++
++};
+diff --git a/tests/unit-addr-simple-bus-reg-mismatch.dts b/tests/unit-addr-simple-bus-reg-mismatch.dts
+new file mode 100644
+index 0000000..2823377
+--- /dev/null
++++ b/tests/unit-addr-simple-bus-reg-mismatch.dts
+@@ -0,0 +1,18 @@
++/dts-v1/;
++
++/ {
++	#address-cells = <1>;
++	#size-cells = <1>;
++
++	bus at 10000000 {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		compatible = "simple-bus";
++		ranges = <0x0 0x10000000 0x10000>;
++
++		node at 100 {
++			reg = <0x1000 1>;
++		};
++	};
++
++};
+-- 
+2.19.1
+
-- 
2.19.1
