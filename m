Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EBFC10DC1
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 21:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FB78466A;
	Thu, 30 Nov 2023 21:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20FB78466A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9ak5zB_29HR; Thu, 30 Nov 2023 21:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EEE08466B;
	Thu, 30 Nov 2023 21:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EEE08466B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 979761BF2F0
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 21:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7077441F9B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 21:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7077441F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2_MmDfiEoem for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 21:21:57 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2697041F96
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 21:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2697041F96
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-35d43f4eaa0so3072035ab.3
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 13:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701379315; x=1701984115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZAfKVqWqFJ3nnTmCawkRpXO1hLwTt2FzuaPyRJSED+c=;
 b=prJbxbBYil6vEn23yO7lnB3MxPB6yZAic4w10ucy4z4b/rm4VHT/2T0F2ROkixWxc0
 jD/EVSM2SVdWF8AqX4f/p8fy5SIRBj2J2IaLXsTX0ZTszRoJYC2UgwwiASqTBCVCzEMZ
 auCG9BlUy3oXR1aq3OVmvZ1I5KHslgTYVdFJkPoHsA0TiNNj6b42ttaBk45VcEUC7OLF
 xCZoWBlNpc0eE2ueuWSvk9tKqmc9ya5VBZCoTUwBrJjM/q0BJtd04B97KtNHrZTVlrEM
 rfkQOBrlHGEzwFQcc6Q25JTFz/lvPghPbYL9TGCgWGeuXa0o5dU3prEVmURk8NC4q0eG
 L7DQ==
X-Gm-Message-State: AOJu0Yyke+hcbmYfnC5wWwYhsJfbnclTFOXJgwZTx9bcI7VOVHxcNaO5
 6uzqpF9uMSHdBpSvrsAlilR+pQ2cBGs=
X-Google-Smtp-Source: AGHT+IGDH1EzBFobSQYMJtJjFJFMtzCU74GFWH/plsM2RyJnuHeg4J6wOpD8Z15n5Wx6m5VVz9TOgg==
X-Received: by 2002:a05:6e02:1be4:b0:35c:aeec:93fc with SMTP id
 y4-20020a056e021be400b0035caeec93fcmr18431241ilv.31.1701379315589; 
 Thu, 30 Nov 2023 13:21:55 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 x12-20020a02ac8c000000b0046678ba8d7asm496193jan.94.2023.11.30.13.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 13:21:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 14:21:53 -0700
Message-Id: <20231130212153.2299051-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701379315; x=1701984115; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAfKVqWqFJ3nnTmCawkRpXO1hLwTt2FzuaPyRJSED+c=;
 b=GfB9ZFVYf0EgkhtyByT9j6XMOWzWDX4QAnU5tNmPmNpVnHmVSfXH9k+GCyoCH0KQ8M
 MM5GwDI/kgkTvNLfhBm9UaoNyLnh/71/q4zGzqnhtVF7kdTlTzBMMDlE9tz0p0WEFRyO
 6mk9dEWUV58fsi240ikAJIxVN5xHRNgj+ujk48g7xUp2XPR+yPeAy3o28uzWoXKt0KGI
 LNEqN3NX/FKlvn8GQg+mkXLi5yaJPatU2EYb6q4xwOi7REHP84t0Pt15ZL4PVOYB1nGf
 RSni9PGbc6ZHObhQypMDZvnxIr58JwoIkuCc8QzajrB+sD2jvlvkmTD7CfkYuq7eYSy3
 Pxjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GfB9ZFVY
Subject: [Buildroot] [PATCH v2 1/1] utils/scanpypi: refactor setuptools
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

Invert setuptools/pyproject fallback ordering so that we try
parsing pyproject.toml files first.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - split out set comprehension changes
---
 utils/scanpypi | 88 +++++++++++++++++---------------------------------
 1 file changed, 29 insertions(+), 59 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 021c99a172..9de1b5d402 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -18,8 +18,8 @@ import hashlib
 import re
 import textwrap
 import tempfile
-import imp
-from functools import wraps
+import importlib
+from setuptools.build_meta import prepare_metadata_for_build_wheel
 import six.moves.urllib.request
 import six.moves.urllib.error
 import six.moves.urllib.parse
@@ -93,32 +93,6 @@ def toml_load(f):
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
@@ -345,26 +319,18 @@ class BuildrootPackage():
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
+                self.setup_metadata = {'method': 'setuptools'}
+                if dist.requires:
+                    self.setup_metadata['install_requires'] = dist.requires
+            finally:
+                shutil.rmtree(metadata)
         finally:
             os.chdir(current_dir)
-            sys.path.remove(self.tmp_extract)
 
     def load_pyproject(self):
         """
@@ -372,7 +338,6 @@ class BuildrootPackage():
         """
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
-        sys.path.insert(0, self.tmp_extract)
         try:
             pyproject_data = toml_load('pyproject.toml')
             try:
@@ -380,20 +345,25 @@ class BuildrootPackage():
                 self.metadata_name = self.setup_metadata.get('name', self.real_name)
                 build_system = pyproject_data.get('build-system', {})
                 build_backend = build_system.get('build-backend', None)
-                if build_backend and build_backend == 'flit_core.buildapi':
-                    self.setup_metadata['method'] = 'flit'
+                if build_backend:
+                    if build_backend == 'flit_core.buildapi':
+                        self.setup_metadata['method'] = 'flit'
+                    elif build_backend == 'setuptools.build_meta':
+                        raise Exception("handle setuptools")
+                    else:
+                        self.setup_metadata['method'] = 'unknown'
                 elif build_system.get('backend-path', None):
                     self.setup_metadata['method'] = 'pep517'
                 else:
-                    self.setup_metadata['method'] = 'unknown'
+                    raise Exception("handle setuptools")
             except KeyError:
                 print('ERROR: Could not determine package metadata for {pkg}.\n'
                       .format(pkg=self.real_name))
                 raise
         except FileNotFoundError:
             raise
-        os.chdir(current_dir)
-        sys.path.remove(self.tmp_extract)
+        finally:
+            os.chdir(current_dir)
 
     def get_requirements(self, pkg_folder):
         """
@@ -778,15 +748,15 @@ def main():
 
             # Loading the package install info from the package
             try:
-                package.load_setup()
-            except ImportError as err:
-                if 'buildutils' in str(err):
-                    print('This package needs buildutils')
-                    continue
-                else:
-                    try:
-                        package.load_pyproject()
-                    except Exception:
+                package.load_pyproject()
+            except Exception:
+                try:
+                    package.load_setup()
+                except ImportError as err:
+                    if 'buildutils' in str(err):
+                        print('This package needs buildutils')
+                        continue
+                    else:
                         raise
             except (AttributeError, KeyError) as error:
                 print('Error: Could not install package {pkg}: {error}'.format(
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
