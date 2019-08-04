From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 16:21:43 +0200
Subject: [Buildroot] [PATCH 3/3] utils/getdeveloperlib.py: add defconfigs
In-Reply-To: <20190804142143.10923-1-victor.huesca@bootlin.com>
References: <20190804142143.10923-1-victor.huesca@bootlin.com>
Message-ID: <20190804142143.10923-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to follow defconfig files.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/getdeveloperlib.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 8c8343a137..80c46b9fa8 100644
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
             things.append('{} runtime'.format(len(self.runtime_tests)))
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
-- 
2.21.0
