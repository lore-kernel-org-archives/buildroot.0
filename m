Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F9DCAC5B8
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 00:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782F88148B;
	Wed,  1 Oct 2025 00:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7fcNKPsrLf2; Wed,  1 Oct 2025 00:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88A19813E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88A19813E7;
	Wed,  1 Oct 2025 00:20:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 789352A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 00:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5423361179
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 00:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqRvuBoPXsaQ for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 00:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A27E460BEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27E460BEA
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A27E460BEA
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 00:20:32 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-88703c873d5so250394239f.3
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 17:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759278031; x=1759882831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yhklmttDj+Ld9XpK6OhpnBxoB+XfTQuMxhus8IsWL9I=;
 b=X9k0H5Ql/TeQu9gtvOuAYlvOI6u/73dP/RS3rOcf2yy7ja01HLzCmcAKGVp728cXeo
 jTh9CvyBQZP9JDPdif7IklIBqTfvu2JYx2p3VIMsWk9K375wu4nln9vO4i0AgNOqdhSL
 tpGMkmNp0jsyDcRi1UY+J6UN3somNQue1JNKq0Kot0WQEZZcPNWuXxclIiqOIZ40mGT9
 Vk8lNGiMUoEzEv2jX33FkAtQbvUmPOzabhO0dnCwZSSitSny2jrBx1U/A4LFE+0AdPDA
 XuJs1AI8BhJfaheRITuhWl0sTYbmCdiP1NmN2PZmqwJBo6WIwlRihjJw7KSASubx2Gp5
 G0Hw==
X-Gm-Message-State: AOJu0Yzd9S7slNNK+gKEq3AcKp1fwXCI8q9yodewOvaZTTTiSqtooNMQ
 itRJCXEDEW4hTSjIVZpo3aY6LjPae1C7wzsxLnCURiTYN36PRHO4DZVKRyIT9HO/
X-Gm-Gg: ASbGncssxWE8Skzh2ShORGB78xZ7CTJska9DHPvkwgL05Li1SaajgdIsPMY1i8tVM7A
 eA5qQURDlm9x+1R4hT6jVkLYulIlh6d1dbgswSmYV3PKFkOimczlR5XzoplN9tlMWvNCB4eW3DD
 9YWOzSxnEx07vmJWhIY816i7jzzWjrh7sqMjjB4I7BF+185RdKzYN/Ii+ak1cNYVzEV/iYesJ/U
 mCjSA3cvZE9sQGS6MQaCpfwIPRU0IaMk0OqNC5F4PyC7a4qlu5qEGPQbe/QlNGZbxiWnFXk9f0T
 sii2kqHvEY44rFtfBDhNs0h3uiD/Psi0/0I3ge3rNNyqW2oy2Li79wED5vV6nfDUHXdePIShTIX
 JxtNjAM2W9ZswZR8lwx46ss0Vl3nme3RbgkmsAMSIGwu3IcilfHfRtsr2bEj01z197810ejs0/t
 cA+4J4y9kGapPpqfGqSz+nyfAw+u0nQEo=
X-Google-Smtp-Source: AGHT+IGIL8kfHJYjBF0fywZFvDD49ZOVrMPHaK57X2PEV4W/kwKAPgrKO4bP3rXNXH46WHtipxh4SA==
X-Received: by 2002:a5d:8177:0:b0:887:62d2:4622 with SMTP id
 ca18e2360f4ac-937acc0b6d8mr191286839f.11.1759278030713; 
 Tue, 30 Sep 2025 17:20:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-9040bed286dsm573312339f.17.2025.09.30.17.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 17:20:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 18:20:04 -0600
Message-ID: <20251001002004.3178942-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759278031; x=1759882831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yhklmttDj+Ld9XpK6OhpnBxoB+XfTQuMxhus8IsWL9I=;
 b=lsEBHX3q94xaPLQQoNTLFpYjxt+dL+hm+q0wnaM1vUmaL+qKfF1C4wI7fdxlC3n21V
 GMuvHlqkwpIuc0VJJrMWMVekn9D4/WjGBgxz3KdH7pLcfFX6zWp7o6ukwcgZwAW+scu/
 WdypKzqJAHGoP9bd1snJMg8PCOUqJYO4Lanl4CIUf7ctaZjGS90ysadFg6p4dakyeb8/
 yGLSwH6Gt3O/I/tDiE4U91idUBUptO9cJMTsBxLNOE/bMGQSdmnwp4GKoISKJyqJnXqJ
 o6heLiIBSZQx50GYbLphPEkcjHmoNmPicPSzlQRtb9abHWiDGchfcz8terHKfvrTGVg+
 Ob9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lsEBHX3q
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: refactor to improve package
 updates and error handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

This patch refactors the scanpypi utility to better handle package
updates and metadata loading failures. The main improvements are:

Add structured classes for file management:
- Introduce Makefile class to parse, update, and write .mk files
  using property-based getters/setters for VERSION, SOURCE, SITE,
  SETUP_TYPE, LICENSE, and LICENSE_FILES variables
- Introduce Hash class to manage .hash files with support for
  preserving license file order when no files are added/removed
- Introduce ConfigIn class to manage Config.in files with dependency
  tracking that preserves non-PyPI dependencies while updating PyPI
  package dependencies

