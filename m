Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E742C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 10:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD7B740A05;
	Wed,  2 Nov 2022 10:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD7B740A05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLs3hgnnc_IO; Wed,  2 Nov 2022 10:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBDCA40A02;
	Wed,  2 Nov 2022 10:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBDCA40A02
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2C7A1BF3DB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 10:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5053402E7
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 10:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5053402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id REP6G60s1KgU for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 10:35:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE9E4400CB
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE9E4400CB
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 10:35:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k2so44136652ejr.2
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 03:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qMKhkafN+b2LUwkJD1gmDrMha/lrBX2PRrqtXwI148g=;
 b=kK5aXaiDbHYGg38SsSjDPhJSUQZLGcHaSZrec5JfbHP39mcETVVIUYlrC59LbuwGl5
 lr4+CUQDtqDrtOluz1wyJd1Y9ABcwafoo5Fkb7A34XjNMeOifUl1XQnE8b9bnsZ7AZV9
 kWRVlMNkU3HMcz6E5GIWZmTGBmSd2XJLdtNBpjtw1Bbd7g6ZL9YEyRoJDh0H4EM1jwc7
 ZO0QIBmtxASrKTFkXJcpo5qkiD5dv56ajpbvH6zWPXKQWKbMOU0BsmhIBimCTu50Uxd3
 HNDgNJJ8mIuS9g2UQE/HKUDvahpAaXVl6okBz9CH246S/w0WiI24gh5dAQXggAx4gyQF
 UEqA==
X-Gm-Message-State: ACrzQf308P2zpKc/udiTlYWawqJ1y/wNblOAjhleTg6ByZkepfhDntd9
 CU4wwBo8FntLvlJipwCHtCXxxyz17ZlZRA==
X-Google-Smtp-Source: AMsMyM4vUSlCc5rfYkHuc0L39mTHGesugVY1ISb9+m+BN/+V6StgukBWc93Av2RYInfO+T2bqpv2hQ==
X-Received: by 2002:a17:907:720d:b0:7a9:b7e6:8612 with SMTP id
 dr13-20020a170907720d00b007a9b7e68612mr22513895ejc.435.1667385298822; 
 Wed, 02 Nov 2022 03:34:58 -0700 (PDT)
Received: from batman.localdomain (p4fed3ae8.dip0.t-ipconnect.de.
 [79.237.58.232]) by smtp.gmail.com with ESMTPSA id
 g11-20020a170906538b00b007ad9028d684sm5250672ejo.104.2022.11.02.03.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 03:34:58 -0700 (PDT)
From: Juan Carrano <juan.carrano@ebee.berlin>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 11:34:27 +0100
Message-Id: <20221102103428.82414-1-juan.carrano@ebee.berlin>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ebee-berlin.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qMKhkafN+b2LUwkJD1gmDrMha/lrBX2PRrqtXwI148g=;
 b=qbPM4GXos7AqJ/+J7iAOY1SR3eR9I5jExswfQ2v63E9ZjQRkDyONwkBCz9kFvGYzGu
 DvClaFKa0AnYw5wMVrDUDhTuEDDxwC3Su2yle2CjVvXm6uTrRQigwi1mr4E0/bWpR8qB
 5rW9IkupDu/gpvx2XGisOvl0wJxu89gEzMJMdf85B3r8HbTAb8Wss0aCctmWYmoRszk+
 CM0b7Hdy9ZkUV45VoEHwRgWuvkgF8rXUmK1PwTZi/sDeGO/Pi14AwlhOFBAcG3YCOO3N
 VZVrNei4OTT//p8rMScFXpim9yH1InxJdVsnRlNura1RQFOHbEivkLfW46k4+owtqeAm
 QQJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ebee-berlin.20210112.gappssmtp.com
 header.i=@ebee-berlin.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=qbPM4GXo
Subject: [Buildroot] [PATCH] support/pkg-stats: list packages from external
 trees.
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
Cc: Juan Carrano <juan.carrano@ebee.berlin>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Search the external trees for package files and add them to the list.
The list of directories walked and excluded are the same as for the main
tree, and should work out of the box if the user sticks to the directory
structure suggested in the manual.

Two additional properties were added to the Package class, the tree name and
the path. For consistency and to simplify the code, packages in the main tree
are marked as coming from "BR2".

The HTML output has a new column listing the external name (or "BR2") and the
json output has a new property "tree".

Signed-off-by: Juan Carrano <juan.carrano@ebee.berlin>
---
 support/scripts/pkg-stats | 90 ++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3248e3678d..2dfcc54d57 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -23,7 +23,7 @@ import asyncio
 import datetime
 import fnmatch
 import os
