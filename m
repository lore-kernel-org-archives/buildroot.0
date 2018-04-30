From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 22:54:00 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] scanpypi: add support for
 the new PyPI infrastructure
Message-ID: <20180501073415.DFB61890ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e0967180ac18c53705d99b6328e629692e75fd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

https://pypi.python.org URL has been changed to https://pypi.org.

Package's JSON object now contains sha256 checksum, so use it
instead of locally computed one. Change comments in the hash
file accordingly.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6766ff9d12c628332170098de9cff42625a2d0a3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index c96f1bc892..bc593e0e89 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -144,7 +144,7 @@ class BuildrootPackage():
         """
         Fetch a package's metadata from the python package index
         """
-        self.metadata_url = 'https://pypi.python.org/pypi/{pkg}/json'.format(
+        self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
             pkg=self.real_name)
         try:
             pkg_json = urllib2.urlopen(self.metadata_url).read().decode()
@@ -178,7 +178,7 @@ class BuildrootPackage():
             self.metadata['urls'] = [{
                 'packagetype': 'sdist',
                 'url': self.metadata['info']['download_url'],
-                'md5_digest': None}]
+                'digests': None}]
             # In this case, we can't get the name of the downloaded file
             # from the pypi api, so we need to find it, this should work
             urlpath = urllib2.urlparse.urlparse(
@@ -199,10 +199,10 @@ class BuildrootPackage():
             else:
                 self.used_url = download_url
                 self.as_string = download.read()
-                if not download_url['md5_digest']:
+                if not download_url['digests']['md5']:
                     break
                 self.md5_sum = hashlib.md5(self.as_string).hexdigest()
-                if self.md5_sum == download_url['md5_digest']:
+                if self.md5_sum == download_url['digests']['md5']:
                     break
         else:
             if download.__class__ == urllib2.HTTPError:
@@ -518,22 +518,23 @@ class BuildrootPackage():
         path_to_hash = os.path.join(self.pkg_dir, pkg_hash)
         print('Creating {filename}...'.format(filename=path_to_hash))
         lines = []
-        if self.used_url['md5_digest']:
-            md5_comment = '# md5 from {url}, sha256 locally computed\n'.format(
+        if self.used_url['digests']['md5'] and self.used_url['digests']['sha256']:
+            hash_header = '# md5, sha256 from {url}\n'.format(
                 url=self.metadata_url)
-            lines.append(md5_comment)
+            lines.append(hash_header)
             hash_line = '{method}\t{digest}  {filename}\n'.format(
                 method='md5',
-                digest=self.used_url['md5_digest'],
+                digest=self.used_url['digests']['md5'],
+                filename=self.filename)
+            lines.append(hash_line)
+            hash_line = '{method}\t{digest}  {filename}\n'.format(
+                method='sha256',
+                digest=self.used_url['digests']['sha256'],
                 filename=self.filename)
             lines.append(hash_line)
-        digest = hashlib.sha256(self.as_string).hexdigest()
-        hash_line = '{method}\t{digest}  {filename}\n'.format(
-            method='sha256',
-            digest=digest,
-            filename=self.filename)
-        lines.append(hash_line)
 
+        if self.license_files:
+            lines.append('# Locally computed sha256 checksums\n')
         for license_file in self.license_files:
             sha256 = hashlib.sha256()
             with open(license_file, 'rb') as lic_f:
