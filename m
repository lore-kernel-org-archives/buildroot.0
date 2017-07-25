From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:01:08 +0200
Subject: [Buildroot] [git commit] genrandconfig: use minimal.config
Message-ID: <20170725210435.170417FA94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cae6ac3e31ea4c32356e6ceee70375e04fd70be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This has a number of side-effects which must be handled.

The lines in minimal.config may be overridden by the random lines added
by amending the configuration, so is_toolchain_usable() shouldn't take
those into account, or indeed the random lines added. Therefore, make
a copy of the config before appending minimal.config and the random
lines. While we're at it, rename the variable to the more appropriate
toolchainconfig.

minimal.config sets BR2_INIT_NONE=y, but we really also want to test
with BR2_INIT_BUSYBOX=y. Therefore, add a random line to use the
busybox init system. We set its probability rather high. The
probabilities of systemd and eudev are increased since they're now
in the else branch of BR2_INIT_BUSYBOX, which halves the probability
that we even get there.

We now also generate configurations without busybox. Previously,
busybox was almost always selected due to BR2_INIT_BUSYBOX=y. Only if
systemd is selected there was a chance to build without busybox.

We now set BR2_SYSTEM_BIN_SH_NONE=y, the other /bin/sh options are
never tested. However, this is not really something that is relevant
to test in the autobuilders.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 4ff7deb..d397b23 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -332,19 +332,24 @@ def gen_config(args):
     configs = get_toolchain_configs(args.toolchains_url)
 
     i = randint(0, len(configs) - 1)
-    config = configs[i]
+    toolchainconfig = configs[i]
 
-    configlines = config
+    configlines = list(toolchainconfig)
+
+    # Combine with the minimal configuration
+    minimalconfigfile = os.path.join(args.buildrootdir,
+                                     'support/config-fragments/minimal.config')
+    with open(minimalconfigfile) as minimalf:
+        configlines += minimalf.readlines()
 
     # Amend the configuration with a few things.
-    configlines.append("BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y\n")
-    configlines.append("# BR2_TARGET_ROOTFS_TAR is not set\n")
-    configlines.append("BR2_COMPILER_PARANOID_UNSAFE_PATH=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_ENABLE_DEBUG=y\n")
-    if randint(0, 30) == 0:
+    if randint(0, 1) == 0:
+        configlines.append("BR2_INIT_BUSYBOX=y\n")
+    elif randint(0, 15) == 0:
         configlines.append("BR2_INIT_SYSTEMD=y\n")
-    elif randint(0, 20) == 0:
+    elif randint(0, 10) == 0:
         configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_STATIC_LIBS=y\n")
@@ -364,7 +369,7 @@ def gen_config(args):
     subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                            "olddefconfig"])
 
-    if not is_toolchain_usable(configfile, config):
+    if not is_toolchain_usable(configfile, toolchainconfig):
         return 2
 
     # Now, generate the random selection of packages, and fixup
