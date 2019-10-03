From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Thu,  3 Oct 2019 13:26:22 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/bird: import bugfixes from
 upstream
Message-ID: <20191003132620.25740-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 ...tup-with-multiple-dynamic-BGP-ranges.patch | 34 ++++++++++++++++++
 ...tion-body-comparison-result-now-used.patch | 34 ++++++++++++++++++
 ...ix-help-for-graceful-restart-command.patch | 31 ++++++++++++++++
 .../bird/0004-Filter-Fix-eval-command.patch   | 26 ++++++++++++++
 .../0005-Nest-Fix-bug-in-export-table.patch   | 32 +++++++++++++++++
 ...BFD-Fix-reconfiguration-of-neighbors.patch | 35 +++++++++++++++++++
 6 files changed, 192 insertions(+)
 create mode 100644 package/bird/0001-BGP-Fix-setup-with-multiple-dynamic-BGP-ranges.patch
 create mode 100644 package/bird/0002-Filters-Function-body-comparison-result-now-used.patch
 create mode 100644 package/bird/0003-Nest-Fix-help-for-graceful-restart-command.patch
 create mode 100644 package/bird/0004-Filter-Fix-eval-command.patch
 create mode 100644 package/bird/0005-Nest-Fix-bug-in-export-table.patch
 create mode 100644 package/bird/0006-BFD-Fix-reconfiguration-of-neighbors.patch

