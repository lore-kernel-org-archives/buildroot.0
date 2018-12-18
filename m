From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Dec 2018 22:44:43 +0100
Subject: [Buildroot] [PATCH v2] package/pkgconf: add patch to restore
 pre-1.5.3 behavior for sysroot prefixing
Message-ID: <20181218214443.19888-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to the bump to version 1.5.3 in commit
4e423669399ad8389edd81761ea5c9cc26bf312d, we had a patch on pkgconf
that ensures only some variables containing paths were prefixed by the
sysroot directory when queried through pkg-config. This patch was
dropped as part of the 1.5.3 bump, but it turns out we really need
something like this, or a significant number of changes need to be
done to existing packages.

Indeed, pkg-config has no notion of which variable/path gets used at
build time vs. which variable/path gets used at runtime. Prefixing
with the sysroot the paths used at build time works and is desirable,
but prefixing the paths used at runtime doesn't work.

This commit should fix a large number of remaining build failures
related to pkgconf 1.5.3, and should allow reverting a significant
number of workarounds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
 - Fix the pkgconf patch description, which was meaningless, as
   noticed by Yann.
 - Don't initialize the add_sysroot variable to true to later set its
   value unconditionally to false, as noticed by Yann.
---
 ...th-the-sysroot-a-subset-of-variables.patch | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch

diff --git a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
new file mode 100644
index 0000000000..5a9713d651
--- /dev/null
+++ b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
@@ -0,0 +1,142 @@
+From 267a57022699453e8d8f517519df25ac6bf6ac4e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 16 Dec 2018 11:52:18 +0100
+Subject: [PATCH] Only prefix with the sysroot a subset of variables
+
+The standard logic of pkg-config is to prefix all absolute paths by
+the sysroot defined in PKG_CONFIG_SYSROOT_DIR. However, while some
+paths (like includedir, libdir, and paths used in -L and -I options)
+indeed need to be prefixed by the sysroot, it is not necessarily the
+case for paths that are used on the target. If they get prefixed by
+the sysroot, the runtime path on the target is incorrect.
+
+Unfortunately, pkg-config doesn't have a sense of which path needs to
+be prefixed by the sysroot, and which path should not be prefixed by
+the sysroot.
+
+So, let's simply have a whitelist of paths that should be prefixed:
+includedir, libdir, mapdir, pkgdatadir and sdkdir. This list of
+variables was collected over years of Buildroot development. All other
+paths are not prefixed by the sysroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libpkgconf/tuple.c | 60 ++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 42 insertions(+), 18 deletions(-)
+
+diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
+index 8523709..7cd2fff 100644
+--- a/libpkgconf/tuple.c
++++ b/libpkgconf/tuple.c
+@@ -160,6 +160,18 @@ dequote(const char *value)
+ 	return buf;
+ }
+ 
++static char *
++pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot);
++
++const char *sysrooted_keys[] = {
++	"includedir",
++	"libdir",
++	"mapdir",
++	"pkgdatadir",
++	"sdkdir",
++	NULL,
++};
++
+ /*
+  * !doc
+  *
+@@ -180,6 +192,8 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
+ {
+ 	char *dequote_value;
+ 	pkgconf_tuple_t *tuple = calloc(sizeof(pkgconf_tuple_t), 1);
++	bool add_sysroot = false;
++	int i;
+ 
+ 	pkgconf_tuple_find_delete(list, key);
+ 
+@@ -187,9 +201,13 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
+ 
+ 	PKGCONF_TRACE(client, "adding tuple to @%p: %s => %s (parsed? %d)", list, key, dequote_value, parse);
+ 
++	for (i = 0; sysrooted_keys[i] != NULL; i++)
++		if (!strcmp(key, sysrooted_keys[i]))
++			add_sysroot = true;
++
+ 	tuple->key = strdup(key);
+ 	if (parse)
+-		tuple->value = pkgconf_tuple_parse(client, list, dequote_value);
++		tuple->value = pkgconf_tuple_parse_sysroot(client, list, dequote_value, add_sysroot);
+ 	else
+ 		tuple->value = strdup(dequote_value);
+ 
+@@ -233,27 +251,14 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
+ 	return NULL;
+ }
+ 
+-/*
+- * !doc
+- *
+- * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
+- *
+- *    Parse an expression for variable substitution.
+- *
+- *    :param pkgconf_client_t* client: The pkgconf client object to access.
+- *    :param pkgconf_list_t* list: The variable list to search for variables (along side the global variable list).
+- *    :param char* value: The ``key=value`` string to parse.
+- *    :return: the variable data with any variables substituted
+- *    :rtype: char *
+- */
+-char *
+-pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
++static char *
++pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot)
+ {
+ 	char buf[PKGCONF_BUFSIZE];
+ 	const char *ptr;
+ 	char *bptr = buf;
+ 
+-	if (*value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
++	if (add_sysroot && *value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
+ 		bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
+ 
+ 	for (ptr = value; *ptr != '\0' && bptr - buf < PKGCONF_BUFSIZE; ptr++)
+@@ -293,7 +298,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+ 
+ 				if (kv != NULL)
+ 				{
+-					parsekv = pkgconf_tuple_parse(client, vars, kv);
++					parsekv = pkgconf_tuple_parse_sysroot(client, vars, kv, add_sysroot);
+ 
+ 					strncpy(bptr, parsekv, PKGCONF_BUFSIZE - (bptr - buf));
+ 					bptr += strlen(parsekv);
+@@ -338,6 +343,25 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+ 	return strdup(buf);
+ }
+ 
++/*
++ * !doc
++ *
++ * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
++ *
++ *    Parse an expression for variable substitution.
++ *
++ *    :param pkgconf_client_t* client: The pkgconf client object to access.
++ *    :param pkgconf_list_t* list: The variable list to search for variables (along side the global variable list).
++ *    :param char* value: The ``key=value`` string to parse.
++ *    :return: the variable data with any variables substituted
++ *    :rtype: char *
++ */
++char *
++pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
++{
++	return pkgconf_tuple_parse_sysroot(client, vars, value, true);
++}
++
+ /*
+  * !doc
+  *
+-- 
+2.19.2
+
-- 
2.19.2
