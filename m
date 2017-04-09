From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Apr 2017 22:51:25 +0200
Subject: [Buildroot] [PATCH/autobuild 5/8] autobuild-run: check that
	toolchain config lines are still present
In-Reply-To: <20170409205128.11560-1-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
Message-ID: <20170409205128.11560-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some lines from the toolchain config may be removed due to dependency
issues. Currently this is covered by explicit conditions in the
autobuild-run script, e.g. checking that libc is not glibc before
enabling BR2_STATIC_LIBS. However, that binds this script pretty
tightly to the logic in Buildroot itself.

So instead, just check that the toolchain configuration is still valid
after running 'olddefconfig', and discard the configuration if it
isn't.  This is similar to how it's done in the test-pkg script.

We also report all the missing lines in the log file.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 1df1ce0..50808b6 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -366,6 +366,16 @@ def is_toolchain_usable(**kwargs):
     with open(os.path.join(outputdir, ".config")) as configf:
         configlines = configf.readlines()
 
+    # Check that the toolchain configuration is still present
+    # Report all the missing ones
+    toolchaincomplete = True
+    for toolchainline in kwargs['config']:
+        if toolchainline not in configlines:
+            log_write(log, "WARN: missing toolchain config line: %s" % toolchainline[:-1])
+            toolchaincomplete = False
+    if not toolchaincomplete:
+        return False
+
     # The latest Linaro toolchains on x86-64 hosts requires glibc
     # 2.14+ on the host.
     if platform.machine() == 'x86_64':
@@ -564,7 +574,7 @@ def gen_config(**kwargs):
         log_write(log, "ERROR: cannot oldconfig")
         return -1
 
-    if not is_toolchain_usable(**kwargs):
+    if not is_toolchain_usable(config=config["contents"], **kwargs):
         return -1
 
     # Now, generate the random selection of packages, and fixup
-- 
2.11.0
