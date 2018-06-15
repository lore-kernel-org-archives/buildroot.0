From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 14:06:43 +0200
Subject: [Buildroot] [git commit] scanpypi: rework download_package error
 handling
Message-ID: <20180615125302.C6BF8886F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb775f4c87c627537efbb56f2663d6079489f018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages don't provide source archive but only a wheel file. In
this case download variable is not defined. So define this variable at
the very beginning and check whether it is None after searching for
source archives in the metadata.

Bonus: fix PEP8 issue with wrong indentation.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 8a2ae00434..12c96b842e 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -178,6 +178,7 @@ class BuildrootPackage():
         """
         Download a package using metadata from pypi
         """
+        download = None
         try:
             self.metadata['urls'][0]['filename']
         except IndexError:
@@ -201,7 +202,7 @@ class BuildrootPackage():
                 continue
             try:
                 print('Downloading package {pkg} from {url}...'.format(
-                      pkg=self.real_name, url=download_url['url']))
+                    pkg=self.real_name, url=download_url['url']))
                 download = six.moves.urllib.request.urlopen(download_url['url'])
             except six.moves.urllib.error.HTTPError as http_error:
                 download = http_error
@@ -213,11 +214,14 @@ class BuildrootPackage():
                 self.md5_sum = hashlib.md5(self.as_string).hexdigest()
                 if self.md5_sum == download_url['digests']['md5']:
                     break
-        else:
-            if download.__class__ == six.moves.urllib.error.HTTPError:
-                raise download
-            raise DownloadFailed('Failed to download package {pkg}'
+
+        if download is None:
+            raise DownloadFailed('Failed to download package {pkg}: '
+                                 'No source archive available'
                                  .format(pkg=self.real_name))
+        elif download.__class__ == six.moves.urllib.error.HTTPError:
+            raise download
+
         self.filename = self.used_url['filename']
         self.url = self.used_url['url']
 
