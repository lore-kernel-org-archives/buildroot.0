Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA185CDD1B9
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 20:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91796811EF;
	Fri, 27 Sep 2024 20:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMjOgt2k4FFh; Fri, 27 Sep 2024 20:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD8DF80CC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD8DF80CC9;
	Fri, 27 Sep 2024 20:36:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E369E1BF302
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 20:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1DDE40CAF
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 20:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE9DJNZXQxy1 for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 20:36:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 616C740CA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 616C740CA7
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 616C740CA7
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 20:36:51 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a1a7c0f612so11798195ab.3
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 13:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727469410; x=1728074210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/b2AcCx9fUkVwEVI17JpsEA1q1pbLSwm0SYS28Z9Lok=;
 b=E6qczVKXe3ZDoyM+8G+bQILhJuvmRsIlS1mqzsZwWVKlYDqp/ZyREWSSQbpXUg5aeB
 M+npGjqgiC1auzlwSDhy6r9vOrSZtq8fCUl6h9duy+qDBWUkd+RlNfA50kBxVzgnQ2Ho
 L8BMezq8CZ6XTcHQgqzPne0mw9CdVUVmjOmN6uKiVJgNn24G6DG4ubuR9tAhG6ySKi45
 HJ6/ZUnFu0u3txB/NgdSETVzrkpU+W2TLvmN6Ui/YsBpxrvmwM9Yb452YFjWx6sLVMys
 7fXH5TxaK4e1sulZHM5hqpuzAIuDNZjxH7CGu0enneGecFmglqX5eTWZUS2NpeMkLyNR
 TH7Q==
X-Gm-Message-State: AOJu0YwB2ivh6ddNnnCRZROqOw71/fKy9Cga9Pk7G52yIOsSUEmd6yTz
 Fr7Uk/z00VVoVnz65tn7cnVPOid1h2IPFiV23a3QqLkjTGgXjGIyVTAmfUrN
X-Google-Smtp-Source: AGHT+IG4a20RwV/fBvgthREEtfOR1VLtE4mUKPi0S8z8eGJzuUKRzmW/67ZpJH01uZ3QiPmcV6c62g==
X-Received: by 2002:a05:6e02:13a5:b0:3a0:90c7:f0f with SMTP id
 e9e14a558f8ab-3a345181626mr46655935ab.15.1727469409956; 
 Fri, 27 Sep 2024 13:36:49 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344d82affsm7988925ab.25.2024.09.27.13.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 13:36:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 14:36:42 -0600
Message-Id: <20240927203642.355640-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727469410; x=1728074210; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/b2AcCx9fUkVwEVI17JpsEA1q1pbLSwm0SYS28Z9Lok=;
 b=T4Z8JGSa0Z/eWHB0Qo5XQ4plLKNW7n0RrqxupqqtpKFcvsEFAMWyQg8sfjFolzQunM
 JV4lDmRyFv/G0GsP3Nl+QFyfWSWMFUW1jbkwGy6d7Jr0wLtXZdVXFB9Kh+mEM/gn1n4F
 ak475ivgNpIgsQMy9jqwle0pz6RPmc5a87KTXR30CbuaCJQNG/zhsTmpKQHMhXbNwZH5
 ceQjZsHAqYVvQqY3EE0fbEPJ5bKVUKbUMFywxR+wIOdQOZdbUuLOYxHUJeMZxePASoAa
 M9x4SV1ja8NHRllmSb/OaVclqJnPglRcft8506tJEk8DfzOtLJm85D/XgaArz7gcBA8a
 zzug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T4Z8JGSa
Subject: [Buildroot] [PATCH v4 1/1] utils/scanpypi: refactor setuptools
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
Changes v3 -> v4:
  - rebase
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
index 8765a98323..430bb4757d 100755
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
-                # with the monkey path at the beginning
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
