From: Chris LaRocque <clarocq@gmail.com>
Date: Thu, 24 Dec 2015 07:44:03 -0500
Subject: [Buildroot] trying to use
	https://github.com/beagleboard/linux.git with buildroot
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
 <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
 <20151223193943.21a6f0fc@free-electrons.com>
 <1450910736.3752716.475291418.490BB3EA@webmail.messagingengine.com>
 <20151223235253.0afe702e@free-electrons.com>
 <1450917779.3775953.475348978.37FAC3A8@webmail.messagingengine.com>
Message-ID: <n5gpaj$p9d$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Craig Swank wrote:

> Here is another thing I've found:
> 
> https://github.com/beagleboard/linux/issues/49
> 
> In that issue the person had some addresses set incorrectly in uEnv.txt,
> but mine doesn't have any addresses set:
> 
> bootpart=0:1
> bootdir=
> uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ram
> boot
> 
> Is there something that needs to be set in uEnv.txt?
> 
> 
> On Wed, Dec 23, 2015, at 02:52 PM, Thomas Petazzoni wrote:
>> Dear Craig Swank,
>> 
>> On Wed, 23 Dec 2015 14:45:36 -0800, Craig Swank wrote:
>> > Is it strange to you that when I do the build the output/build
>> > directory has both of these dirs?
>> > 
>> > ?  buildroot git:(master) ? ls output/build/linux-*
>> > output/build/linux-4.1.4-ti-r9
>> > output/build/linux-headers-3.12.10
>> 
>> No, it is perfectly fine. linux-headers is used when building the
>> toolchain. linux is used to build the kernel itself.
>> 
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
> 
> 
Hello Craig

I use the beagleboard.org/linux and here's some of my kernel 4.1 config. I 
have a working build for kernel 3.8 as well if you'd like.

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_3_2 is not set
# BR2_KERNEL_HEADERS_3_4 is not set
# BR2_KERNEL_HEADERS_3_10 is not set
# BR2_KERNEL_HEADERS_3_12 is not set
# BR2_KERNEL_HEADERS_3_14 is not set
# BR2_KERNEL_HEADERS_3_18 is not set
BR2_KERNEL_HEADERS_4_1=y
# BR2_KERNEL_HEADERS_4_2 is not set
# BR2_KERNEL_HEADERS_4_3 is not set
# BR2_KERNEL_HEADERS_VERSION is not set
BR2_DEFAULT_KERNEL_HEADERS="4.1.13"

and

# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_LATEST_VERSION is not set
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_CUSTOM_GIT=y
# BR2_LINUX_KERNEL_CUSTOM_HG is not set
# BR2_LINUX_KERNEL_CUSTOM_LOCAL is not set
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/beagleboard/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.1.13-ti-r36"
BR2_LINUX_KERNEL_VERSION="4.1.13-ti-r36"
BR2_LINUX_KERNEL_PATCH=""
# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/output/build/linux-4.1.13-ti-
r36/arch/arm/configs/bb.org_defconfig"
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=""
# BR2_LINUX_KERNEL_UIMAGE is not set
# BR2_LINUX_KERNEL_APPENDED_UIMAGE is not set
BR2_LINUX_KERNEL_ZIMAGE=y
# BR2_LINUX_KERNEL_APPENDED_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_USE_INTREE_DTS=y
# BR2_LINUX_KERNEL_USE_CUSTOM_DTS is not set
BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
# BR2_LINUX_KERNEL_INSTALL_TARGET is not set

My uEnv.txt

bootfile=zImage
fdtfile=am335x-boneblack.dtb
loadaddr=0x80007fc0
fdtaddr=0x80F80000
loadfdt=fatload mmc 0:1 ${fdtaddr} ${fdtfile}
loaduimage=fatload mmc 0:1 ${loadaddr} ${bootfile}
console=ttyO0,115200n8
mmcroot=/dev/mmcblk0p2
mmcrootfstype=ext2
uenvcmd=mmc rescan; run loaduimage; run loadfdt; run fdtboot
fdtboot=run mmc_args; run mmcargs; bootz ${loadaddr} - ${fdtaddr}
mmc_args=setenv bootargs console=${console} ${optargs} root=${mmcroot} rw 
rootfstype=${mmcrootfstype} rootwait

You'll need to patch the host DTC (for the cape manager and cape overlays. 
Heres my patch (hack) derived from Robert Nelsons bb.org-overlays.

set BR2_GLOBAL_PATCH_DIR to a valid path

create the folder DTC in BR2_GLOBAL_PATCH_DIR and place the patch file 
named: host-dtc-1.4.1.patch within...


host-dtc-1.4.1.patch **********************************************


--- a/checks.c	2015-12-10 14:50:21.537561920 -0500
+++ b/checks.c	2015-12-01 17:11:59.266242047 -0500
@@ -458,6 +458,8 @@
 				     struct node *node, struct 