Improve error handling and graceful degradation:
- Catch BackendUnavailable and ValueError exceptions during metadata
  loading and continue processing with limited information instead of
  failing
- Print full stack traces for metadata load failures to aid debugging
- Skip dependency detection when metadata loading fails but still
  create package files (.mk, .hash, Config.in)

Enhance license file handling:
- Detect when license files are unchanged by comparing file existence
  and hashes, preserving existing license information when unchanged
- Skip license file re-processing when files and hashes match
- Preserve license file order in .hash files when the set of license
  files remains the same

Update Config.in handling:
- Create Config.in files if they don't exist
- Update dependencies in existing Config.in files when new
  dependencies are detected
- Preserve manually added non-PyPI package dependencies when updating

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 921 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 672 insertions(+), 249 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 61879e39d4..a2e256507c 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -14,7 +14,6 @@ import os
 import shutil
 import tarfile
 import zipfile
-import errno
 import hashlib
 import re
 import textwrap
@@ -26,6 +25,7 @@ import urllib.request
 import urllib.error
 import urllib.parse
 import io
+from pathlib import Path
 
 BUF_SIZE = 65536
 
@@ -99,10 +99,12 @@ def find_file_upper_case(filenames, path='./'):
     filenames -- List of filenames to be found
     path -- Path to the directory to search
     """
-    for root, dirs, files in os.walk(path):
+    search_path = Path(path)
+    for root, dirs, files in os.walk(search_path):
+        root_path = Path(root)
         for file in files:
             if file.upper() in filenames:
-                yield (os.path.join(root, file))
+                yield str(root_path / file)
 
 
 def pkg_buildroot_name(pkg_name):
@@ -168,6 +170,511 @@ class BackendPathFinder:
         return spec
 
 
+class Makefile:
+    """Manages parsing, updating, and writing of Buildroot .mk files"""
+
+    # Standard variable ordering for Buildroot makefiles
+    VARIABLE_ORDER = [
+        'VERSION',
+        'SOURCE',
+        'SITE',
+        'SETUP_TYPE',
+        'LICENSE',
+        'LICENSE_FILES',
+        'CPE_ID_VENDOR',
+        'CPE_ID_PRODUCT',
+        'DEPENDENCIES',
+    ]
+
+    def __init__(self, pkg_dir, pkg_name, mk_name):
+        self.pkg_dir = Path(pkg_dir)
+        self.pkg_name = pkg_name
+        self.mk_name = mk_name
+        self.mk_path = self.pkg_dir / '{name}.mk'.format(name=pkg_name)
+        self.lines = []
+        self.is_host = False
+        self.is_target = False
+
+    def exists(self):
+        return self.mk_path.is_file()
+
+    def load(self):
+        """
+        Load existing .mk file into memory
+        """
+        if not self.mk_path.is_file():
+            self._create_new()
+            return
+
+        with self.mk_path.open('r') as f:
+            self.lines = f.readlines()
+
+        for line in self.lines:
+            if '$(eval $(host-python-package))' in line:
+                self.is_host = True
+            if '$(eval $(python-package))' in line:
+                self.is_target = True
+
+    def _create_new(self):
+        """
+        Initialize lines for a new makefile with proper structure
+        """
+        self.lines = []
+        self.lines.append('#' * 80 + '\n')
+        self.lines.append('#\n')
+        self.lines.append('# {name}\n'.format(name=self.pkg_name))
+        self.lines.append('#\n')
+        self.lines.append('#' * 80 + '\n')
+        self.lines.append('\n')
+        self.lines.append('\n')
+        self.lines.append('$(eval $(python-package))\n')
+        self.is_target = True
+
+    def _find_variable_line(self, var_name):
+        """
+        Find the line index for a variable, or None if not found
+        """
+        pattern = r'^{prefix}_{var}\s*='.format(
+            prefix=re.escape(self.mk_name),
+            var=re.escape(var_name))
+        for i, line in enumerate(self.lines):
+            if re.match(pattern, line.strip()):
+                return i
+        return None
+
+    def _get_variable(self, var_name):
+        """
+        Get the value of a variable
+        """
+        idx = self._find_variable_line(var_name)
+        if idx is None:
+            return None
+        match = re.match(
+            r'^{prefix}_{var}\s*=\s*(.*)$'.format(
+                prefix=re.escape(self.mk_name),
+                var=re.escape(var_name)),
+            self.lines[idx].strip())
+        return match.group(1) if match else None
+
+    def _find_insertion_point(self, var_name):
+        """
+        Find the appropriate insertion point for a new variable.
+        Uses VARIABLE_ORDER to determine placement.
+        """
+        # Find where this variable should go in the ordering
+        try:
+            var_order_idx = self.VARIABLE_ORDER.index(var_name)
+        except ValueError:
+            for i in range(len(self.lines) - 1, -1, -1):
+                if self.lines[i].strip().startswith('$(eval'):
+                    return i
+            return len(self.lines)
+
+        for check_idx in range(var_order_idx - 1, -1, -1):
+            check_var = self.VARIABLE_ORDER[check_idx]
+            existing_idx = self._find_variable_line(check_var)
+            if existing_idx is not None:
+                return existing_idx + 1
+
+        for i, line in enumerate(self.lines):
+            stripped = line.strip()
+            if stripped and not stripped.startswith('#'):
+                return i
+
+        for i in range(len(self.lines) - 1, -1, -1):
+            if self.lines[i].strip().startswith('$(eval'):
+                return i
+        return len(self.lines)
+
+    def _set_variable(self, var_name, value):
+        """
+        Set a variable value, updating in place if exists
+        """
+        line = '{prefix}_{var} = {value}\n'.format(
+            prefix=self.mk_name,
+            var=var_name,
+            value=value)
+
+        idx = self._find_variable_line(var_name)
+        if idx is not None:
+            self.lines[idx] = line
+        else:
+            insert_idx = self._find_insertion_point(var_name)
+            self.lines.insert(insert_idx, line)
+
+    @property
+    def version(self):
+        return self._get_variable('VERSION')
+
+    @version.setter
+    def version(self, value):
+        self._set_variable('VERSION', value)
+
+    @property
+    def source(self):
+        return self._get_variable('SOURCE')
+
+    @source.setter
+    def source(self, value):
+        self._set_variable('SOURCE', value)
+
+    @property
+    def site(self):
+        return self._get_variable('SITE')
+
+    @site.setter
+    def site(self, value):
+        self._set_variable('SITE', value)
+
+    @property
+    def setup_type(self):
+        return self._get_variable('SETUP_TYPE')
+
+    @setup_type.setter
+    def setup_type(self, value):
+        self._set_variable('SETUP_TYPE', value)
+
+    @property
+    def license(self):
+        return self._get_variable('LICENSE')
+
+    @license.setter
+    def license(self, value):
+        self._set_variable('LICENSE', value)
+
+    @property
+    def license_files(self):
+        return self._get_variable('LICENSE_FILES')
+
+    @license_files.setter
+    def license_files(self, value):
+        self._set_variable('LICENSE_FILES', value)
+
+    def save(self):
+        """
+        Write the makefile to disk
+        """
+        with self.mk_path.open('w') as f:
+            f.writelines(self.lines)
+
+        action = 'Updating' if self.exists() else 'Creating'
+        print('{action} {file}...'.format(action=action, file=self.mk_path))
+
+
+class ConfigIn:
+    """Manages parsing, updating, and writing of Buildroot Config.in files"""
+
+    def __init__(self, pkg_dir, pkg_name, mk_name):
+        self.pkg_dir = Path(pkg_dir)
+        self.pkg_name = pkg_name
+        self.mk_name = mk_name
+        self.config_path = self.pkg_dir / 'Config.in'
+        self.lines = []
+
+    def exists(self):
+        return self.config_path.is_file()
+
+    def load(self):
+        """
+        Load existing Config.in file into memory
+        """
+        if not self.config_path.is_file():
+            return
+
+        with self.config_path.open('r') as f:
+            self.lines = f.readlines()
+
+    def _create_new(self, buildroot_name, mk_name):
+        """
+        Initialize lines for a new Config.in file
+        """
+        self.lines = []
+        config_line = 'config BR2_PACKAGE_{name}\n'.format(name=mk_name)
+        self.lines.append(config_line)
+        bool_line = '\tbool "{name}"\n'.format(name=buildroot_name)
+        self.lines.append(bool_line)
+        self.lines.append('\thelp\n')
+        self.lines.append('\t  PLACEHOLDER\n')
+
+    def _find_section_indices(self):
+        """
+        Find the indices of key sections in Config.in
+        """
+        config_idx = None
+        bool_idx = None
+        help_idx = None
+
+        for i, line in enumerate(self.lines):
+            stripped = line.strip()
+            if stripped.startswith('config BR2_PACKAGE_'):
+                config_idx = i
+            elif config_idx is not None and stripped.startswith('bool '):
+                bool_idx = i
+            elif bool_idx is not None and stripped.startswith('help'):
+                help_idx = i
+                break
+
+        return config_idx, bool_idx, help_idx
+
+    @property
+    def dependencies(self):
+        """
+        Get list of dependency package names
+        """
+        deps = []
+        config_idx, bool_idx, help_idx = self._find_section_indices()
+
+        if bool_idx is None or help_idx is None:
+            return deps
+
+        for i in range(bool_idx + 1, help_idx):
+            stripped = self.lines[i].strip()
+            if stripped.startswith('select BR2_PACKAGE_'):
+                dep_match = re.match(r'select\s+BR2_PACKAGE_(\S+)', stripped)
+                if dep_match:
+                    dep_name = dep_match.group(1).lower().replace('_', '-')
+                    deps.append(dep_name)
+
+        return deps
+
+    @dependencies.setter
+    def dependencies(self, pkg_req):
+        """
+        Set dependencies, replacing existing ones while preserving non-PyPI deps
+        """
+        if not self.lines:
+            return
+
+        config_idx, bool_idx, help_idx = self._find_section_indices()
+
+        if bool_idx is None or help_idx is None:
+            return
+
+        non_pypi_deps = []
+        for i in range(bool_idx + 1, help_idx):
+            stripped = self.lines[i].strip()
+            if stripped.startswith('select BR2_PACKAGE_'):
+                dep_match = re.match(r'select\s+(BR2_PACKAGE_\S+)', stripped)
+                if dep_match:
+                    dep_name = dep_match.group(1)
+                    if not dep_name.startswith('BR2_PACKAGE_PYTHON_'):
+                        non_pypi_deps.append(self.lines[i])
+
+        new_lines = []
+        new_lines.extend(self.lines[:bool_idx + 1])
+
+        for i in range(bool_idx + 1, help_idx):
+            if not self.lines[i].strip().startswith('select BR2_PACKAGE_'):
+                new_lines.append(self.lines[i])
+
+        if pkg_req:
+            sorted_deps = sorted(pkg_req)
+            for dep in sorted_deps:
+                dep_line = '\tselect BR2_PACKAGE_{req} # runtime\n'.format(
+                    req=dep.upper().replace('-', '_'))
+                new_lines.append(dep_line)
+
+        new_lines.extend(non_pypi_deps)
+
+        new_lines.extend(self.lines[help_idx:])
+        self.lines = new_lines
+
+    @property
+    def help_text(self):
+        """
+        Get the help text lines
+        """
+        config_idx, bool_idx, help_idx = self._find_section_indices()
+
+        if help_idx is None:
+            return []
+
+        help_lines = []
+        for i in range(help_idx + 1, len(self.lines)):
+            line = self.lines[i]
+            if line.startswith('\t  '):
+                help_lines.append(line[4:].rstrip('\n'))
+
+        return help_lines
+
+    @help_text.setter
+    def help_text(self, metadata):
+        """
+        Set the help text from metadata
+        """
+        config_idx, bool_idx, help_idx = self._find_section_indices()
+
+        if help_idx is None:
+            return
+
+        md_info = metadata['info']
+        help_lines = textwrap.wrap(md_info['summary'], 62,
+                                   initial_indent='\t  ',
+                                   subsequent_indent='\t  ')
+
+        if help_lines and help_lines[-1][-1] != '.':
+            help_lines[-1] += '.'
+
+        home_page = md_info.get('home_page', None)
+        if not home_page:
+            project_urls = md_info.get('project_urls', None)
+            if project_urls:
+                home_page = project_urls.get('Homepage', None)
+
+        if home_page:
+            help_lines.append('')
+            help_lines.append('\t  ' + home_page)
+
+        help_lines = [x + '\n' for x in help_lines]
+
+        new_lines = self.lines[:help_idx + 1]
+        new_lines.extend(help_lines)
+        self.lines = new_lines
+
+    def save(self):
+        """
+        Write Config.in file to disk
+        """
+        with self.config_path.open('w') as f:
+            f.writelines(self.lines)
+
+        action = 'Updating' if self.exists() else 'Creating'
+        print('{action} {file}...'.format(action=action, file=self.config_path))
+
+
+class Hash:
+    """Manages parsing, updating, and writing of Buildroot .hash files"""
+
+    def __init__(self, pkg_dir, pkg_name):
+        self.pkg_dir = Path(pkg_dir)
+        self.pkg_name = pkg_name
+        self.hash_path = self.pkg_dir / '{name}.hash'.format(name=pkg_name)
+        self.lines = []
+        self.package_hashes = {}
+        self.license_hashes = {}
+        self.license_order = []
+
+    def exists(self):
+        return self.hash_path.is_file()
+
+    def load(self):
+        """
+        Load existing .hash file into memory
+        """
+        if not self.hash_path.is_file():
+            self._create_new()
+            return
+
+        with self.hash_path.open('r') as f:
+            self.lines = f.readlines()
+
+        in_license_section = False
+        for line in self.lines:
+            if 'Locally computed' in line:
+                in_license_section = True
+                continue
+
+            stripped = line.strip()
+            if not stripped or stripped.startswith('#'):
+                continue
+
+            parts = stripped.split()
+            if len(parts) >= 3:
+                method, digest, filename = parts[0], parts[1], parts[2]
+                if in_license_section:
+                    self.license_hashes[filename] = (method, digest)
+                    if filename not in self.license_order:
+                        self.license_order.append(filename)
+                else:
+                    if filename not in self.package_hashes:
+                        self.package_hashes[filename] = {}
+                    self.package_hashes[filename][method] = digest
+
+    def _create_new(self):
+        """
+        Initialize lines for a new hash file
+        """
+        self.lines = []
+
+    def set_package_hash(self, filename, method, digest):
+        """
+        Set a package hash (md5 or sha256 from PyPI)
+        """
+        if filename not in self.package_hashes:
+            self.package_hashes[filename] = {}
+        self.package_hashes[filename][method] = digest
+
+    def set_license_hash(self, filename, method, digest):
+        """
+        Set a license file hash
+        """
+        self.license_hashes[filename] = (method, digest)
+
+    def compute_license_hash(self, license_file, tmp_extract):
+        """
+        Compute sha256 hash for a license file
+        """
+        sha256 = hashlib.sha256()
+        with open(license_file, 'rb') as f:
+            while True:
+                data = f.read(BUF_SIZE)
+                if not data:
+                    break
+                sha256.update(data)
+
+        filename = str(Path(license_file).relative_to(tmp_extract))
+        self.license_hashes[filename] = ('sha256', sha256.hexdigest())
+        if filename not in self.license_order:
+            self.license_order.append(filename)
+
+    def save(self, metadata_url=None):
+        """
+        Write the hash file to disk
+        """
+        lines = []
+
+        if self.package_hashes:
+            if metadata_url:
+                lines.append('# md5, sha256 from {url}\n'.format(url=metadata_url))
+
+            latest_filename = sorted(self.package_hashes.keys())[-1]
+            hashes = self.package_hashes[latest_filename]
+            if 'md5' in hashes:
+                lines.append('{method}  {digest}  {filename}\n'.format(
+                    method='md5',
+                    digest=hashes['md5'],
+                    filename=latest_filename))
+            if 'sha256' in hashes:
+                lines.append('{method}  {digest}  {filename}\n'.format(
+                    method='sha256',
+                    digest=hashes['sha256'],
+                    filename=latest_filename))
+
+        if self.license_hashes:
+            lines.append('# Locally computed sha256 checksums\n')
+            current_files = set(self.license_hashes.keys())
+            original_files = set(self.license_order)
+            files_changed = (current_files != original_files)
+
+            if self.license_order and not files_changed:
+                files_to_write = self.license_order
+            else:
+                files_to_write = sorted(self.license_hashes.keys())
+
+            for filename in files_to_write:
+                method, digest = self.license_hashes[filename]
+                lines.append('{method}  {digest}  {filename}\n'.format(
+                    method=method,
+                    digest=digest,
+                    filename=filename))
+
+        with self.hash_path.open('w') as f:
+            f.writelines(lines)
+
+        action = 'Updating' if self.exists() else 'Creating'
+        print('{action} {file}...'.format(action=action, file=self.hash_path))
+
+
 class BuildrootPackage():
     """This class's methods are not meant to be used individually please
     use them in the correct order:
