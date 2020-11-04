From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Nov 2020 15:51:36 +0100
Subject: [Buildroot] [PATCH 02/10] support/scripts/cve-checker: parse
 arguments earlier
In-Reply-To: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201104145145.1316167-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to have --help working, and the argument error checking
before we read from stdin, and potentially block if we get nothing on
stdin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve-checker | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
index 998ea5b8af..ff110fc17c 100755
--- a/support/scripts/cve-checker
+++ b/support/scripts/cve-checker
@@ -172,6 +172,8 @@ def parse_args():
 
 
 def __main__():
+    args = parse_args()
+
     packages = list()
     content = json.load(sys.stdin)
     for item in content:
@@ -179,7 +181,6 @@ def __main__():
         p = Package(item, pkg.get('version', ''), pkg.get('ignore_cves', ''))
         packages.append(p)
 
-    args = parse_args()
     date = datetime.datetime.utcnow()
 
     print("Checking packages CVEs")
-- 
2.26.2
