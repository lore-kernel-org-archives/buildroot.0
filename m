From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  1 Aug 2020 16:20:32 +0200
Subject: [Buildroot] [PATCHv3 2/5] package/efl: bump to version 1.24.3
In-Reply-To: <20200801142035.4060526-1-romain.naour@gmail.com>
References: <20200801142035.4060526-1-romain.naour@gmail.com>
Message-ID: <20200801142035.4060526-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  - Remove upstream patch [1].
  - evas-modules option removed since all evas-modules are now built shared. [2]
  - Make sure that mono is disabled [3].
  - gstreamer support removed from emotion & evas [4].
  - emotion-loaders-disabler & emotion-generic-loaders-disabler removed [5].
  - Add openjpeg dependency for jp2k evas loader [6] otherwise the build
    system fail when only libjpeg.so is provided (jpeg-turbo or libjpeg).
  - Update COMPLIANCE file hash due to esacpe library removal [7].
  - Update COPYING file hash due to new csharp,cxx libraries and esacpe,emotion
    removal [8].
  - Remove bullet dependency from recommended option for efl [9].
  - Add new patches to fix build with "Unknown variable" issue with meson.
  - Fix Evas_Engine_GL_Drm.h include path.

[1] https://git.enlightenment.org/core/efl.git/commit/?id=a2afcfc872c29bd2c4a60fdafbc655c90f938d1e
    https://git.enlightenment.org/core/efl.git/commit/?id=c245b576aad09ac5faeb800de7f7c4fef87c6363
[2] https://git.enlightenment.org/core/efl.git/commit/?id=6d8e39a6425e721eb40e0cb1e67f1cbf5b223cc0
[3] https://git.enlightenment.org/core/efl.git/commit/?id=17a81bee4a53891e44a165a14ca20027f9aa0824
[4] https://git.enlightenment.org/core/efl.git/commit/?id=b8dc80c144fec54a521987535c57b995748ccece
[5] https://git.enlightenment.org/core/efl.git/commit/?id=075bab83c4288b5de20f6acfc6b0459656ea85e0
[6] https://git.enlightenment.org/core/efl.git/commit/?id=8ec6e28b7cc568a8bb636de90b2dd10f19db2be3
[7] https://git.enlightenment.org/core/efl.git/commit/?id=f3d9b8ee703621cfbb52a03d346335148318af7a
[8] https://git.enlightenment.org/core/efl.git/commit/?id=40a980174b7e29e6946f7425bd7a238ae45900f8
    https://git.enlightenment.org/core/efl.git/commit/?id=a3ade15d5a45e7d564b7c1304f561af9c4203991
    https://git.enlightenment.org/core/efl.git/commit/?id=31da42a0503556a59c190efcb0a79331e828bf6c
[9] https://git.enlightenment.org/core/efl.git/commit/?id=523a64d2265c13a82ba73022d10919f0e392bab2

See:
https://www.enlightenment.org/news/efl-1.24.0
https://www.enlightenment.org/news/efl-1.24.1
https://www.enlightenment.org/news/efl-1.24.2
https://www.enlightenment.org/news/efl-1.24.3

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3 fix openjpeg dependency
   remove bullet from recommended dependency
   update to 1.24.3
   Review by upstream: https://sourceforge.net/p/enlightenment/mailman/message/37065780/
v2 update COMPLIANCE and COPYING files hash.
---
 ...meson.build-add-single-quote-for-env.patch |  33 +++
 ...-evas-fix-compilation-with-Dwl-false.patch |  31 ---
 ...cc-10-which-has-fno-common-enabled-b.patch | 222 ------------------
 ...es-drm-meson.build-use-gl_deps-as-en.patch |  36 +++
 ...es-drm-meson.build-fix-gl_drm-includ.patch |  37 +++
 package/efl/Config.in                         |   7 +-
 package/efl/efl.hash                          |   8 +-
 package/efl/efl.mk                            |  15 +-
 8 files changed, 119 insertions(+), 270 deletions(-)
 create mode 100644 package/efl/0001-doc-meson.build-add-single-quote-for-env.patch
 delete mode 100644 package/efl/0001-evas-fix-compilation-with-Dwl-false.patch
 delete mode 100644 package/efl/0002-Fix-build-with-gcc-10-which-has-fno-common-enabled-b.patch
 create mode 100644 package/efl/0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
 create mode 100644 package/efl/0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch

