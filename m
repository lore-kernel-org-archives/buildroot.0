From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  1 Aug 2019 08:16:35 +0530
Subject: [Buildroot] [PATCH v4 22/30] autobuild-run: move get_branch() to
 Builder class
In-Reply-To: <20190801024643.11024-1-itsatharva@gmail.com>
References: <20190801024643.11024-1-itsatharva@gmail.com>
Message-ID: <20190801024643.11024-23-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

get_branch() requires http_url and is only called inside
Builder class. Moving it to builder class makes http_url
available to it and makes the Builder class cohesive.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - New patch
---
 scripts/autobuild-run | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 391c1dc..ccfa9c4 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -178,23 +178,6 @@ def log_write(logf, msg):
     logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()), msg))
     logf.flush()
 
-def get_branch():
-    """Returns the branch that should be built. It fetches a CSV file from
-    autobuild.buildroot.org that provides the list of branches to test
-    (first field) and their weight (second field). We build a list of
-    branches, where the branch name is repeated N times, with N being
-    the weight of the branch. We then pick a random branch in this
-    list. This way, branches with a higher weight are more likely to
-    be selected.
-    """
-    with urlopen_closing('http://autobuild.buildroot.org/branches') as r:
-        csv_branches = r.readlines()
-    branches = []
-    for branch in csv.reader(csv_branches):
-        branches += [branch[0]] * int(branch[1])
-
-    return branches[randint(0, len(branches) - 1)]
-
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc"]
     DEFAULT_OPTIONAL_PROGS = ["bzr", "diffoscope", "java", "javac", "jar"]
@@ -306,6 +289,23 @@ class Builder:
             print("ERROR: script version too old, please upgrade.")
             sys.exit(1)
 
+    def get_branch(self):
+        """Returns the branch that should be built. It fetches a CSV file from
+        autobuild.buildroot.org that provides the list of branches to test
+        (first field) and their weight (second field). We build a list of
+        branches, where the branch name is repeated N times, with N being
+        the weight of the branch. We then pick a random branch in this
+        list. This way, branches with a higher weight are more likely to
+        be selected.
+        """
+        with urlopen_closing('http://autobuild.buildroot.org/branches') as r:
+            csv_branches = r.readlines()
+        branches = []
+        for branch in csv.reader(csv_branches):
+            branches += [branch[0]] * int(branch[1])
+
+        return branches[randint(0, len(branches) - 1)]
+
     def prepare_build(self):
         """Prepare for the next build of the specified instance
 
@@ -346,7 +346,7 @@ class Builder:
                       os.path.relpath(f, self.dldir))
             os.remove(f)
 
-        branch = get_branch()
+        branch = self.get_branch()
         log_write(self.log, "INFO: testing branch '%s'" % branch)
 
         # Clone Buildroot. This only happens if the source directory
-- 
2.22.0