-from collections import defaultdict
+from collections import defaultdict, namedtuple
 import re
 import subprocess
 import json
@@ -32,6 +32,7 @@ import time
 import gzip
 import xml.etree.ElementTree
 import requests
+import itertools
 
 brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
@@ -77,6 +78,19 @@ def get_defconfig_list():
     ]
 
 
+Br2Tree = namedtuple("Br2Tree", ["name", "path"])
+
+
+def get_trees():
+    raw_variables = subprocess.check_output(["make", "--no-print-directory", "-s",
+                                             "BR2_HAVE_DOT_CONFIG=y", "printvars",
+                                             "VARS=BR2_EXTERNAL_NAMES BR2_EXTERNAL_%_PATH"])
+    variables = dict(line.partition("=")[0::2] for line in raw_variables.decode().split("\n") if line)
+    variables["BR2_EXTERNAL_BR2_PATH"] = brpath
+    externals = ["BR2", *variables["BR2_EXTERNAL_NAMES"].split()]
+    return [Br2Tree(name, os.path.normpath(variables[f"BR2_EXTERNAL_{name}_PATH"])) for name in externals]
+
+
 class Package:
     all_licenses = dict()
     all_license_files = list()
@@ -89,7 +103,9 @@ class Package:
     status_checks = ['cve', 'developers', 'hash', 'license',
                      'license-files', 'patches', 'pkg-check', 'url', 'version']
 
-    def __init__(self, name, path):
+    def __init__(self, tree, name, path):
+        self.tree = tree.name
+        self.tree_path = tree.path
         self.name = name
         self.path = path
         self.pkg_path = os.path.dirname(path)
@@ -118,12 +134,24 @@ class Package:
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
 
+    @property
+    def pkgdir(self):
+        return os.path.join(self.tree_path, self.pkg_path)
+
+    @property
+    def pkgfile(self):
+        return os.path.join(self.tree_path, self.path)
+
+    @property
+    def hashpath(self):
+        return self.pkgfile.replace(".mk", ".hash")
+
     def set_url(self):
         """
         Fills in the .url field
         """
         self.status['url'] = ("warning", "no Config.in")
-        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
+        pkgdir = self.pkgdir
         for filename in os.listdir(pkgdir):
             if fnmatch.fnmatch(filename, 'Config.*'):
                 fp = open(os.path.join(pkgdir, filename), "r")
@@ -172,7 +200,7 @@ class Package:
             keep_target = True
 
         self.infras = list()
-        with open(os.path.join(brpath, self.path), 'r') as f:
+        with open(self.pkgfile, 'r') as f:
             lines = f.readlines()
             for line in lines:
                 match = INFRA_RE.match(line)
@@ -211,8 +239,7 @@ class Package:
             self.status['hash-license'] = ("na", "no valid package infra")
             return
 
-        hashpath = self.path.replace(".mk", ".hash")
-        if os.path.exists(os.path.join(brpath, hashpath)):
+        if os.path.exists(self.hashpath):
             self.status['hash'] = ("ok", "found")
         else:
             self.status['hash'] = ("error", "missing")
@@ -225,8 +252,7 @@ class Package:
             self.status['patches'] = ("na", "no valid package infra")
             return
 
-        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
-        for subdir, _, _ in os.walk(pkgdir):
+        for subdir, _, _ in os.walk(self.pkgdir):
             self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
 
         if self.patch_count == 0:
@@ -268,9 +294,8 @@ class Package:
         Fills in the .warnings and .status['pkg-check'] fields
         """
         cmd = [os.path.join(brpath, "utils/check-package")]
-        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
         self.status['pkg-check'] = ("error", "Missing")
-        for root, dirs, files in os.walk(pkgdir):
+        for root, dirs, files in os.walk(self.pkgdir):
             for f in files:
                 if f.endswith(".mk") or f.endswith(".hash") or f == "Config.in" or f == "Config.in.host":
                     cmd.append(os.path.join(root, f))
@@ -328,7 +353,7 @@ class Package:
              self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
 
 
-def get_pkglist(npackages, package_list):
+def get_pkglist(trees, npackages, package_list):
     """
     Builds the list of Buildroot packages, returning a list of Package
     objects. Only the .name and .path fields of the Package object are
@@ -358,8 +383,8 @@ def get_pkglist(npackages, package_list):
                      "toolchain/toolchain-wrapper.mk"]
     packages = list()
     count = 0
-    for root, dirs, files in os.walk(brpath):
-        root = os.path.relpath(root, brpath)
+    for br_tree, root, dirs, files in ((tree, *rdf) for tree in trees for rdf in os.walk(tree.path)):
+        root = os.path.relpath(root, br_tree.path)
         rootdir = root.split("/")
         if len(rootdir) < 1:
             continue