property *prop)
 {
 	struct marker *m = prop->val.markers;
+	struct fixup *f, **fp;
+	struct fixup_entry *fe, **fep;
 	struct node *refnode;
 	cell_t phandle;
 
@@ -466,14 +468,73 @@
 
 		refnode = get_node_by_ref(dt, m->ref);
 		if (! refnode) {
+			if (!dt->is_plugin) {
 			FAIL(c, "Reference to non-existent node or 
label \"%s\"\n",
 			     m->ref);
 			continue;
 		}
 
+			/* allocate fixup entry */
+			fe = xmalloc(sizeof(*fe));
+
+			fe->node = node;
+			fe->prop = prop;
+			fe->offset = m->offset;
+			fe->next = NULL;
+
+			/* search for an already existing fixup */
+			for_each_fixup(dt, f)
+				if (strcmp(f->ref, m->ref) == 0)
+					break;
+
+			/* no fixup found, add new */
+			if (f == NULL) {
+				f = xmalloc(sizeof(*f));
+				f->ref = m->ref;
+				f->entries = NULL;
+				f->next = NULL;
+
+				/* add it to the tree */
+				fp = &dt->fixups;
+				while (*fp)
+					fp = &(*fp)->next;
+				*fp = f;
+			}
+
+			/* and now append fixup entry */
+			fep = &f->entries;
+			while (*fep)
+				fep = &(*fep)->next;
+			*fep = fe;
+
+			/* mark the entry as unresolved */
+			*((cell_t *)(prop->val.val + m->offset)) =
+				cpu_to_fdt32(0xdeadbeef);
+			continue;
+		}
+
+		/* if it's a local reference, we need to record it */
+		if (symbol_fixup_support) {
+
+			/* allocate a new local fixup entry */
+			fe = xmalloc(sizeof(*fe));
+
+			fe->node = node;
+			fe->prop = prop;
+			fe->offset = m->offset;
+			fe->next = NULL;
+
+			/* append it to the local fixups */
+			fep = &dt->local_fixups;
+			while (*fep)
+				fep = &(*fep)->next;
+			*fep = fe;
+		}
+
 		phandle = get_node_phandle(dt, refnode);
 		*((cell_t *)(prop->val.val + m->offset)) = 
cpu_to_fdt32(phandle);
 	}
+
 }
 ERROR(phandle_references, NULL, NULL, fixup_phandle_references, NULL,
       &duplicate_node_names, &explicit_phandles);
@@ -652,6 +713,45 @@
 }
 TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
 
+static void check_auto_label_phandles(struct check *c, struct node *dt,
+				       struct node *node)
+{
+	struct label *l;
+	struct symbol *s, **sp;
+	int has_label;
+
+	if (!symbol_fixup_support)
+		return;
+
+	has_label = 0;
+	for_each_label(node->labels, l) {
+		has_label = 1;
+		break;
+	}
+
+	if (!has_label)
+		return;
+
+	/* force allocation of a phandle for this node */
+	(void)get_node_phandle(dt, node);
+
+	/* add the symbol */
+	for_each_label(node->labels, l) {
+
+		s = xmalloc(sizeof(*s));
+		s->label = l;
+		s->node = node;
+		s->next = NULL;
+
+		/* add it to the symbols list */
+		sp = &dt->symbols;
+		while (*sp)
+			sp = &((*sp)->next);
+		*sp = s;
+	}
+}
+NODE_WARNING(auto_label_phandles, NULL);
+
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
@@ -670,6 +770,8 @@
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
+	&auto_label_phandles,
+
 	&always_fail,
 };
 
