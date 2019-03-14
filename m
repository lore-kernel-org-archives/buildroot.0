From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 14 Mar 2019 17:29:30 -0400
Subject: [Buildroot] [PATCH 1/1] package/systemd: Fix patch 0019
Message-ID: <20190314212930.85183-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This patch was backported to work with systemd v240. Now that systemd is at
v241, we must update the patch.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...ary-strings-to-hold-dbus-paths-on-the.patch | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch b/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
index bd09e60207..007b806c09 100644
--- a/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
+++ b/package/systemd/0019-Allocate-temporary-strings-to-hold-dbus-paths-on-the.patch
@@ -10,14 +10,14 @@ clear way to understand if the allocation fails.
 (cherry picked from commit f519a19bcd5afe674a9b8fc462cd77d8bad403c1)
 [baruch: backport to v240]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Adam: Update for v241]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
-Upstream status: commit f519a19bcd5
-
  src/libsystemd/sd-bus/bus-objects.c | 68 +++++++++++++++++++++++------
  1 file changed, 54 insertions(+), 14 deletions(-)
 
 diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index d0538104ae25..54b977418e03 100644
+index 58329f3fe78..54b977418e0 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -1133,7 +1133,8 @@ static int object_manager_serialize_path_and_fallbacks(
@@ -34,7 +34,7 @@ index d0538104ae25..54b977418e03 100644
                  return 0;
  
          /* Second, add fallback vtables registered for any of the prefixes */
--        prefix = alloca(strlen(path) + 1);
+-        prefix = newa(char, strlen(path) + 1);
 +        pl = strlen(path);
 +        assert(pl <= BUS_PATH_SIZE_MAX);
 +        prefix = new(char, pl + 1);
@@ -81,7 +81,7 @@ index d0538104ae25..54b977418e03 100644
 +                if (!prefix)
 +                        return -ENOMEM;
  
--                prefix = alloca(strlen(path) + 1);
+-                prefix = newa(char, strlen(path) + 1);
                  OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
                          n = hashmap_get(bus->nodes, prefix);
                          if (n)
@@ -113,7 +113,7 @@ index d0538104ae25..54b977418e03 100644
                  if (bus->nodes_modified)
                          continue;
  
--                prefix = alloca(strlen(path) + 1);
+-                prefix = newa(char, strlen(path) + 1);
                  OBJECT_PATH_FOREACH_PREFIX(prefix, path) {
                          r = emit_properties_changed_on_interface(bus, prefix, path, interface, true, &found_interface, names);
                          if (r != 0)
@@ -131,7 +131,7 @@ index d0538104ae25..54b977418e03 100644
          if (bus->nodes_modified)
                  return 0;
  
--        prefix = alloca(strlen(path) + 1);
+-        prefix = newa(char, strlen(path) + 1);
 +        pl = strlen(path);
 +        assert(pl <= BUS_PATH_SIZE_MAX);
 +        prefix = new(char, pl + 1);
@@ -155,7 +155,7 @@ index d0538104ae25..54b977418e03 100644
          if (bus->nodes_modified)
                  return 0;
  
--        prefix = alloca(strlen(path) + 1);
+-        prefix = newa(char, strlen(path) + 1);
 +        pl = strlen(path);
 +        assert(pl <= BUS_PATH_SIZE_MAX);
 +        prefix = new(char, pl + 1);
@@ -179,7 +179,7 @@ index d0538104ae25..54b977418e03 100644
          if (bus->nodes_modified)
                  return 0;
  
--        prefix = alloca(strlen(path) + 1);
+-        prefix = newa(char, strlen(path) + 1);
 +        pl = strlen(path);
 +        assert(pl <= BUS_PATH_SIZE_MAX);
 +        prefix = new(char, pl + 1);
-- 
2.20.1
