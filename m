From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  6 Mar 2020 21:10:20 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/liboping: add patch to fix
 gcc-8/gcc-9 snprintf truncation compile failure
Message-ID: <20200306201022.22382-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from upstream merge request ([1]) to fix fix gcc-8/gcc-9 snprintf
truncation related compile failure (-Wall/-Werror), reported on the
mailing list ([2]).

Fixes:

  liboping.c: In function ?ping_set_ttl?:
  liboping.c:207:9: error: ?%s? directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
    207 |    "%s: %s", function, message);
        |         ^~

[1] https://github.com/octo/liboping/pull/50
[2] http://lists.busybox.net/pipermail/buildroot/2020-March/275861.html

Reported-by: Maik Brenke <Maik.Brenke@continental-corporation.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...d-snprintf-truncation-warning-wError.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/liboping/0002-Mitigated-snprintf-truncation-warning-wError.patch

diff --git a/package/liboping/0002-Mitigated-snprintf-truncation-warning-wError.patch b/package/liboping/0002-Mitigated-snprintf-truncation-warning-wError.patch
new file mode 100644
index 0000000000..929d25e22d
--- /dev/null
+++ b/package/liboping/0002-Mitigated-snprintf-truncation-warning-wError.patch
@@ -0,0 +1,31 @@
+From 215003b58c9214c4a3ff5ef44f361887cdbec348 Mon Sep 17 00:00:00 2001
+From: Guillaume Picquet <nelstaar@yahoo.fr>
+Date: Mon, 9 Sep 2019 17:30:47 +0200
+Subject: [PATCH] Mitigated snprintf truncation warning (-wError)
+
+[Upstream: https://github.com/octo/liboping/pull/50/commits/664414123a3fe89984abfa0917946c513bf47163]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/liboping.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/liboping.c b/src/liboping.c
+index a2dfa19..39b0041 100644
+--- a/src/liboping.c
++++ b/src/liboping.c
+@@ -203,9 +203,9 @@ static char *sstrerror (int errnum, char *buf, size_t buflen)
+ static void ping_set_error (pingobj_t *obj, const char *function,
+ 	       	const char *message)
+ {
+-	snprintf (obj->errmsg, sizeof (obj->errmsg),
+-			"%s: %s", function, message);
+-	obj->errmsg[sizeof (obj->errmsg) - 1] = 0;
++	if (snprintf (obj->errmsg, sizeof (obj->errmsg),
++			"%s: %s", function, message) >= sizeof (obj->errmsg))
++		obj->errmsg[sizeof (obj->errmsg) - 1] = 0;
+ }
+ 
+ static void ping_set_errno (pingobj_t *obj, int error_number)
+-- 
+2.25.1
+
-- 
2.25.1