--- a/Documentation/dt-object-internal.txt	1969-12-31 19:00:00.000000000 
-0500
+++ b/Documentation/dt-object-internal.txt	2015-12-01 17:11:59.249242025 
-0500
@@ -0,0 +1,301 @@
+Device Tree Dynamic Object format internals
+-------------------------------------------
+
+The Device Tree for most platforms is a static representation of
+the hardware capabilities. This is insufficient for many platforms
+that need to dynamically insert device tree fragments to the
+running kernel's live tree.
+
+This document explains the the device tree object format and the
+modifications made to the device tree compiler, which make it possible.
+
+1. Simplified Problem Definition
+--------------------------------
+
+Assume we have a platform which boots using following simplified device 
tree.
+
+---- foo.dts 
-----------------------------------------------------------------
+	/* FOO platform */
+	/ {
+		compatible = "corp,foo";
+
+		/* shared resources */
+		res: res {
+		};
+
+		/* On chip peripherals */
+		ocp: ocp {
+			/* peripherals that are always instantiated 
*/
+			peripheral1 { ... };
+		}
+	};
+---- foo.dts 
-----------------------------------------------------------------
+
+We have a number of peripherals that after probing (using some undefined 
method)
+should result in different device tree configuration.
+
+We cannot boot with this static tree because due to the configuration of 
the
+foo platform there exist multiple conficting peripherals DT fragments.
+
+So for the bar peripheral we would have this:
+
+---- foo+bar.dts 
-------------------------------------------------------------
+	/* FOO platform + bar peripheral */
+	/ {
+		compatible = "corp,foo";
+
+		/* shared resources */
+		res: res {
+		};
+
+		/* On chip peripherals */
+		ocp: ocp {
+			/* peripherals that are always instantiated 
*/
+			peripheral1 { ... };
+
+			/* bar peripheral */
+			bar {
+				compatible = "corp,bar";
+				... /* various properties and 
child nodes */
+			}
+		}
+	};
+---- foo+bar.dts 
-------------------------------------------------------------
+
+While for the baz peripheral we would have this:
+
+---- foo+baz.dts 
-------------------------------------------------------------
+	/* FOO platform + baz peripheral */
+	/ {
+		compatible = "corp,foo";
+
+		/* shared resources */
+		res: res {
+			/* baz resources */
+			baz_res: res_baz { ... };
+		};
+
+		/* On chip peripherals */
+		ocp: ocp {
+			/* peripherals that are always instantiated 
*/
+			peripheral1 { ... };
+
+			/* baz peripheral */
+			baz {
+				compatible = "corp,baz";
+				/* reference to another point in 
the tree */
+				ref-to-res = <&baz_res>;
+				... /* various properties and 
child nodes */
+			}
+		}
+	};
+---- foo+baz.dts 
-------------------------------------------------------------
+
+We note that the baz case is more complicated, since the baz peripheral 
needs to
+reference another node in the DT tree.
+
+2. Device Tree Object Format Requirements
+-----------------------------------------
+
+Since the device tree is used for booting a number of very different 
hardware
+platforms it is imperative that we tread very carefully.
+
+2.a) No changes to the Device Tree binary format. We cannot modify the tree
+format at all and all the information we require should be encoded using 
device
+tree itself. We can add nodes that can be safely ignored by both 
bootloaders and
+the kernel.
+
+2.b) Changes to the DTS source format should be absolutely minimal, and 
should
+only be needed for the DT fragment definitions, and not the base boot DT.
+
+2.c) An explicit option should be used to instruct DTC to generate the 
required
+information needed for object resolution. Platforms that don't use the
+dynamic object format can safely ignore it.
+
+2.d) Finally, DT syntax changes should be kept to a minimum. It should be
+possible to express everything using the existing DT syntax.
+
+3. Implementation
+-----------------
+
+The basic unit of addressing in Device Tree is the phandle. Turns out it's
+relatively simple to extend the way phandles are generated and referenced
+so that it's possible to dynamically convert symbolic references (labels)
+to phandle values.
+
+We can roughly divide the operation into two steps.
+
+3.a) Compilation of the base board DTS file using the '-@' option
+generates a valid DT blob with an added __symbols__ node at the root node,
+containing a list of all nodes that are marked with a label.
+
+Using the foo.dts file above the following node will be generated;
+
+$ dtc -@ -O dtb -o foo.dtb -b 0 foo.dts
+$ fdtdump foo.dtb
+...
+/ {
+	...
+	res {
+		...
+		linux,phandle = <0x00000001>;
+		phandle = <0x00000001>;
+		...
+	};
+	ocp {
+		...
+		linux,phandle = <0x00000002>;
+		phandle = <0x00000002>;
+		...
+	};
+	__symbols__ {
+		res="/res";
+		ocp="/ocp";
+	};
+};
+
+Notice that all the nodes that had a label have been recorded, and that
+phandles have been generated for them.
+
+This blob can be used to boot the board normally, the __symbols__ node will
+be safely ignored both by the bootloader and the kernel (the only loss will
+be a few bytes of memory and disk space).
+
+3.b) The Device Tree fragments must be compiled with the same option but 
they
+must also have a tag (/plugin/) that allows undefined references to labels
+that are not present at compilation time to be recorded so that the runtime
+loader can fix them.
+
+So the bar peripheral's DTS format would be of the form:
+
+/plugin/;	/* allow undefined label references and record them */
+/ {
+	....	/* various properties for loader use; i.e. part id 
etc. */
+	fragment at 0 {
+		target = <&ocp>;
+		__overlay__ {
+			/* bar peripheral */
+			bar {
+				compatible = "corp,bar";
+				... /* various properties and 
child nodes */
+			}
+		};
+	};
+};
+
+Note that there's a target property that specifies the location where the
+contents of the overlay node will be placed, and it references the label
+in the foo.dts file.
+
+$ dtc -@ -O dtb -o bar.dtbo -b 0 bar.dts
+$ fdtdump bar.dtbo
+...
+/ {
+	... /* properties */
+	fragment at 0 {
+		target = <0xdeadbeef>;
+		__overlay__ {
+			bar {
+				compatible = "corp,bar";
+				... /* various properties and 
child nodes */
+			}
+		};
+	};
+	__fixups__ {
+	    ocp = "/fragment at 0:target:0";
+	};
+};
+
+No __symbols__ has been generated (no label in bar.dts).
+Note that the target's ocp label is undefined, so the phandle handle
+value is filled with the illegal value '0xdeadbeef', while a __fixups__
+node has been generated, which marks the location in the tree where
+the label lookup should store the runtime phandle value of the ocp node.
+
+The format of the __fixups__ node entry is
+
+	<label> = "<local-full-path>:<property-name>:<offset>";
+
+<label> 		Is the label we're referring
+<local-full-path>	Is the full path of the node the reference is
+<property-name>		Is the name of the property containing the
+			reference
+<offset>		The offset (in bytes) of where the property's
+			phandle value is located.
+
+Doing the same with the baz peripheral's DTS format is a little bit more
+involved, since baz contains references to local labels which require
+local fixups.
+
+/plugin/;	/* allow undefined label references and record them */
+/ {
+	....	/* various properties for loader use; i.e. part id 
etc. */
+	fragment at 0 {
+		target = <&res>;
+		__overlay__ {
+			/* baz resources */
+			baz_res: res_baz { ... };
+		};
+	};
+	fragment at 1 {
+		target = <&ocp>;
+		__overlay__ {
+			/* baz peripheral */
+			baz {
+				compatible = "corp,baz";
+				/* reference to another point in 
the tree */
+				ref-to-res = <&baz_res>;
+				... /* various properties and 
child nodes */
+			}
+		};
+	};
+};
+
+Note that &bar_res reference.
+
+$ dtc -@ -O dtb -o baz.dtbo -b 0 baz.dts
+$ fdtdump baz.dtbo
+...
+/ {
+	... /* properties */
+	fragment at 0 {
+		target = <0xdeadbeef>;
+		__overlay__ {
+			res_baz {
+				....
+				linux,phandle = <0x00000001>;
+				phandle = <0x00000001>;
+			};
+		};
+	};
+	fragment at 1 {
+		target = <0xdeadbeef>;
+		__overlay__ {
+			baz {
+				compatible = "corp,baz";
+				... /* various properties and 
child nodes */
+				ref-to-res = <0x00000001>;
+			}
+		};
+	};
+	__fixups__ {
+		res = "/fragment at 0:target:0";
+		ocp = "/fragment at 1:target:0";
+	};
+	__local_fixups__ {
+		fragment at 1 {
+			__overlay__ {
+				baz {
+					ref-to-res = <0>;
+				};
+			};
+		};
+	};
+};
+
+This is similar to the bar case, but the reference of a local label by the
+baz node generates a __local_fixups__ entry that records the place that the
+local reference is being made. Since phandles are allocated starting at 1
+the run time loader must apply an offset to each phandle in every dynamic
+DT object loaded. The __local_fixups__ node records the place of every
+local reference so that the loader can apply the offset.