diff --git a/package/bird/0001-BGP-Fix-setup-with-multiple-dynamic-BGP-ranges.patch b/package/bird/0001-BGP-Fix-setup-with-multiple-dynamic-BGP-ranges.patch
new file mode 100644
index 0000000000..cbb32a4db3
--- /dev/null
+++ b/package/bird/0001-BGP-Fix-setup-with-multiple-dynamic-BGP-ranges.patch
@@ -0,0 +1,34 @@
+From eb1e43a9af9e1905b754f1f191d228e2676ce181 Mon Sep 17 00:00:00 2001
+From: "Ondrej Zajicek (work)" <santiago@crfreenet.org>
+Date: Tue, 17 Sep 2019 14:45:14 +0200
+Subject: [PATCH] BGP: Fix setup with multiple dynamic BGP ranges
+
+Based on a patch from Liam Nattrass, thanks.
+
+Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
+---
+ proto/bgp/bgp.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/proto/bgp/bgp.c b/proto/bgp/bgp.c
+index b26e5e87..d6c2b7e4 100644
+--- a/proto/bgp/bgp.c
++++ b/proto/bgp/bgp.c
+@@ -1551,6 +1551,14 @@ bgp_start(struct proto *P)
+   lock->type = OBJLOCK_TCP;
+   lock->hook = bgp_start_locked;
+   lock->data = p;
++
++  /* For dynamic BGP, we use inst 1 to avoid collisions with regular BGP */
++  if (bgp_is_dynamic(p))
++  {
++    lock->addr = net_prefix(p->cf->remote_range);
++    lock->inst = 1;
++  }
++
+   olock_acquire(lock);
+ 
+   return PS_START;
+-- 
+2.21.0
+
diff --git a/package/bird/0002-Filters-Function-body-comparison-result-now-used.patch b/package/bird/0002-Filters-Function-body-comparison-result-now-used.patch
new file mode 100644
index 0000000000..e308dda591
--- /dev/null
+++ b/package/bird/0002-Filters-Function-body-comparison-result-now-used.patch
@@ -0,0 +1,34 @@
+From 3f477ccb03ed99cf6754baaca179fcf791bcda55 Mon Sep 17 00:00:00 2001
+From: Maria Matejka <mq@ucw.cz>
+Date: Fri, 20 Sep 2019 10:16:51 +0200
+Subject: [PATCH] Filters: Function body comparison result now used.
+
+Function bodies were compared in post-parse time, yet the result was not
+used and the functions were incorrectly considered the same as before.
+
+Now the result is used to reload affected protocols.
+
+Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
+---
+ filter/f-inst.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/filter/f-inst.c b/filter/f-inst.c
+index 49ae993a..385d18d0 100644
+--- a/filter/f-inst.c
++++ b/filter/f-inst.c
+@@ -897,6 +897,11 @@
+     NEVER_CONSTANT;
+     SYMBOL;
+ 
++    FID_SAME_BODY()
++      if (!(f2->sym->flags & SYM_FLAG_SAME))
++	return 0;
++    FID_INTERPRET_BODY()
++
+     /* Push the body on stack */
+     LINEX(sym->function);
+     curline.emask |= FE_RETURN;
+-- 
+2.21.0
+
diff --git a/package/bird/0003-Nest-Fix-help-for-graceful-restart-command.patch b/package/bird/0003-Nest-Fix-help-for-graceful-restart-command.patch
new file mode 100644
index 0000000000..7727783f4f
--- /dev/null
+++ b/package/bird/0003-Nest-Fix-help-for-graceful-restart-command.patch
@@ -0,0 +1,31 @@
+From 9c79022153c6ef3a6c35b2db8be6b259104e67f3 Mon Sep 17 00:00:00 2001
+From: "Ondrej Zajicek (work)" <santiago@crfreenet.org>
+Date: Sun, 22 Sep 2019 23:32:22 +0200
+Subject: [PATCH] Nest: Fix help for 'graceful restart' command
+
+Multi-worded commands are not automatically added to top-level
+help output.
+
+Thanks to Christoph for the bugreport.
+
+Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
+---
+ sysdep/unix/config.Y | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sysdep/unix/config.Y b/sysdep/unix/config.Y
+index c76eb73b..af82e5bd 100644
+--- a/sysdep/unix/config.Y
++++ b/sysdep/unix/config.Y
+@@ -134,6 +134,8 @@ CF_CLI(CONFIGURE CHECK, cfg_name, [\"<file>\"], [[Parse configuration and check
+ CF_CLI(DOWN,,, [[Shut the daemon down]])
+ { cmd_shutdown(); } ;
+ 
++CF_CLI_HELP(GRACEFUL, restart, [[Shut the daemon down for graceful restart]])
++
+ CF_CLI(GRACEFUL RESTART,,, [[Shut the daemon down for graceful restart]])
+ { cmd_graceful_restart(); } ;
+ 
+-- 
+2.21.0
+
diff --git a/package/bird/0004-Filter-Fix-eval-command.patch b/package/bird/0004-Filter-Fix-eval-command.patch
new file mode 100644
index 0000000000..c9871b6cbf
--- /dev/null
+++ b/package/bird/0004-Filter-Fix-eval-command.patch
@@ -0,0 +1,26 @@
+From ea0917bcba86d354f9c8516a4f114c38d04f890b Mon Sep 17 00:00:00 2001
+From: "Ondrej Zajicek (work)" <santiago@crfreenet.org>
+Date: Tue, 24 Sep 2019 00:18:48 +0200
+Subject: [PATCH] Filter: Fix eval command
+
+Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
+---
+ filter/filter.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/filter/filter.c b/filter/filter.c
+index 35bd75e6..60e351f9 100644
+--- a/filter/filter.c
++++ b/filter/filter.c
+@@ -407,7 +407,7 @@ f_eval_buf(const struct f_line *expr, struct linpool *tmp_pool, buffer *buf)
+ {
+   struct f_val val;
+   enum filter_return fret = f_eval(expr, tmp_pool, &val);
+-  if (fret > F_RETURN)
++  if (fret <= F_RETURN)
+     val_format(&val, buf);
+   return fret;
+ }
+-- 
+2.21.0
+
diff --git a/package/bird/0005-Nest-Fix-bug-in-export-table.patch b/package/bird/0005-Nest-Fix-bug-in-export-table.patch
new file mode 100644
index 0000000000..91fb3c08c7
--- /dev/null
+++ b/package/bird/0005-Nest-Fix-bug-in-export-table.patch
@@ -0,0 +1,32 @@
+From ca2dacfcee92d8cfecff74dd020c2d16202b0d5c Mon Sep 17 00:00:00 2001
+From: "Ondrej Zajicek (work)" <santiago@crfreenet.org>
+Date: Tue, 24 Sep 2019 17:12:15 +0200
+Subject: [PATCH] Nest: Fix bug in export table
+
+Exported route may be in modified state, we need to get cached one for
+rte_same() and rta_clone() to work properly.
+
+Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
+---
+ nest/rt-table.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/nest/rt-table.c b/nest/rt-table.c
+index 318ec2ee..c3ec0314 100644
+--- a/nest/rt-table.c
++++ b/nest/rt-table.c
+@@ -2705,6 +2705,11 @@ rte_update_out(struct channel *c, const net_addr *n, rte *new, rte *old0, int re
+   {
+     net = net_get(tab, n);
+     src = new->attrs->src;
++
++    rte_store_tmp_attrs(new, rte_update_pool, NULL);
++
++    if (!rta_is_cached(new->attrs))
++      new->attrs = rta_lookup(new->attrs);
+   }
+   else
+   {
+-- 
+2.21.0
+
diff --git a/package/bird/0006-BFD-Fix-reconfiguration-of-neighbors.patch b/package/bird/0006-BFD-Fix-reconfiguration-of-neighbors.patch
new file mode 100644
index 0000000000..6e3a1debd8
--- /dev/null
+++ b/package/bird/0006-BFD-Fix-reconfiguration-of-neighbors.patch
@@ -0,0 +1,35 @@
+From 4821251ebb13c05e8752f6f54b8e5ad6d87fecaa Mon Sep 17 00:00:00 2001
+From: "Ondrej Zajicek (work)" <santiago@crfreenet.org>
+Date: Mon, 30 Sep 2019 19:10:14 +0200
+Subject: [PATCH] BFD: Fix reconfiguration of neighbors
+
+The bfd_reconfigure_neighbors() returned after first reconfigured
+neighbor instead of continuing with the next one.
+
+Thanks to Winston Chen for the bugreport and a patch.
+
+Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
+---
+ proto/bfd/bfd.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/proto/bfd/bfd.c b/proto/bfd/bfd.c
+index f774e67b..a3e6d01c 100644
+--- a/proto/bfd/bfd.c
++++ b/proto/bfd/bfd.c
+@@ -837,10 +837,11 @@ bfd_reconfigure_neighbors(struct bfd_proto *p, struct bfd_config *new)
+ 
+ 	nn->req = on->req;
+ 	nn->active = 1;
+-	return;
++	goto next;
+       }
+ 
+     bfd_stop_neighbor(p, on);
++  next:;
+   }
+ 
+   WALK_LIST(nn, new->neigh_list)
+-- 
+2.21.0
+
-- 
2.19.1
