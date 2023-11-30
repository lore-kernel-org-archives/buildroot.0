Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AF0C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 19:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79F941F3E;
	Thu, 30 Nov 2023 19:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E79F941F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0fNT0YD4rw7o; Thu, 30 Nov 2023 19:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0702D41F5A;
	Thu, 30 Nov 2023 19:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0702D41F5A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AD961BF40F
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 19:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40E138463A
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 19:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E138463A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dMQGdBOm6jIn for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 19:32:44 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C56084635
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 19:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C56084635
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7b34ee2a243so37860239f.0
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 11:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701372763; x=1701977563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oe/Q+PReuqGQOGEqqMdWslp67vteE42ESmgVSFfu/7c=;
 b=OqiwPWcjl3jK+Wl/TvnJrMIZraQcAvYdcRm5d+jkCOXXmKnNc4sisGrS8xSa8ws0cY
 S/RRaHC67lmt0+waSH322FvvzE9WOBoplbDjzgFBZRQ/1blQDAkZhTt/ilseN2C/81gi
 uRUIimjAM6gcwRYV0FoouLgsYCXchcSExFBaOfB58qeXV7JXLQJAInfDwHpehn34ydNP
 zm1ORJERfw0kiA3wlWMmbAbkQO05XyyazIae255H5eZZ8EQPIKuuFGbd/sW3IvNpdDeJ
 /MzxpORVNktmD8Exev6J7XvIR0quMUs7XRy72SN3abTQcUN4O9bZX4duOJfQUuaQ/h5W
 2VlQ==
X-Gm-Message-State: AOJu0YxJmlkO+AZ1nBatSEKgOU4+Qo8wmG5qD7ziRSYjfKPLIYqs4/+9
 nMBUpY967tJo7cYSMAwIciL1FnA9eis=
X-Google-Smtp-Source: AGHT+IH7qwNeiRX25/otNJldGs0Jyoz2TdHLmCALNh0eJbbfgUHcoov61X0VA9PWo9UTYewO0w5TOA==
X-Received: by 2002:a05:6602:2bfc:b0:7b3:fcb9:3532 with SMTP id
 d28-20020a0566022bfc00b007b3fcb93532mr5161011ioy.12.1701372762670; 
 Thu, 30 Nov 2023 11:32:42 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 t23-20020a05663801f700b0044d10eda3a8sm445277jaq.158.2023.11.30.11.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 11:32:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 12:32:34 -0700
Message-Id: <20231130193234.2275235-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701372763; x=1701977563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oe/Q+PReuqGQOGEqqMdWslp67vteE42ESmgVSFfu/7c=;
 b=MLUo+ui36K1zeHswDKvtGswJ0/rL9Zc5atBhR7mVLow6df60P+oAitHK8VLKRFqEv3
 poNdqH83Hy7o3HEX8skzRGQJqDHAjSsteyn+95httE+BiCCmwecaRKFZ1pBp8A/f2oRs
 LzI2SD5aZshwD1/R3/Wkx5TEQmmts+4sZMD8P7DdS74KMlc5LegSqiNwwFqZP5cWWctK
 eQD3eDkp8LJBH/QqyT2COUCpp+OpqeHCw06c/s42w2lMWDrpgIB4Nv4XYEGePXWLN+5a
 j729ESoRKKdZvSkHoFTDWi7ub/F739qGQdXbX3xw0BG77gDJRu65AKTGxxCMV7fMgjue
 IhJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MLUo+ui3
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: refactor setuptools
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

Use a set comprehension instead of a list comprehension for
generating pkg_req so that we don't get duplicates.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 92 +++++++++++++++++---------------------------------
 1 file changed, 31 insertions(+), 61 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 021c99a172..a1c2c2bd52 100755
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
@@ -411,8 +381,8 @@ class BuildrootPackage():
                         for req in self.pkg_req]
 
         # get rid of commented lines and also strip the package strings
-        self.pkg_req = [item.strip() for item in self.pkg_req
-                        if len(item) > 0 and item[0] != '#']
+        self.pkg_req = {item.strip() for item in self.pkg_req
+                        if len(item) > 0 and item[0] != '#'}
 
         req_not_found = self.pkg_req
         self.pkg_req = list(map(pkg_buildroot_name, self.pkg_req))
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
