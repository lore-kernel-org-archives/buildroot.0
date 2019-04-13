From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 13 Apr 2019 18:46:06 +0200
Subject: [Buildroot] [RFC] package/python-mako: build host-python-mako as
 python3 module for mesa3d build.
Message-ID: <20190413164606.25700-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since a long time, it was not possible to build mesa3d from the git
repository due to the missing dependency on host-python-mako package
in mesa3d package.

python-mako module is used by a python script
ir_expression_operation.py to build the header file
ir_expression_operation_constant.h.

Hopefully when building mesa3d from a tarball release using the
autotools build system, this header is alreay generated and the build
continue.

But we are switching mesa3d package to meson build system that check
unconditionnaly if the mako module for python3 interpreter is present.

Even by removing this check, the meson build system call
ir_expression_operation.py script even if
ir_expression_operation_constant.h is already generated.

The problem with host-python-mako and mesa3d is that we need to build
mako module for python3 interpreter. Adding host-python-mako as mesa3d
dependency is not enough since it can be build as host python2 module
when BR2_PACKAGE_PYTHON3 is not selected for the target.

But adding python3 on the target in order to have a python3 module
on the host is not nice.

To build host-python-mako as python3 module we can add this line
in pyhon-mako package:
HOST_PYTHON_MAKO_NEEDS_HOST_PYTHON = python3

But python mako is not available anymore for python2 interpreter.

The problem is more global, how can we build the same python
module for python2 and/or python3 on the host ?

Mako module is also used by gnuradio build system and building
this module for python3 for mesa3d can eventually break the build of
gnuradio when the python interpreter on the host is python2
(to be tested).

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-mako/python-mako.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 0d06dc4986..710e4bbe32 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -14,5 +14,11 @@ PYTHON_MAKO_LICENSE_FILES = LICENSE
 # In host build, setup.py tries to download markupsafe if it is not installed
 HOST_PYTHON_MAKO_DEPENDENCIES = host-python-markupsafe
 
+# mesa3d python script use python-mako module only for python3.
+# So, build python-mako as python3 module.
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+HOST_PYTHON_MAKO_NEEDS_HOST_PYTHON = python3
+endif
+
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.20.1
