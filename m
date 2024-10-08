Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C16CEFC54
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4C496066D;
	Tue,  8 Oct 2024 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez7A955lQV0K; Tue,  8 Oct 2024 20:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA6A6066E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA6A6066E;
	Tue,  8 Oct 2024 20:09:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4D961BF59E
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4BA28084B
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIDRbXBpJgWh for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A5480630
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A5480630
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6339085B07; Tue,  8 Oct 2024 20:09:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Oct 2024 22:07:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a05bb567647454690199d5cdb808d2530a45656c
X-Git-Newrev: 699b3c38fd5cd4de88b1df8d10c1ab45edcf2468
X-Patchwork-Hint: ignore
Message-Id: <20241008200948.6339085B07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/scanpypi: refactor setuptools
 handling to not use imp
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=699b3c38fd5cd4de88b1df8d10c1ab45edcf2468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The imp module is deprecated as of python verison 3.12.

Refactor setuptools handling to remove monkeypatching hack and
instead do pep517 metadata generation and dependency resolution.

This is effectively done by implementing the minimal neccesary
pep517 frontend hooks needed for dependency resolution in scanpypi.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Arnout: add license info]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/scanpypi | 178 ++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 105 insertions(+), 73 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 8765a98323..b6a2a92219 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -1,4 +1,5 @@
 #!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later AND MIT
 """
 
 Utility for building Buildroot packages for existing PyPI packages
@@ -18,8 +19,9 @@ import hashlib
 import re
 import textwrap
 import tempfile
-import imp
-from functools import wraps
+import traceback
+import importlib
+import importlib.metadata
 import six.moves.urllib.request
 import six.moves.urllib.error
 import six.moves.urllib.parse
@@ -93,32 +95,6 @@ def toml_load(f):
         raise ex
 
 
-def setup_decorator(func, method):
-    """
-    Decorator for distutils.core.setup and setuptools.setup.
-    Puts the arguments with which setup is called as a dict
-    Add key 'method' which should be either 'setuptools' or 'distutils'.
-
-    Keyword arguments:
-    func -- either setuptools.setup or distutils.core.setup
-    method -- either 'setuptools' or 'distutils'
-    """
-
-    @wraps(func)
-    def closure(*args, **kwargs):
-        # Any python packages calls its setup function to be installed.
-        # Argument 'name' of this setup function is the package's name
-        BuildrootPackage.setup_args[kwargs['name']] = kwargs
-        BuildrootPackage.setup_args[kwargs['name']]['method'] = method
-    return closure
-
-# monkey patch
-import setuptools  # noqa E402
-setuptools.setup = setup_decorator(setuptools.setup, 'setuptools')
-import distutils   # noqa E402
-distutils.core.setup = setup_decorator(setuptools.setup, 'distutils')
-
-
 def find_file_upper_case(filenames, path='./'):
     """
     List generator:
@@ -156,6 +132,48 @@ class DownloadFailed(Exception):
     pass
 
 
+# Copied and adapted from
+# https://github.com/pypa/pyproject-hooks/blob/v1.1.0/src/pyproject_hooks/_in_process/_in_process.py
+# SPDX-License-Identifier: MIT
+
+class BackendUnavailable(Exception):
+    """Raised if we cannot import the backend"""
+
+    def __init__(self, message, traceback=None):
+        super().__init__(message)
+        self.message = message
+        self.traceback = traceback
+
+
+class BackendPathFinder:
+    """Implements the MetaPathFinder interface to locate modules in ``backend-path``.
+
+    Since the environment provided by the frontend can contain all sorts of
+    MetaPathFinders, the only way to ensure the backend is loaded from the
+    right place is to prepend our own.
+    """
+
+    def __init__(self, backend_path, backend_module):
+        self.backend_path = backend_path
+        self.backend_module = backend_module
+        self.backend_parent, _, _ = backend_module.partition(".")
+
+    def find_spec(self, fullname, _path, _target=None):
+        if "." in fullname:
+            # Rely on importlib to find nested modules based on parent's path
+            return None
+
+        # Ignore other items in _path or sys.path and use backend_path instead:
+        spec = importlib.machinery.PathFinder.find_spec(fullname, path=self.backend_path)
+        if spec is None and fullname == self.backend_parent:
+            # According to the spec, the backend MUST be loaded from backend-path.
+            # Therefore, we can halt the import machinery and raise a clean error.
+            msg = f"Cannot find module {self.backend_module!r} in {self.backend_path!r}"
+            raise BackendUnavailable(msg)
+
+        return spec
+
+
 class BuildrootPackage():
     """This class's methods are not meant to be used individually please
     use them in the correct order:
@@ -191,6 +209,8 @@ class BuildrootPackage():
         self.metadata_url = None
         self.pkg_req = None
         self.setup_metadata = None
+        self.backend_path = None
+        self.build_backend = None
         self.tmp_extract = None
         self.used_url = None
         self.filename = None
@@ -339,32 +359,46 @@ class BuildrootPackage():
             folder=tmp_pkg,
             name=pkg_filename)
 
-    def load_setup(self):
+    def load_metadata(self):
         """
         Loads the corresponding setup and store its metadata
         """
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
-        sys.path.insert(0, self.tmp_extract)
         try:
-            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
-            imp.load_module('__main__', s_file, s_path, s_desc)
-            if self.metadata_name in self.setup_args:
-                pass
-            elif self.metadata_name.replace('_', '-') in self.setup_args:
-                self.metadata_name = self.metadata_name.replace('_', '-')
-            elif self.metadata_name.replace('-', '_') in self.setup_args:
-                self.metadata_name = self.metadata_name.replace('-', '_')
+            mod_path, _, obj_path = self.build_backend.partition(":")
+
+            path_finder = None
+            if self.backend_path:
+                path_finder = BackendPathFinder(self.backend_path, mod_path)
+                sys.meta_path.insert(0, path_finder)
+
+            try:
+                build_backend = importlib.import_module(self.build_backend)
+            except ImportError:
+                msg = f"Cannot import {mod_path!r}"
+                raise BackendUnavailable(msg, traceback.format_exc())
+
+            if obj_path:
+                for path_part in obj_path.split("."):
+                    build_backend = getattr(build_backend, path_part)
+
+            if path_finder:
+                sys.meta_path.remove(path_finder)
+
+            prepare_metadata_for_build_wheel = getattr(
+                build_backend, 'prepare_metadata_for_build_wheel'
+            )
+            metadata = prepare_metadata_for_build_wheel(self.tmp_extract)
             try:
-                self.setup_metadata = self.setup_args[self.metadata_name]
-            except KeyError:
-                # This means setup was not called
-                print('ERROR: Could not determine package metadata for {pkg}.\n'
-                      .format(pkg=self.real_name))
-                raise
+                dist = importlib.metadata.Distribution.at(metadata)
+                self.metadata_name = dist.name
+                if dist.requires:
+                    self.setup_metadata['install_requires'] = dist.requires
+            finally:
+                shutil.rmtree(metadata)
         finally:
             os.chdir(current_dir)
-            sys.path.remove(self.tmp_extract)
 
     def load_pyproject(self):
         """
