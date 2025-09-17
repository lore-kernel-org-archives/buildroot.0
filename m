Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E138BCAC5A5
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74EF84447;
	Wed, 17 Sep 2025 16:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3-TEOZAMWCr; Wed, 17 Sep 2025 16:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4FD18444E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4FD18444E;
	Wed, 17 Sep 2025 16:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA9C1290
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BFC161579
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPaiJsC3-sai for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6176B615DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6176B615DA
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F5DC851CA; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 18:42:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6448c3b425ebe416103cc6878f1d7d0024f09932
X-Git-Newrev: 53eb75ef535b656e9cd762fb9412dc5c1340f64b
X-Patchwork-Hint: ignore
Message-Id: <20250917164534.5F5DC851CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/scanpypi: remove python six module
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53eb75ef535b656e9cd762fb9412dc5c1340f64b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We dropped support for python2 a while back in [1], as such we
can remove the python six module which was only needed for
backwards comaptibility with python2.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/2743ce00ca61fde1537b64a165a69d497052be58

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add commit ref removing python2 support]
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
