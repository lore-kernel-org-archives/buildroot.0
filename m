Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464C3C25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D615F4010C;
	Sun, 12 May 2024 07:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWpfby79fS5e; Sun, 12 May 2024 07:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A93401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A93401CC;
	Sun, 12 May 2024 07:02:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBD01BF59F
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1487242222
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RpccNMnMxEM for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 626C242207
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626C242207
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 626C242207
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:02:22 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7e1d23df7f7so42488239f.2
 for <buildroot@buildroot.org>; Sun, 12 May 2024 00:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715497341; x=1716102141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aCjc8r0B/AsAcQGZ50zFabQEwOsrhyAWDz18SUmQEmw=;
 b=bL4E0d7TxTs0iUwoYPaQoEOMKIB9i4NvtQTPwLx7tl5wjwnlM3iDKVKqC0rSNnIj/t
 DJBvpXI22qEjrZzqMCnppAQoxWhuePgASefcfnmlQb5rhsck9xVgfRZiBPDs2Wgc2nGh
 cuCkGZBVcePHL52lZ586GODYWnxH/XfNRMRD8swxw/+25tyk083J6VDh8wRcvkN1LU4E
 TitpwVRtWVQlaaERyKhPIRHgh6De0YpLXVSGDuFoT/81AlKCJRKk5ma+IftRdn4uYAT9
 PSG9OYHeoBUgoeWR6WnnyUKMgM1P5P6I/GeLTzIx6jyJkP01jzk6GnxXTBnqw8y9Gxyy
 6b9Q==
X-Gm-Message-State: AOJu0Yyb/uFWwDuBpTlGEYjd0Y5VvQKa6EiG8CaqsAiiuOEJWEDcZzoE
 sHbgoGS5cd5dsbvAVcPhVUKx7B6OEQSqkh4OiGTB2+zw75UNjPqGQWoQGQ==
X-Google-Smtp-Source: AGHT+IHNSUthLPfApOztm5bPTzq6Z+v1yXkvrfneEhw28WAH+NWM0cQn0PmBftfv2F/Bz17r7pCMAA==
X-Received: by 2002:a05:6602:280d:b0:7da:1896:9e7b with SMTP id
 ca18e2360f4ac-7e1b5219aaemr744935239f.20.1715497340834; 
 Sun, 12 May 2024 00:02:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7e1cc43e540sm64300639f.30.2024.05.12.00.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 00:02:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 01:02:17 -0600
Message-Id: <20240512070217.3850799-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715497341; x=1716102141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aCjc8r0B/AsAcQGZ50zFabQEwOsrhyAWDz18SUmQEmw=;
 b=XtNewkKCeU9fV83V/eKAl+u2NYHA7zqVkj2+NPcJ7x4XaGLRjZ8YT1ZkwNuWp/OZBm
 4p17OPO6WJ6o8Sh4rcSqT0LJ8nXZDu62+kWLPR2Rb3jzSnMhaPzqg7Wuvvm+6Y6m6md/
 0TW7LTIPz8f0m3aGTjIe3mV08g11umaq8IeWjizOnvJRsBbRyVGKZ5+wrrJtWE4khrWv
 DCnxw9J8jGjHy0F2P4hR3nrBuLRqhMR54i2cE55ngFRN3WgNz1SLA0Ef9Kg/GFZpVul3
 Jl5+HmSlEfxBNXv+2OukzR0DPridlHk0VRyDty9amPx082vQXiXije3x49KzJCm0CfBm
 jgAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XtNewkKC
Subject: [Buildroot] [PATCH v3 1/1] utils/scanpypi: refactor setuptools
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The imp module is deprecated as of python verison 3.12.

Refactor setuptools handling to remove monkeypatching hack and
instead do pep517 metadata generation and dependency resolution.

This is effectively done by implementing the minimal neccesary
pep517 frontend hooks needed for dependency resolution in scanpypi.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - support pep517 dependency resolution for all build systems
  - replace setuptools specific load_setup with generic load_metadata
  - remove setuptools load_setup fallback exception hacks
Changes v1 -> v2:
  - split out set comprehension changes
---
 utils/scanpypi | 173 ++++++++++++++++++++++++++++---------------------
 1 file changed, 100 insertions(+), 73 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 5a58550145..f51f1192ca 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -18,8 +18,9 @@ import hashlib
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
@@ -93,32 +94,6 @@ def toml_load(f):
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
@@ -156,6 +131,44 @@ class DownloadFailed(Exception):
     pass
 
 
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
@@ -191,6 +204,8 @@ class BuildrootPackage():
         self.metadata_url = None
         self.pkg_req = None
         self.setup_metadata = None
+        self.backend_path = None
+        self.build_backend = None
         self.tmp_extract = None
         self.used_url = None
         self.filename = None
@@ -339,32 +354,46 @@ class BuildrootPackage():
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
@@ -372,28 +401,29 @@ class BuildrootPackage():
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
@@ -406,7 +436,11 @@ class BuildrootPackage():
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
 
@@ -753,11 +787,6 @@ def main():
                 package.fetch_package_info()
             except (six.moves.urllib.error.URLError, six.moves.urllib.error.HTTPError):
                 continue
-            if package.metadata_name.lower() == 'setuptools':
-                # setuptools imports itself, that does not work very well
-                # with the monkey path at the begining
-                print('Error: setuptools cannot be built using scanPyPI')
-                continue
 
             try:
                 package.download_package()
@@ -777,17 +806,15 @@ def main():
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
