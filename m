From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Jan 2017 17:14:03 +0000
Subject: [Buildroot] [PATCH] ruby: bump version to 2.4.0
Message-ID: <20170109171403.57632-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem addressed by 0001 patch has been fixed upstream and is that
fix is included in this release:
  https://github.com/ruby/ruby/commit/aa107497cd379b713eba8cecdb9a882bb1e0dd89

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...-process.c-fix-rb_spawn_process-for-nommu.patch | 34 ----------------------
 package/ruby/ruby.hash                             |  4 +--
 package/ruby/ruby.mk                               |  6 ++--
 3 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 package/ruby/0001-process.c-fix-rb_spawn_process-for-nommu.patch

diff --git a/package/ruby/0001-process.c-fix-rb_spawn_process-for-nommu.patch b/package/ruby/0001-process.c-fix-rb_spawn_process-for-nommu.patch
deleted file mode 100644
index 701c105..0000000
--- a/package/ruby/0001-process.c-fix-rb_spawn_process-for-nommu.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 24e6d5bcf791a5c3f46191e544731420ff8b1312 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 19 May 2016 11:10:02 -0300
-Subject: [PATCH] process.c: fix rb_spawn_process() for nommu
-
-rb_spawn_process() in process.c tries different solutions for when fork
-and/or spawnv are/aren't available.
-The last resort when both aren't is to use the system() call which
-stores the value in the status variable, which isn't declared.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: reported https://bugs.ruby-lang.org/issues/12398
-
- process.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/process.c b/process.c
-index e196639..40967f7 100644
---- a/process.c
-+++ b/process.c
-@@ -3897,6 +3897,9 @@ rb_spawn_process(struct rb_execarg *eargp, char *errmsg, size_t errmsg_buflen)
-     VALUE prog;
-     struct rb_execarg sarg;
- #endif
-+#if !defined HAVE_WORKING_FORK || !USE_SPAWNV
-+    int status;
-+#endif
- 
- #if defined HAVE_WORKING_FORK && !USE_SPAWNV
-     pid = rb_fork_async_signal_safe(NULL, rb_exec_atfork, eargp, eargp->redirect_fds, errmsg, errmsg_buflen);
--- 
-2.7.3
-
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 8182e2c..19722a3 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,2 +1,2 @@
-# From https://www.ruby-lang.org/en/news/2016/11/21/ruby-2-3-3-released/
-sha256 1a4fa8c2885734ba37b97ffdb4a19b8fba0e8982606db02d936e65bac07419dc  ruby-2.3.3.tar.xz
+# From https://www.ruby-lang.org/en/news/2016/12/25/ruby-2-4-0-released/
+sha256 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690  ruby-2.4.0.tar.xz
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index b8e03ac..4c6459b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 2.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
-RUBY_VERSION_EXT = 2.3.0
+RUBY_VERSION_MAJOR = 2.4
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION_EXT = 2.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.10.2
