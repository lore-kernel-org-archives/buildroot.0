From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 6 Jun 2009 21:53:15 +0200
Subject: [Buildroot] [git commit] busybox: 1.14.1 ftpd + modprobe patches
Message-ID: <20090606195402.1FF5A77825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82182c3e270441d7650ae5c3888adc8d734519c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.1-ftpd.patch     |   22 ++++
 package/busybox/busybox-1.14.1-modprobe.patch |  132 +++++++++++++++++++++++++
 2 files changed, 154 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.1-ftpd.patch
 create mode 100644 package/busybox/busybox-1.14.1-modprobe.patch

diff --git a/package/busybox/busybox-1.14.1-ftpd.patch b/package/busybox/busybox-1.14.1-ftpd.patch
new file mode 100644
index 0000000..d33977f
--- /dev/null
+++ b/package/busybox/busybox-1.14.1-ftpd.patch
@@ -0,0 +1,22 @@
+diff -urpN busybox-1.14.1/networking/ftpd.c busybox-1.14.1-ftpd/networking/ftpd.c
+--- busybox-1.14.1/networking/ftpd.c	2009-05-27 18:00:23.000000000 +0200
++++ busybox-1.14.1-ftpd/networking/ftpd.c	2009-06-04 18:59:49.000000000 +0200
+@@ -1320,6 +1320,8 @@ int ftpd_main(int argc UNUSED_PARAM, cha
+ 				handle_appe();
+ 			else if (cmdval == const_STOU) /* "store unique" */
+ 				handle_stou();
++			else
++				goto bad_cmd;
+ 		}
+ #endif
+ #if 0
+@@ -1340,6 +1342,9 @@ int ftpd_main(int argc UNUSED_PARAM, cha
+ 			 * (doesn't necessarily mean "we must support them")
+ 			 * foo 1.2.3: XXXX - comment
+ 			 */
++#if ENABLE_FEATURE_FTP_WRITE
++ bad_cmd:
++#endif
+ 			cmdio_write_raw(STR(FTP_BADCMD)" Unknown command\r\n");
+ 		}
+ 	}
diff --git a/package/busybox/busybox-1.14.1-modprobe.patch b/package/busybox/busybox-1.14.1-modprobe.patch
new file mode 100644
index 0000000..9690125
--- /dev/null
+++ b/package/busybox/busybox-1.14.1-modprobe.patch
@@ -0,0 +1,132 @@
+diff -urpN busybox-1.14.1/modutils/modprobe.c busybox-1.14.1-modprobe/modutils/modprobe.c
+--- busybox-1.14.1/modutils/modprobe.c	2009-05-27 18:01:37.000000000 +0200
++++ busybox-1.14.1-modprobe/modutils/modprobe.c	2009-06-04 19:01:04.000000000 +0200
+@@ -8,12 +8,17 @@
+  * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
+  */
+ 
++/* Note that unlike older versions of modules.dep/depmod (busybox and m-i-t),
++ * we expect the full dependency list to be specified in modules.dep.  Older
++ * versions would only export the direct dependency list.
++ */
++
+ #include "libbb.h"
+ #include "modutils.h"
+ #include <sys/utsname.h>
+ #include <fnmatch.h>
+ 
+-//#define DBG(...) bb_error_msg(__VA_ARGS__)
++//#define DBG(fmt, ...) bb_error_msg("%s: " fmt, __func__, ## __VA_ARGS__)
+ #define DBG(...) ((void)0)
+ 
+ #define MODULE_FLAG_LOADED		0x0001
+@@ -116,6 +121,7 @@ static void add_probe(const char *name)
+ 		return;
+ 	}
+ 
++	DBG("queuing %s", name);
+ 	m->probed_name = name;
+ 	m->flags |= MODULE_FLAG_NEED_DEPS;
+ 	llist_add_to_end(&G.probes, m);
+@@ -205,9 +211,10 @@ static int read_config(const char *path)
+ 
+ static int do_modprobe(struct module_entry *m)
+ {
+-	struct module_entry *m2;
++	struct module_entry *m2 = m2; /* for compiler */
+ 	char *fn, *options;
+-	int rc = -1;
++	int rc, first;
++	llist_t *l;
+ 
+ 	if (!(m->flags & MODULE_FLAG_FOUND_IN_MODDEP)) {
+ 		DBG("skipping %s, not found in modules.dep", m->modname);
+@@ -218,13 +225,25 @@ static int do_modprobe(struct module_ent
+ 	if (!(option_mask32 & MODPROBE_OPT_REMOVE))
+ 		m->deps = llist_rev(m->deps);
+ 
++	for (l = m->deps; l != NULL; l = l->link)
++		DBG("dep: %s", l->data);
++
++	first = 1;
+ 	rc = 0;
+ 	while (m->deps && rc == 0) {
+ 		fn = llist_pop(&m->deps);
+ 		m2 = get_or_add_modentry(fn);
+ 		if (option_mask32 & MODPROBE_OPT_REMOVE) {
+-			if (bb_delete_module(m->modname, O_EXCL) != 0)
+-				rc = errno;
++			if (m2->flags & MODULE_FLAG_LOADED) {
++				if (bb_delete_module(m2->modname, O_EXCL) != 0) {
++					if (first)
++						rc = errno;
++				} else {
++					m2->flags &= ~MODULE_FLAG_LOADED;
++				}
++			}
++			/* do not error out if *deps* fail to unload */
++			first = 0;
+ 		} else if (!(m2->flags & MODULE_FLAG_LOADED)) {
+ 			options = m2->options;
+ 			m2->options = NULL;
+@@ -242,11 +261,10 @@ static int do_modprobe(struct module_ent
+ 		free(fn);
+ 	}
+ 
+-//FIXME: what if rc < 0?
+-	if (rc > 0 && !(option_mask32 & INSMOD_OPT_SILENT)) {
++	if (rc && !(option_mask32 & INSMOD_OPT_SILENT)) {
+ 		bb_error_msg("failed to %sload module %s: %s",
+ 			(option_mask32 & MODPROBE_OPT_REMOVE) ? "un" : "",
+-			m->probed_name ? m->probed_name : m->modname,
++			m2->probed_name ? m2->probed_name : m2->modname,
+ 			moderror(rc)
+ 		);
+ 	}
+@@ -294,7 +312,8 @@ static void load_modules_dep(void)
+ 			llist_add_to(&m->deps, xstrdup(tokens[0]));
+ 			if (tokens[1])
+ 				string_to_llist(tokens[1], &m->deps, " ");
+-		}
++		} else
++			DBG("skipping dep line");
+ 	}
+ 	config_close(p);
+ }
+@@ -344,10 +363,12 @@ int modprobe_main(int argc UNUSED_PARAM,
+ 	if (opt & (MODPROBE_OPT_INSERT_ALL | MODPROBE_OPT_REMOVE)) {
+ 		/* Each argument is a module name */
+ 		do {
++			DBG("adding module %s", *argv);
+ 			add_probe(*argv++);
+ 		} while (*argv);
+ 	} else {
+ 		/* First argument is module name, rest are parameters */
++		DBG("probing just module %s", *argv);
+ 		add_probe(argv[0]);
+ 		G.cmdline_mopts = parse_cmdline_module_options(argv);
+ 	}
+diff -urpN busybox-1.14.1/modutils/modprobe-small.c busybox-1.14.1-modprobe/modutils/modprobe-small.c
+--- busybox-1.14.1/modutils/modprobe-small.c	2009-05-27 18:00:23.000000000 +0200
++++ busybox-1.14.1-modprobe/modutils/modprobe-small.c	2009-06-04 19:01:28.000000000 +0200
+@@ -656,7 +656,7 @@ depmod -[aA] [-n -e -v -q -V -r -u]
+       [-b basedirectory] [forced_version]
+ depmod [-n -e -v -q -r -u] [-F kernelsyms] module1.ko module2.ko ...
+ If no arguments (except options) are given, "depmod -a" is assumed.
+-depmod will output a dependancy list suitable for the modprobe utility.
++depmod will output a dependency list suitable for the modprobe utility.
+ Options:
+     -a, --all           Probe all modules
+     -A, --quick         Only does the work if there's a new module
+diff -urpN busybox-1.14.1/modutils/modutils.c busybox-1.14.1-modprobe/modutils/modutils.c
+--- busybox-1.14.1/modutils/modutils.c	2009-05-27 18:00:23.000000000 +0200
++++ busybox-1.14.1-modprobe/modutils/modutils.c	2009-06-03 12:50:48.000000000 +0200
+@@ -57,7 +57,7 @@ char * FAST_FUNC filename2modname(const 
+ 	from = bb_get_last_path_component_nostrip(filename);
+ 	for (i = 0; i < (MODULE_NAME_LEN-1) && from[i] != '\0' && from[i] != '.'; i++)
+ 		modname[i] = (from[i] == '-') ? '_' : from[i];
+-	modname[i] = 0;
++	modname[i] = '\0';
+ 
+ 	return modname;
+ }
-- 
1.6.0.6
