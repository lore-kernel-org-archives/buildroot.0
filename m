From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:46 -0500
Subject: [Buildroot] [PATCH 07/17] setools: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-8-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in                                  |    1 +
 package/setools/Config.in                          |   22 +
 .../setools/setools-0001-cross_compile_fixes.patch |  116 +++
 .../setools-0002-swig_typedef_python_fixes.patch   | 1010 ++++++++++++++++++++
 package/setools/setools.mk                         |   91 ++
 5 files changed, 1240 insertions(+), 0 deletions(-)
 create mode 100644 package/setools/Config.in
 create mode 100644 package/setools/setools-0001-cross_compile_fixes.patch
 create mode 100644 package/setools/setools-0002-swig_typedef_python_fixes.patch
 create mode 100644 package/setools/setools.mk

diff --git a/package/Config.in b/package/Config.in
index ca38111..9e59b90 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -903,6 +903,7 @@ source "package/libsepol/Config.in"
 source "package/libselinux/Config.in"
 source "package/libsemanage/Config.in"
 source "package/sepolgen/Config.in"
+source "package/setools/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/setools/Config.in b/package/setools/Config.in
new file mode 100644
index 0000000..649216d
--- /dev/null
+++ b/package/setools/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_SETOOLS
+	bool "setools"
+	help
+	  SETools is an open source project designed to facilitate SELinux policy 
+	  analysis. The primary tools are:
+	      
+	      apol - analyze a SELinux policy.
+	      seaudit - analyze audit messages from SELinux.
+	      seaudit-report - generate highly-customized audit log reports.
+	      sechecker - command line tool for performing modular checks on an SELinux policy.
+	      sediff - semantic policy difference tool for SELinux.
+	      secmds - command-line tools to analyze and search SELinux policy. 
+
+if BR2_PACKAGE_SETOOLS
+
+config BR2_PACKAGE_SETOOLS_PYTHON_BINDINGS
+	bool "python bindings"
+	select BR2_PACKAGE_PYTHON
+	help
+	  enable building python bindings
+
+endif
diff --git a/package/setools/setools-0001-cross_compile_fixes.patch b/package/setools/setools-0001-cross_compile_fixes.patch
new file mode 100644
index 0000000..d9eca46
--- /dev/null
+++ b/package/setools/setools-0001-cross_compile_fixes.patch
@@ -0,0 +1,116 @@
+diff -urN a/configure.ac b/configure.ac
+--- a/configure.ac	2013-01-16 10:36:24.000000000 -0600
++++ b/configure.ac	2013-07-12 08:22:10.380255248 -0500
+@@ -448,8 +448,9 @@
+               sepol_srcdir="")
+ if test "x${sepol_srcdir}" = "x"; then
+    sepol_srcdir=${sepol_devel_libdir}
+-   AC_CHECK_FILE([${sepol_srcdir}/libsepol.a],,
+-      AC_MSG_ERROR([make sure libsepol-static is installed]))
++   if test ! -f ${sepol_srcdir}/libsepol.a; then
++      AC_MSG_ERROR([could not find precompiled libsepol.a])
++   fi
+ else
+    AC_MSG_CHECKING([for compatible sepol source tree])
+    sepol_version=${sepol_srcdir}/VERSION
+@@ -484,8 +485,9 @@
+    AC_CHECK_HEADER([sepol/policydb/policydb.h], , AC_MSG_ERROR([could not find sepol source tree]))
+    CFLAGS="${sepol_src_save_CFLAGS}"
+    CPPFLAGS="${sepol_src_save_CPPFLAGS}"
+-   AC_CHECK_FILE([${sepol_srcdir}/libsepol.a],,
+-      AC_MSG_ERROR([could not find precompiled libsepol.a]))
++   if test ! -f ${sepol_srcdir}/libsepol.a; then
++      AC_MSG_ERROR([could not find precompiled libsepol.a])
++   fi
+    sepol_devel_incdir="${sepol_srcdir}/../include"
+ fi
+ SELINUX_CFLAGS="-I${sepol_devel_incdir} -I${selinux_devel_incdir}"
+@@ -578,12 +580,13 @@
+                          [AC_LANG_SOURCE([
+ #include <sepol/policydb/expand.h>
+ int main () {
+-  return expand_module_avrules(NULL, NULL, NULL, NULL, NULL, 0, 0);
++  return expand_module_avrules(NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0);
+ }])],
+                          AC_MSG_RESULT([yes]),
+                          AC_MSG_ERROR([this version of libsepol is incompatible with SETools]))
+     fi
+     sepol_new_expand_boolmap="yes"
++    sepol_new_user_role_mapping="yes"
+ else
+     sepol_new_expand_boolmap="no"
+ fi
+@@ -607,7 +610,8 @@
+     exit(EXIT_FAILURE);
+ }])],
+     sepol_policy_version_max=`cat conftest.data`,
+-    AC_MSG_FAILURE([could not determine maximum libsepol policy version]))
++    AC_MSG_FAILURE([could not determine maximum libsepol policy version]),
++    sepol_policy_version_max="26")
+ AC_DEFINE_UNQUOTED(SEPOL_POLICY_VERSION_MAX, ${sepol_policy_version_max}, [maximum policy version supported by libsepol])
+ CFLAGS="${sepol_save_CFLAGS}"
+ CPPFLAGS="${sepol_save_CPPFLAGS}"
+@@ -631,7 +635,7 @@
+     changequote([,])dnl
+     selinux_save_CFLAGS="${CFLAGS}"
+     CFLAGS="${SELINUX_CFLAGS} ${SELINUX_LIB_FLAG} -lselinux -lsepol ${CFLAGS}"
+-    gcc ${CFLAGS} -o conftest conftest.c >&5
++    ${CC} ${CFLAGS} -o conftest conftest.c >&5
+     selinux_policy_dir=`./conftest`
+     AC_MSG_RESULT(${selinux_policy_dir})
+     CFLAGS="${selinux_save_CFLAGS}"
+diff -urN a/libqpol/src/policy_define.c b/libqpol/src/policy_define.c
+--- a/libqpol/src/policy_define.c	2013-01-16 10:36:24.000000000 -0600
++++ b/libqpol/src/policy_define.c	2013-07-12 08:22:10.380255248 -0500
+@@ -2135,7 +2135,7 @@
+ #ifdef HAVE_SEPOL_ROLE_ATTRS
+ 	if (role_set_expand(&roles, &e_roles, policydbp, NULL, NULL))
+ #elif HAVE_SEPOL_USER_ROLE_MAPPING
+-	if (role_set_expand(&roles, &e_roles, policydbp, NULL))
++	if (role_set_expand(&roles, &e_roles, policydbp, NULL, NULL))
+ #else
+ 	if (role_set_expand(&roles, &e_roles, policydbp))
+ #endif
+diff -urN a/m4/ac_python_devel.m4 b/m4/ac_python_devel.m4
+--- a/m4/ac_python_devel.m4	2013-01-16 10:36:22.000000000 -0600
++++ b/m4/ac_python_devel.m4	2013-07-12 08:22:10.380255248 -0500
+@@ -234,7 +234,7 @@
+ 	AC_MSG_CHECKING([consistency of all components of python development environment])
+ 	AC_LANG_PUSH([C])
+ 	# save current global flags
+-	LIBS="$ac_save_LIBS $PYTHON_LDFLAGS"
++	LIBS="$ac_save_LIBS $PYTHON_EXTRA_LIBS $PYTHON_LDFLAGS"
+ 	CPPFLAGS="$ac_save_CPPFLAGS $PYTHON_CPPFLAGS"
+ 	AC_TRY_LINK([
+ 		#include <Python.h>
+diff -urN a/python/setools/Makefile.am b/python/setools/Makefile.am
+--- a/python/setools/Makefile.am	2013-01-16 10:36:22.000000000 -0600
++++ b/python/setools/Makefile.am	2013-07-12 08:22:19.200251011 -0500
+@@ -22,13 +22,13 @@
+ python-build: sesearch.c seinfo.c
+ 	@mkdir -p setools
+ 	@cp __init__.py setools
+-	LIBS="$(QPOL_LIB_FLAG) $(APOL_LIB_FLAG)" INCLUDES="$(QPOL_CFLAGS) $(APOL_CFLAGS)" $(PYTHON) setup.py build
++	LIBS="$(QPOL_LIB_FLAG) $(APOL_LIB_FLAG)" LIBDIRS="$(PYTHON_LDFLAGS)" INCLUDES="$(PYTHON_CPPFLAGS) $(QPOL_CFLAGS) $(APOL_CFLAGS)" CC="$(CC)" CFLAGS="$(CFLAGS)" LDSHARED="$(CC) -shared" LDFLAGS="$(LDFLAGS)" $(PYTHON) setup.py build_ext
+ 
+ install-exec-hook:
+-	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
++	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --prefix=$(DESTDIR)/usr`
+ 
+ uninstall-hook: 
+-	$(PYTHON) setup.py uninstall `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
++	$(PYTHON) setup.py uninstall `test -n "$(DESTDIR)" && echo --prefix=$(DESTDIR)/usr`
+ 
+ clean-local:
+ 	$(PYTHON) setup.py clean -a 
+--- a/python/setools/setup.py	2013-01-16 10:36:22.000000000 -0600
++++ b/python/setools/setup.py	2013-09-04 09:17:48.452916991 -0500
+@@ -8,7 +8,7 @@
+ try:
+     inc=os.getenv("INCLUDES").split(" ")    
+     INCLUDES=map(lambda x: x[2:], inc)
+-    LIBDIRS=map(lambda x: "/".join(x.split("/")[:-1]), os.getenv("LIBS").split())
++    LIBDIRS=map(lambda x: "/".join(x.split("/")[:-1]), os.getenv("LIBS").split()) + map(lambda x: x[2:], os.getenv("LIBDIRS").split())
+ except:
+     INCLUDES=""
+     LIBDIRS=""
diff --git a/package/setools/setools-0002-swig_typedef_python_fixes.patch b/package/setools/setools-0002-swig_typedef_python_fixes.patch
new file mode 100644
index 0000000..fbe721a
--- /dev/null
+++ b/package/setools/setools-0002-swig_typedef_python_fixes.patch
@@ -0,0 +1,1010 @@
+--- a/libapol/swig/apol.i	2010-04-23 11:22:08.000000000 -0500
++++ b/libapol/swig/apol.i	2012-08-29 08:04:29.000000000 -0500
+@@ -232,7 +232,7 @@
+ %newobject wrap_apol_str_to_internal_ip(char*);
+ %rename(apol_str_to_internal_ip) wrap_apol_str_to_internal_ip;
+ %inline %{
+-	typedef struct apol_ip {
++	typedef struct {
+ 		uint32_t ip[4];
+ 		int proto;
+ 	} apol_ip_t;
+@@ -301,7 +301,7 @@
+ %inline %{
+ 	typedef struct apol_string_vector apol_string_vector_t;
+ %}
+-typedef struct apol_vector {} apol_vector_t;
++typedef struct {} apol_vector_t;
+ %extend apol_vector_t {
+ 	apol_vector_t() {
+ 		return apol_vector_create(NULL);
+@@ -377,7 +377,7 @@
+ 		return apol_vector_compare(a, b, NULL, NULL, &idx);
+ 	}
+ %}
+-typedef struct apol_string_vector {} apol_string_vector_t;
++typedef struct {} apol_string_vector_t;
+ %extend apol_string_vector_t {
+ 	apol_string_vector_t() {
+ 		return (apol_string_vector_t*)apol_vector_create(free);
+@@ -460,7 +460,7 @@
+ 	APOL_POLICY_PATH_TYPE_MONOLITHIC = 0,
+ 	APOL_POLICY_PATH_TYPE_MODULAR
+ } apol_policy_path_type_e;
+-typedef struct apol_policy_path {} apol_policy_path_t;
++typedef struct {} apol_policy_path_t;
+ %extend apol_policy_path_t {
+ 	apol_policy_path_t(apol_policy_path_type_e type, char * primary, apol_string_vector_t *modules = NULL) {
+ 		apol_policy_path_t *p;
+@@ -540,7 +540,7 @@
+ int apol_file_is_policy_path_list(const char *filename);
+ 
+ /* apol policy */
+-typedef struct apol_policy {} apol_policy_t;
++typedef struct {} apol_policy_t;
+ #define APOL_PERMMAP_MAX_WEIGHT 10
+ #define APOL_PERMMAP_MIN_WEIGHT 1
+ #define APOL_PERMMAP_UNMAPPED	0x00
+@@ -650,7 +650,7 @@
+ };
+ 
+ /* apol type query */
+-typedef struct apol_type_query {} apol_type_query_t;
++typedef struct {} apol_type_query_t;
+ %extend apol_type_query_t {
+ 	apol_type_query_t() {
+ 		apol_type_query_t *tq;
+@@ -692,7 +692,7 @@
+ };
+ 
+ /* apol attribute query */
+-typedef struct apol_attr_query {} apol_attr_query_t;
++typedef struct {} apol_attr_query_t;
+ %extend apol_attr_query_t {
+ 	apol_attr_query_t() {
+ 		apol_attr_query_t *aq;
+@@ -734,7 +734,7 @@
+ };
+ 
+ /* apol role query */
+-typedef struct apol_role_query {} apol_role_query_t;
++typedef struct {} apol_role_query_t;
+ %extend apol_role_query_t {
+ 	apol_role_query_t() {
+ 		apol_role_query_t *rq;
+@@ -786,7 +786,7 @@
+ int apol_role_has_type(apol_policy_t * p, qpol_role_t * r, qpol_type_t * t);
+ 
+ /* apol class query */
+-typedef struct apol_class_query {} apol_class_query_t;
++typedef struct {} apol_class_query_t;
+ %extend apol_class_query_t {
+ 	apol_class_query_t() {
+ 		apol_class_query_t *cq;
+@@ -837,7 +837,7 @@
+ };
+ 
+ /* apol common query */
+-typedef struct apol_common_query {} apol_common_query_t;
++typedef struct {} apol_common_query_t;
+ %extend apol_common_query_t {
+ 	apol_common_query_t() {
+ 		apol_common_query_t *cq;
+@@ -879,7 +879,7 @@
+ };
+ 
+ /* apol perm query */
+-typedef struct apol_perm_query {} apol_perm_query_t;
++typedef struct {} apol_perm_query_t;
+ %extend apol_perm_query_t {
+ 	apol_perm_query_t() {
+ 		apol_perm_query_t *pq;
+@@ -921,7 +921,7 @@
+ };
+ 
+ /* apol bool query */
+-typedef struct apol_bool_query {} apol_bool_query_t;
++typedef struct {} apol_bool_query_t;
+ %extend apol_bool_query_t {
+ 	apol_bool_query_t() {
+ 		apol_bool_query_t *bq;
+@@ -963,7 +963,7 @@
+ };
+ 
+ /* apol mls level */
+-typedef struct apol_mls_level {} apol_mls_level_t;
++typedef struct {} apol_mls_level_t;
+ %extend apol_mls_level_t {
+ 	apol_mls_level_t() {
+ 		apol_mls_level_t *aml;
+@@ -1122,11 +1122,11 @@
+ %typemap(in) apol_mls_level_t *lvl {
+ 	void *x = NULL;
+ 	Py_IncRef($input);
+-	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_mls_level, 0 |  0 );
++	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_mls_level_t, 0 |  0 );
+ 	$1 = (apol_mls_level_t*)x;
+ }
+ #endif
+-typedef struct apol_mls_range {} apol_mls_range_t;
++typedef struct {} apol_mls_range_t;
+ %extend apol_mls_range_t {
+ 	apol_mls_range_t() {
+ 		apol_mls_range_t *amr;
+@@ -1276,7 +1276,7 @@
+ %}
+ 
+ /* apol level query */
+-typedef struct apol_level_query {} apol_level_query_t;
++typedef struct {} apol_level_query_t;
+ %extend apol_level_query_t {
+ 	apol_level_query_t() {
+ 		apol_level_query_t * alq;
+@@ -1327,7 +1327,7 @@
+ };
+ 
+ /* apol cat query */
+-typedef struct apol_cat_query {} apol_cat_query_t;
++typedef struct {} apol_cat_query_t;
+ %extend apol_cat_query_t {
+ 	apol_cat_query_t() {
+ 		apol_cat_query_t * acq;
+@@ -1373,11 +1373,11 @@
+ %typemap(in) apol_mls_range_t *rng {
+ 	void *x = NULL;
+ 	Py_IncRef($input);
+-	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_mls_range, 0 |  0 );
++	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_mls_range_t, 0 |  0 );
+ 	$1 = (apol_mls_range_t*)x;
+ }
+ #endif
+-typedef struct apol_user_query {} apol_user_query_t;
++typedef struct {} apol_user_query_t;
+ %extend apol_user_query_t {
+ 	apol_user_query_t() {
+ 		apol_user_query_t *auq;
+@@ -1446,7 +1446,7 @@
+ };
+ 
+ /* apol context */
+-typedef struct apol_context {} apol_context_t;
++typedef struct {} apol_context_t;
+ %extend apol_context_t {
+ 	apol_context_t() {
+ 		apol_context_t *ctx;
+@@ -1581,7 +1581,7 @@
+ int apol_context_compare(apol_policy_t * p, apol_context_t * target, apol_context_t * search, unsigned int range_compare_type);
+ 
+ /* apol constraint query */
+-typedef struct apol_constraint_query {} apol_constraint_query_t;
++typedef struct {} apol_constraint_query_t;
+ %extend apol_constraint_query_t {
+ 	apol_constraint_query_t() {
+ 		apol_constraint_query_t *acq;
+@@ -1632,7 +1632,7 @@
+ };
+ 
+ /* apol validatetrans query */
+-typedef struct apol_validatetrans_query {} apol_validatetrans_query_t;
++typedef struct {} apol_validatetrans_query_t;
+ %extend apol_validatetrans_query_t {
+ 	apol_validatetrans_query_t() {
+ 		apol_validatetrans_query_t *avq;
+@@ -1678,11 +1678,11 @@
+ %typemap(in) apol_context_t *ctx {
+ 	void *x = NULL;
+ 	Py_IncRef($input);
+-	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_context, 0 |  0 );
++	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_context_t, 0 |  0 );
+ 	$1 = (apol_context_t*)x;
+ }
+ #endif
+-typedef struct apol_genfscon_query {} apol_genfscon_query_t;
++typedef struct {} apol_genfscon_query_t;
+ %extend apol_genfscon_query_t {
+ 	apol_genfscon_query_t() {
+ 		apol_genfscon_query_t *agq;
+@@ -1744,7 +1744,7 @@
+ char *apol_genfscon_render(apol_policy_t * p, qpol_genfscon_t * genfscon);
+ 
+ /* apol fs_use query */
+-typedef struct apol_fs_use_query {} apol_fs_use_query_t;
++typedef struct {} apol_fs_use_query_t;
+ %extend apol_fs_use_query_t {
+ 	apol_fs_use_query_t() {
+ 		apol_fs_use_query_t *afq;
+@@ -1797,7 +1797,7 @@
+ char *apol_fs_use_render(apol_policy_t * p, qpol_fs_use_t * fsuse);
+ 
+ /* apol initial sid query */
+-typedef struct apol_isid_query {} apol_isid_query_t;
++typedef struct {} apol_isid_query_t;
+ %extend apol_isid_query_t {
+ 	apol_isid_query_t() {
+ 		apol_isid_query_t *aiq;
+@@ -1839,7 +1839,7 @@
+ };
+ 
+ /* apol portcon query */
+-typedef struct apol_portcon_query {} apol_portcon_query_t;
++typedef struct {} apol_portcon_query_t;
+ %extend apol_portcon_query_t {
+ 	apol_portcon_query_t() {
+ 		apol_portcon_query_t *apq;
+@@ -1883,7 +1883,7 @@
+ char *apol_portcon_render(apol_policy_t * p, qpol_portcon_t * portcon);
+ 
+ /* apol netifcon query */
+-typedef struct apol_netifcon_query {} apol_netifcon_query_t;
++typedef struct {} apol_netifcon_query_t;
+ %extend apol_netifcon_query_t {
+ 	apol_netifcon_query_t() {
+ 		apol_netifcon_query_t *anq;
+@@ -1930,7 +1930,7 @@
+ char *apol_netifcon_render(apol_policy_t * p, qpol_netifcon_t * netifcon);
+ 
+ /* apol nodecon query */
+-typedef struct apol_nodecon_query {} apol_nodecon_query_t;
++typedef struct {} apol_nodecon_query_t;
+ %extend apol_nodecon_query_t {
+ 	apol_nodecon_query_t() {
+ 		apol_nodecon_query_t *anq;
+@@ -2010,7 +2010,7 @@
+ char *apol_nodecon_render(apol_policy_t * p, qpol_nodecon_t * nodecon);
+ 
+ /* apol avrule query */
+-typedef struct apol_avrule_query {} apol_avrule_query_t;
++typedef struct {} apol_avrule_query_t;
+ %extend apol_avrule_query_t {
+ 	apol_avrule_query_t() {
+ 		apol_avrule_query_t *avq;
+@@ -2161,7 +2161,7 @@
+ %}
+ 
+ /* apol terule query */
+-typedef struct apol_terule_query {} apol_terule_query_t;
++typedef struct {} apol_terule_query_t;
+ %extend apol_terule_query_t {
+ 	apol_terule_query_t() {
+ 		apol_terule_query_t *atq;
+@@ -2285,7 +2285,7 @@
+ apol_vector_t *apol_terule_list_to_syn_terules(apol_policy_t * p, apol_vector_t * rules);
+ 
+ /* apol cond rule query */
+-typedef struct apol_cond_query {} apol_cond_query_t;
++typedef struct {} apol_cond_query_t;
+ %extend apol_cond_query_t {
+ 	apol_cond_query_t() {
+ 		apol_cond_query_t *acq;
+@@ -2329,7 +2329,7 @@
+ char *apol_cond_expr_render(apol_policy_t * p, qpol_cond_t * cond);
+ 
+ /* apol role allow query */
+-typedef struct apol_role_allow_query {} apol_role_allow_query_t;
++typedef struct {} apol_role_allow_query_t;
+ %extend apol_role_allow_query_t {
+ 	apol_role_allow_query_t() {
+ 		apol_role_allow_query_t *arq;
+@@ -2385,7 +2385,7 @@
+ char *apol_role_allow_render(apol_policy_t * policy, qpol_role_allow_t * rule);
+ 
+ /* apol role transition rule query */
+-typedef struct apol_role_trans_query {} apol_role_trans_query_t;
++typedef struct {} apol_role_trans_query_t;
+ %extend apol_role_trans_query_t {
+ 	apol_role_trans_query_t() {
+ 		apol_role_trans_query_t *arq;
+@@ -2450,7 +2450,7 @@
+ char *apol_role_trans_render(apol_policy_t * policy, qpol_role_trans_t * rule);
+ 
+ /* apol range transition rule query */
+-typedef struct apol_range_trans_query {} apol_range_trans_query_t;
++typedef struct {} apol_range_trans_query_t;
+ %extend apol_range_trans_query_t {
+ 	apol_range_trans_query_t() {
+ 		apol_range_trans_query_t *arq;
+@@ -2529,7 +2529,7 @@
+ #define APOL_DOMAIN_TRANS_SEARCH_VALID		0x01
+ #define APOL_DOMAIN_TRANS_SEARCH_INVALID	0x02
+ #define APOL_DOMAIN_TRANS_SEARCH_BOTH		(APOL_DOMAIN_TRANS_SEARCH_VALID|APOL_DOMAIN_TRANS_SEARCH_INVALID)
+-typedef struct apol_domain_trans_analysis {} apol_domain_trans_analysis_t;
++typedef struct {} apol_domain_trans_analysis_t;
+ %extend apol_domain_trans_analysis_t {
+ 	apol_domain_trans_analysis_t() {
+ 		apol_domain_trans_analysis_t *dta;
+@@ -2620,7 +2620,7 @@
+ 		return v;
+ 	};
+ };
+-typedef struct apol_domain_trans_result {} apol_domain_trans_result_t;
++typedef struct {} apol_domain_trans_result_t;
+ %extend apol_domain_trans_result_t {
+ 	apol_domain_trans_result_t(apol_domain_trans_result_t *in) {
+ 		apol_domain_trans_result_t *dtr;
+@@ -2703,7 +2703,7 @@
+ 		*in = NULL;
+ 	}
+ %}
+-typedef struct apol_infoflow {} apol_infoflow_t;
++typedef struct {} apol_infoflow_t;
+ %extend apol_infoflow_t {
+ 	apol_infoflow_t() {
+ 		BEGIN_EXCEPTION
+@@ -2728,7 +2728,7 @@
+ 		return v;
+ 	};
+ };
+-typedef struct apol_infoflow_analysis {} apol_infoflow_analysis_t;
++typedef struct {} apol_infoflow_analysis_t;
+ %extend apol_infoflow_analysis_t {
+ 	apol_infoflow_analysis_t() {
+ 		apol_infoflow_analysis_t *aia;
+@@ -2821,7 +2821,7 @@
+ 		return;
+ 	};
+ };
+-typedef struct apol_infoflow_graph {} apol_infoflow_graph_t;
++typedef struct {} apol_infoflow_graph_t;
+ %extend apol_infoflow_graph_t {
+ 	apol_infoflow_graph_t() {
+ 		BEGIN_EXCEPTION
+@@ -2865,7 +2865,7 @@
+ 		return retval;
+ 	};
+ };
+-typedef struct apol_infoflow_result {} apol_infoflow_result_t;
++typedef struct {} apol_infoflow_result_t;
+ %extend apol_infoflow_result_t {
+ 	apol_infoflow_result_t() {
+ 		BEGIN_EXCEPTION
+@@ -2899,7 +2899,7 @@
+ 		return (apol_infoflow_result_t*)x;
+ 	};
+ %}
+-typedef struct apol_infoflow_step {} apol_infoflow_step_t;
++typedef struct {} apol_infoflow_step_t;
+ %extend apol_infoflow_step_t {
+ 	apol_infoflow_step_t() {
+ 		BEGIN_EXCEPTION
+@@ -2936,7 +2936,7 @@
+ #define APOL_RELABEL_DIR_FROM    0x02
+ #define APOL_RELABEL_DIR_BOTH    (APOL_RELABEL_DIR_TO|APOL_RELABEL_DIR_FROM)
+ #define APOL_RELABEL_DIR_SUBJECT 0x04
+-typedef struct apol_relabel_analysis {} apol_relabel_analysis_t;
++typedef struct {} apol_relabel_analysis_t;
+ %extend apol_relabel_analysis_t {
+ 	apol_relabel_analysis_t() {
+ 		apol_relabel_analysis_t *ara;
+@@ -3009,7 +3009,7 @@
+ 		return;
+ 	};
+ };
+-typedef struct apol_relabel_result {} apol_relabel_result_t;
++typedef struct {} apol_relabel_result_t;
+ %extend apol_relabel_result_t {
+ 	apol_relabel_result_t() {
+ 		BEGIN_EXCEPTION
+@@ -3040,7 +3040,7 @@
+ 		return (apol_relabel_result_t*)x;
+ 	};
+ %}
+-typedef struct apol_relabel_result_pair {} apol_relabel_result_pair_t;
++typedef struct {} apol_relabel_result_pair_t;
+ %extend apol_relabel_result_pair_t {
+ 	apol_relabel_result_pair_t() {
+ 		BEGIN_EXCEPTION
+@@ -3082,7 +3082,7 @@
+ #define APOL_TYPES_RELATION_DIRECT_FLOW 0x1000
+ #define APOL_TYPES_RELATION_TRANS_FLOW_AB 0x4000
+ #define APOL_TYPES_RELATION_TRANS_FLOW_BA 0x8000
+-typedef struct apol_types_relation_analysis {} apol_types_relation_analysis_t;
++typedef struct {} apol_types_relation_analysis_t;
+ %extend apol_types_relation_analysis_t {
+ 	apol_types_relation_analysis_t() {
+ 		apol_types_relation_analysis_t *atr;
+@@ -3137,7 +3137,7 @@
+ 		return;
+ 	};
+ };
+-typedef struct apol_types_relation_result {} apol_types_relation_result_t;
++typedef struct {} apol_types_relation_result_t;
+ %extend apol_types_relation_result_t {
+ 	apol_types_relation_result_t() {
+ 		BEGIN_EXCEPTION
+@@ -3192,7 +3192,7 @@
+ 		return apol_types_relation_result_get_domainsBA(self);
+ 	};
+ };
+-typedef struct apol_types_relation_access {} apol_types_relation_access_t;
++typedef struct {} apol_types_relation_access_t;
+ %extend apol_types_relation_access_t {
+ 	apol_types_relation_access_t() {
+ 		BEGIN_EXCEPTION
+--- a/libqpol/swig/qpol.i	2010-04-30 11:23:28.000000000 -0500
++++ b/libqpol/swig/qpol.i	2012-08-29 07:52:17.000000000 -0500
+@@ -226,7 +226,7 @@
+ #define QPOL_MODULE_UNKNOWN 0
+ #define QPOL_MODULE_BASE    1
+ #define QPOL_MODULE_OTHER   2
+-typedef struct qpol_module {} qpol_module_t;
++typedef struct {} qpol_module_t;
+ %extend qpol_module_t {
+ 	qpol_module_t(const char *path) {
+ 		qpol_module_t *m;
+@@ -310,7 +310,7 @@
+ #define QPOL_POLICY_OPTION_NO_NEVERALLOWS 0x00000001
+ #define QPOL_POLICY_OPTION_NO_RULES       0x00000002
+ #define QPOL_POLICY_OPTION_MATCH_SYSTEM   0x00000004
+-typedef struct qpol_policy {} qpol_policy_t;
++typedef struct {} qpol_policy_t;
+ typedef void (*qpol_callback_fn_t) (void *varg, struct qpol_policy * policy, int level, const char *fmt, va_list va_args);
+ #define QPOL_POLICY_UNKNOWN       -1
+ #define QPOL_POLICY_KERNEL_SOURCE  0
+@@ -684,7 +684,7 @@
+ };
+ 
+ /* qpol iterator */
+-typedef struct qpol_iterator {} qpol_iterator_t;
++typedef struct {} qpol_iterator_t;
+ %extend qpol_iterator_t {
+ 	/* user never directly creates, but SWIG expects a constructor */
+ 	qpol_iterator_t() {
+@@ -734,7 +734,7 @@
+ };
+ 
+ /* qpol type */
+-typedef struct qpol_type {} qpol_type_t;
++typedef struct {} qpol_type_t;
+ %extend qpol_type_t {
+ 	qpol_type_t(qpol_policy_t *p, const char *name) {
+ 		BEGIN_EXCEPTION
+@@ -849,7 +849,7 @@
+ %}
+ 
+ /* qpol role */
+-typedef struct qpol_role {} qpol_role_t;
++typedef struct {} qpol_role_t;
+ %extend qpol_role_t {
+ 	qpol_role_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_role_t *r;
+@@ -917,7 +917,7 @@
+ %}
+ 
+ /* qpol level */
+-typedef struct qpol_level {} qpol_level_t;
++typedef struct {} qpol_level_t;
+ %extend qpol_level_t {
+ 	qpol_level_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_level_t *l;
+@@ -995,7 +995,7 @@
+ %}
+ 
+ /* qpol cat */
+-typedef struct qpol_cat {} qpol_cat_t;
++typedef struct {} qpol_cat_t;
+ %extend qpol_cat_t {
+ 	qpol_cat_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_cat_t *c;
+@@ -1062,7 +1062,7 @@
+ %}
+ 
+ /* qpol mls range */
+-typedef struct qpol_mls_range {} qpol_mls_range_t;
++typedef struct {} qpol_mls_range_t;
+ %extend qpol_mls_range_t {
+ 	qpol_mls_range_t() {
+ 		BEGIN_EXCEPTION
+@@ -1103,7 +1103,7 @@
+ %}
+ 
+ /* qpol mls level */
+-typedef struct qpol_mls_level {} qpol_mls_level_t;
++typedef struct {} qpol_mls_level_t;
+ %extend qpol_mls_level_t {
+ 	qpol_mls_level_t() {
+ 		BEGIN_EXCEPTION
+@@ -1145,7 +1145,7 @@
+ %}
+ 
+ /* qpol user */
+-typedef struct qpol_user {} qpol_user_t;
++typedef struct {} qpol_user_t;
+ %extend qpol_user_t {
+ 	qpol_user_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_user_t *u;
+@@ -1221,7 +1221,7 @@
+ %}
+ 
+ /* qpol bool */
+-typedef struct qpol_bool {} qpol_bool_t;
++typedef struct {} qpol_bool_t;
+ %extend qpol_bool_t {
+ 	qpol_bool_t(qpol_policy_t *p, const char *name) {
+ 		qpol_bool_t *b;
+@@ -1293,7 +1293,7 @@
+ %}
+ 
+ /* qpol context */
+-typedef struct qpol_context {} qpol_context_t;
++typedef struct {} qpol_context_t;
+ %extend qpol_context_t {
+ 	qpol_context_t() {
+ 		BEGIN_EXCEPTION
+@@ -1354,7 +1354,7 @@
+ %}
+ 
+ /* qpol class */
+-typedef struct qpol_class {} qpol_class_t;
++typedef struct {} qpol_class_t;
+ %extend qpol_class_t {
+ 	qpol_class_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_class_t *c;
+@@ -1441,7 +1441,7 @@
+ %}
+ 
+ /* qpol common */
+-typedef struct qpol_common {} qpol_common_t;
++typedef struct {} qpol_common_t;
+ %extend qpol_common_t {
+ 	qpol_common_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_common_t *c;
+@@ -1514,7 +1514,7 @@
+ #define QPOL_FS_USE_NONE  5U
+ #define QPOL_FS_USE_PSID  6U
+ #endif
+-typedef struct qpol_fs_use {} qpol_fs_use_t;
++typedef struct {} qpol_fs_use_t;
+ %extend qpol_fs_use_t {
+ 	qpol_fs_use_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_fs_use_t *f;
+@@ -1592,7 +1592,7 @@
+ #define QPOL_CLASS_LNK_FILE   9U
+ #define QPOL_CLASS_SOCK_FILE 12U
+ #endif
+-typedef struct qpol_genfscon {} qpol_genfscon_t;
++typedef struct {} qpol_genfscon_t;
+ %extend qpol_genfscon_t {
+ 	qpol_genfscon_t(qpol_policy_t *p, const char *name, const char *path) {
+ 		qpol_genfscon_t *g;
+@@ -1655,7 +1655,7 @@
+ %}
+ 
+ /* qpol isid */
+-typedef struct qpol_isid {} qpol_isid_t;
++typedef struct {} qpol_isid_t;
+ %extend qpol_isid_t {
+ 	qpol_isid_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_isid_t *i;
+@@ -1699,7 +1699,7 @@
+ %}
+ 
+ /* qpol netifcon */
+-typedef struct qpol_netifcon {} qpol_netifcon_t;
++typedef struct {} qpol_netifcon_t;
+ %extend qpol_netifcon_t {
+ 	qpol_netifcon_t(qpol_policy_t *p, const char *name) {
+ 		const qpol_netifcon_t *n;
+@@ -1755,7 +1755,7 @@
+ /* qpol nodecon */
+ #define QPOL_IPV4 0
+ #define QPOL_IPV6 1
+-typedef struct qpol_nodecon {} qpol_nodecon_t;
++typedef struct {} qpol_nodecon_t;
+ %extend qpol_nodecon_t {
+ 	qpol_nodecon_t(qpol_policy_t *p, int addr[4], int mask[4], int protocol) {
+ 		uint32_t a[4], m[4];
+@@ -1828,7 +1828,7 @@
+ /* from netinet/in.h */
+ #define IPPROTO_TCP 6
+ #define IPPROTO_UDP 17
+-typedef struct qpol_portcon {} qpol_portcon_t;
++typedef struct {} qpol_portcon_t;
+ %extend qpol_portcon_t {
+ 	qpol_portcon_t(qpol_policy_t *p, uint16_t low, uint16_t high, uint8_t protocol) {
+ 		const qpol_portcon_t *qp;
+@@ -1892,7 +1892,7 @@
+ %}
+ 
+ /* qpol constraint */
+-typedef struct qpol_constraint {} qpol_constraint_t;
++typedef struct {} qpol_constraint_t;
+ %extend qpol_constraint_t {
+ 	qpol_constraint_t() {
+ 		BEGIN_EXCEPTION
+@@ -1944,7 +1944,7 @@
+ %}
+ 
+ /* qpol validatetrans */
+-typedef struct qpol_validatetrans {} qpol_validatetrans_t;
++typedef struct {} qpol_validatetrans_t;
+ %extend qpol_validatetrans_t {
+ 	qpol_validatetrans_t() {
+ 		BEGIN_EXCEPTION
+@@ -2009,7 +2009,7 @@
+ #define QPOL_CEXPR_OP_DOM    3
+ #define QPOL_CEXPR_OP_DOMBY  4
+ #define QPOL_CEXPR_OP_INCOMP 5
+-typedef struct qpol_constraint_expr_node {} qpol_constraint_expr_node_t;
++typedef struct {} qpol_constraint_expr_node_t;
+ %extend qpol_constraint_expr_node_t {
+ 	qpol_constraint_expr_node_t() {
+ 		BEGIN_EXCEPTION
+@@ -2071,7 +2071,7 @@
+ %}
+ 
+ /* qpol role allow */
+-typedef struct qpol_role_allow {} qpol_role_allow_t;
++typedef struct {} qpol_role_allow_t;
+ %extend qpol_role_allow_t {
+ 	qpol_role_allow_t() {
+ 		BEGIN_EXCEPTION
+@@ -2112,7 +2112,7 @@
+ %}
+ 
+ /* qpol role trans */
+-typedef struct qpol_role_trans {} qpol_role_trans_t;
++typedef struct {} qpol_role_trans_t;
+ %extend qpol_role_trans_t {
+ 	qpol_role_trans_t() {
+ 		BEGIN_EXCEPTION
+@@ -2163,7 +2163,7 @@
+ %}
+ 
+ /* qpol range trans */
+-typedef struct qpol_range_trans {} qpol_range_trans_t;
++typedef struct {} qpol_range_trans_t;
+ %extend qpol_range_trans_t {
+ 	qpol_range_trans_t() {
+ 		BEGIN_EXCEPTION
+@@ -2226,7 +2226,7 @@
+ #define QPOL_RULE_NEVERALLOW  128
+ #define QPOL_RULE_AUDITALLOW    2
+ #define QPOL_RULE_DONTAUDIT     4
+-typedef struct qpol_avrule {} qpol_avrule_t;
++typedef struct {} qpol_avrule_t;
+ %extend qpol_avrule_t {
+ 	qpol_avrule_t() {
+ 		BEGIN_EXCEPTION
+@@ -2346,7 +2346,7 @@
+ #define QPOL_RULE_TYPE_TRANS   16
+ #define QPOL_RULE_TYPE_CHANGE  64
+ #define QPOL_RULE_TYPE_MEMBER  32
+-typedef struct qpol_terule {} qpol_terule_t;
++typedef struct {} qpol_terule_t;
+ %extend qpol_terule_t {
+ 	qpol_terule_t() {
+ 		BEGIN_EXCEPTION
+@@ -2462,7 +2462,7 @@
+ %}
+ 
+ /* qpol conditional */
+-typedef struct qpol_cond {} qpol_cond_t;
++typedef struct {} qpol_cond_t;
+ %extend qpol_cond_t {
+ 	qpol_cond_t() {
+ 		BEGIN_EXCEPTION
+@@ -2555,7 +2555,7 @@
+ #define QPOL_COND_EXPR_XOR  5      /* bool ^ bool */
+ #define QPOL_COND_EXPR_EQ   6      /* bool == bool */
+ #define QPOL_COND_EXPR_NEQ  7      /* bool != bool */
+-typedef struct qpol_cond_expr_node {} qpol_cond_expr_node_t;
++typedef struct {} qpol_cond_expr_node_t;
+ %extend qpol_cond_expr_node_t {
+ 	qpol_cond_expr_node_t() {
+ 		BEGIN_EXCEPTION
+@@ -2600,7 +2600,7 @@
+ %}
+ 
+ /* qpol type set */
+-typedef struct qpol_type_set {} qpol_type_set_t;
++typedef struct {} qpol_type_set_t;
+ %extend qpol_type_set_t {
+ 	qpol_type_set_t() {
+ 		BEGIN_EXCEPTION
+@@ -2663,7 +2663,7 @@
+ %}
+ 
+ /* qpol syn av rule */
+-typedef struct qpol_syn_avrule {} qpol_syn_avrule_t;
++typedef struct {} qpol_syn_avrule_t;
+ %extend qpol_syn_avrule_t {
+ 	qpol_syn_avrule_t() {
+ 		BEGIN_EXCEPTION
+@@ -2776,7 +2776,7 @@
+ %}
+ 
+ /* qpol syn te rule */
+-typedef struct qpol_syn_terule {} qpol_syn_terule_t;
++typedef struct {} qpol_syn_terule_t;
+ %extend qpol_syn_terule_t {
+ 	qpol_syn_terule_t() {
+ 		BEGIN_EXCEPTION
+--- a/libpoldiff/swig/poldiff.i	2007-10-31 16:03:33.000000000 -0500
++++ b/libpoldiff/swig/poldiff.i	2012-08-29 08:08:02.000000000 -0500
+@@ -258,7 +258,7 @@
+ 
+ /* for handling the get_stats function */
+ %{
+-	typedef struct poldiff_stats {
++	typedef struct {
+ 		size_t stats[5];
+ 	} poldiff_stats_t;
+ 	poldiff_stats_t *poldiff_stats_create() {
+@@ -271,7 +271,7 @@
+ 		*x = NULL;
+ 	}
+ %}
+-typedef struct poldiff_stats {} poldiff_stats_t;
++typedef struct {} poldiff_stats_t;
+ %extend poldiff_stats_t {
+ 	poldiff_stats_t() {
+ 		poldiff_stats_t *s;
+@@ -336,17 +336,17 @@
+ %typemap(in) apol_policy_t *op {
+ 	void *x = NULL;
+ 	Py_IncRef($input);
+-	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_policy, 0 |  0 );
++	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_policy_t, 0 |  0 );
+ 	$1 = (apol_policy_t*)x;
+ }
+ %typemap(in) apol_policy_t *mp {
+ 	void *x = NULL;
+ 	Py_IncRef($input);
+-	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_policy, 0 |  0 );
++	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_apol_policy_t, 0 |  0 );
+ 	$1 = (apol_policy_t*)x;
+ }
+ #endif
+-typedef struct poldiff {} poldiff_t;
++typedef struct {} poldiff_t;
+ %extend poldiff_t {
+ 	poldiff_t(apol_policy_t *op, apol_policy_t *mp) {
+ 		poldiff_t *p;
+@@ -476,7 +476,7 @@
+ };
+ 
+ /* attribute diff */
+-typedef struct poldiff_attrib {} poldiff_attrib_t;
++typedef struct {} poldiff_attrib_t;
+ %extend poldiff_attrib_t {
+    poldiff_attrib_t () {
+       BEGIN_EXCEPTION
+@@ -521,7 +521,7 @@
+ %}
+ 
+ /* av rule diff */
+-typedef struct poldiff_avrule {} poldiff_avrule_t;
++typedef struct {} poldiff_avrule_t;
+ %extend poldiff_avrule_t {
+    poldiff_avrule_t() {
+       BEGIN_EXCEPTION
+@@ -629,7 +629,7 @@
+ %}
+ 
+ /* boolean diff */
+-typedef struct poldiff_bool {} poldiff_bool_t;
++typedef struct {} poldiff_bool_t;
+ %extend poldiff_bool_t {
+ 	poldiff_bool_t() {
+       BEGIN_EXCEPTION
+@@ -668,7 +668,7 @@
+ %}
+ 
+ /* category diff */
+-typedef struct poldiff_cat {} poldiff_cat_t;
++typedef struct {} poldiff_cat_t;
+ %extend poldiff_cat_t {
+ 	poldiff_cat_t() {
+       BEGIN_EXCEPTION
+@@ -707,7 +707,7 @@
+ %}
+ 
+ /* class diff */
+-typedef struct poldiff_class {} poldiff_class_t;
++typedef struct {} poldiff_class_t;
+ %extend poldiff_class_t {
+ 	poldiff_class_t() {
+       BEGIN_EXCEPTION
+@@ -752,7 +752,7 @@
+ %}
+ 
+ /* common diff */
+-typedef struct poldiff_common {} poldiff_common_t;
++typedef struct {} poldiff_common_t;
+ %extend poldiff_common_t {
+ 	poldiff_common_t() {
+       BEGIN_EXCEPTION
+@@ -797,7 +797,7 @@
+ %}
+ 
+ /* level diff */
+-typedef struct poldiff_level {} poldiff_level_t;
++typedef struct {} poldiff_level_t;
+ %extend poldiff_level_t {
+ 	poldiff_level_t() {
+       BEGIN_EXCEPTION
+@@ -857,7 +857,7 @@
+ %}
+ 
+ /* range diff */
+-typedef struct poldiff_range {} poldiff_range_t;
++typedef struct {} poldiff_range_t;
+ %extend poldiff_range_t {
+ 	poldiff_range_t() {
+       BEGIN_EXCEPTION
+@@ -908,7 +908,7 @@
+ %}
+ 
+ /* range_transition rule diff */
+-typedef struct poldiff_range_trans {} poldiff_range_trans_t;
++typedef struct {} poldiff_range_trans_t;
+ %extend poldiff_range_trans_t {
+ 	poldiff_range_trans_t() {
+       BEGIN_EXCEPTION
+@@ -956,7 +956,7 @@
+ %}
+ 
+ /* role allow rule diff */
+-typedef struct poldiff_role_allow {} poldiff_role_allow_t;
++typedef struct {} poldiff_role_allow_t;
+ %extend poldiff_role_allow_t {
+ 	poldiff_role_allow_t() {
+       BEGIN_EXCEPTION
+@@ -1004,7 +1004,7 @@
+ %}
+ 
+ /* role_transition rule diff */
+-typedef struct poldiff_role_trans {} poldiff_role_trans_t;
++typedef struct {} poldiff_role_trans_t;
+ %extend poldiff_role_trans_t {
+ 	poldiff_role_trans_t() {
+       BEGIN_EXCEPTION
+@@ -1052,7 +1052,7 @@
+ %}
+ 
+ /* role diff */
+-typedef struct poldiff_role {} poldiff_role_t;
++typedef struct {} poldiff_role_t;
+ %extend poldiff_role_t {
+ 	poldiff_role_t() {
+       BEGIN_EXCEPTION
+@@ -1097,7 +1097,7 @@
+ %}
+ 
+ /* te rule diff */
+-typedef struct poldiff_terule {} poldiff_terule_t;
++typedef struct {} poldiff_terule_t;
+ %extend poldiff_terule_t {
+ 	poldiff_terule_t() {
+       BEGIN_EXCEPTION
+@@ -1178,7 +1178,7 @@
+ %}
+ 
+ /* type diff */
+-typedef struct poldiff_type {} poldiff_type_t;
++typedef struct {} poldiff_type_t;
+ %extend poldiff_type_t {
+ 	poldiff_type_t() {
+       BEGIN_EXCEPTION
+@@ -1223,7 +1223,7 @@
+ %}
+ 
+ /* user diff */
+-typedef struct poldiff_user {} poldiff_user_t;
++typedef struct {} poldiff_user_t;
+ %extend poldiff_user_t {
+ 	poldiff_user_t() {
+       BEGIN_EXCEPTION
+@@ -1280,7 +1280,7 @@
+ %}
+ 
+ /* type remap */
+-typedef struct poldiff_type_remap_entry {} poldiff_type_remap_entry_t;
++typedef struct {} poldiff_type_remap_entry_t;
+ %extend poldiff_type_remap_entry_t {
+ 	poldiff_type_remap_entry_t() {
+       BEGIN_EXCEPTION
+--- a/libseaudit/swig/seaudit.i	2007-10-31 16:03:33.000000000 -0500
++++ b/libseaudit/swig/seaudit.i	2012-08-29 08:11:39.000000000 -0500
+@@ -240,7 +240,7 @@
+ %{
+ 	typedef struct tm tm_t;
+ %}
+-typedef struct tm {
++typedef struct {
+ 	int tm_sec;   /* seconds */
+ 	int tm_min;   /* minutes */
+ 	int tm_hour;  /* hours */
+@@ -278,7 +278,7 @@
+ 	SEAUDIT_LOG_TYPE_SYSLOG,
+ 	SEAUDIT_LOG_TYPE_AUDITD
+ } seaudit_log_type_e;
+-typedef struct seaudit_log {} seaudit_log_t;
++typedef struct {} seaudit_log_t;
+ %extend seaudit_log_t {
+ 	seaudit_log_t() {
+ 		seaudit_log_t *slog;
+@@ -355,7 +355,7 @@
+ 	SEAUDIT_MESSAGE_TYPE_AVC,
+ 	SEAUDIT_MESSAGE_TYPE_LOAD
+ } seaudit_message_type_e;
+-typedef struct seaudit_message {} seaudit_message_t;
++typedef struct {} seaudit_message_t;
+ %extend seaudit_message_t {
+ 	seaudit_message_t() {
+ 		BEGIN_EXCEPTION
+@@ -427,7 +427,7 @@
+ %}
+ 
+ /* seaudit load message */
+-typedef struct seaudit_load_message {} seaudit_load_message_t;
++typedef struct {} seaudit_load_message_t;
+ %extend seaudit_load_message_t {
+ 	seaudit_load_message_t() {
+ 		BEGIN_EXCEPTION
+@@ -448,7 +448,7 @@
+ %}
+ 
+ /* seaudit bool message */
+-typedef struct seaudit_bool_message {} seaudit_bool_message_t;
++typedef struct {} seaudit_bool_message_t;
+ %extend seaudit_bool_message_t {
+ 	seaudit_bool_message_t(void *msg) {
+ 		BEGIN_EXCEPTION
+@@ -475,7 +475,7 @@
+ 	SEAUDIT_AVC_DENIED,
+ 	SEAUDIT_AVC_GRANTED
+ } seaudit_avc_message_type_e;
+-typedef struct seaudit_avc_message {} seaudit_avc_message_t;
++typedef struct {} seaudit_avc_message_t;
+ %extend seaudit_avc_message_t {
+ 	seaudit_avc_message_t() {
+ 		BEGIN_EXCEPTION
+@@ -606,7 +606,7 @@
+ 	SEAUDIT_FILTER_DATE_MATCH_AFTER,
+ 	SEAUDIT_FILTER_DATE_MATCH_BETWEEN
+ } seaudit_filter_date_match_e;
+-typedef struct seaudit_filter {} seaudit_filter_t;
++typedef struct {} seaudit_filter_t;
+ %extend seaudit_filter_t {
+ 	seaudit_filter_t(char *name = NULL) {
+ 		seaudit_filter_t *sf = NULL;
+@@ -1012,7 +1012,7 @@
+ %}
+ 
+ /* seaudit sort */
+-typedef struct seaudit_sort {} seaudit_sort_t;
++typedef struct {} seaudit_sort_t;
+ %extend seaudit_sort_t {
+ 	seaudit_sort_t() {
+ 		BEGIN_EXCEPTION
+@@ -1101,17 +1101,17 @@
+ %typemap(in) seaudit_filter_t *filter {
+ 	void *x = NULL;
+ 	Py_IncRef($input);
+-	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_seaudit_filter, 0 |  0 );
++	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_seaudit_filter_t, 0 |  0 );
+ 	$1 = (seaudit_filter_t*)x;
+ }
+ %typemap(in) seaudit_sort_t *ssort {
+ 	void *x = NULL;
+ 	Py_IncRef($input);
+-	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_seaudit_sort, 0 |  0 );
++	SWIG_ConvertPtr($input, &x,SWIGTYPE_p_seaudit_sort_t, 0 |  0 );
+ 	$1 = (seaudit_sort_t*)x;
+ }
+ #endif
+-typedef struct seaudit_model {} seaudit_model_t;
++typedef struct {} seaudit_model_t;
+ %extend seaudit_model_t {
+ 	seaudit_model_t(char *name = NULL, seaudit_log_t *slog = NULL) {
+ 		seaudit_model_t *smod;
+@@ -1309,7 +1309,7 @@
+ 	SEAUDIT_REPORT_FORMAT_TEXT,
+ 	SEAUDIT_REPORT_FORMAT_HTML
+ } seaudit_report_format_e;
+-typedef struct seaudit_report {} seaudit_report_t;
++typedef struct {} seaudit_report_t;
+ %extend seaudit_report_t {
+ 	seaudit_report_t(seaudit_model_t *m) {
+ 		seaudit_report_t *sr;
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
new file mode 100644
index 0000000..faa519f
--- /dev/null
+++ b/package/setools/setools.mk
@@ -0,0 +1,91 @@
+#############################################################
+#
+# setools
+#
+#############################################################
+SETOOLS_VERSION = 3.3.8
+SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
+SETOOLS_SITE = http://oss.tresys.com/projects/setools/chrome/site/dists/setools-$(SETOOLS_VERSION)/
+
+##############################
+# Target Section
+##############################
+SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2
+
+SETOOLS_INSTALL_STAGING = YES
+SETOOLS_INSTALL_TARGET = YES
+
+SETOOLS_AUTORECONF = YES
+SETOOLS_AUTORECONF_OPT = -i -s
+
+# Notes: Need "disable-selinux-check" so the configure does not check to see if host has
+#        selinux enabled.
+SETOOLS_CONF_OPT = \
+	--disable-debug \
+	--disable-gui \
+	--disable-bwidget-check \
+	--disable-selinux-check \
+	--disable-swig-java \
+	--disable-swig-python \
+	--disable-swig-tcl \
+	--with-sepol-devel="$(STAGING_DIR)/usr" \
+	--with-selinux-devel="$(STAGING_DIR)/usr" \
+
+ifeq ($(BR2_PACKAGE_SETOOLS_PYTHON_BINDINGS),y)
+	SETOOLS_DEPENDENCIES += python host-python host-swig 
+	SETOOLS_CONF_ENV += am_cv_pathless_PYTHON=python \
+		ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
+		am_cv_python_version=$(PYTHON_VERSION) \
+		am_cv_python_platform=linux2 \
+		am_cv_python_pythondir=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		am_cv_python_pyexecdir=$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		am_cv_python_includes=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+	SETOOLS_CONF_OPT += \
+		--enable-swig-python \
+		PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
+		PYTHON_LDFLAGS="-L$(STAGING_DIR)/usr/lib/" \
+		PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+		PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil -lpython$(PYTHON_VERSION_MAJOR)"
+endif
+
+##############################
+# Host Section
+##############################
+HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-sqlite host-libxml2 host-bzip2
+
+HOST_SETOOLS_AUTORECONF = YES
+HOST_SETOOLS_AUTORECONF_OPT = -i -s
+
+# Notes: Need "disable-selinux-check" so the configure does not check to see if host has
+#        selinux enabled.
+HOST_SETOOLS_CONF_OPT = \
+	--disable-debug \
+	--disable-gui \
+	--disable-bwidget-check \
+	--disable-selinux-check \
+	--disable-swig-java \
+	--disable-swig-python \
+	--disable-swig-tcl \
+	--with-sepol-devel="$(HOST_DIR)/usr" \
+	--with-selinux-devel="$(HOST_DIR)/usr" \
+
+ifeq ($(BR2_PACKAGE_SETOOLS_PYTHON_BINDINGS),y)
+	HOST_SETOOLS_DEPENDENCIES += host-python host-swig 
+	HOST_SETOOLS_CONF_ENV += \
+		am_cv_pathless_PYTHON=python \
+		ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
+		am_cv_python_version=$(PYTHON_VERSION) \
+		am_cv_python_platform=linux2 \
+		am_cv_python_pythondir=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		am_cv_python_pyexecdir=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		am_cv_python_includes=-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+	HOST_SETOOLS_CONF_OPT += \
+		--enable-swig-python \
+		PYTHON_CPPFLAGS="-I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
+		PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/" \
+		PYTHON_SITE_PKG="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+		PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil -lpython$(PYTHON_VERSION_MAJOR)"
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.1
