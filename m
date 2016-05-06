From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:58:18 +0200
Subject: [Buildroot] [git commit] uboot-tools: add patch to fix linking with
	libubootenv
Message-ID: <20160507071254.13C2A7FEB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c24eecc2146d72df24da9c4adcce40032100e970
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch from upstream [1] to fix linking with libubootenv:
	fw_env.c:(.text+0x94): undefined reference to `common_args'

[1] http://git.denx.de/?p=u-boot.git;a=commit;h=43cb65b7a00e4759427a6e4b8a02039e43dab5a5

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ug-config-structs-must-be-defined-in-tool.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/uboot-tools/0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch b/package/uboot-tools/0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch
new file mode 100644
index 0000000..380e8cc
--- /dev/null
+++ b/package/uboot-tools/0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch
@@ -0,0 +1,58 @@
+From 43cb65b7a00e4759427a6e4b8a02039e43dab5a5 Mon Sep 17 00:00:00 2001
+From: Andreas Fenkart <andreas.fenkart@digitalstrom.com>
+Date: Fri, 25 Mar 2016 14:52:19 +0100
+Subject: [PATCH] tools: env: bug: config structs must be defined in tools
+ library
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fw_senten/fw_printenv can be compiled as a tools library, excluding the
+fw_env_main object.
+
+Fixes build error when linking with libubootenv:
+	fw_env.c:(.text+0x94): undefined reference to `common_args'
+
+Backported from: 43cb65b7a00e4759427a6e4b8a02039e43dab5a5
+
+Reported-by: Stefano Babic <sbabic@denx.de>
+Signed-off-by: Andreas Fenkart <andreas.fenkart@digitalstrom.com>
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ tools/env/fw_env.c      | 4 ++++
+ tools/env/fw_env_main.c | 4 ----
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
+index 5c7505c..1420ac5 100644
+--- a/tools/env/fw_env.c
++++ b/tools/env/fw_env.c
+@@ -35,6 +35,10 @@
+ 
+ #include "fw_env.h"
+ 
++struct common_args common_args;
++struct printenv_args printenv_args;
++struct setenv_args setenv_args;
++
+ #define DIV_ROUND_UP(n, d)	(((n) + (d) - 1) / (d))
+ 
+ #define min(x, y) ({				\
+diff --git a/tools/env/fw_env_main.c b/tools/env/fw_env_main.c
+index 3bec5b9..3706d8f 100644
+--- a/tools/env/fw_env_main.c
++++ b/tools/env/fw_env_main.c
+@@ -49,10 +49,6 @@ static struct option long_options[] = {
+ 	{NULL, 0, NULL, 0}
+ };
+ 
+-struct common_args common_args;
+-struct printenv_args printenv_args;
+-struct setenv_args setenv_args;
+-
+ void usage_printenv(void)
+ {
+ 
+-- 
+2.8.2
+
