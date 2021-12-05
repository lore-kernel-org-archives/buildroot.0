Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524C5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 018DF60749;
	Sun,  5 Dec 2021 00:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crLhdVvREJoG; Sun,  5 Dec 2021 00:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F4760A8D;
	Sun,  5 Dec 2021 00:12:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE241BF95D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C38382D0F
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siubKl1hso4q for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:12:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55DF982CFD
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:12:03 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id z26so8496359iod.10
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LgoVMrRSX/w9HFOIH0PslMuSWFkXe8CnXYFGjdJRaxQ=;
 b=m8/kMF2LyPM9qqkIVvHaLmlLw6rACIPC4ltHTLiRW9+JXurLUD4Y5wLdSSHHnYpV/K
 3KMkXqgmet9Bbc/DTUQfpbHFRFQFKeXlYp7JgK2KnAlkuJBMeuHArhyRaGWr5nRj8erl
 bvJnVkF3IuFBn72WXw01hFE/GBac61UuOijq1X7eR/pKpu7w647TSUSJ7IG6+5IisykK
 j6zVo9J5U4hUUmVFrLyHiqRCH2gHSlaCPRwcwp5XculDdcdRGcTryVq2sgu8jbSKx2tt
 /4p8IB7c1hbyjJD0EgH8Y5wBsK7uwLgNbv8dhp3ErWR1o2c+miHzDza45ynWx0qqEsYm
 Tzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LgoVMrRSX/w9HFOIH0PslMuSWFkXe8CnXYFGjdJRaxQ=;
 b=gEwUGahM2kCry6wf08iQnpTi+j/hKuI7WixgsfwUTgKRVW+zS04c/+dHe9fJW6HXWS
 0QF5eWLaaokTdMi+NRU4V9TuOFSgCqDvZkc6Gt+9hKyvaEBhPDF55A8Nan2vH5y5WS0O
 CZzNDU8nhK3KW88nUCQbRkExfsitQk9E/nNQAehxTYQukNKtI2GgH22CPISMmbca+arm
 Wx1aEDXy5EjJBeMhREy/eryU1GVdOO8+sBT68C8xHz7h/koKjTSyzg/n1b0toQsFYRtw
 JUENl9bDcGV7tEpD6uA71NRa1ConOAieMjhr7byhRxyhXNtOf1/VGd5EqjWf9X384ICE
 pdhw==
X-Gm-Message-State: AOAM532TMbkHPmCA/4ohW3AuzN5Jex2pY+TaP33WmHvU96MXXtthK/ld
 f82b3hkzPUsefzAV/BRUQ02y1S4mSII=
X-Google-Smtp-Source: ABdhPJz+QY2WXZxBrAyYVGwoDf1ftd/UrWzIK5xFP3ZMMmaIU7ZIa/KSVx+idrN6v4y6nZ8QAk3uSA==
X-Received: by 2002:a05:6638:224d:: with SMTP id
 m13mr33207018jas.86.1638663122393; 
 Sat, 04 Dec 2021 16:12:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id b8sm4333309ilj.0.2021.12.04.16.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:12:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:11:55 -0700
Message-Id: <20211205001156.2402104-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205001156.2402104-1-james.hilliard1@gmail.com>
References: <20211205001156.2402104-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] utils/scanpypi: add flit package support
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These packages don't have a setup.py so we instead need to parse their
pyproject.toml file.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 81 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 1f3326cf4d..4164a52db3 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -296,21 +296,67 @@ class BuildrootPackage():
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
         sys.path.insert(0, self.tmp_extract)
-        s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
-        imp.load_module('__main__', s_file, s_path, s_desc)
-        if self.metadata_name in self.setup_args:
-            pass
-        elif self.metadata_name.replace('_', '-') in self.setup_args:
-            self.metadata_name = self.metadata_name.replace('_', '-')
-        elif self.metadata_name.replace('-', '_') in self.setup_args:
-            self.metadata_name = self.metadata_name.replace('-', '_')
         try:
-            self.setup_metadata = self.setup_args[self.metadata_name]
-        except KeyError:
-            # This means setup was not called
-            print('ERROR: Could not determine package metadata for {pkg}.\n'
-                  .format(pkg=self.real_name))
+            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
+            imp.load_module('__main__', s_file, s_path, s_desc)
+            if self.metadata_name in self.setup_args:
+                pass
+            elif self.metadata_name.replace('_', '-') in self.setup_args:
+                self.metadata_name = self.metadata_name.replace('_', '-')
+            elif self.metadata_name.replace('-', '_') in self.setup_args:
+                self.metadata_name = self.metadata_name.replace('-', '_')
+            try:
+                self.setup_metadata = self.setup_args[self.metadata_name]
+            except KeyError:
+                # This means setup was not called
+                print('ERROR: Could not determine package metadata for {pkg}.\n'
+                      .format(pkg=self.real_name))
+                raise
+        finally:
+            os.chdir(current_dir)
+            sys.path.remove(self.tmp_extract)
+
+    def load_pyproject(self):
+        """
+        Loads the corresponding pyproject.toml and store its metadata
+        """
+        from pprint import pprint
+        current_dir = os.getcwd()
+        os.chdir(self.tmp_extract)
+        sys.path.insert(0, self.tmp_extract)
+        try:
+            pyproject = open('pyproject.toml')
+        except FileNotFoundError:
             raise
+        else:
+            try:
+                from pip._vendor.tomli import load as toml_load
+            except ImportError:
+                try:
+                    from toml import load as _toml_load  # noqa: F401
+                    def toml_load(f):
+                        w = io.TextIOWrapper(f, encoding="utf8", newline="")
+                        try:
+                            return _toml_load(w)
+                        finally:
+                            w.detach()
+                except ImportError:
+                    print('This package needs toml')
+                    raise
+            with pyproject:
+                pyproject_data = toml_load(pyproject)
+                try:
+                    self.setup_metadata = pyproject_data.get('project', {})
+                    self.metadata_name = self.setup_metadata.get('name', self.real_name)
+                    build_backend = pyproject_data.get('build-system', {}).get('build-backend', None)
+                    if build_backend is not None:
+                        if build_backend == 'flit_core.buildapi':
+                            self.setup_metadata['method'] = 'flit'
+                except KeyError:
+                    # This means setup was not called
+                    print('ERROR: Could not determine package metadata for {pkg}.\n'
+                          .format(pkg=self.real_name))
+                    raise
         os.chdir(current_dir)
         sys.path.remove(self.tmp_extract)
 
@@ -690,11 +736,14 @@ def main():
             try:
                 package.load_setup()
             except ImportError as err:
-                if 'buildutils' in err.message:
+                if 'buildutils' in str(err):
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