--- a/Documentation/manual.txt	2015-12-10 14:50:21.537561920 -0500
+++ b/Documentation/manual.txt	2015-12-01 17:11:59.249242025 -0500
@@ -119,6 +119,14 @@
 	Make space for <number> reserve map entries
 	Relevant for dtb and asm output only.
 
+    -@
+        Generates a __symbols__ node at the root node of the resulting blob
+	for any node labels used, and for any local references using 
phandles
+	it also generates a __local_fixups__ node that tracks them.
+
+	When using the /plugin/ tag all unresolved label references to
+	be tracked in the __fixups__ node, making dynamic resolution 
possible.
+
     -S <bytes>
 	Ensure the blob at least <bytes> long, adding additional
 	space if needed.
@@ -153,6 +161,8 @@
 
     devicetree:   '/' nodedef
 
+    plugindecl:   '/' 'plugin' '/' ';'
+
     nodedef:      '{' list_of_property list_of_subnode '}' ';'
 
     property:     label PROPNAME '=' propdata ';'
--- a/dtc.c	2015-12-10 14:50:21.537561920 -0500
+++ b/dtc.c	2015-12-01 17:11:59.264242045 -0500
@@ -31,6 +31,7 @@
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle 
properties */
+int symbol_fixup_support = 0;
 
 static void fill_fullpaths(struct node *tree, const char *prefix)
 {
@@ -53,7 +54,7 @@
 #define FDT_VERSION(version)	_FDT_VERSION(version)
 #define _FDT_VERSION(version)	#version
 static const char usage_synopsis[] = "dtc [options] <input file>";
-static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:hv";
+static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:@hv";
 static struct option const usage_long_opts[] = {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -71,6 +72,7 @@
 	{"phandle",           a_argument, NULL, 'H'},
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
+	{"symbols",	     no_argument, NULL, '@'},
 	{"help",             no_argument, NULL, 'h'},
 	{"version",          no_argument, NULL, 'v'},
 	{NULL,               no_argument, NULL, 0x0},
@@ -101,6 +103,7 @@
 	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" 
properties",
 	"\n\tEnable/disable warnings (prefix with \"no-\")",
 	"\n\tEnable/disable errors (prefix with \"no-\")",
+	"\n\tEnable symbols/fixup support",
 	"\n\tPrint this help and exit",
 	"\n\tPrint version and exit",
 	NULL,
@@ -233,7 +236,9 @@
 		case 'E':
 			parse_checks_option(false, true, optarg);
 			break;
-
+		case '@':
+			symbol_fixup_support = 1;
+			break;
 		case 'h':
 			usage(NULL);
 		default:
--- a/dtc.h	2015-12-10 14:50:21.538561922 -0500
+++ b/dtc.h	2015-12-01 17:11:59.250242026 -0500
@@ -54,6 +54,7 @@
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
 extern int phandle_format;	/* Use linux,phandle or phandle properties 
*/
+extern int symbol_fixup_support;/* enable symbols & fixup support */
 
 #define PHANDLE_LEGACY	0x1
 #define PHANDLE_EPAPR	0x2
@@ -132,6 +133,26 @@
 	struct label *next;
 };
 
+struct fixup_entry {
+	int offset;
+	struct node *node;
+	struct property *prop;
+	struct fixup_entry *next;
+	bool local_fixup_generated;
+};
+
+struct fixup {
+	char *ref;
+	struct fixup_entry *entries;
+	struct fixup *next;
+};
+
+struct symbol {
+	struct label *label;
+	struct node *node;
+	struct symbol *next;
+};
+
 struct property {
 	bool deleted;
 	char *name;
@@ -158,6 +179,13 @@
 	int addr_cells, size_cells;
 
 	struct label *labels;
+
+	struct symbol *symbols;
+	struct fixup_entry *local_fixups;
+	bool emit_local_fixup_node;
+
+	bool is_plugin;
+	struct fixup *fixups;
 };
 
 #define for_each_label_withdel(l0, l) \
@@ -181,6 +209,18 @@
 	for_each_child_withdel(n, c) \
 		if (!(c)->deleted)
 
+#define for_each_fixup(n, f) \
+	for ((f) = (n)->fixups; (f); (f) = (f)->next)
+
+#define for_each_fixup_entry(f, fe) \
+	for ((fe) = (f)->entries; (fe); (fe) = (fe)->next)
+
+#define for_each_symbol(n, s) \
+	for ((s) = (n)->symbols; (s); (s) = (s)->next)
+
+#define for_each_local_fixup_entry(n, fe) \
+	for ((fe) = (n)->local_fixups; (fe); (fe) = (fe)->next)
+
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
--- a/dtc-lexer.l	2015-12-10 14:50:21.537561920 -0500
+++ b/dtc-lexer.l	2015-12-01 17:11:59.249242025 -0500
@@ -113,6 +113,11 @@
 			return DT_V1;
 		}
 
