Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395E6C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B992B60B92;
	Mon, 28 Nov 2022 18:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B992B60B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36aULAM9Gr4s; Mon, 28 Nov 2022 18:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D903960C09;
	Mon, 28 Nov 2022 18:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D903960C09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E46491BF377
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCD2760B92
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCD2760B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGhb1H0Q7S6O for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 18:23:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EDD5605BA
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EDD5605BA
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 18:23:10 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 11so8285679iou.0
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 10:23:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKTTgqrjKJC2SwkGREkrW3Ev1m34dXPJil0JBIisqJ8=;
 b=jImoybKdIH2qe4fvskCtMsatkxPAc2A0JW4adQ5wkr2XHZUMWr8ixWvyag22+ff5T0
 VUhpdjF8dRYN/14Hu59Fdq80ExJFrdXfhI1LTvzMOE/kwjYee6k0mhahEVf3V60Pl/uD
 wyqeAyIFVnMNsb9aouX6sqQ52NabgLxQPsrTgBknD4R2LgRRdvBfV47H//kAXZdOUz+9
 /gzVTn7HmSJcjqYXKqFNeU12rPS7CSfHkFUDSo3UjdyaNGdpT5uF+I/RMMD76gI01FW/
 g02EtU2G5tThpbAA2jGdzDqI7gL1XCjf6GHQHCOSrNWrD6saTykfYbOLJtCVp9ml1Grx
 Ogsg==
X-Gm-Message-State: ANoB5pnG7lErps+TFEo4VyT3Z91UafxenxO22wfojYpX10Ewdo+gW5Oy
 QFBKxvtgynLmXsTbLvOF0TSQki3JDNz3+Eez
X-Google-Smtp-Source: AA0mqf56mVhCi58cHWaxROX35OFCQYfzdSihTk6sdq1uw3C8KQZ5nZejUm3VPJeW7YbjAZZnJwSCLw==
X-Received: by 2002:a6b:1442:0:b0:6bd:2e10:82b9 with SMTP id
 63-20020a6b1442000000b006bd2e1082b9mr15120842iou.135.1669659789787; 
 Mon, 28 Nov 2022 10:23:09 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 d74-20020a02624d000000b00363e4730a41sm4475978jac.175.2022.11.28.10.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 10:23:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 11:23:04 -0700
Message-Id: <20221128182304.1915237-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NKTTgqrjKJC2SwkGREkrW3Ev1m34dXPJil0JBIisqJ8=;
 b=KvHHrfzYZOHqoYdCL48ZhQn60okrZPh1qbMHWf7HHd6WgL8Ni0dKfS9mXcB4tIc/uS
 zSCkUt5qvU/sZpIFXwS9TAA9RED+hgs44cwfEV7OhT4tj3LQR6KhhDZ2c2otGmXLfFi3
 I6P6EsvvGYBxBV4RyALyMSI+xI45HD2lGzaWV+gcSVVUUywXwSzQFKfCydjRMm1kPB6n
 0i9wyqRBptUP0Q/aZkP78ucewAaxBBKAN3IJFbDP4aOEdxj0wRshrI/FwPXDHwt2bzP7
 833Y68ZpSTHncnXGqzGn9HJSnVr570NtxwPk1lnM+fpC6ffB8yf0howVuMj4kggmnO5T
 ClnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KvHHrfzY
Subject: [Buildroot] [PATCH v4 1/1] utils/scanpypi: add flit package support
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

These packages don't have a setup.py so we instead need to parse their
pyproject.toml file.

Note that this currently doesn't handle flit package dependency
resolution.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - prefer/support python3.11 tomllib
  - use bool interpretation for None
Changes v2 -> v3:
  - minor cleanup
  - rebase
  - more detailed  commit log
Changes v1 -> v2:
  - remove homepage format fixes(sent as separate patch)
  - remove load_setup fixes
---
 utils/scanpypi | 85 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 3c98bb4bcc..38f0cb91e9 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -42,6 +42,55 @@ except ImportError:
           'pip install spdx_lookup')
     liclookup = None
 
+def toml_load(f):
+    with open(f, 'rb') as fh:
+        ex = None
+
+        # Try standard library tomllib first
+        try:
+            from tomllib import load
+            return load(fh)
+        except ImportError as e:
+            pass
+
+        # Try regular tomli next
+        try:
+            from tomli import load
+            return load(fh)
+        except ImportError as e:
+            ex = e
+
+        # Try pip's vendored tomli
+        try:
+            from pip._vendor.tomli import load
+            try:
+                return load(fh)
+            except TypeError:
+                # Fallback to handle older version
+                try:
+                    fh.seek(0)
+                    w = io.TextIOWrapper(fh, encoding="utf8", newline="")
+                    return load(w)
+                finally:
+                    w.detach()
+        except ImportError as e:
+            pass
+
+        # Try regular toml last
+        try:
+            from toml import load
+            fh.seek(0)
+            w = io.TextIOWrapper(fh, encoding="utf8", newline="")
+            try:
+                return load(w)
+            finally:
+                w.detach()
+        except ImportError:
+            pass
+
+        print('This package needs tomli')
+        raise ex
+
 
 def setup_decorator(func, method):
     """
@@ -316,6 +365,35 @@ class BuildrootPackage():
             os.chdir(current_dir)
             sys.path.remove(self.tmp_extract)
 
+    def load_pyproject(self):
+        """
+        Loads the corresponding pyproject.toml and store its metadata
+        """
+        current_dir = os.getcwd()
+        os.chdir(self.tmp_extract)
+        sys.path.insert(0, self.tmp_extract)
+        try:
+            pyproject_data = toml_load('pyproject.toml')
+            try:
+                self.setup_metadata = pyproject_data.get('project', {})
+                self.metadata_name = self.setup_metadata.get('name', self.real_name)
+                build_system = pyproject_data.get('build-system', {})
+                build_backend = build_system.get('build-backend', None)
+                if build_backend and build_backend == 'flit_core.buildapi':
+                    self.setup_metadata['method'] = 'flit'
+                elif build_system.get('backend-path', None):
+                    self.setup_metadata['method'] = 'pep517'
+                else:
+                    self.setup_metadata['method'] = 'unknown'
+            except KeyError:
+                print('ERROR: Could not determine package metadata for {pkg}.\n'
+                      .format(pkg=self.real_name))
+                raise
+        except FileNotFoundError:
+            raise
+        os.chdir(current_dir)
+        sys.path.remove(self.tmp_extract)
+
     def get_requirements(self, pkg_folder):
         """
         Retrieve dependencies from the metadata found in the setup.py script of
@@ -699,9 +777,12 @@ def main():
             except ImportError as err:
                 if 'buildutils' in str(err):
                     print('This package needs buildutils')
+                    continue
                 else:
-                    raise
-                continue
+                    try:
+                        package.load_pyproject()
+                    except Exception as e:
+                        raise
             except (AttributeError, KeyError) as error:
                 print('Error: Could not install package {pkg}: {error}'.format(
                     pkg=package.real_name, error=error))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
