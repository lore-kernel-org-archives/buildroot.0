From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 22 Feb 2019 21:37:56 +0100
Subject: [Buildroot] [PATCH] package/ninja: enforce Python3 on the host
Message-ID: <20190222203756.8795-1-joerg.krause@embedded.rocks>
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
 package/ninja/ninja.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 9d6f30e9fe..42dc3cb567 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -9,7 +9,10 @@ NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
-HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+# Enforce Python3 on the host, to prevent building Python2 and Python3 when
+# using packages using the Meson infrastructure and not having any Python
+# interperter selected for the target.
+HOST_NINJA_NEEDS_HOST_PYTHON = python3
 
 define HOST_NINJA_BUILD_CMDS
 	(cd $(@D); ./configure.py --bootstrap)
-- 
2.20.1
