From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 20:21:14 -0400
Subject: [Buildroot] [PATCH 8/8 v2] package/setools: fix build with latest
	selinux libs
In-Reply-To: <1466814074-4557-1-git-send-email-Aduskett@gmail.com>
References: <1466814074-4557-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1466814074-4557-8-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Setools 3.3.8 won't cleanly compile against newer versions
of the new selinux libraries. This patch fixes these errors.

Changes v1 -> v2:
 - Added subject, commit log, and SoB-line to 0003 patch.
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0003-fix-build-with-latest-selinux-libs.patch  | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 package/setools/0003-fix-build-with-latest-selinux-libs.patch

diff --git a/package/setools/0003-fix-build-with-latest-selinux-libs.patch b/package/setools/0003-fix-build-with-latest-selinux-libs.patch
new file mode 100644
index 0000000..78203c8
--- /dev/null
+++ b/package/setools/0003-fix-build-with-latest-selinux-libs.patch
@@ -0,0 +1,89 @@
+Fix compile errors against newer versions of selinux libraries.
+Credit to: Joe MacDonald <joe_macdonald@mentor.com>
+URL: https://github.com/flihp/meta-selinux/commit/e09eaef7a9acb552a4a5e1f90117154ae06b6fda
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+
+diff --git a/libqpol/src/policy_define.c b/libqpol/src/policy_define.c
+index fad6b60..231962f 100644
+--- a/libqpol/src/policy_define.c
++++ b/libqpol/src/policy_define.c
+@@ -1449,7 +1449,7 @@ int define_compute_type_helper(int which, avrule_t ** rule)
+ 				return -1;
+ 			}
+ 			class_perm_node_init(perm);
+-			perm->class = i + 1;
++			perm->tclass = i + 1;
+ 			perm->data = datum->s.value;
+ 			perm->next = avrule->perms;
+ 			avrule->perms = perm;
+@@ -1699,7 +1699,7 @@ int define_te_avtab_helper(int which, avrule_t ** rule)
+ 			goto out;
+ 		}
+ 		class_perm_node_init(cur_perms);
+-		cur_perms->class = i + 1;
++		cur_perms->tclass = i + 1;
+ 		if (!perms)
+ 			perms = cur_perms;
+ 		if (tail)
+diff --git a/libqpol/src/policy_extend.c b/libqpol/src/policy_extend.c
+index 5325a87..1417271 100644
+--- a/libqpol/src/policy_extend.c
++++ b/libqpol/src/policy_extend.c
+@@ -843,7 +843,7 @@ static int qpol_syn_rule_table_insert_sepol_avrule(qpol_policy_t * policy, qpol_
+ 			for (class_node = rule->perms; class_node; class_node = class_node->next) {
+ 				key.rule_type = rule->specified;
+ 				key.source_val = key.target_val = i + 1;
+-				key.class_val = class_node->class;
++				key.class_val = class_node->tclass;
+ 				key.cond = cond;
+ 				if (qpol_syn_rule_table_insert_entry(policy, table, &key, new_rule))
+ 					goto err;
+@@ -856,7 +856,7 @@ static int qpol_syn_rule_table_insert_sepol_avrule(qpol_policy_t * policy, qpol_
+ 				key.rule_type = rule->specified;
+ 				key.source_val = i + 1;
+ 				key.target_val = j + 1;
+-				key.class_val = class_node->class;
++				key.class_val = class_node->tclass;
+ 				key.cond = cond;
+ 				if (qpol_syn_rule_table_insert_entry(policy, table, &key, new_rule))
+ 					goto err;
+diff --git a/libqpol/src/syn_rule_query.c b/libqpol/src/syn_rule_query.c
+index 3e63204..d7578f1 100644
+--- a/libqpol/src/syn_rule_query.c
++++ b/libqpol/src/syn_rule_query.c
+@@ -67,7 +67,7 @@ static void *syn_rule_class_state_get_cur(const qpol_iterator_t * iter)
+ 		return NULL;
+ 	}
+
+-	return db->class_val_to_struct[srcs->cur->class - 1];
++	return db->class_val_to_struct[srcs->cur->tclass - 1];
+ }
+
+ static int syn_rule_class_state_next(qpol_iterator_t * iter)
+@@ -465,10 +465,10 @@ int qpol_syn_avrule_get_perm_iter(const qpol_policy_t * policy, const qpol_syn_a
+ 	}
+
+ 	for (node = internal_rule->perms; node; node = node->next) {
+-		for (i = 0; i < db->class_val_to_struct[node->class - 1]->permissions.nprim; i++) {
++		for (i = 0; i < db->class_val_to_struct[node->tclass - 1]->permissions.nprim; i++) {
+ 			if (!(node->data & (1 << i)))
+ 				continue;
+-			tmp = sepol_av_to_string(db, node->class, (sepol_access_vector_t) (1 << i));
++			tmp = sepol_av_to_string(db, node->tclass, (sepol_access_vector_t) (1 << i));
+ 			if (tmp) {
+ 				tmp++; /* remove prepended space */
+ 				for (cur = 0; cur < perm_list_sz; cur++)
+diff --git a/secmds/replcon.cc b/secmds/replcon.cc
+index 34f7c1a..307c39f 100644
+--- a/secmds/replcon.cc
++++ b/secmds/replcon.cc
+@@ -60,7 +60,7 @@ static struct option const longopts[] = {
+ 	{NULL, 0, NULL, 0}
+ };
+
+-extern int lsetfilecon_raw(const char *, security_context_t) __attribute__ ((weak));
++extern int lsetfilecon_raw(const char *, const char *) __attribute__ ((weak));
+
+ /**
+  * As that setools must work with older libselinux versions that may
-- 
2.7.4
