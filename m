From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:43 -0000
Subject: [Buildroot] [git commit] package/ninja: always use host-python3
Message-ID: <20190602201233.E09CD81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8886a07a29d4760a107192bf2f31049694c5287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current logic selects Python3 for the host only if Python3 is
selected for the target, otherwise it selects Python2.

As Meson, the only package infrastructure using ninja, needs Python 3,
it is desirable to also depend on Python 3 on the host for the ninja
host package.

Otherwise, if no Python interpreter is selected for the target, both
Python 2 and Python 3 are build for the host, which is time consuming
without any benefit.

For example when building libmpdclient (and all its target and host
dependencies) the actual elapsed time for is reduced from around 286s
to 207s as reported by `time -p make clean all`.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ninja/ninja.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 9d6f30e9fe..f29ab0a930 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -9,7 +9,12 @@ NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
-HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+# Although Ninja supports both Python2 and Python3, we enforce Python3
+# on the host for the following reason: Meson is the only package
+# using Ninja so far and Meson requires Python3. In this way, we
+# prevent both Python2 and Python3 from being created on the host,
+# which is time consuming and without benefit.
+HOST_NINJA_DEPENDENCIES = host-python3
 
 define HOST_NINJA_BUILD_CMDS
 	(cd $(@D); ./configure.py --bootstrap)