diff --git a/package/efl/0001-doc-meson.build-add-single-quote-for-env.patch b/package/efl/0001-doc-meson.build-add-single-quote-for-env.patch
new file mode 100644
index 0000000000..e4064478c8
--- /dev/null
+++ b/package/efl/0001-doc-meson.build-add-single-quote-for-env.patch
@@ -0,0 +1,33 @@
+From bc7992c483a5a188b893a0f0a23d9205274a4485 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 1 Aug 2020 01:38:24 +0200
+Subject: [PATCH] doc/meson.build: add single quote for env
+
+Meson trigger an error due to missing sigle quote for env:
+
+efl-1.24.3/doc/meson.build:114:2: ERROR: Unknown variable "env"
+
+Upstream status:
+https://sourceforge.net/p/enlightenment/mailman/message/37075003/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ doc/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/meson.build b/doc/meson.build
+index 5ad389828c..11e2b6446b 100644
+--- a/doc/meson.build
++++ b/doc/meson.build
+@@ -113,7 +113,7 @@ foreach text_filter_property : text_filter_properties
+ 
+   doc_target += custom_target('preview_text_filters_'+name,
+                   command: [
+-                    env, 'EFL_RUN_IN_TREE=1',
++                    'env', 'EFL_RUN_IN_TREE=1',
+                     'EFL_EVAS_FILTER_LUA_PREFIX=' + join_paths(meson.source_root(), 'src', 'lib', 'evas'),
+                     preview_text_filter.full_path(), text, filter_code.stdout(), '@OUTPUT@', font, size
+                   ],
+-- 
+2.25.4
+
diff --git a/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch b/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch
deleted file mode 100644
index feac95fbc7..0000000000
--- a/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e1c289912c4ad68380f8b317c6c91d25b5b73814 Mon Sep 17 00:00:00 2001
-From: Boris Faure <billiob@gmail.com>
-Date: Thu, 2 Jan 2020 11:38:31 +0000
-Subject: [PATCH] evas: fix compilation with -Dwl=false
-
-Reviewed-by: Chris Michael <cp.michael@samsung.com>
-Reviewed-by: Marcel Hollerbach <mail@marcel-hollerbach.de>
-Differential Revision: https://phab.enlightenment.org/D10994
-
-(cherry picked from commit a2afcfc872c29bd2c4a60fdafbc655c90f938d1e)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/modules/evas/engines/gl_drm/evas_engine.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/modules/evas/engines/gl_drm/evas_engine.c b/src/modules/evas/engines/gl_drm/evas_engine.c
-index a5b4c7a4c8..8c1d6013e7 100644
---- a/src/modules/evas/engines/gl_drm/evas_engine.c
-+++ b/src/modules/evas/engines/gl_drm/evas_engine.c
-@@ -3,8 +3,6 @@
- #include "../gl_common/evas_gl_define.h"
- #include "../software_generic/evas_native_common.h"
- 
--#include <wayland-client.h>
--
- #ifdef HAVE_DLSYM
- # include <dlfcn.h>      /* dlopen,dlclose,etc */
- #else
--- 
-2.24.1
-
diff --git a/package/efl/0002-Fix-build-with-gcc-10-which-has-fno-common-enabled-b.patch b/package/efl/0002-Fix-build-with-gcc-10-which-has-fno-common-enabled-b.patch
deleted file mode 100644
index 1b54bfdf0a..0000000000
--- a/package/efl/0002-Fix-build-with-gcc-10-which-has-fno-common-enabled-b.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-From c245b576aad09ac5faeb800de7f7c4fef87c6363 Mon Sep 17 00:00:00 2001
-From: Tom Callaway <spot@fedoraproject.org>
-Date: Fri, 31 Jan 2020 12:40:45 +0000
-Subject: [PATCH] Fix build with gcc 10 (which has -fno-common enabled by
- default).
-
-EFL failed to build from source in Fedora Rawhide as a result of the update to GCC 10. GCC 10 enables -fno-common by default, and this found three issues in EFL:
-
-  # The eina benchmark code defined int key_size in a header that was included in multiple places.
-  #/usr/bin/ld: bin/elementary/elementary_test-test_ui_clock.o:(.bss.dt1+0x0): multiple definition of `dt1'; bin/elementary/elementary_test-test_datetime.o:(.bss.dt1+0x0): first defined here
- The elementary test code defines the "dt1", "dt2", "dt3" vars in two code files which are compiled together (but these variables do not appear to be used globally)
-  # The eio test code defines the "ee" var in two code files which are compiled together (but this variable does not appear to be used globally)
-
-I've fixed these issues and confirmed locally that the code builds again in Fedora.
-
-Reviewed-by: Marcel Hollerbach <mail@marcel-hollerbach.de>
-Differential Revision: https://phab.enlightenment.org/D11259
-
-Patch taken from upstream: https://github.com/Enlightenment/efl/commit/c245b576aad09ac5faeb800de7f7c4fef87c6363
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- src/benchmarks/eina/eina_bench.h          |  2 +-
- src/benchmarks/eina/eina_bench_crc_hash.c |  1 +
- src/bin/elementary/test_ui_clock.c        | 90 +++++++++++------------
- src/tests/eio/eio_test_map.c              | 10 +--
- 4 files changed, 52 insertions(+), 51 deletions(-)
-
-diff --git a/src/benchmarks/eina/eina_bench.h b/src/benchmarks/eina/eina_bench.h
-index a38d70433e..747ac6f39f 100644
---- a/src/benchmarks/eina/eina_bench.h
-+++ b/src/benchmarks/eina/eina_bench.h
-@@ -21,7 +21,7 @@
- 
- #include "eina_benchmark.h"
- 
--int key_size;
-+extern int key_size;
- 
- void eina_bench_hash(Eina_Benchmark *bench);
- void eina_bench_crc_hash_short(Eina_Benchmark *bench);
-diff --git a/src/benchmarks/eina/eina_bench_crc_hash.c b/src/benchmarks/eina/eina_bench_crc_hash.c
-index b6734489a3..7750233ed4 100644
---- a/src/benchmarks/eina/eina_bench_crc_hash.c
-+++ b/src/benchmarks/eina/eina_bench_crc_hash.c
-@@ -26,6 +26,7 @@
- uint64_t CityHash64(const char *buf, size_t len);
- #endif
- 
-+int key_size;
- char *key_str=NULL;
- 
- void repchar(int n)
-diff --git a/src/bin/elementary/test_ui_clock.c b/src/bin/elementary/test_ui_clock.c
-index 79e9074ead..9973b25cd3 100644
---- a/src/bin/elementary/test_ui_clock.c
-+++ b/src/bin/elementary/test_ui_clock.c
-@@ -6,7 +6,7 @@
- 
- /* A simple test, just displaying clock in its default format */
- 
--Evas_Object *dt1, *dt2, *dt3, *dt4;
-+Evas_Object *uicdt1, *uicdt2, *uicdt3, *uicdt4;
- 
- static void
- _changed_cb(void *data EINA_UNUSED, const Efl_Event *ev EINA_UNUSED)
-@@ -28,19 +28,19 @@ _bt_clicked(void *data EINA_UNUSED, const Efl_Event *ev)
-    new_time.tm_mday = 26;
-    new_time.tm_hour = 9;
-    new_time.tm_min = 0;
--   efl_ui_clock_field_visible_set(dt1, EFL_UI_CLOCK_TYPE_HOUR, EINA_TRUE);
--   efl_ui_clock_field_visible_set(dt1, EFL_UI_CLOCK_TYPE_MINUTE, EINA_TRUE);
--   efl_ui_clock_field_visible_set(dt1, EFL_UI_CLOCK_TYPE_AMPM, EINA_TRUE);
--   efl_ui_clock_field_visible_set(dt1, EFL_UI_CLOCK_TYPE_SECOND, EINA_TRUE);
--   efl_ui_clock_field_visible_set(dt1, EFL_UI_CLOCK_TYPE_DAY, EINA_TRUE);
--   efl_ui_clock_time_set(dt1, new_time);
--
--   elm_object_disabled_set(dt1, EINA_TRUE);
-+   efl_ui_clock_field_visible_set(uicdt1, EFL_UI_CLOCK_TYPE_HOUR, EINA_TRUE);
-+   efl_ui_clock_field_visible_set(uicdt1, EFL_UI_CLOCK_TYPE_MINUTE, EINA_TRUE);
-+   efl_ui_clock_field_visible_set(uicdt1, EFL_UI_CLOCK_TYPE_AMPM, EINA_TRUE);
-+   efl_ui_clock_field_visible_set(uicdt1, EFL_UI_CLOCK_TYPE_SECOND, EINA_TRUE);
-+   efl_ui_clock_field_visible_set(uicdt1, EFL_UI_CLOCK_TYPE_DAY, EINA_TRUE);
-+   efl_ui_clock_time_set(uicdt1, new_time);
-+
-+   elm_object_disabled_set(uicdt1, EINA_TRUE);
-    elm_object_disabled_set(ev->object, EINA_TRUE);
- 
--   efl_del(dt2);
--   efl_del(dt3);
--   dt2 = dt3 = NULL;
-+   efl_del(uicdt2);
-+   efl_del(uicdt3);
-+   uicdt2 = uicdt3 = NULL;
- }
- 
- void
-@@ -56,33 +56,33 @@ test_ui_clock(void *data EINA_UNUSED, Evas_Object *obj EINA_UNUSED, void *event_
-                 efl_content_set(win, efl_added),
-                 efl_gfx_hint_size_min_set(efl_added, EINA_SIZE2D(360, 240)));
- 
--   dt1 = efl_add(EFL_UI_CLOCK_CLASS, bx,
--                 efl_gfx_hint_weight_set(efl_added, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND),
--                 efl_gfx_hint_fill_set(efl_added, EINA_TRUE, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_HOUR, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_MINUTE, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_AMPM, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_SECOND, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_DAY, EINA_FALSE),
--                 efl_ui_clock_pause_set(efl_added, EINA_TRUE),
--                 efl_event_callback_add(efl_added, EFL_UI_CLOCK_EVENT_CHANGED, _changed_cb, NULL),
--                 efl_pack(bx, efl_added));
--
--   dt2 = efl_add(EFL_UI_CLOCK_CLASS, bx,
--                 efl_gfx_hint_weight_set(efl_added, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND),
--                 efl_gfx_hint_fill_set(efl_added, EINA_TRUE, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_YEAR, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_MONTH, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_DATE, EINA_FALSE),
--                 efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_SECOND, EINA_FALSE),
--                 efl_ui_clock_pause_set(efl_added, EINA_TRUE),
--                 efl_pack(bx, efl_added));
--   elm_object_disabled_set(dt2, EINA_TRUE);
--
--   dt3 = efl_add(EFL_UI_CLOCK_CLASS, bx,
--                 efl_gfx_hint_weight_set(efl_added, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND),
--                 efl_gfx_hint_fill_set(efl_added, EINA_TRUE, EINA_FALSE),
--                 efl_pack(bx, efl_added));
-+   uicdt1 = efl_add(EFL_UI_CLOCK_CLASS, bx,
-+                    efl_gfx_hint_weight_set(efl_added, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND),
-+                    efl_gfx_hint_fill_set(efl_added, EINA_TRUE, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_HOUR, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_MINUTE, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_AMPM, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_SECOND, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_DAY, EINA_FALSE),
-+                    efl_ui_clock_pause_set(efl_added, EINA_TRUE),
-+                    efl_event_callback_add(efl_added, EFL_UI_CLOCK_EVENT_CHANGED, _changed_cb, NULL),
-+                    efl_pack(bx, efl_added));
-+
-+   uicdt2 = efl_add(EFL_UI_CLOCK_CLASS, bx,
-+                    efl_gfx_hint_weight_set(efl_added, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND),
-+                    efl_gfx_hint_fill_set(efl_added, EINA_TRUE, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_YEAR, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_MONTH, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_DATE, EINA_FALSE),
-+                    efl_ui_clock_field_visible_set(efl_added, EFL_UI_CLOCK_TYPE_SECOND, EINA_FALSE),
-+                    efl_ui_clock_pause_set(efl_added, EINA_TRUE),
-+                    efl_pack(bx, efl_added));
-+   elm_object_disabled_set(uicdt2, EINA_TRUE);
-+
-+   uicdt3 = efl_add(EFL_UI_CLOCK_CLASS, bx,
-+                    efl_gfx_hint_weight_set(efl_added, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND),
-+                    efl_gfx_hint_fill_set(efl_added, EINA_TRUE, EINA_FALSE),
-+                    efl_pack(bx, efl_added));
- 
-    efl_add(EFL_UI_TEXTBOX_CLASS, bx,
-            efl_text_set(efl_added, "Editable Clock:"),
-@@ -92,12 +92,12 @@ test_ui_clock(void *data EINA_UNUSED, Evas_Object *obj EINA_UNUSED, void *event_
-            efl_gfx_hint_size_min_set(efl_added, EINA_SIZE2D(100, 25)),
-            efl_pack(bx, efl_added));
- 
--   dt4 = efl_add(EFL_UI_CLOCK_CLASS, bx,
--                 efl_gfx_hint_weight_set(efl_added, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND),
--                 efl_gfx_hint_fill_set(efl_added, EINA_TRUE, EINA_FALSE),
--                 efl_ui_clock_edit_mode_set(efl_added, EINA_TRUE),
--                 efl_ui_clock_pause_set(efl_added, EINA_TRUE),
--                 efl_pack(bx, efl_added));
-+   uicdt4 = efl_add(EFL_UI_CLOCK_CLASS, bx,
-+                    efl_gfx_hint_weight_set(efl_added, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND),
-+                    efl_gfx_hint_fill_set(efl_added, EINA_TRUE, EINA_FALSE),
-+                    efl_ui_clock_edit_mode_set(efl_added, EINA_TRUE),
-+                    efl_ui_clock_pause_set(efl_added, EINA_TRUE),
-+                    efl_pack(bx, efl_added));
- 
-    efl_add(EFL_UI_BUTTON_CLASS, win,
-            efl_text_set(efl_added, "Back to the future..."),
-diff --git a/src/tests/eio/eio_test_map.c b/src/tests/eio/eio_test_map.c
-index fdb0631a9d..f794f73d73 100644
---- a/src/tests/eio/eio_test_map.c
-+++ b/src/tests/eio/eio_test_map.c
-@@ -14,7 +14,7 @@
- 
- #include "eio_suite.h"
- 
--Eina_File *ee;
-+Eina_File *eie;
- 
- static void
- _done_cb(void *data EINA_UNUSED, Eio_File *handler EINA_UNUSED)
-@@ -25,7 +25,7 @@ _done_cb(void *data EINA_UNUSED, Eio_File *handler EINA_UNUSED)
- static void
- _open_cb(void *data EINA_UNUSED, Eio_File *handler EINA_UNUSED, Eina_File *ef)
- {
--   ee = ef;
-+   eie = ef;
-    ecore_main_loop_quit();
- }
- 
-@@ -70,17 +70,17 @@ EFL_START_TEST(eio_test_map_simple)
-    ecore_main_loop_begin();
-    fail_if(!ef);
- 
--   ef = eio_file_map_all(ee, EINA_FILE_POPULATE, _filter_cb, _map_cb,
-+   ef = eio_file_map_all(eie, EINA_FILE_POPULATE, _filter_cb, _map_cb,
-                     _error_cb, data);
-    ecore_main_loop_begin();
-    fail_if(!ef);
- 
--   ef = eio_file_map_new(ee, EINA_FILE_WILLNEED, 0, strlen(data), _filter_cb,
-+   ef = eio_file_map_new(eie, EINA_FILE_WILLNEED, 0, strlen(data), _filter_cb,
-                          _map_cb, _error_cb, data);
-    ecore_main_loop_begin();
-    fail_if(!ef);
- 
--   ef = eio_file_close(ee, _done_cb, _error_cb, NULL);
-+   ef = eio_file_close(eie, _done_cb, _error_cb, NULL);
-    ecore_main_loop_begin();
-    fail_if(!ef);
- 
--- 
-2.20.1
-
diff --git a/package/efl/0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch b/package/efl/0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
new file mode 100644
index 0000000000..85affe940f
--- /dev/null
+++ b/package/efl/0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
@@ -0,0 +1,36 @@
+From f6b8b53fdd1cb63219f61e783479bf8d221649b3 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 1 Aug 2020 02:25:47 +0200
+Subject: [PATCH] ecore_evas/engines/drm/meson.build: use "gl_deps" as engine
+ dependencies
+
+Meson trigger an error since "engine_gl_drm" variable doesn't exist.
+
+src/modules/ecore_evas/engines/drm/meson.build:10:2: ERROR: Unknown variable "engine_gl_drm".
+
+Instead use "gl_deps" as engine dependencies.
+
+Upstream status:
+https://sourceforge.net/p/enlightenment/mailman/message/37075016/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/modules/ecore_evas/engines/drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
+index 584cc56159..de645f1093 100644
+--- a/src/modules/ecore_evas/engines/drm/meson.build
++++ b/src/modules/ecore_evas/engines/drm/meson.build
+@@ -7,7 +7,7 @@ engine_deps = [ecore_drm2, ecore_input, eeze, elput, libdrm, engine_drm]
+ 
+ if get_option('opengl') != 'none'
+   config_h.set('BUILD_ECORE_EVAS_GL_DRM', '1')
+-  engine_deps += [engine_gl_drm]
++  engine_deps += [gl_deps]
+ endif
+ 
+ engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
+-- 
+2.25.4
+
diff --git a/package/efl/0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch b/package/efl/0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
new file mode 100644
index 0000000000..b9a416a754
--- /dev/null
+++ b/package/efl/0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
@@ -0,0 +1,37 @@
+From 83c62fd6b53bd5d3f46c59362ef4fdac9090fd8d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 1 Aug 2020 01:01:00 +0200
+Subject: [PATCH] ecore_evas/engines/drm/meson.build: fix "gl_drm" include
+ directory
+
+The Evas_Engine_GL_Drm.h file is in "gl_drm" directory, not "drm".
+
+../src/modules/ecore_evas/engines/drm/ecore_evas_drm.c:23:11: fatal error: Evas_Engine_GL_Drm.h: No such file or directory
+   23 | # include <Evas_Engine_GL_Drm.h>
+      |           ^~~~~~~~~~~~~~~~~~~~~~
+compilation terminated.
+
+Upstream status:
+https://sourceforge.net/p/enlightenment/mailman/message/37075004/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/modules/ecore_evas/engines/drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
+index de645f1093..205468750a 100644
+--- a/src/modules/ecore_evas/engines/drm/meson.build
++++ b/src/modules/ecore_evas/engines/drm/meson.build
+@@ -10,7 +10,7 @@ if get_option('opengl') != 'none'
+   engine_deps += [gl_deps]
+ endif
+ 
+-engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'drm'))
++engine_include_dir += include_directories(join_paths('..', '..', '..', 'evas', 'engines', 'gl_drm'))
+ 
+ shared_module(mod_full_name, engine_src,
+   include_directories : config_dir + [engine_include_dir],
+-- 
+2.25.4
+
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 910b3af804..031bff7ad6 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -26,8 +26,7 @@ config BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 config BR2_PACKAGE_EFL_BULLET
-	bool "Enable bullet support (recommended)"
-	default y
+	bool "Enable bullet support"
 	select BR2_PACKAGE_BULLET
 	help
 	  If you have chosen to disable physics support, this disables
@@ -131,8 +130,7 @@ comment "efl's libmount support needs udev /dev management (eeze)"
 
 config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 	bool
-	default y if BR2_PACKAGE_EFL_BULLET && \
-		BR2_PACKAGE_EFL_EEZE && \
+	default y if BR2_PACKAGE_EFL_EEZE && \
 		BR2_PACKAGE_EFL_FONTCONFIG && \
 		BR2_PACKAGE_EFL_GSTREAMER1 && \
 		BR2_PACKAGE_EFL_LIBFRIBIDI && \
@@ -244,6 +242,7 @@ comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_JPEG
 	bool "libevas jpeg loader"
+	select BR2_PACKAGE_OPENJPEG
 	help
 	  This enables the loader code that loads jpeg files using
 	  libjpeg.
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 9c6102c368..9f1c0b6dcb 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,8 +1,8 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.23.2.tar.xz.sha256sum
-sha256  ba8d9e4a4690a6c917c98ec090fffa6ffe005ab911811b8d443aa155ad95d493  efl-1.23.2.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.24.3.tar.xz.sha256sum
+sha256  de95c6e673c170c1e21382918b122417c091c643e7dcaced89aa785529625c2a  efl-1.24.3.tar.xz
 
-sha256  d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
-sha256  aacde32f865e7166fd8efb117f6a3436c8c6fbe8cce0e4501cb2dbe8c10c86f6  COPYING
+sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
+sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
 sha256  e5133b4034a4749a781e2220ffb230b60a282b88861f1124d69a58abd5143994  COPYING.images
 sha256  c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c  licenses/COPYING.ASL
 sha256  af4ffe7ed1795a6e9cd3b3ce8747fdc45da449ff58cf35b8027c0699a66fd5cf  licenses/COPYING.BSD
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 0557a8c1cf..0ffbcf9f07 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.23.2
+EFL_VERSION = 1.24.3
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
@@ -35,10 +35,9 @@ EFL_CONF_OPTS = \
 	-Davahi=false \
 	-Dbuild-examples=false \
 	-Dbuild-tests=false \
+	-Ddotnet=false \
 	-Decore-imf-loaders-disabler=ibus,scim,xim \
 	-Delua=true \
-	-Demotion-generic-loaders-disabler=vlc \
-	-Demotion-loaders-disabler=gstreamer,gstreamer1,libvlc,xine \
 	-Dembedded-lz4=false \
 	-Dlua-interpreter=luajit \
 	-Dnetwork-backend=none \
@@ -199,16 +198,15 @@ endif
 
 EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 
-# Evas loaders are shared by default.
-EFL_CONF_OPTS += -Devas-modules=shared
-
 # json evas loader is disabled by default by upstream.
 # Disable libspectre (ps).
 # Keep all other evas loader enabled or handled below.
 EFL_EVAS_LOADERS_DISABLER = gst json ps
 
 # efl already depends on jpeg.
-ifeq ($(BR2_PACKAGE_EFL_JPEG),)
+ifeq ($(BR2_PACKAGE_EFL_JPEG),y)
+EFL_DEPENDENCIES += openjpeg
+else
 EFL_EVAS_LOADERS_DISABLER += jp2k
 endif
 
@@ -307,14 +305,13 @@ HOST_EFL_CONF_OPTS += \
 	-Dbuild-examples=false \
 	-Dbuild-tests=false \
 	-Dcrypto=openssl \
+	-Ddotnet=false \
 	-Decore-imf-loaders-disabler=ibus,scim,xim \
 	-Dedje-sound-and-video=false \
 	-Deeze=false \
 	-Delogind=false \
 	-Delua=true \
 	-Dembedded-lz4=true \
-	-Demotion-generic-loaders-disabler=vlc \
-	-Demotion-loaders-disabler=gstreamer,gstreamer1,libvlc,xine \
 	-Dfontconfig=false \
 	-Dfribidi=false \
 	-Dglib=true \
-- 
2.25.4
