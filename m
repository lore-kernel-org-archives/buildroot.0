From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:24 +0100
Subject: [Buildroot] [PATCH 07/13] autobuild-run: get host arch once
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-8-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in get_toolchain_configs()

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index fee68b7..e0971cb 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -162,15 +162,17 @@ def get_toolchain_configs():
     with urlopen_closing(tc_cfg_uri) as r:
         l = decode_byte_list(r.readlines())
     configs = []
+
+    (_, _, _, _, hostarch) = os.uname()
+    if hostarch == 'i686' or hostarch == 'x86_64':
+        hostarch = 'x86'
+
     for row in csv.reader(l):
         config = {}
         config["url"] = row[0]
         config["hostarch"] = row[1]
         # Ignore toolchains that are not built for the appropriate
         # host architecture
-        (_, _, _, _, hostarch) = os.uname()
-        if hostarch == 'i686' or hostarch == 'x86_64':
-            hostarch = 'x86'
         if hostarch != config["hostarch"]:
             continue
         config["libc"] = row[2]
-- 
2.3.0
