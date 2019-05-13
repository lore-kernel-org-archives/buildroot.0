From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 13 May 2019 23:53:37 +0200
Subject: [Buildroot] [PATCH v2] package/ninja: enforce Python3 on the host
Message-ID: <20190513215337.10400-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current logic selects Python3 for the host only if Python3 is
selected for the target, otherwise it selects Python2.

As Meson, the only package infrastructure using ninja, needs Python3, it is
desirable to also depend on Python3 on the host for the ninja host
package.

Otherwise, if no Python interpreter is selected for the target, both
Python2 and Python3 are build for the host, which is time consuming
without any benefit.

For example when building libmpdclient (and all its target and host
dependencies) the actual elapsed time for is reduced from around 286s to 207s
as reported by `time -p make clean all`.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
v2:
 * fix setting the dependency, as <pkg>_NEEDS_HOST_PYTHON
   only makes sense for packages using the python-package infrastructure,
   but Ninja is using the generic-package infrastructure (Thomas
   Petazzoni)
---
 package/ninja/ninja.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 9d6f30e9fe..6ae32d5ca3 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -9,7 +9,11 @@ NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
-HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+# Although Ninja supports both Python2 and Python3, we enforce Python3 on the
+# host for the following reason: Meson is the only package using Ninja so far
+# and Meson requires Python3. In this way, we prevent both Python2 and Python3
+# from being created on the host, which is time consuming and without benefit.
+HOST_NINJA_DEPENDENCIES = host-python3
 
 define HOST_NINJA_BUILD_CMDS
 	(cd $(@D); ./configure.py --bootstrap)
-- 
2.21.0
