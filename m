From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:12:59 +0200
Subject: [Buildroot] [git commit] package/collectd: fix netlink with musl
Message-ID: <20200907210710.C7D6F821D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c27c72251ec7e403e6f992b66bc3f1385ce82fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/cd4d75888b5259b028132dd224be34f69bcbb702

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-src-netlink.c-remove-REG_NOERROR.patch    | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch b/package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch
new file mode 100644
index 0000000000..14af0d763c
--- /dev/null
+++ b/package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch
@@ -0,0 +1,43 @@
+From 5e600ae2ad370ddbb759e84ce55a7dfaa9a0bdd7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 6 Sep 2020 14:17:23 +0200
+Subject: [PATCH] src/netlink.c: remove REG_NOERROR
+
+REG_NOERROR is used since version 5.12.0 and
+https://github.com/collectd/collectd/commit/f7fd32e5209e188db7985a42054252fc4cbfe7c1
+
+However, REG_NOERROR is not defined by musl, even GNU regex do not
+mention REG_NOERROR, so just remove it to avoid the following build
+failure:
+
+src/netlink.c: In function 'check_ignorelist':
+src/netlink.c:243:51: error: 'REG_NOERROR' undeclared (first use in this function); did you mean 'REG_NOTBOL'?
+       if (regexec(i->rdevice, dev, 0, NULL, 0) != REG_NOERROR)
+                                                   ^~~~~~~~~~~
+                                                   REG_NOTBOL
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cd4d75888b5259b028132dd224be34f69bcbb702
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/collectd/collectd/pull/3569]
+---
+ src/netlink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/netlink.c b/src/netlink.c
+index 7a5da762..fac2fb1e 100644
+--- a/src/netlink.c
++++ b/src/netlink.c
+@@ -240,7 +240,7 @@ static int check_ignorelist(const char *dev, const char *type,
+   for (ir_ignorelist_t *i = ir_ignorelist_head; i != NULL; i = i->next) {
+ #if HAVE_REGEX_H
+     if (i->rdevice != NULL) {
+-      if (regexec(i->rdevice, dev, 0, NULL, 0) != REG_NOERROR)
++      if (regexec(i->rdevice, dev, 0, NULL, 0))
+         continue;
+     } else
+ #endif
+-- 
+2.28.0
+
