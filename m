From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Jun 2020 23:55:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/circus: bump to version 0.16.1
Message-ID: <20200619215542.257729-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ame-async-argument-of-_create_circus.patch | 97 -------------------
 package/circus/circus.hash                    |  4 +-
 package/circus/circus.mk                      |  4 +-
 3 files changed, 4 insertions(+), 101 deletions(-)
 delete mode 100644 package/circus/0001-circus-tests-rename-async-argument-of-_create_circus.patch

diff --git a/package/circus/0001-circus-tests-rename-async-argument-of-_create_circus.patch b/package/circus/0001-circus-tests-rename-async-argument-of-_create_circus.patch
deleted file mode 100644
index 6af8d87254..0000000000
--- a/package/circus/0001-circus-tests-rename-async-argument-of-_create_circus.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 7fd0495cf3520508fb1cca301ad3d792b56b5656 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 8 Sep 2018 22:24:24 +0200
-Subject: [PATCH] circus/tests: rename async argument of _create_circus() to
- use_async
-
-In Python 3.7.0, 'async' is now a reserved keyword of the language, so
-it cannot be used as an method argument name. When used, it causes the
-following byte-compilation failure:
-
-Traceback (most recent call last):
-  File "/home/thomas/projets/buildroot/output/host/lib/python3.7/py_compile.py", line 136, in compile
-    _optimize=optimize)
-  File "<frozen importlib._bootstrap_external>", line 763, in source_to_code
-  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
-  File "usr/lib/python3.7/site-packages/circus/tests/support.py", line 210
-    debug=debug, async=True, **kw)
-                     ^
-SyntaxError: invalid syntax
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://github.com/circus-tent/circus/pull/1079
----
- circus/tests/support.py      | 6 +++---
- circus/tests/test_client.py  | 2 +-
- circus/tests/test_watcher.py | 4 ++--
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/circus/tests/support.py b/circus/tests/support.py
-index 38964cc..794a9c7 100644
---- a/circus/tests/support.py
-+++ b/circus/tests/support.py
-@@ -217,7 +217,7 @@ class TestCircus(AsyncTestCase):
-                       stdout_stream=None, debug=True, **kw):
-         testfile, arbiter = self._create_circus(
-             cmd, stdout_stream=stdout_stream,
--            debug=debug, async=True, **kw)
-+            debug=debug, use_async=True, **kw)
-         self.test_file = testfile
-         self.arbiter = arbiter
-         self.arbiters.append(arbiter)
-@@ -265,7 +265,7 @@ class TestCircus(AsyncTestCase):
- 
-     @classmethod
-     def _create_circus(cls, callable_path, plugins=None, stats=False,
--                       async=False, arbiter_kw=None, **kw):
-+                       use_async=False, arbiter_kw=None, **kw):
-         fd, testfile = mkstemp()
-         os.close(fd)
-         wdir = os.path.dirname(os.path.dirname(os.path.dirname(
-@@ -292,7 +292,7 @@ class TestCircus(AsyncTestCase):
-             arbiter_kw['stats_endpoint'] = "tcp://127.0.0.1:%d" % _gp()
-             arbiter_kw['statsd_close_outputs'] = not debug
- 
--        if async:
-+        if use_async:
-             arbiter_kw['background'] = False
-             arbiter_kw['loop'] = get_ioloop()
-         else:
-diff --git a/circus/tests/test_client.py b/circus/tests/test_client.py
-index 9a56a11..a0cfca0 100644
---- a/circus/tests/test_client.py
-+++ b/circus/tests/test_client.py
-@@ -90,7 +90,7 @@ class TestWithHook(TestCircus):
-         self.stream = QueueStream()
-         self.errstream = QueueStream()
-         dummy_process = 'circus.tests.support.run_process'
--        return self._create_circus(dummy_process, async=True,
-+        return self._create_circus(dummy_process, use_async=True,
-                                    stdout_stream={'stream': self.stream},
-                                    stderr_stream={'stream': self.errstream},
-                                    hooks=hooks)
-diff --git a/circus/tests/test_watcher.py b/circus/tests/test_watcher.py
-index 5dd857c..4299ed1 100644
---- a/circus/tests/test_watcher.py
-+++ b/circus/tests/test_watcher.py
-@@ -376,7 +376,7 @@ class TestWatcherHooks(TestCircus):
-         return self._create_circus(dummy_process,
-                                    stdout_stream=stdout_stream,
-                                    stderr_stream=stderr_stream,
--                                   hooks=hooks, debug=True, async=True)
-+                                   hooks=hooks, debug=True, use_async=True)
- 
-     @tornado.gen.coroutine
-     def _stop(self):
-@@ -601,7 +601,7 @@ class RespawnTest(TestCircus):
-     def test_not_respawning(self):
-         oneshot_process = 'circus.tests.test_watcher.oneshot_process'
-         testfile, arbiter = self._create_circus(oneshot_process,
--                                                respawn=False, async=True)
-+                                                respawn=False, use_async=True)
-         yield arbiter.start()
-         watcher = arbiter.watchers[-1]
-         try:
--- 
-2.14.4
-
diff --git a/package/circus/circus.hash b/package/circus/circus.hash
index 6391f0b5f7..b9e1ef2e68 100644
--- a/package/circus/circus.hash
+++ b/package/circus/circus.hash
@@ -1,4 +1,4 @@
 # md5, sha256 from https://pypi.org/pypi/circus/json
-md5	ed9082b5ac6ac5786721254b06315183  circus-0.15.0.tar.gz
-sha256	d1603cf4c4f620ce6593d3d2a67fad25bf0242183ea24110d8bb1c8079c55d1b  circus-0.15.0.tar.gz
+md5  9887ddafebef7475c08ff2c8e5cc2fad  circus-0.16.1.tar.gz
+sha256  dd7c011eb67785a1c96a4db94a56a22810c6ed608cebf301152dabc771654c5d  circus-0.16.1.tar.gz
 sha256  3df739c05a4eed7efdf4987142658d2a4f1243e5f08e72a5ecedac5749c92a49  LICENSE
diff --git a/package/circus/circus.mk b/package/circus/circus.mk
index d962651924..8f650de1e7 100644
--- a/package/circus/circus.mk
+++ b/package/circus/circus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CIRCUS_VERSION = 0.15.0
-CIRCUS_SITE = https://files.pythonhosted.org/packages/12/11/b72ee03c3d1fd09c39466954def2eae176d22a9fa5d9e6e8e6b90ee88f56
+CIRCUS_VERSION = 0.16.1
+CIRCUS_SITE = https://files.pythonhosted.org/packages/09/8a/44a0b6b35ecf5dcf22bf51e4bcf188ec9e7ab9dd4c14330ba1b8bea51102
 CIRCUS_SETUP_TYPE = setuptools
 CIRCUS_LICENSE = Apache-2.0
 CIRCUS_LICENSE_FILES = LICENSE
-- 
2.26.2
