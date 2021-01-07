From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 14:39:38 +0100
Subject: [Buildroot] [PATCH 01/10] support/scripts/pkg-stats: improvements
 in is_status_*() methods
In-Reply-To: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210107133948.2997849-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make is_status_ok() work when the given status name is not even listed
in the status dict. This will be necessary for following commits.

Introduced similar methods for the error and na status, which will be
used in following commits.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4a9ff1ffa0..900f290e11 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -276,7 +276,13 @@ class Package:
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
-- 
2.29.2