@@ -372,28 +406,29 @@ class BuildrootPackage():
         """
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
-        sys.path.insert(0, self.tmp_extract)
         try:
             pyproject_data = toml_load('pyproject.toml')
-            try:
-                self.setup_metadata = pyproject_data.get('project', {})
-                self.metadata_name = self.setup_metadata.get('name', self.real_name)
-                build_system = pyproject_data.get('build-system', {})
-                build_backend = build_system.get('build-backend', None)
-                if build_backend and build_backend == 'flit_core.buildapi':
+            self.setup_metadata = pyproject_data.get('project', {})
+            self.metadata_name = self.setup_metadata.get('name', self.real_name)
+            build_system = pyproject_data.get('build-system', {})
+            build_backend = build_system.get('build-backend', None)
+            self.backend_path = build_system.get('backend-path', None)
+            if build_backend:
+                self.build_backend = build_backend
+                if build_backend == 'flit_core.buildapi':
                     self.setup_metadata['method'] = 'flit'
-                elif build_system.get('backend-path', None):
-                    self.setup_metadata['method'] = 'pep517'
+                elif build_backend == 'setuptools.build_meta':
+                    self.setup_metadata['method'] = 'setuptools'
                 else:
-                    self.setup_metadata['method'] = 'unknown'
-            except KeyError:
-                print('ERROR: Could not determine package metadata for {pkg}.\n'
-                      .format(pkg=self.real_name))
-                raise
+                    if self.backend_path:
+                        self.setup_metadata['method'] = 'pep517'
+                    else:
+                        self.setup_metadata['method'] = 'unknown'
         except FileNotFoundError:
-            raise
-        os.chdir(current_dir)
-        sys.path.remove(self.tmp_extract)
+            self.build_backend = 'setuptools.build_meta'
+            self.setup_metadata = {'method': 'setuptools'}
+        finally:
+            os.chdir(current_dir)
 
     def get_requirements(self, pkg_folder):
         """
@@ -406,7 +441,11 @@ class BuildrootPackage():
         if 'install_requires' not in self.setup_metadata:
             self.pkg_req = None
             return set()
-        self.pkg_req = self.setup_metadata['install_requires']
+        self.pkg_req = set()
+        extra_re = re.compile(r'''extra\s*==\s*("([^"]+)"|'([^']+)')''')
+        for req in self.setup_metadata['install_requires']:
+            if not extra_re.search(req):
+                self.pkg_req.add(req)
         self.pkg_req = [re.sub(r'([-.\w]+).*', r'\1', req)
                         for req in self.pkg_req]
 
@@ -753,11 +792,6 @@ def main():
                 package.fetch_package_info()
             except (six.moves.urllib.error.URLError, six.moves.urllib.error.HTTPError):
                 continue
-            if package.metadata_name.lower() == 'setuptools':
-                # setuptools imports itself, that does not work very well
-                # with the monkey path at the beginning
-                print('Error: setuptools cannot be built using scanPyPI')
-                continue
 
             try:
                 package.download_package()
@@ -777,17 +811,15 @@ def main():
                 continue
 
             # Loading the package install info from the package
+            package.load_pyproject()
             try:
-                package.load_setup()
+                package.load_metadata()
             except ImportError as err:
                 if 'buildutils' in str(err):
                     print('This package needs buildutils')
                     continue
                 else:
-                    try:
-                        package.load_pyproject()
-                    except Exception:
-                        raise
+                    raise
             except (AttributeError, KeyError) as error:
                 print('Error: Could not install package {pkg}: {error}'.format(
                     pkg=package.real_name, error=error))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
