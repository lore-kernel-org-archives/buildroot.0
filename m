Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C334C61DF7
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 07:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC6560B6C;
	Sat, 25 Nov 2023 07:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCC6560B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGGU5PoNkLJk; Sat, 25 Nov 2023 07:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034D360B8F;
	Sat, 25 Nov 2023 07:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034D360B8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 192CD1BF3A1
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 07:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB88C822B2
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 07:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB88C822B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uzh3MJreF7_H for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 07:34:23 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0474582006
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 07:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0474582006
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35beca6d020so10285975ab.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 23:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700897662; x=1701502462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cyG16yAwEOrajMvrjvPnBNm5NdkWZX8PoWMBT6KxPZw=;
 b=ocfoUupnKmpnR8qC1EFZdQQbAb19zMglDJTQ+EqMK0TlbnarqIzgSkw/tNoHtv6k0v
 umrq7RXSNDLzonE9dB+7M2aJNvl9mR1ZdjWEYwnFVMRggfE1mSJ17b9MhXajynE700G4
 0/ykfX+tUz/EOcRmDuSNUK4Pi/2pK0clV5nf9n3KtTmh1Mn1jkW49LGTdSHjVws1tQUy
 NpNZtLg5KmjAHx2J4lrIMt75tSYlWEdrLaDGMvyhqn717XLoD1kCZEGHLmBiziVU5E4n
 1RaTNejTr3151c8o8CYMQW3LoqI7ANT7alICpO3J1jDevsrFt94Z4Dr9M5R3ixxryvGz
 La0A==
X-Gm-Message-State: AOJu0YzbpSz9+qIGFqmYP+SW41XL4B3AAiioZXet6ELwpdwStWnq4Lp/
 0+sTQlaL1bZN6yqTu9Z73OOseacTwO8=
X-Google-Smtp-Source: AGHT+IHT2h+KYod2cvHpXfJf0j1UIbQg+b+ZeyYgtbCq+YQNv0Kt8TJX8HdlAAZJTD1I7uPt061z+w==
X-Received: by 2002:a05:6602:2ad1:b0:798:2415:1189 with SMTP id
 m17-20020a0566022ad100b0079824151189mr761157iov.12.1700897661746; 
 Fri, 24 Nov 2023 23:34:21 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 z90-20020a0293e3000000b0039deb26853csm1263847jah.10.2023.11.24.23.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 23:34:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 00:34:18 -0700
Message-Id: <20231125073418.854169-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700897662; x=1701502462; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cyG16yAwEOrajMvrjvPnBNm5NdkWZX8PoWMBT6KxPZw=;
 b=R1rOgWJ1OMz8ptei0xk8t0OqmUjSCaycUEmBDaVShbeIxTd1EuWfktyjkzJfTyWAkE
 iqekk0wlZoPeX55msKWWsBF0C22zPBU6w2ywSCR8gO06vXzTR5k5TFR64aEF8oB3X3TS
 FLni0EVr9kgMu3iVfArI29okQjAxY+20cltTt+5RBRdKPByWCpMt1E3/Z0ucl5mB+New
 Z5PX5Tn1eLzOSwmHJaQ0Yjd4sxPD/hcgbvogXgu1W1EgcDZj+hpBYjGUBxS2pvtLRsrn
 jZMyq8H/HWqMcJh3P91ePBM54D3SbLkmOBCeWQ8jOzJfCko1jvBZonPIvz/KTEkSkhaW
 kZ/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R1rOgWJ1
Subject: [Buildroot] [PATCH v6 1/1] utils/scanpypi: add flit package support
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
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v5 -> v6:
  - handle None project_urls
Changes v4 -> v5:
  - remove unnecessary "as e" from tomlib exception path
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
 utils/scanpypi | 93 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 4 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 3c98bb4bcc..eae9783a1f 100755
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
+        except ImportError:
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
@@ -620,8 +698,12 @@ class BuildrootPackage():
         if help_lines[-1][-1] != '.':
             help_lines[-1] += '.'
 
-        home_page = md_info.get('home_page', None) or \
-                    md_info.get('project_urls', {}).get('Homepage', None)  # noqa: E127
+        home_page = md_info.get('home_page', None)
+
+        if not home_page:
+            project_urls = md_info.get('project_urls', None)
+            if project_urls:
+                home_page = project_urls.get('Homepage', None)
 
         if home_page:
             # \t + two spaces is 3 char long
@@ -699,9 +781,12 @@ def main():
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
