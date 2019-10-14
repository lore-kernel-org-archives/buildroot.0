From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 23:23:07 +0200
Subject: [Buildroot] [git commit] package/syslog-ng: bump version to 3.24.1
Message-ID: <20191014214037.14FA881798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f896c47ad11be97053e80bbd4cd20e363ebeb01f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch applied upstream.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dd-explicit-un-initialized-state-to-Windo.patch | 118 ---------------------
 package/syslog-ng/syslog-ng.conf                   |   2 +-
 package/syslog-ng/syslog-ng.hash                   |   2 +-
 package/syslog-ng/syslog-ng.mk                     |   2 +-
 4 files changed, 3 insertions(+), 121 deletions(-)

diff --git a/package/syslog-ng/0002-logsource-add-explicit-un-initialized-state-to-Windo.patch b/package/syslog-ng/0002-logsource-add-explicit-un-initialized-state-to-Windo.patch
deleted file mode 100644
index 1ddf0be1fd..0000000000
--- a/package/syslog-ng/0002-logsource-add-explicit-un-initialized-state-to-Windo.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From e350607f27b78094fb72422faf5394384ae6193b Mon Sep 17 00:00:00 2001
-From: Laszlo Budai <laszlo.budai@outlook.com>
-Date: Thu, 29 Aug 2019 17:09:39 +0200
-Subject: [PATCH] logsource: add explicit (un)initialized state to
- WindowSizeCounter
-
-Fixes: #2893
-
-On 32 bit systems (or non-64 bit systems), syslog-ng could abort during
-shutdown.
-
-What was the reason of the abort?
-a) in `log_source_set_options` where we set the initial window size
-conditionally, the condition was false thus the `full_window_size`
-remained 0
-b) when `log_source_free` is called during shutdown,
- * `_release_dynamic_window` called unconditionally and
- *  a dynamic_part is calculated as full_window_size(=0) - init_window_size(=default 100),
- so dynamic_part = -100
- * window_size is decremented by dynamic_part(-100) and the
- `window_size_counter_sub` asserts on old_value >= value, and this
- assert failed, so syslog-ng aborted
-
-So the questions are
-1) why we did not set initial window size?
-2) why old_value was not greater than value?
-
-Answers:
-1) the value we get from `window_size_counter_get` is the masked
-value... on 64 bit systems this value is a 63 bits of `1` and it is compared to
-a 32 bits of `1` but the 63 bits are truncated to 32 thanks to an explicit cast
-And what if we are on a 32 bits system?
-Well... the sizeof(gsize) is 4 , sizeof(gint) is also 4 on these
-systems. This means that the `window_size_counter_get` returns 31 bits of
-`-1`, and it is compared to 32 bits of `1` : they are obviously not
-equals -> we won't set full_window_size
-
-2) old_value is a -1, which is masked, so the actual old value is 2^31-1, while new value is a
--100, which is (2^32-100), so on a 32 bits system 31 bit negative value is
-compared to a  to 32 bits negative value...
-
-Proposed solution:
- * add a initialized state to LogSource: this is checked/(set to TRUE) only in
- `log_source_set_options`, and set to FALSE only in `log_source_init_instance`
-
-Signed-off-by: Laszlo Budai <laszlo.budai@outlook.com>
-[Retrieved from:
-https://github.com/syslog-ng/syslog-ng/commit/e350607f27b78094fb72422faf5394384ae6193b]
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----
- lib/logsource.c | 23 +++++++++++++++++------
- lib/logsource.h |  1 +
- 2 files changed, 18 insertions(+), 6 deletions(-)
-
-diff --git a/lib/logsource.c b/lib/logsource.c
-index 3f38b66e8..67e1c1570 100644
---- a/lib/logsource.c
-+++ b/lib/logsource.c
-@@ -633,7 +633,20 @@ log_source_queue(LogPipe *s, LogMessage *msg, const LogPathOptions *path_options
-                   evt_tag_printf("msg", "%p", msg));
- 
-   msg_set_context(NULL);
-+}
-+
-+static void
-+_initialize_window(LogSource *self, gint init_window_size)
-+{
-+  self->window_initialized = TRUE;
-+  window_size_counter_set(&self->window_size, init_window_size);
-+  self->full_window_size = init_window_size;
-+}
- 
-+static gboolean
-+_is_window_initialized(LogSource *self)
-+{
-+  return self->window_initialized;
- }
- 
- void
-@@ -645,11 +658,9 @@ log_source_set_options(LogSource *self, LogSourceOptions *options,
-    * configuration and we received a SIGHUP.  This means that opened
-    * connections will not have their window_size changed. */
- 
--  if ((gint)window_size_counter_get(&self->window_size, NULL) == -1)
--    {
--      window_size_counter_set(&self->window_size, options->init_window_size);
--      self->full_window_size = options->init_window_size;
--    }
-+  if (!_is_window_initialized(self))
-+    _initialize_window(self, options->init_window_size);
-+
-   self->options = options;
-   if (self->stats_id)
-     g_free(self->stats_id);
-@@ -679,7 +690,7 @@ log_source_init_instance(LogSource *self, GlobalConfig *cfg)
-   self->super.free_fn = log_source_free;
-   self->super.init = log_source_init;
-   self->super.deinit = log_source_deinit;
--  window_size_counter_set(&self->window_size, (gsize)-1);
-+  self->window_initialized = FALSE;
-   self->ack_tracker = NULL;
- }
- 
-diff --git a/lib/logsource.h b/lib/logsource.h
-index 370842efc..75d492604 100644
---- a/lib/logsource.h
-+++ b/lib/logsource.h
-@@ -71,6 +71,7 @@ struct _LogSource
-   gchar *stats_instance;
-   WindowSizeCounter window_size;
-   DynamicWindow dynamic_window;
-+  gboolean window_initialized;
-   /* full_window_size = static + dynamic */
-   gsize full_window_size;
-   atomic_gssize window_size_to_be_reclaimed;
--- 
-2.17.1
-
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 3490e4a0f7..e8b9f1fba4 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.23
+ at version: 3.24
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 5ace261569..62bc48a7af 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 fb36cfc1982831f74143b77a924ee79714745b5e2b3ff59d086d09a77d0acd38  syslog-ng-3.23.1.tar.gz
+sha256 d4d0a0357b452be96b69d6f741129275530d8f0451e35adc408ad5635059fa3d  syslog-ng-3.24.1.tar.gz
 sha256 835219c8ca76156e6337236d1bcb8e617c0b1c2783b4a8bc478e18a86743d607  COPYING
 sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index c31e71daf0..fc44777d16 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.23.1
+SYSLOG_NG_VERSION = 3.24.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
