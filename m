From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:42 +0100
Subject: [Buildroot] [PATCH v2 09/10] autobuild-run: control subprocess env
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <1426693843-28792-10-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Preparation step for passing LANG to worker (sub-)processes,
allows to control execution environment of subprocesses
without affecting the "autobuild-run" process itself.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0ee6d57..e1a3398 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -173,11 +173,12 @@ class SystemInfo:
         self.optional_progs = list(self.__class__.DEFAULT_OPTIONAL_PROGS)
         self.progs = {}
         self.devnull = open(os.devnull, "w")
+        self.env = os.environ.copy()
 
-    def find_prog(self, name, flags=os.X_OK, env=os.environ):
+    def find_prog(self, name, flags=os.X_OK):
         if not name or name[0] == os.sep: raise ValueError(name)
 
-        prog_path = env.get("PATH", None)
+        prog_path = self.env.get("PATH", None)
         # for windows compatibility, we'd need to take PATHEXT into account
 
         if prog_path:
@@ -234,6 +235,7 @@ class SystemInfo:
         kwargs.setdefault('stdin', self.devnull)
         kwargs.setdefault('stdout', self.devnull)
         kwargs.setdefault('stderr', self.devnull)
+        kwargs['env'] = self.env
         return subprocess.Popen(cmdv, **kwargs)
 
     def run_cmd(self, cmdv, **kwargs):
-- 
2.3.2
