From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 19 Oct 2015 14:22:40 +0200
Subject: [Buildroot] [PATCH] iptables: add upstream patch fixing the message
	'connlabel.conf not found'
Message-ID: <1445257360-31923-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

In iptables versions 1.4.20 and 1.4.21, any call to iptables
would generate a message

    cannot open connlabel.conf, not registering 'connlabel' match: No
        such file or directory

This problem was reported at [1] and subsequently fixed with commit [2], but
no upstream release has been made since. This patch imports the fix into
Buildroot, awaiting a new release of iptables.

[1] http://marc.info/?l=netfilter-devel&m=140990442432002&w=2
[2] http://git.netfilter.org/iptables/commit/?id=825fbda5482a7d5ec5a6619c81fe07ff865c7d6e

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 .../iptables/0006-fix-connlabel-conf-warning.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/iptables/0006-fix-connlabel-conf-warning.patch

diff --git a/package/iptables/0006-fix-connlabel-conf-warning.patch b/package/iptables/0006-fix-connlabel-conf-warning.patch
new file mode 100644
index 0000000..872dcb1
--- /dev/null
+++ b/package/iptables/0006-fix-connlabel-conf-warning.patch
@@ -0,0 +1,72 @@
+From 825fbda5482a7d5ec5a6619c81fe07ff865c7d6e Mon Sep 17 00:00:00 2001
+From: Florian Westphal <fw@strlen.de>
+Date: Fri, 5 Sep 2014 20:45:56 +0200
+Subject: extensions: libxt_connlabel: do not open config file from _init hook
+
+else, static builds will print this for every iptables invocation,
+even 'iptables -L'.  Delay open until we need to translate a mapping.
+
+Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+[Thomas De Schampheleire: import unchanged into Buildroot]
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+
+diff --git a/extensions/libxt_connlabel.c b/extensions/libxt_connlabel.c
+index c84a167..1f83095 100644
+--- a/extensions/libxt_connlabel.c
++++ b/extensions/libxt_connlabel.c
+@@ -29,11 +29,26 @@ static const struct xt_option_entry connlabel_mt_opts[] = {
+ 	XTOPT_TABLEEND,
+ };
+ 
++/* cannot do this via _init, else static builds might spew error message
++ * for every iptables invocation.
++ */
++static void connlabel_open(void)
++{
++	if (map)
++		return;
++
++	map = nfct_labelmap_new(NULL);
++	if (!map && errno)
++		xtables_error(RESOURCE_PROBLEM, "cannot open connlabel.conf: %s\n",
++			strerror(errno));
++}
++
+ static void connlabel_mt_parse(struct xt_option_call *cb)
+ {
+ 	struct xt_connlabel_mtinfo *info = cb->data;
+ 	int tmp;
+ 
++	connlabel_open();
+ 	xtables_option_parse(cb);
+ 
+ 	switch (cb->entry->id) {
+@@ -54,7 +69,11 @@ static void connlabel_mt_parse(struct xt_option_call *cb)
+ 
+ static const char *connlabel_get_name(int b)
+ {
+-	const char *name = nfct_labelmap_get_name(map, b);
++	const char *name;
++
++	connlabel_open();
++
++	name = nfct_labelmap_get_name(map, b);
+ 	if (name && strcmp(name, ""))
+ 		return name;
+ 	return NULL;
+@@ -114,11 +133,5 @@ static struct xtables_match connlabel_mt_reg = {
+ 
+ void _init(void)
+ {
+-	map = nfct_labelmap_new(NULL);
+-	if (!map) {
+-		fprintf(stderr, "cannot open connlabel.conf, not registering '%s' match: %s\n",
+-			connlabel_mt_reg.name, strerror(errno));
+-		return;
+-	}
+ 	xtables_register_match(&connlabel_mt_reg);
+ }
+-- 
+cgit v0.10.1
+
-- 
1.9.5
