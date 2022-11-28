Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D260EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 545BE60B92;
	Mon, 28 Nov 2022 18:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 545BE60B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ca969ZzBN5UL; Mon, 28 Nov 2022 18:32:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DB060C2D;
	Mon, 28 Nov 2022 18:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70DB060C2D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D95601BF377
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B319360BFC
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 18:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B319360BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOiG4gTNM0Ga for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 18:32:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F404B608A5
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F404B608A5
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 18:32:33 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id r81so8286629iod.2
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 10:32:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Ty2prr1PBo+hHCUn2XUYJpdg8AacvfERaVqqR/BP6c=;
 b=y/RHEhdK/CRqmSNEkiJf2lfpLY2bTpc0GbmO9iwKywJj9M7sOQT0ZUyfPZPJPEwvZw
 VfYANybW8VscmqyLpeVKUlTEIBf5diCojhRZkLXzFY02jWU5S/euBcOMvgMw8jxHuSpf
 nnjqzQrsV80J2uz5ixW8q1o0NST32LHkQhp8FPHJR4fPwpzEcwUzO6mQea22d5bgtzIe
 v2qnCikOP3ZMoD9l6/RxD9Gt7rDrIwJJB21gBciYK7DAyI0hBDx8/6GE9EbNUBpWEVVH
 QB8ghtn/NJ8UlW4jOAdQ6q2C02Tuq5BNGyguatTOmWonUYOKQkXoGAT6xW2DBax0Fidt
 qGhQ==
X-Gm-Message-State: ANoB5pkUm9ymLcbwocWbAlF604uqiJTWjs42xkvA7qLTssYDJplP0mLM
 qYD+OwiCYy0h/1U29w/IIYyvuklpEkDtmHXU
X-Google-Smtp-Source: AA0mqf6ToD4qZLAYEwf3OG0ycU/+SIk4s6AWHZuZxgEJCZwwBKQBrfeYitIlDzUgZsR7PfwnwuIP8Q==
X-Received: by 2002:a02:6d6f:0:b0:375:c16b:7776 with SMTP id
 e47-20020a026d6f000000b00375c16b7776mr15852611jaf.54.1669660352751; 
 Mon, 28 Nov 2022 10:32:32 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 q5-20020a6b2a05000000b006decda48b2bsm4685165ioq.0.2022.11.28.10.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 10:32:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 11:32:30 -0700
Message-Id: <20221128183230.1915592-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ty2prr1PBo+hHCUn2XUYJpdg8AacvfERaVqqR/BP6c=;
 b=eD21rkp5nZ9XG9ga8bv4VUamW1ORRuko+lTftp/KqFm3h+Nq2K9MdbRRhJ98WcDPlF
 Xcq7aMhNNx8LyOhAXiURM4WbHCA+Wce1lEXu2LKvIxZ2L5/RkeQsF7tJ+5p/C4uhWexi
 dAKYjISEaSOQr4dSUPEutrS7or2kxOExoVAZAyb3phsi2Hnl/hnLFGwDFrU3CCJdHfZF
 lbhqYQrvPOYYCtKcmAzTKUgNV1AW7ZZmNua1web52102Dxxi74wN8ElLLGLiQ3wFFk49
 tN+7GSFFXsHIl8IC5n24ghWPnMqaVejdkWOyWrggQ/rzw2XQrFcaFdBhsZqL5/eKLRCo
 BceQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eD21rkp5
Subject: [Buildroot] [PATCH v5 1/1] utils/scanpypi: add flit package support
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
 utils/scanpypi | 85 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 3c98bb4bcc..79c5db8a5f 100755
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
