Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00864CAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 20:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B07EB8123F;
	Mon, 15 Sep 2025 20:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VigEIdkj6QZI; Mon, 15 Sep 2025 20:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC12F81240
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC12F81240;
	Mon, 15 Sep 2025 20:27:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A573B22F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AD9C403F8
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0RHoHropbYjH for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 20:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4998403E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4998403E7
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4998403E7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:27:41 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-42404af313aso8700245ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 13:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757968060; x=1758572860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kuYoppTAWkMmBv7X5lDQL72t04cQZkBA6VfarpJH+9g=;
 b=bHrnzmSC6D6tS2DttNneBi/xlif0Y5XBJkL29q7VvRNpWCYs9NroSWI90vTI4wZMNf
 4OnSMjHLFQUeXc00nbu3mBaLujNunmC5FI9mN+uDecRfzx9NQElNFDTBEXo6hgzcbMmM
 UEaoF5gHXWrNeBaDK0P2z1f8eO9a7V0ydJ1NcuVL00LgOaR50iK8C57GQyxLJSwLEMsF
 jVUPVgb5Q2RwgA2KCOuKnL/mLTq1PGWeGC88gRDtchfoVreCqyv/kw3VlQ7PTaszUZCL
 kP8CRCuPDJMsbiOjyYu2z2Uhc/6Of7CWeUby3whzr4NOH9mTNC3YHgadXkQkmuNupW7b
 ELTA==
X-Gm-Message-State: AOJu0Yx2HvJ3w4TY3OPxZZJ4qDFxP7QuWnHYYFMctOJptmtKFcS1HkAV
 aRnfkZki7aflBW9vxMOrq+8ZiRRSFkAuby3Ht+nq6LR3xE4SOy8zTN1OJiBvOA==
X-Gm-Gg: ASbGncs4FTca7xRSdmn2/iCBigtR4Cvb5i/Q4XTK8b8MXd0ascwtykVO4pUG3Iycbiz
 3FMukfHUoQ0aYfJvM07487ikH5uZbkqC4DxdC1Kz/4jCiQiPpMclvv7W+6qTJa/2+858oom5f9o
 vafLvGEbnTs4bIytoFCkVY3rN4X8+4/qQf7XQrHo/iuDkK1xYw8eN8JTM/esEKznT7L5mj+fzux
 RqtffLd43Zm6DKVwZaoFKkC12XDmHqDLxq8Ge2pdtwxUzv8eFMXWhqM4ULYEkNbCcusQz+fvyYH
 /ENdwgL0J9vs4Ac8cm3tmr2eOHTlkKhyC60L4wafPgJgP0uoatDqxZKMUci6/Egtrr+FPx2+XBU
 +6H1Z5lrXZ5Sl3Lfwbuzo0iIgiYOUqpqXMgq8Gs249bbgTmuHJnswrx1QPuy29QbPuQbIVHJT+N
 ekLjDurT7RvuU=
X-Google-Smtp-Source: AGHT+IG8hxBTZEg+fYLLBAHBEUT1BfSrf7V83LwWlTg2oFxvcvPE/I94mjaY5QVeVCFURdZSywXU+w==
X-Received: by 2002:a05:6e02:1849:b0:424:ce7:848 with SMTP id
 e9e14a558f8ab-4240cf64cd8mr15983055ab.24.1757968060078; 
 Mon, 15 Sep 2025 13:27:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-51215c488b2sm2869511173.61.2025.09.15.13.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 13:27:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 14:27:37 -0600
Message-ID: <20250915202737.1513190-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757968060; x=1758572860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kuYoppTAWkMmBv7X5lDQL72t04cQZkBA6VfarpJH+9g=;
 b=bSgrXZj9Vu3W4EC8d0QTURy71b2WqRN6beKS8+pJ9eUYYwXv8cg1EWLop4OYfxANRb
 ZkldswjjpQaO4S2cQ6hcy8yw1RtNrVvgviwIpfrf3lyWySCk0Qidy0Pu3EGWNBQii7mO
 4DTs7jQq71OPPpC5JklP4vVCGjFAQAp2Pjgsi/YlEYIMI/46kyPfqmBNefZxF6oakSna
 6mmgzz5iO8rkTTsnxm/VbBt9RR/KSMs2UkPpoh/UaBFntYTyALcWjvbnhSfqe9bpji69
 YZ0jInig4YVXyvcCWUMb3N2P6aqgMyNhU43e3aZA8y+8BI8rqdAK+/JWJWj3kT1KTq67
 Tg6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bSgrXZj9
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: remove python six module
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

