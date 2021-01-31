From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 12:02:41 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: improvements in
 is_status_*() methods
Message-ID: <20210131104322.839D485F35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f83ad74675161abeb7ad4a47d2a30a4f4f7510b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make is_status_ok() work when the given status name is not even listed
in the status dict. This will be necessary for following commits.

Introduced similar methods for the error and na status, which will be
used in following commits.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b66064f143..099aacc8d2 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -275,7 +275,13 @@ class Package:
             self.status['developers'] = ("warning", "no developers")
 
     def is_status_ok(self, name):
-        return self.status[name][0] == 'ok'
+        return name in self.status and self.status[name][0] == 'ok'
+
+    def is_status_error(self, name):
+        return name in self.status and self.status[name][0] == 'error'
+
+    def is_status_na(self, name):
+        return name in self.status and self.status[name][0] == 'na'
 
     def __eq__(self, other):
         return self.path == other.path