@@ -380,7 +405,7 @@ def get_pkglist(npackages, package_list):
                     continue
             if skip:
                 continue
-            p = Package(pkgname, pkgpath)
+            p = Package(br_tree, pkgname, pkgpath)
             packages.append(p)
             count += 1
             if npackages and count == npackages:
@@ -854,7 +879,7 @@ function expandField(fieldId){
 #package-grid, #results-grid {
   display: grid;
   grid-gap: 2px;
-  grid-template-columns: 1fr repeat(12, min-content);
+  grid-template-columns: min-content 1fr repeat(12, min-content);
 }
 #results-grid {
   grid-template-columns: 3fr 1fr;
@@ -920,6 +945,8 @@ def boolean_str(b):
 
 def dump_html_pkg(f, pkg):
     pkg_css_class = pkg.path.replace("/", "_")[:-3]
+    f.write(f'<div id="tree__{pkg_css_class}" \
+        class="tree data _{pkg_css_class}">{pkg.tree}</div>\n')
     f.write(f'<div id="package__{pkg_css_class}" \
         class="package data _{pkg_css_class}">{pkg.path}</div>\n')
     # Patch count
@@ -1122,31 +1149,33 @@ def dump_html_pkg(f, pkg):
 def dump_html_all_pkgs(f, packages):
     f.write("""
 <div id="package-grid">
-<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="package"
+<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="tree"
+     class="tree data label"><span>Tree</span><span></span></div>
+<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="package"
      class="package data label"><span>Package</span><span></span></div>
-<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="patch_count"
+<div style="grid-column: 3;" onclick="sortGrid(this.id)" id="patch_count"
      class="centered patch_count data label"><span>Patch count</span><span></span></div>
-<div style="grid-column: 3;" onclick="sortGrid(this.id)" id="infrastructure"
+<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="infrastructure"
      class="centered infrastructure data label">Infrastructure<span></span></div>
-<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="license"
+<div style="grid-column: 5;" onclick="sortGrid(this.id)" id="license"
      class="centered license data label"><span>License</span><span></span></div>
-<div style="grid-column: 5;" onclick="sortGrid(this.id)" id="license_files"
+<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="license_files"
      class="centered license_files data label"><span>License files</span><span></span></div>
-<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="hash_file"
+<div style="grid-column: 7;" onclick="sortGrid(this.id)" id="hash_file"
      class="centered hash_file data label"><span>Hash file</span><span></span></div>
-<div style="grid-column: 7;" onclick="sortGrid(this.id)" id="current_version"
+<div style="grid-column: 8;" onclick="sortGrid(this.id)" id="current_version"
      class="centered current_version data label"><span>Current version</span><span></span></div>
-<div style="grid-column: 8;" onclick="sortGrid(this.id)" id="latest_version"
+<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="latest_version"
      class="centered latest_version data label"><span>Latest version</span><span></span></div>
-<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="warnings"
+<div style="grid-column: 10;" onclick="sortGrid(this.id)" id="warnings"
      class="centered warnings data label"><span>Warnings</span><span></span></div>
-<div style="grid-column: 10;" onclick="sortGrid(this.id)" id="upstream_url"
+<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="upstream_url"
      class="centered upstream_url data label"><span>Upstream URL</span><span></span></div>
-<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="cves"
+<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="cves"
      class="centered cves data label"><span>CVEs</span><span></span></div>
-<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="ignored_cves"
+<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="ignored_cves"
      class="centered ignored_cves data label"><span>CVEs Ignored</span><span></span></div>
-<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="cpe_id"
+<div style="grid-column: 14;" onclick="sortGrid(this.id)" id="cpe_id"
      class="centered cpe_id data label"><span>CPE ID</span><span></span></div>
 """)
     for pkg in sorted(packages):
@@ -1217,7 +1246,7 @@ def dump_html(packages, stats, date, commit, output):
 def dump_json(packages, defconfigs, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
-    excluded_fields = ['url_worker', 'name']
+    excluded_fields = ['url_worker', 'name', 'tree_path']
     pkgs = {
         pkg.name: {
             k: v
@@ -1305,7 +1334,8 @@ def __main__():
                                       'rev-parse',
                                       'HEAD']).splitlines()[0].decode()
     print("Build package list ...")
-    packages = get_pkglist(args.npackages, package_list)
+    all_trees = get_trees()
+    packages = get_pkglist(all_trees, args.npackages, package_list)
     print("Getting developers ...")
     developers = parse_developers()
     print("Build defconfig list ...")
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