+<*>"/plugin/"	{
+			DPRINT("Keyword: /plugin/\n");
+			return DT_PLUGIN;
+		}
+
 <*>"/memreserve/"	{
 			DPRINT("Keyword: /memreserve/\n");
 			BEGIN_DEFAULT();
--- a/dtc-parser.y	2015-12-10 14:50:21.537561920 -0500
+++ b/dtc-parser.y	2015-12-01 17:11:59.249242025 -0500
@@ -19,6 +19,7 @@
  */
 %{
 #include <stdio.h>
+#include <inttypes.h>
 
 #include "dtc.h"
 #include "srcpos.h"
@@ -52,9 +53,11 @@
 	struct node *nodelist;
 	struct reserve_info *re;
 	uint64_t integer;
+	bool is_plugin;
 }
 
 %token DT_V1
+%token DT_PLUGIN
 %token DT_MEMRESERVE
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
@@ -71,6 +74,7 @@
 
 %type <data> propdata
 %type <data> propdataprefix
+%type <is_plugin> plugindecl
 %type <re> memreserve
 %type <re> memreserves
 %type <array> arrayprefix
@@ -101,10 +105,22 @@
 %%
 
 sourcefile:
-	  DT_V1 ';' memreserves devicetree
+	  DT_V1 ';' plugindecl memreserves devicetree
 		{
-			the_boot_info = build_boot_info($3, $4,
-							
guess_boot_cpuid($4));
+			$5->is_plugin = $3;
+			the_boot_info = build_boot_info($4, $5,
+							
guess_boot_cpuid($5));
+		}
+	;
+
+plugindecl:
+	/* empty */
+		{
+			$$ = false;
+		}
+	| DT_PLUGIN ';'
+		{
+			$$ = true;
 		}
 	;
 
--- a/fdtdump.c	2015-12-10 14:50:21.538561922 -0500
+++ b/fdtdump.c	2015-12-01 17:11:59.250242026 -0500
@@ -8,6 +8,14 @@
 #include <stdlib.h>
 #include <string.h>
 #include <ctype.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <alloca.h>
+#include <dirent.h>
+#include <limits.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
 
 #include <libfdt.h>
 #include <libfdt_env.h>
@@ -143,6 +151,95 @@
 	}
 }
 
+static void dump_live_internal(const char *path, bool debug, int depth)
+{
+	int maxsz = strlen(path) + 1 + PATH_MAX;
+	char *new_path = alloca(maxsz + 1);
+	struct stat sb;
+	struct dirent *de;
+	char *buf, *p;
+	int buf_alloc, shift, chunk, left, fd, ret;
+	DIR *d;
+
+	shift = 4;
+	buf_alloc = 4 * 1024;	/* 4K (maximum chunk) */
+	buf = alloca(buf_alloc + sizeof(uint32_t));
+	buf[buf_alloc] = '\0';	/* always terminate (just in case) */
+
+	d = opendir(path);
+	if (d == NULL)
+		die("Could not open %s directory\n", path);
+
+	/* first dump the properties (files) */
+	while ((de = readdir(d)) != NULL) {
+		/* properties are files */
+		if (de->d_type != DT_REG)
+			continue;
+		snprintf(new_path, maxsz, "%s/%s", path, de->d_name);
+		new_path[maxsz] = '\0';
+		printf("%*s%s", depth * shift, "", de->d_name);
+
+		if (stat(new_path, &sb) != 0)
+			die("could not open: %s\n", new_path);
+
+		fd = open(new_path, O_RDONLY);
+		if (fd == -1)
+			die("Could not open: %s\n", new_path);
+
+		chunk = sb.st_size > buf_alloc ? buf_alloc : 
sb.st_size;
+		p = buf;
+		left = chunk;
+		while (left > 0) {
+			do {
+				ret = read(fd, p, left);
+			} while (ret == -1 && (errno == EAGAIN || 
errno == EINTR));
+			if (ret == -1)
+				die("Read failed on: %s\n", 
new_path);
+			left -= ret;
+			p += ret;
+		}
+		close(fd);
+
+		if (chunk < sb.st_size)
+			printf(" (trunc)");
+		utilfdt_print_data(buf, chunk);
+		printf(";\n");
+	}
+
+	/* now recurse to the directories */
+	rewinddir(d);
+	while ((de = readdir(d)) != NULL) {
+		/* properties are files */
+		if (de->d_type != DT_DIR)
+			continue;
+		/* skip current and parent directories */
+		if (strcmp(de->d_name, ".") == 0 ||
+				strcmp(de->d_name, "..") == 0)
+			continue;
+		snprintf(new_path, maxsz, "%s/%s", path, de->d_name);
+		new_path[maxsz] = '\0';
+		printf("%*s%s {\n", depth * shift, "", de->d_name);
+		dump_live_internal(new_path, debug, depth + 1);
+		printf("%*s};\n", depth * shift, "");
+	}
+}
+
+static void dump_live(const char *path, bool debug)
+{
+	char *fixed_path = alloca(strlen(path) + 1);
+	char *p;
+
+	/* strip trailing / */
+	strcpy(fixed_path, path);
+	p = fixed_path + strlen(fixed_path) - 1;
+	while (*p == '/' && p > fixed_path)
+		*p-- = '\0';
+	printf("/* dump of live tree at %s */\n", fixed_path);
+	printf("/ {\n");
+	dump_live_internal(fixed_path, debug, 1);
+	printf("};\n");
+}
+
 /* Usage related data. */
 static const char usage_synopsis[] = "fdtdump [options] <file>";
 static const char usage_short_opts[] = "ds" USAGE_COMMON_SHORT_OPTS;