@@ -194,7 +701,7 @@ class BuildrootPackage():
     def __init__(self, real_name, pkg_folder):
         self.real_name = real_name
         self.buildroot_name = pkg_buildroot_name(self.real_name)
-        self.pkg_dir = os.path.join(pkg_folder, self.buildroot_name)
+        self.pkg_dir = Path(pkg_folder) / self.buildroot_name
         self.mk_name = self.buildroot_name.upper().replace('-', '_')
         self.as_string = None
         self.md5_sum = None
@@ -211,6 +718,10 @@ class BuildrootPackage():
         self.url = None
         self.version = None
         self.license_files = []
+        self.skip_license_update = False
+        self.makefile = Makefile(self.pkg_dir, self.buildroot_name, self.mk_name)
+        self.hashfile = Hash(self.pkg_dir, self.buildroot_name)
+        self.config_in = ConfigIn(self.pkg_dir, self.buildroot_name, self.mk_name)
 
     def fetch_package_info(self):
         """
@@ -312,43 +823,35 @@ class BuildrootPackage():
         tmp_path -- directory where you want the package to be extracted
         """
         as_file = io.BytesIO(self.as_string)
+        tmp_path = Path(tmp_path)
+        tmp_pkg = tmp_path / self.buildroot_name
+
         if self.filename[-3:] == 'zip':
             with zipfile.ZipFile(as_file) as as_zipfile:
-                tmp_pkg = os.path.join(tmp_path, self.buildroot_name)
                 try:
-                    os.makedirs(tmp_pkg)
-                except OSError as exception:
-                    if exception.errno != errno.EEXIST:
-                        print("ERROR: ", exception.strerror, file=sys.stderr)
-                        return
-                    print('WARNING:', exception.strerror, file=sys.stderr)
+                    tmp_pkg.mkdir(parents=True, exist_ok=False)
+                except FileExistsError:
+                    print('WARNING: Directory exists', file=sys.stderr)
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
-                    os.makedirs(tmp_pkg)
+                    tmp_pkg.mkdir(parents=True)
                 self.check_archive(as_zipfile.namelist())
                 as_zipfile.extractall(tmp_pkg)
                 pkg_filename = self.filename.split(".zip")[0]
         else:
             with tarfile.open(fileobj=as_file) as as_tarfile:
-                tmp_pkg = os.path.join(tmp_path, self.buildroot_name)
                 try:
-                    os.makedirs(tmp_pkg)
-                except OSError as exception:
-                    if exception.errno != errno.EEXIST:
-                        print("ERROR: ", exception.strerror, file=sys.stderr)
-                        return
-                    print('WARNING:', exception.strerror, file=sys.stderr)
+                    tmp_pkg.mkdir(parents=True, exist_ok=False)
+                except FileExistsError:
+                    print('WARNING: Directory exists', file=sys.stderr)
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
-                    os.makedirs(tmp_pkg)
+                    tmp_pkg.mkdir(parents=True)
                 self.check_archive(as_tarfile.getnames())
                 as_tarfile.extractall(tmp_pkg)
                 pkg_filename = self.filename.split(".tar")[0]
 
-        tmp_extract = '{folder}/{name}'
-        self.tmp_extract = tmp_extract.format(
-            folder=tmp_pkg,
-            name=pkg_filename)
+        self.tmp_extract = str(tmp_pkg / pkg_filename)
 
     def load_metadata(self):
         """
@@ -428,6 +931,12 @@ class BuildrootPackage():
         finally:
             os.chdir(current_dir)
 
+    def package_exists(self):
+        """
+        Check if the package already exists
+        """
+        return self.pkg_dir.is_dir() and self.makefile.exists()
+
     def get_requirements(self, pkg_folder):
         """
         Retrieve dependencies from the metadata found in the setup.py script of
@@ -457,74 +966,13 @@ class BuildrootPackage():
         # pkg_tuples is a list of tuples that looks like
         # ('werkzeug','python-werkzeug') because I need both when checking if
         # dependencies already exist or are already in the download list
+        pkg_folder_path = Path(pkg_folder)
         req_not_found = set(
             pkg[0] for pkg in pkg_tuples
-            if not os.path.isdir(pkg[1])
+            if not (pkg_folder_path / pkg[1]).is_dir()
             )
         return req_not_found
 
-    def __create_mk_header(self):
-        """
-        Create the header of the <package_name>.mk file
-        """
-        header = ['#' * 80 + '\n']
-        header.append('#\n')
-        header.append('# {name}\n'.format(name=self.buildroot_name))
-        header.append('#\n')
-        header.append('#' * 80 + '\n')
-        header.append('\n')
-        return header
-
-    def __create_mk_download_info(self):
-        """
-        Create the lines referring to the download information of the
-        <package_name>.mk file
-        """
-        lines = []
-        version_line = '{name}_VERSION = {version}\n'.format(
-            name=self.mk_name,
-            version=self.version)
-        lines.append(version_line)
-
-        if self.buildroot_name != self.real_name:
-            targz = self.filename.replace(
-                self.version,
-                '$({name}_VERSION)'.format(name=self.mk_name))
-            targz_line = '{name}_SOURCE = {filename}\n'.format(
-                name=self.mk_name,
-                filename=targz)
-            lines.append(targz_line)
-
-        if self.filename not in self.url:
-            # Sometimes the filename is in the url, sometimes it's not
-            site_url = self.url
-        else:
-            site_url = self.url[:self.url.find(self.filename)]
-        site_line = '{name}_SITE = {url}'.format(name=self.mk_name,
-                                                 url=site_url)
-        site_line = site_line.rstrip('/') + '\n'
-        lines.append(site_line)
-        return lines
-
-    def __create_mk_setup(self):
-        """
-        Create the line referring to the setup method of the package of the
-        <package_name>.mk file
-
-        There are two things you can use to make an installer
-        for a python package: distutils or setuptools
-        distutils comes with python but does not support dependencies.
-        distutils is mostly still there for backward support.
-        setuptools is what smart people use,
-        but it is not shipped with python :(
-        """
-        lines = []
-        setup_type_line = '{name}_SETUP_TYPE = {method}\n'.format(
-            name=self.mk_name,
-            method=self.setup_metadata['method'])
-        lines.append(setup_type_line)
-        return lines
-
     def __get_license_names(self, license_files):
         """
         Try to determine the related license name.
@@ -591,167 +1039,131 @@ class BuildrootPackage():
 
         return license_line
 
-    def __create_mk_license(self):
-        """
-        Create the lines referring to the package's license information of the
-        <package_name>.mk file
-
-        The license's files are found by searching the package (case insensitive)
-        for files named license, license.txt etc. If more than one license file
-        is found, the user is asked to select which ones he wants to use.
-        """
-        lines = []
-
+    def __find_license_files(self):
         filenames = ['LICENCE', 'LICENSE', 'LICENSE.MD', 'LICENSE.RST',
                      'LICENCE.TXT', 'LICENSE.TXT', 'COPYING', 'COPYING.TXT']
         self.license_files = list(find_file_upper_case(filenames, self.tmp_extract))
 
-        lines.append(self.__get_license_names(self.license_files))
-
-        license_files = [license.replace(self.tmp_extract, '')[1:]
-                         for license in self.license_files]
-        if len(license_files) > 0:
-            if len(license_files) > 1:
-                print('More than one file found for license:',
-                      ', '.join(license_files))
-            license_files = [filename
-                             for index, filename in enumerate(license_files)]
-            license_file_line = ('{name}_LICENSE_FILES ='
-                                 ' {files}\n'.format(
-                                     name=self.mk_name,
-                                     files=' '.join(license_files)))
-            lines.append(license_file_line)
-        else:
-            print('WARNING: No license file found,'
-                  ' please specify it manually afterwards')
-            license_file_line = '# No license file found\n'
-
-        return lines
+        if len(self.license_files) > 1:
+            license_names = [Path(lic).relative_to(self.tmp_extract) for lic in self.license_files]
+            print('More than one file found for license:', ', '.join(str(name) for name in license_names))
+        elif not self.license_files:
+            print('WARNING: No license file found, please specify it manually afterwards')
 
-    def __create_mk_requirements(self):
+    def __check_license_files_unchanged(self):
         """