We dropped support for python2 a while back, as such we can remove
the python six module which was only needed for backwards
comaptibility with python2.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index af62c01632..61879e39d4 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -22,16 +22,10 @@ import tempfile
 import traceback
 import importlib
 import importlib.metadata
-import six.moves.urllib.request
-import six.moves.urllib.error
-import six.moves.urllib.parse
-from six.moves import map
-from six.moves import zip
-from six.moves import input
-if six.PY2:
-    import StringIO
-else:
-    import io
+import urllib.request
+import urllib.error
+import urllib.parse
+import io
 
 BUF_SIZE = 65536
 
@@ -225,15 +219,15 @@ class BuildrootPackage():
         self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
             pkg=self.real_name)
         try:
-            pkg_json = six.moves.urllib.request.urlopen(self.metadata_url).read().decode()
-        except six.moves.urllib.error.HTTPError as error:
+            pkg_json = urllib.request.urlopen(self.metadata_url).read().decode()
+        except urllib.error.HTTPError as error:
             print('ERROR:', error.getcode(), error.msg, file=sys.stderr)
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
                   .format(pkg=self.real_name))
             raise
-        except six.moves.urllib.error.URLError:
+        except urllib.error.URLError:
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
@@ -260,7 +254,7 @@ class BuildrootPackage():
                 'digests': None}]
             # In this case, we can't get the name of the downloaded file
             # from the pypi api, so we need to find it, this should work
-            urlpath = six.moves.urllib.parse.urlparse(
+            urlpath = urllib.parse.urlparse(
                 self.metadata['info']['download_url']).path
             # urlparse().path give something like
             # /path/to/file-version.tar.gz
@@ -272,8 +266,8 @@ class BuildrootPackage():
             try:
                 print('Downloading package {pkg} from {url}...'.format(
                     pkg=self.real_name, url=download_url['url']))
-                download = six.moves.urllib.request.urlopen(download_url['url'])
-            except six.moves.urllib.error.HTTPError as http_error:
+                download = urllib.request.urlopen(download_url['url'])
+            except urllib.error.HTTPError as http_error:
                 download = http_error
             else:
                 self.used_url = download_url
@@ -288,7 +282,7 @@ class BuildrootPackage():
             raise DownloadFailed('Failed to download package {pkg}: '
                                  'No source archive available'
                                  .format(pkg=self.real_name))
-        elif download.__class__ == six.moves.urllib.error.HTTPError:
+        elif download.__class__ == urllib.error.HTTPError:
             raise download
 
         self.filename = self.used_url['filename']
@@ -317,10 +311,7 @@ class BuildrootPackage():
         Keyword arguments:
         tmp_path -- directory where you want the package to be extracted
         """
-        if six.PY2:
-            as_file = StringIO.StringIO(self.as_string)
-        else:
-            as_file = io.BytesIO(self.as_string)
+        as_file = io.BytesIO(self.as_string)
         if self.filename[-3:] == 'zip':
             with zipfile.ZipFile(as_file) as as_zipfile:
                 tmp_pkg = os.path.join(tmp_path, self.buildroot_name)
@@ -797,12 +788,12 @@ def main():
             print('Fetching package', package.real_name)
             try:
                 package.fetch_package_info()
-            except (six.moves.urllib.error.URLError, six.moves.urllib.error.HTTPError):
+            except (urllib.error.URLError, urllib.error.HTTPError):
                 continue
 
             try:
                 package.download_package()
-            except six.moves.urllib.error.HTTPError as error:
+            except urllib.error.HTTPError as error:
                 print('Error: {code} {reason}'.format(code=error.code,
                                                       reason=error.reason))
                 print('Error downloading package :', package.buildroot_name)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