@@ -165,6 +262,7 @@
 	bool debug = false;
 	bool scan = false;
 	off_t len;
+	struct stat sb;
 
 	while ((opt = util_getopt_long()) != EOF) {
 		switch (opt) {
@@ -182,6 +280,15 @@
 		usage("missing input filename");
 	file = argv[optind];
 
+	if (stat(file, &sb) != 0)
+		die("could not open: %s\n", file);
+
+	/* dump live tree if it's a directory */
+	if (S_ISDIR(sb.st_mode)) {
+		dump_live(file, debug);
+		return 0;
+	}
+
 	buf = utilfdt_read_len(file, &len);
 	if (!buf)
 		die("could not read: %s\n", file);
--- a/flattree.c	2015-12-10 14:50:21.538561922 -0500
+++ b/flattree.c	2015-12-01 17:11:59.250242026 -0500
@@ -255,6 +255,204 @@
 	return i;
 }
 
+static void emit_local_fixups(struct node *tree, struct emitter *emit,
+		void *etarget, struct data *strbuf, struct 
version_info *vi,
+		struct node *node)
+{
+	struct fixup_entry *fe, *fen;
+	struct node *child;
+	int nameoff, count;
+	cell_t *buf;
+	struct data d;
+
+	if (node->emit_local_fixup_node) {
+
+		/* emit the external fixups (do not emit /) */
+		if (node != tree) {
+			emit->beginnode(etarget, NULL);
+			emit->string(etarget, node->name, 0);
+			emit->align(etarget, sizeof(cell_t));
+		}
+
+		for_each_local_fixup_entry(tree, fe) {
+			if (fe->node != node || fe-
>local_fixup_generated)
+				continue;
+
+			/* count the number of fixup entries */
+			count = 0;
+			for_each_local_fixup_entry(tree, fen) {
+				if (fen->prop != fe->prop)
+					continue;
+				fen->local_fixup_generated = 
true;
+				count++;
+			}
+
+			/* allocate buffer */
+			buf = xmalloc(count * sizeof(cell_t));
+
+			/* collect all the offsets in buffer */
+			count = 0;
+			for_each_local_fixup_entry(tree, fen) {
+				if (fen->prop != fe->prop)
+					continue;
+				fen->local_fixup_generated = 
true;
+				buf[count++] = cpu_to_fdt32(fen-
>offset);
+			}
+			d = empty_data;
+			d.len = count * sizeof(cell_t);
+			d.val = (char *)buf;
+
+			nameoff = stringtable_insert(strbuf, fe-
>prop->name);
+			emit->property(etarget, fe->prop->labels);
+			emit->cell(etarget, count * 
sizeof(cell_t));
+			emit->cell(etarget, nameoff);
+
+			if ((vi->flags & FTF_VARALIGN) &&
+					(count * 
sizeof(cell_t)) >= 8)
+				emit->align(etarget, 8);
+
+			emit->data(etarget, d);
+			emit->align(etarget, sizeof(cell_t));
+
+			free(buf);
+		}
+	}
+
+	for_each_child(node, child)
+		emit_local_fixups(tree, emit, etarget, strbuf, vi, 
child);
+
+	if (node->emit_local_fixup_node && node != tree)
+		emit->endnode(etarget, tree->labels);
+}
+
+static void emit_symbols_node(struct node *tree, struct emitter *emit,
+			      void *etarget, struct data *strbuf,
+			      struct version_info *vi)
+{
+	struct symbol *sym;
+	int nameoff, vallen;
+
+	/* do nothing if no symbols */
+	if (!tree->symbols)
+		return;
+
+	emit->beginnode(etarget, NULL);
+	emit->string(etarget, "__symbols__", 0);
+	emit->align(etarget, sizeof(cell_t));
+
+	for_each_symbol(tree, sym) {
+
+		vallen = strlen(sym->node->fullpath);
+
+		nameoff = stringtable_insert(strbuf, sym->label-
>label);
+
+		emit->property(etarget, NULL);
+		emit->cell(etarget, vallen + 1);
+		emit->cell(etarget, nameoff);
+
+		if ((vi->flags & FTF_VARALIGN) && vallen >= 8)
+			emit->align(etarget, 8);
+
+		emit->string(etarget, sym->node->fullpath,
+				strlen(sym->node->fullpath));
+		emit->align(etarget, sizeof(cell_t));
+	}
+
+	emit->endnode(etarget, NULL);
+}
+
+static void emit_local_fixups_node(struct node *tree, struct emitter *emit,
+				   void *etarget, struct data 
*strbuf,
+				   struct version_info *vi)
+{
+	struct fixup_entry *fe;
+	struct node *node;
+
+	/* do nothing if no local fixups */
+	if (!tree->local_fixups)
+		return;
+
+	/* mark all nodes that need a local fixup generated (and parents) 
*/
+	for_each_local_fixup_entry(tree, fe) {
+		node = fe->node;
+		while (node != NULL && !node->emit_local_fixup_node) {
+			node->emit_local_fixup_node = true;
+			node = node->parent;
+		}
+	}
+
+	/* emit the local fixups node now */
+	emit->beginnode(etarget, NULL);
+	emit->string(etarget, "__local_fixups__", 0);
+	emit->align(etarget, sizeof(cell_t));
+
+	emit_local_fixups(tree, emit, etarget, strbuf, vi, tree);
+
+	emit->endnode(etarget, tree->labels);
+}
+
+static void emit_fixups_node(struct node *tree, struct emitter *emit,
+			     void *etarget, struct data *strbuf,
+			     struct version_info *vi)
+{
+	struct fixup *f;
+	struct fixup_entry *fe;
+	char *name, *s;
+	const char *fullpath;
+	int namesz, nameoff, vallen;
+
+	/* do nothing if no fixups */
+	if (!tree->fixups)
+		return;
+
+	/* emit the external fixups */
+	emit->beginnode(etarget, NULL);
+	emit->string(etarget, "__fixups__", 0);
+	emit->align(etarget, sizeof(cell_t));
+
+	for_each_fixup(tree, f) {
+
+		namesz = 0;
+		for_each_fixup_entry(f, fe) {
+			fullpath = fe->node->fullpath;
+			if (fullpath[0] == '\0')
+				fullpath = "/";
+			namesz += strlen(fullpath) + 1;
+			namesz += strlen(fe->prop->name) + 1;
+			namesz += 32;	/* space for 
:<number> + '\0' */
+		}
+
+		name = xmalloc(namesz);
+
+		s = name;
+		for_each_fixup_entry(f, fe) {
+			fullpath = fe->node->fullpath;
+			if (fullpath[0] == '\0')
+				fullpath = "/";
+			snprintf(s, name + namesz - s, "%s:%s:%d", 
fullpath,
+					fe->prop->name, fe-
>offset);
+			s += strlen(s) + 1;
+		}
+
+		nameoff = stringtable_insert(strbuf, f->ref);
+		vallen = s - name - 1;
+
+		emit->property(etarget, NULL);
+		emit->cell(etarget, vallen + 1);
+		emit->cell(etarget, nameoff);
+
+		if ((vi->flags & FTF_VARALIGN) && vallen >= 8)
+			emit->align(etarget, 8);
+
+		emit->string(etarget, name, vallen);
+		emit->align(etarget, sizeof(cell_t));
+
+		free(name);
+	}
+
+	emit->endnode(etarget, tree->labels);
+}
+
 static void flatten_tree(struct node *tree, struct emitter *emit,
 			 void *etarget, struct data *strbuf,
 			 struct version_info *vi)
@@ -310,6 +508,10 @@
 		flatten_tree(child, emit, etarget, strbuf, vi);
 	}
 