-        Create the lines referring to the dependencies of the of the
-        <package_name>.mk file
-
-        Keyword Arguments:
-        pkg_name -- name of the package
-        pkg_req -- dependencies of the package
+        Check if all existing license files still exist and their hashes match
         """
-        lines = []
-        dependencies_line = ('{name}_DEPENDENCIES ='
-                             ' {reqs}\n'.format(
-                                 name=self.mk_name,
-                                 reqs=' '.join(self.pkg_req)))
-        lines.append(dependencies_line)
-        return lines
+        if not self.package_exists():
+            return False
 
-    def create_package_mk(self):
-        """
-        Create the lines corresponding to the <package_name>.mk file
-        """
-        pkg_mk = '{name}.mk'.format(name=self.buildroot_name)
-        path_to_mk = os.path.join(self.pkg_dir, pkg_mk)
-        print('Creating {file}...'.format(file=path_to_mk))
-        lines = self.__create_mk_header()
-        lines += self.__create_mk_download_info()
-        lines += self.__create_mk_setup()
-        lines += self.__create_mk_license()
+        self.makefile.load()
+        self.hashfile.load()
 
-        lines.append('\n')
-        lines.append('$(eval $(python-package))')
-        lines.append('\n')
-        with open(path_to_mk, 'w') as mk_file:
-            mk_file.writelines(lines)
+        existing_license_files = self.makefile.license_files
+        if not existing_license_files:
+            return False
+
+        existing_files = existing_license_files.split()
+
+        for lic_file in existing_files:
+            full_path = Path(self.tmp_extract) / lic_file
+            if not full_path.is_file():
+                return False
 
-    def create_hash_file(self):
-        """
-        Create the lines corresponding to the <package_name>.hash files
-        """
-        pkg_hash = '{name}.hash'.format(name=self.buildroot_name)
-        path_to_hash = os.path.join(self.pkg_dir, pkg_hash)
-        print('Creating {filename}...'.format(filename=path_to_hash))
-        lines = []
-        if self.used_url['digests']['md5'] and self.used_url['digests']['sha256']:
-            hash_header = '# md5, sha256 from {url}\n'.format(
-                url=self.metadata_url)
-            lines.append(hash_header)
-            hash_line = '{method}  {digest}  {filename}\n'.format(
-                method='md5',
-                digest=self.used_url['digests']['md5'],
-                filename=self.filename)
-            lines.append(hash_line)
-            hash_line = '{method}  {digest}  {filename}\n'.format(
-                method='sha256',
-                digest=self.used_url['digests']['sha256'],
-                filename=self.filename)
-            lines.append(hash_line)
-
-        if self.license_files:
-            lines.append('# Locally computed sha256 checksums\n')
-        for license_file in self.license_files:
             sha256 = hashlib.sha256()
-            with open(license_file, 'rb') as lic_f:
+            with open(full_path, 'rb') as f:
                 while True:
-                    data = lic_f.read(BUF_SIZE)
+                    data = f.read(BUF_SIZE)
                     if not data:
                         break
                     sha256.update(data)
-            hash_line = '{method}  {digest}  {filename}\n'.format(
-                method='sha256',
-                digest=sha256.hexdigest(),
-                filename=license_file.replace(self.tmp_extract, '')[1:])
-            lines.append(hash_line)
 
-        with open(path_to_hash, 'w') as hash_file:
-            hash_file.writelines(lines)
+            computed_hash = sha256.hexdigest()
+            if lic_file not in self.hashfile.license_hashes:
+                return False
+
+            method, existing_hash = self.hashfile.license_hashes[lic_file]
+            if computed_hash != existing_hash:
+                return False
+
+        return True
 
-    def create_config_in(self):
+    def create_package_mk(self):
         """
-        Creates the Config.in file of a package
+        Create the .mk file
         """
-        path_to_config = os.path.join(self.pkg_dir, 'Config.in')
-        print('Creating {file}...'.format(file=path_to_config))
-        lines = []
-        config_line = 'config BR2_PACKAGE_{name}\n'.format(
-            name=self.mk_name)
-        lines.append(config_line)
-
-        bool_line = '\tbool "{name}"\n'.format(name=self.buildroot_name)
-        lines.append(bool_line)
-        if self.pkg_req:
-            self.pkg_req.sort()
-            for dep in self.pkg_req:
-                dep_line = '\tselect BR2_PACKAGE_{req} # runtime\n'.format(
-                    req=dep.upper().replace('-', '_'))
-                lines.append(dep_line)
+        self.skip_license_update = self.__check_license_files_unchanged()
 
-        lines.append('\thelp\n')
+        if self.skip_license_update:
+            print('License files unchanged, preserving existing license information')
+        else:
+            self.__find_license_files()
 
-        md_info = self.metadata['info']
-        help_lines = textwrap.wrap(md_info['summary'], 62,
-                                   initial_indent='\t  ',
-                                   subsequent_indent='\t  ')
+        self.makefile.load()
 
-        # make sure a help text is terminated with a full stop
-        if help_lines[-1][-1] != '.':
-            help_lines[-1] += '.'
+        self.makefile.version = self.version
 
-        home_page = md_info.get('home_page', None)
+        if self.buildroot_name != self.real_name:
+            targz = self.filename.replace(
+                self.version,
+                '$({name}_VERSION)'.format(name=self.mk_name))
+            self.makefile.source = targz
 
-        if not home_page:
-            project_urls = md_info.get('project_urls', None)
-            if project_urls:
-                home_page = project_urls.get('Homepage', None)
+        if self.filename not in self.url:
+            site_url = self.url
+        else:
+            site_url = self.url[:self.url.find(self.filename)]
+        self.makefile.site = site_url.rstrip('/')
 
-        if home_page:
-            # \t + two spaces is 3 char long
-            help_lines.append('')
-            help_lines.append('\t  ' + home_page)
-            help_lines = [x + '\n' for x in help_lines]
-            lines += help_lines
+        self.makefile.setup_type = self.setup_metadata['method']
+
+        if not self.skip_license_update:
+            license_line = self.__get_license_names(self.license_files)
+            if license_line:
+                self.makefile.license = license_line.split('=', 1)[1].strip()
+
+            if self.license_files:
+                license_file_paths = [Path(lic).relative_to(self.tmp_extract) for lic in self.license_files]
+                self.makefile.license_files = ' '.join(str(path) for path in license_file_paths)
+
+        self.makefile.save()
+
+    def create_hash_file(self):
+        """
+        Create or update the <package_name>.hash file.
+        """
+        self.hashfile.load()
+
+        if self.used_url['digests']['md5'] and self.used_url['digests']['sha256']:
+            self.hashfile.set_package_hash(
+                self.filename, 'md5', self.used_url['digests']['md5'])
+            self.hashfile.set_package_hash(
+                self.filename, 'sha256', self.used_url['digests']['sha256'])
+
+        if not self.skip_license_update:
+            for license_file in self.license_files:
+                self.hashfile.compute_license_hash(license_file, self.tmp_extract)
 
-        with open(path_to_config, 'w') as config_file:
-            config_file.writelines(lines)
+        self.hashfile.save(self.metadata_url)
+
+    def create_or_update_config_in(self):
+        """
+        Creates or updates the Config.in file
+        """
+        if self.config_in.exists():
+            self.config_in.load()
+            if self.pkg_req:
+                self.config_in.dependencies = self.pkg_req
+                self.config_in.save()
+            else:
+                print('Config.in already exists, no dependencies to update')
+        else:
+            self.config_in._create_new(self.buildroot_name, self.mk_name)
+            if self.pkg_req:
+                self.config_in.dependencies = self.pkg_req
+            self.config_in.help_text = self.metadata
+            self.config_in.save()
 
 
 def main():
@@ -810,6 +1222,7 @@ def main():
 
             # Loading the package install info from the package
             package.load_pyproject()
+            metadata_loaded = True
             try:
                 package.load_metadata()
             except ImportError as err:
@@ -822,38 +1235,48 @@ def main():
                 print('Error: Could not install package {pkg}: {error}'.format(
                     pkg=package.real_name, error=error))
                 continue
+            except BackendUnavailable as error:
+                print('WARNING: Could not load metadata: {msg}'.format(msg=error.message))
+                if error.traceback:
+                    print(error.traceback)
+                print('WARNING: Continuing with limited information, dependencies may be incomplete')
+                metadata_loaded = False
+            except ValueError as error:
+                print('WARNING: Could not load metadata: {error}'.format(error=str(error)))
+                traceback.print_exc()
+                print('WARNING: Continuing with limited information, dependencies may be incomplete')
+                metadata_loaded = False
+
+            if metadata_loaded:
+                req_not_found = package.get_requirements(pkg_folder)
+                req_not_found = req_not_found.difference(packages)
+
+                packages += req_not_found
+                if req_not_found:
+                    print('Added packages \'{pkgs}\' as dependencies of {pkg}'
+                          .format(pkgs=", ".join(req_not_found),
+                                  pkg=package.buildroot_name))
+            else:
+                print('WARNING: Skipping dependency detection due to metadata load failure')
 
-            # Package requirement are an argument of the setup function
-            req_not_found = package.get_requirements(pkg_folder)
-            req_not_found = req_not_found.difference(packages)
-
-            packages += req_not_found
-            if req_not_found:
-                print('Added packages \'{pkgs}\' as dependencies of {pkg}'
-                      .format(pkgs=", ".join(req_not_found),
-                              pkg=package.buildroot_name))
-            print('Checking if package {name} already exists...'.format(
-                name=package.pkg_dir))
-            try:
-                os.makedirs(package.pkg_dir)
-            except OSError as exception:
-                if exception.errno != errno.EEXIST:
-                    print("ERROR: ", exception.message, file=sys.stderr)
-                    continue
-                print('Error: Package {name} already exists'
-                      .format(name=package.pkg_dir))
-                del_pkg = input(
-                    'Do you want to delete existing package ? [y/N]')
-                if del_pkg.lower() == 'y':
-                    shutil.rmtree(package.pkg_dir)
-                    os.makedirs(package.pkg_dir)
-                else:
+            pkg_exists = package.package_exists()
+
+            if pkg_exists:
+                print('Package {name} exists, updating...'.format(
+                    name=package.pkg_dir))
+            else:
+                print('Creating package {name}...'.format(
+                    name=package.pkg_dir))
+                try:
+                    package.pkg_dir.mkdir(parents=True, exist_ok=False)
+                except FileExistsError:
+                    print("ERROR: Directory exists", file=sys.stderr)
                     continue
-            package.create_package_mk()
 
+            package.create_package_mk()
             package.create_hash_file()
+            package.create_or_update_config_in()
 
-            package.create_config_in()
             print("NOTE: Remember to also make an update to the DEVELOPERS file")
             print("      and include an entry for the pkg in packages/Config.in")
             print()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
