From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 23:39:13 +0100
Subject: [Buildroot] [PATCH 6/7 v3] autobuild: add a function to check if
	the configuration is fixable
In-Reply-To: <cover.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <6e28b34908740816d7f4fe96631ab3f94d023370.1448663846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the fixup_config() function is responsible for two things:
  - checking whether the configuration can be fixed,
  - actually fixing it.

When we have an initial basic configuration, we currently loop
over-and-over again until the configuration is actually fixed (limted to
100 iterations).

However, there are cases where the configuration can *not* be fixed,
because it contains options incompatible with the host system [0], and
wich are not randomised (i.e. looping will never fix the configuration).

Introduce a new function, is_config_fixable() which is responsible for
checking that the initial configuration does not contain any option that
is incompatible with the host system.

That function currently does nothing ands always consider the
configuration to be fixable; actual tests will be added in followup
commits.

[0] like the latest Linaro ARM toolchains which requires a glibc >= 2.14.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/autobuild-run | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0fce008..1c7c91f 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -332,6 +332,15 @@ def prepare_build(**kwargs):
 
     return 0
 
+def is_config_fixable(**kwargs):
+    """Check if the configuration is actually fixable
+
+    This functions checks that the configuration does not contain
+    any unfixable options.
+    """
+
+    return True
+
 def fixup_config(**kwargs):
     """Finalize the configuration and reject any problematic combinations
 
@@ -516,6 +525,10 @@ def gen_config(**kwargs):
         log_write(log, "ERROR: cannot oldconfig")
         return -1
 
+    if not is_config_fixable(**kwargs):
+        log_write(log, "ERROR: configuration is not fixable")
+        return -1
+
     # Now, generate the random selection of packages, and fixup
     # things if needed.
     # Safe-guard, in case we can not quickly come to a valid
-- 
1.9.1