+	emit_symbols_node(tree, emit, etarget, strbuf, vi);
+	emit_local_fixups_node(tree, emit, etarget, strbuf, vi);
+	emit_fixups_node(tree, emit, etarget, strbuf, vi);
+
 	emit->endnode(etarget, tree->labels);
 }

--- a/libfdt/fdt_ro.c	2014-11-11 22:29:16.000000000 -0500
+++ b/libfdt/fdt_ro.c	2015-12-01 17:11:42.213219672 -0500
@@ -154,9 +154,9 @@
 	return fdt_subnode_offset_namelen(fdt, parentoffset, name, 
strlen(name));
 }
 
-int fdt_path_offset(const void *fdt, const char *path)
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 {
-	const char *end = path + strlen(path);
+	const char *end = path + namelen;
 	const char *p = path;
 	int offset = 0;
 
@@ -164,7 +164,7 @@
 
 	/* see if we have an alias */
 	if (*path != '/') {
-		const char *q = strchr(path, '/');
+		const char *q = memchr(path, '/', end - p);
 
 		if (!q)
 			q = end;
@@ -177,14 +177,15 @@
 		p = q;
 	}
 
-	while (*p) {
+	while (p < end) {
 		const char *q;
 
-		while (*p == '/')
+		while (*p == '/') {
 			p++;
-		if (! *p)
-			return offset;
-		q = strchr(p, '/');
+			if (p == end)
+				return offset;
+		}
+		q = memchr(p, '/', end - p);
 		if (! q)
 			q = end;
 
@@ -198,6 +199,11 @@
 	return offset;
 }
 
+int fdt_path_offset(const void *fdt, const char *path)
+{
+	return fdt_path_offset_namelen(fdt, path, strlen(path));
+}
+
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
 	const struct fdt_node_header *nh = _fdt_offset_ptr(fdt, 
nodeoffset);

--- a/libfdt/libfdt.h	2014-11-11 22:29:16.000000000 -0500
+++ b/libfdt/libfdt.h	2015-12-01 17:11:42.213219672 -0500
@@ -323,6 +323,17 @@
 int fdt_subnode_offset(const void *fdt, int parentoffset, const char 
*name);
 
 /**
+ * fdt_path_offset_namelen - find a tree node by its full path
+ * @fdt: pointer to the device tree blob
+ * @path: full path of the node to locate
+ * @namelen: number of characters of path to consider
+ *
+ * Identical to fdt_path_offset(), but only consider the first namelen
+ * characters of path as the path name.
+ */
+int fdt_path_offset_namelen(const void *fdt, const char *path, int 
namelen);
+
+/**
  * fdt_path_offset - find a tree node by its full path
  * @fdt: pointer to the device tree blob
  * @path: full path of the node to locate

--- a/libfdt/version.lds	2014-11-11 22:29:16.000000000 -0500
+++ b/libfdt/version.lds	2015-12-01 17:11:42.213219672 -0500
@@ -8,6 +8,7 @@
 		fdt_get_mem_rsv;
 		fdt_subnode_offset_namelen;
 		fdt_subnode_offset;
+		fdt_path_offset_namelen;
 		fdt_path_offset;
 		fdt_get_name;
 		fdt_get_property_namelen;
@@ -54,6 +55,8 @@
 		fdt_get_property_by_offset;
 		fdt_getprop_by_offset;
 		fdt_next_property_offset;
+		fdt_first_subnode;
+		fdt_next_subnode;
 
 	local:
 		*;


--- a/tests/run_tests.sh	2014-11-11 22:29:16.000000000 -0500
+++ b/tests/run_tests.sh	2015-12-01 17:11:42.213219672 -0500
@@ -42,20 +42,20 @@
 
 shorten_echo () {
     limit=32
-    echo -n "$1"
+    printf "$1"
     shift
     for x; do
 	if [ ${#x} -le $limit ]; then
-	    echo -n " $x"
+	    printf " $x"
 	else
 	    short=$(echo "$x" | head -c$limit)
-	    echo -n " \"$short\"...<${#x} bytes>"
+	    printf " \"$short\"...<${#x} bytes>"
 	fi
     done
 }
 
 run_test () {
-    echo -n "$@:	"
+    printf "$*:	"
     if [ -n "$VALGRIND" -a -f $1.supp ]; then
 	VGSUPP="--suppressions=$1.supp"
     fi
@@ -63,7 +63,7 @@
 }
 
 run_sh_test () {
-    echo -n "$@:	"
+    printf "$*:	"
     base_run_test sh "$@"
 }
 
@@ -106,12 +106,12 @@
 
 run_wrap_error_test () {
     shorten_echo "$@"
-    echo -n " {!= 0}:	"
+    printf " {!= 0}:	"
     base_run_test wrap_error "$@"
 }
 
 run_dtc_test () {
-    echo -n "dtc $@:	"
+    printf "dtc $*:	"
     base_run_test wrap_test $VALGRIND $DTC "$@"
 }
 
@@ -126,7 +126,7 @@
 run_fdtget_test () {
     expect="$1"
     shift
-    echo -n "fdtget-runtest.sh "$expect" $@:	"
+    printf "fdtget-runtest.sh %s $*:	" "$(echo $expect)"
     base_run_test sh fdtget-runtest.sh "$expect" "$@"
 }
 
@@ -134,14 +134,14 @@
     expect="$1"
     shift
     shorten_echo fdtput-runtest.sh "$expect" "$@"
-    echo -n ":	"
+    printf ":	"
     base_run_test sh fdtput-runtest.sh "$expect" "$@"
 }
 
 run_fdtdump_test() {
     file="$1"
     shorten_echo fdtdump-runtest.sh "$file"
-    echo -n ":	"
+    printf ":	"
     base_run_test sh fdtdump-runtest.sh "$file"
 }
 
@@ -279,6 +279,8 @@
     run_dtc_test -I dts -O dtb -o embedded_nul.test.dtb embedded_nul.dts
     run_dtc_test -I dts -O dtb -o embedded_nul_equiv.test.dtb 
embedded_nul_equiv.dts
     run_test dtbs_equal_ordered embedded_nul.test.dtb 
embedded_nul_equiv.test.dtb
+
+    run_dtc_test -I dts -O dtb bad-size-cells.dts
 }
 
 dtc_tests () {
@@ -399,6 +401,8 @@
     tree1_tests dtc_tree1_merge.test.dtb test_tree1.dtb
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge_labelled.test.dtb 
test_tree1_merge_labelled.dts
     tree1_tests dtc_tree1_merge_labelled.test.dtb test_tree1.dtb
+    run_dtc_test -I dts -O dtb -o dtc_tree1_label_noderef.test.dtb 
test_tree1_label_noderef.dts
+    run_test dtbs_equal_unordered dtc_tree1_label_noderef.test.dtb 
test_tree1.dtb
     run_dtc_test -I dts -O dtb -o multilabel_merge.test.dtb 
multilabel_merge.dts
     run_test references multilabel.test.dtb
     run_test dtbs_equal_ordered multilabel.test.dtb 
multilabel_merge.test.dtb
@@ -610,6 +614,28 @@
     run_wrap_test $DTPUT $dtb -cp /chosen
     run_wrap_test $DTPUT $dtb -cp /chosen/son
 
+    # Start again with a fresh dtb
+    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
+
+    # Node delete
+    run_wrap_test $DTPUT $dtb -c /chosen/node1 /chosen/node2 /chosen/node3
+    run_fdtget_test "node3\nnode2\nnode1" $dtb -l  /chosen
+    run_wrap_test $DTPUT $dtb -r /chosen/node1 /chosen/node2
+    run_fdtget_test "node3" $dtb -l  /chosen
+
+    # Delete the non-existent node
+    run_wrap_error_test $DTPUT $dtb -r /non-existent/node
+
+    # Property delete
+    run_fdtput_test "eva" $dtb /chosen/ name "" -ts "eva"
+    run_fdtput_test "016" $dtb /chosen/ age  "" -ts "016"
+    run_fdtget_test "age\nname\nbootargs\nlinux,platform" $dtb -p  /chosen
+    run_wrap_test $DTPUT $dtb -d /chosen/ name age
+    run_fdtget_test "bootargs\nlinux,platform" $dtb -p  /chosen
+
+    # Delete the non-existent property
+    run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
+
     # TODO: Add tests for verbose mode?
 }
 
