From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 00:02:35 +0200
Subject: [Buildroot] [git commit] utils/getdeveloperlib.py: add defconfig
 parsing
Message-ID: <20190804220044.28DBD82C8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caead54274416651b3eb732919c2f4f375b34a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch extends the Developer class so that it associates each
developer with the defconfigs (in configs/) is in responsible for,
according to the DEVELOPERS file.

It will allow using the getdeveloperlib module to find which developer
is responsible for which defconfig, and send e-mail notifications of
defconfig build failures.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/getdeveloperlib.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index c0eff7df29..c18236b3a5 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -120,6 +120,7 @@ class Developer:
         self.architectures = parse_developer_architectures(files)
         self.infras = parse_developer_infras(files)
         self.runtime_tests = parse_developer_runtime_tests(files)
+        self.defconfigs = parse_developer_defconfigs(files)
 
     def hasfile(self, f):
         f = os.path.abspath(f)
@@ -141,6 +142,8 @@ class Developer:
             things.append('{} infras'.format(len(self.infras)))
         if len(self.runtime_tests):
             things.append('{} tests'.format(len(self.runtime_tests)))
+        if len(self.defconfigs):
+            things.append('{} defconfigs'.format(len(self.defconfigs)))
         if things:
             return 'Developer <{} ({})>'.format(name, ', '.join(things))
         else:
@@ -203,6 +206,14 @@ def parse_developer_infras(fnames):
     return infras
 
 
+def parse_developer_defconfigs(fnames):
+    """Given a list of file names, returns the config names
+    corresponding to defconfigs."""
+    return {os.path.basename(fname[:-10])
+            for fname in fnames
+            if fname.endswith('_defconfig')}
+
+
 def parse_developer_runtime_tests(fnames):
     """Given a list of file names, returns the runtime tests
     corresponding to the file."""
