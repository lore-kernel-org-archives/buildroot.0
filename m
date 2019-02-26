From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Feb 2019 20:15:34 +0200
Subject: [Buildroot] [PATCH] package/systemd: add upstream security fixes
Message-ID: <d4ac88943e000f048f1ef9ee8605fc76f9c195b6.1551204934.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2019-6454: systemd (PID1) crash with specially crafted D-Bus message
from unprivileged user

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...age-paths-longer-than-BUS_PATH_SIZE_.patch |  53 +++++
 ...ry-strings-to-hold-dbus-paths-on-the.patch | 194 ++++++++++++++++++
 2 files changed, 247 insertions(+)
 create mode 100644 package/systemd/0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
 create mode 100644 package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch

diff --git a/package/systemd/0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch b/package/systemd/0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
new file mode 100644
index 000000000000..2de3b71b5cec
--- /dev/null
+++ b/package/systemd/0018-Refuse-dbus-message-paths-longer-than-BUS_PATH_SIZE_.patch
@@ -0,0 +1,53 @@
+From febef5e18558c114f4fb7c94f6c8ed3520c50cdf Mon Sep 17 00:00:00 2001
+From: Riccardo Schirone <rschiron@redhat.com>
+Date: Mon, 4 Feb 2019 14:29:09 +0100
+Subject: [PATCH] Refuse dbus message paths longer than BUS_PATH_SIZE_MAX
+ limit.
+
+Even though the dbus specification does not enforce any length limit on the
+path of a dbus message, having to analyze too long strings in PID1 may be
+time-consuming and it may have security impacts.
+
+In any case, the limit is set so high that real-life applications should not
+have a problem with it.
+
+(cherry picked from commit 61397a60d98e368a5720b37e83f3169e3eb511c4)
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 61397a60d98
+
+ src/libsystemd/sd-bus/bus-internal.c | 2 +-
+ src/libsystemd/sd-bus/bus-internal.h | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/libsystemd/sd-bus/bus-internal.c b/src/libsystemd/sd-bus/bus-internal.c
+index 40acae213381..598b7f110c73 100644
+--- a/src/libsystemd/sd-bus/bus-internal.c
++++ b/src/libsystemd/sd-bus/bus-internal.c
+@@ -43,7 +43,7 @@ bool object_path_is_valid(const char *p) {
+         if (slash)
+                 return false;
+ 
+-        return true;
++        return (q - p) <= BUS_PATH_SIZE_MAX;
+ }
+ 
+ char* object_path_startswith(const char *a, const char *b) {
+diff --git a/src/libsystemd/sd-bus/bus-internal.h b/src/libsystemd/sd-bus/bus-internal.h
+index f208b294d8f1..a8d61bf72a4e 100644
+--- a/src/libsystemd/sd-bus/bus-internal.h
++++ b/src/libsystemd/sd-bus/bus-internal.h
+@@ -332,6 +332,10 @@ struct sd_bus {
+ 
+ #define BUS_MESSAGE_SIZE_MAX (128*1024*1024)
+ #define BUS_AUTH_SIZE_MAX (64*1024)
++/* Note that the D-Bus specification states that bus paths shall have no size limit. We enforce here one
++ * anyway, since truly unbounded strings are a security problem. The limit we pick is relatively large however,
++ * to not clash unnecessarily with real-life applications. */
++#define BUS_PATH_SIZE_MAX (64*1024)
+ 
+ #define BUS_CONTAINER_DEPTH 128
+ 
+-- 
+2.20.1
+
diff --git a/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch b/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
new file mode 100644
index 000000000000..bd09e6020747
--- /dev/null
+++ b/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
@@ -0,0 +1,194 @@
+From 9e3f5a77226d5320270c92df001f6c79be735af3 Mon Sep 17 00:00:00 2001
+From: Riccardo Schirone <rschiron@redhat.com>
+Date: Mon, 4 Feb 2019 14:29:28 +0100
+Subject: [PATCH] Allocate temporary strings to hold dbus paths on the heap
+
+Paths are limited to BUS_PATH_SIZE_MAX but the maximum size is anyway too big
+to be allocated on the stack, so let's switch to the heap where there is a
+clear way to understand if the allocation fails.
+
+(cherry picked from commit f519a19bcd5afe674a9b8fc462cd77d8bad403c1)
+[baruch: backport to v240]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit f519a19bcd5
+
+ src/libsystemd/sd-bus/bus-objects.c | 68 +++++++++++++++++++++++------
+ 1 file changed, 54 insertions(+), 14 deletions(-)
+
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index d0538104ae25..54b977418e03 100644
+--- a/src/libsystemd/sd-bus/bus-objects.c
++++ b/src/libsystemd/sd-bus/bus-objects.c
+@@ -1133,7 +1133,8 @@ static int object_manager_serialize_path_and_fallbacks(
+                 const char *path,
+                 sd_bus_error *error) {
+ 
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+ 
+         assert(bus);
+@@ -1149,7 +1150,12 @@ static int object_manager_serialize_path_and_fallbacks(
+                 return 0;
+ 
+         /* Second, add fallback vtables registered for any of the prefixes */
+-        prefix = alloca(strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_manager_serialize_path(bus, reply, prefix, path, true, error);
+                 if (r < 0)
+@@ -1345,6 +1351,7 @@ static int object_find_and_run(
+ }
+ 
+ int bus_process_object(sd_bus *bus, sd_bus_message *m) {
++        _cleanup_free_ char *prefix = NULL;
+         int r;
+         size_t pl;
+         bool found_object = false;
+@@ -1369,9 +1376,12 @@ int bus_process_object(sd_bus *bus, sd_bus_message *m) {
+         assert(m->member);
+ 
+         pl = strlen(m->path);
+-        do {
+-                char prefix[pl+1];
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
+ 
++        do {
+                 bus->nodes_modified = false;
+ 
+                 r = object_find_and_run(bus, m, m->path, false, &found_object);
+@@ -1498,9 +1508,15 @@ static int bus_find_parent_object_manager(sd_bus *bus, struct node **out, const
+ 
+         n = hashmap_get(bus->nodes, path);
+         if (!n) {
+-                char *prefix;
++                _cleanup_free_ char *prefix = NULL;
++                size_t pl;
++
++                pl = strlen(path);
++                assert(pl <= BUS_PATH_SIZE_MAX);
++                prefix = new(char, pl + 1);
++                if (!prefix)
++                        return -ENOMEM;
+ 
+-                prefix = alloca(strlen(path) + 1);
+                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                         n = hashmap_get(bus->nodes, prefix);
+                         if (n)
+@@ -2083,8 +2099,9 @@ _public_ int sd_bus_emit_properties_changed_strv(
+                 const char *interface,
+                 char **names) {
+ 
++        _cleanup_free_ char *prefix = NULL;
+         bool found_interface = false;
+-        char *prefix;
++        size_t pl;
+         int r;
+ 
+         assert_return(bus, -EINVAL);
+@@ -2105,6 +2122,12 @@ _public_ int sd_bus_emit_properties_changed_strv(
+ 
+         BUS_DONT_DESTROY(bus);
+ 
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         do {
+                 bus->nodes_modified = false;
+ 
+@@ -2114,7 +2137,6 @@ _public_ int sd_bus_emit_properties_changed_strv(
+                 if (bus->nodes_modified)
+                         continue;
+ 
+-                prefix = alloca(strlen(path) + 1);
+                 OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                         r = emit_properties_changed_on_interface(bus, prefix, path, interface, true, &found_interface, names);
+                         if (r != 0)
+@@ -2246,7 +2268,8 @@ static int object_added_append_all_prefix(
+ 
+ static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
+         _cleanup_set_free_ Set *s = NULL;
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+ 
+         assert(bus);
+@@ -2291,7 +2314,12 @@ static int object_added_append_all(sd_bus *bus, sd_bus_message *m, const char *p
+         if (bus->nodes_modified)
+                 return 0;
+ 
+-        prefix = alloca(strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_added_append_all_prefix(bus, m, s, prefix, path, true);
+                 if (r < 0)
+@@ -2430,7 +2458,8 @@ static int object_removed_append_all_prefix(
+ 
+ static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char *path) {
+         _cleanup_set_free_ Set *s = NULL;
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+ 
+         assert(bus);
+@@ -2462,7 +2491,12 @@ static int object_removed_append_all(sd_bus *bus, sd_bus_message *m, const char
+         if (bus->nodes_modified)
+                 return 0;
+ 
+-        prefix = alloca(strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = object_removed_append_all_prefix(bus, m, s, prefix, path, true);
+                 if (r < 0)
+@@ -2612,7 +2646,8 @@ static int interfaces_added_append_one(
+                 const char *path,
+                 const char *interface) {
+ 
+-        char *prefix;
++        _cleanup_free_ char *prefix = NULL;
++        size_t pl;
+         int r;
+ 
+         assert(bus);
+@@ -2626,7 +2661,12 @@ static int interfaces_added_append_one(
+         if (bus->nodes_modified)
+                 return 0;
+ 
+-        prefix = alloca(strlen(path) + 1);
++        pl = strlen(path);
++        assert(pl <= BUS_PATH_SIZE_MAX);
++        prefix = new(char, pl + 1);
++        if (!prefix)
++                return -ENOMEM;
++
+         OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
+                 r = interfaces_added_append_one_prefix(bus, m, prefix, path, interface, true);
+                 if (r != 0)
+-- 
+2.20.1
+
-- 
2.20.1
