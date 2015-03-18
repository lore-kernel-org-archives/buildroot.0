From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:36 +0100
Subject: [Buildroot] [PATCH v2 03/10] autobuild-run,
	python3: decode subprocess output
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <1426693843-28792-4-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

subprocess.check_output() and its py 2.6 compat variant,
subprocess.Popen().communicate()[0], return a bytes object in Python 3,
but regexp.search() in get_failure_reason() wants a str:

  >>> re.search(r'.', b'a')
  TypeError: can't use a string pattern on a bytes-like object

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 1edffc1..e536289 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -576,8 +576,9 @@ def send_results(result, **kwargs):
 
     def get_failure_reason():
         # Output is a tuple (package, version), or None.
-        lastlines = subprocess.Popen(["tail", "-n", "3",
-                                      os.path.join(outputdir, "logfile")], stdout=subprocess.PIPE).communicate()[0].splitlines()
+        lastlines = decode_bytes(subprocess.Popen(
+            ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
+            stdout=subprocess.PIPE).communicate()[0]).splitlines()
 
         import re
         regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
-- 
2.3.2
