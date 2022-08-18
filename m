Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AF2C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 08:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3FE84026;
	Thu, 18 Aug 2022 08:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3FE84026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLdyPl4OTTId; Thu, 18 Aug 2022 08:26:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0D2384020;
	Thu, 18 Aug 2022 08:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0D2384020
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4581BF2AA
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 08:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69A21410E7
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 08:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69A21410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I7cVjd5o_UAW for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 08:26:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73B9E40168
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73B9E40168
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 08:26:21 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11c9af8dd3eso646058fac.10
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 01:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=nZAdqiIBjirSPxq2myTBPG9xWcx6YGKTe4erL53m9TE=;
 b=UAYQYCMyjgC/8zMlZMtHy4arNw+CKeqZPIweQ/1dzWqgL016B28O88Uk50clHGaWtx
 1hqUkfIlgPVrQ9aVdI4kY1BI2Sh7W/0YgSnMXmMyXVwT3DKRy5CG0IauSnd5Wz5RXwpw
 t13VtrcxTKGhUe7wa7T7nQdSWoliBJwo8n/88gR6CZAfbtrkFwKaEfbSZgJ9WZRHlGTs
 /W9vy4qumMxho5zL+CcHIeM4zNDFk6FHvPCYkY8vlKF1XJViNEDx0s46aN/RK5uNroOm
 1Y0pMR03AB5jP8/ejuqv8IzPy6rRWWaxB+YvhyXi6VGsdPEGcHVUcNg0csjdgrjA2wRp
 5LSQ==
X-Gm-Message-State: ACgBeo0eQt3u7LCzDMXwayvBSm23jePSAJvabD8wYRxcylCfze9Xeoiq
 5ADBYhBOzOUlLlc14bRCqdl41cEEy4c=
X-Google-Smtp-Source: AA6agR5AYpO+yZwplaeA7HBnUuum3p5nZMZsd1wp4b9aH06yq0mv/7avZU5aCjisRVOWzuPckJGD2g==
X-Received: by 2002:a05:6870:808b:b0:10e:cb5e:b268 with SMTP id
 q11-20020a056870808b00b0010ecb5eb268mr3728112oab.162.1660811180040; 
 Thu, 18 Aug 2022 01:26:20 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 4-20020a9d0284000000b00638ae0350bdsm279701otl.0.2022.08.18.01.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 01:26:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 02:26:17 -0600
Message-Id: <20220818082617.24624-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=nZAdqiIBjirSPxq2myTBPG9xWcx6YGKTe4erL53m9TE=;
 b=YbO/IlderyecBKe3kjsPeyAzB10tSQEnFuzAh71vMi118CbHW/+BW4W5JOJoBVwWMI
 yVx40zjZ9ovepDz/p8AwC8zwA+uw3PtmP3ThvXhMd1w4EC2UyE0w/ldwBFa45Cu1F/Bf
 8FgXs893JfOKfH6+ZO0MmwHAbuy/yfyxdH7ELLoJXFatYZuabvSDxBVp5ARwPw3LpQmZ
 /6H9bkLrL5bu49PKhd3r5tQLSrDMxVIHQrr9MAAczjBI8P7VLTfz7zRAdRJzcltxbAbs
 k3OigWvwpcUHG55cPTaW2shRJj/RdYeHIeWe/XUBaaR/tL1bFWaC/27jxg9dbOdDJhaZ
 a34Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YbO/Ilde
Subject: [Buildroot] [PATCH v3 1/1] utils/scanpypi: add flit package support
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
Changes v2 -> v3:
  - minor cleanup
  - rebase
  - more detailed  commit log
Changes v1 -> v2:
  - remove homepage format fixes(sent as separate patch)
  - remove load_setup fixes
---
 utils/scanpypi | 78 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 452b4a3fc3..bce7c01494 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -42,6 +42,48 @@ except ImportError:
           'pip install spdx_lookup')
     liclookup = None
 
+def toml_load(f):
+    with open(f, 'rb') as fh:
+        ex = None
+
+        # Try regular tomli first
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
@@ -316,6 +358,35 @@ class BuildrootPackage():
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
+                if build_backend is not None and build_backend == 'flit_core.buildapi':
+                    self.setup_metadata['method'] = 'flit'
+                elif build_system.get('backend-path', None) is not None:
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
@@ -699,9 +770,12 @@ def main():
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
