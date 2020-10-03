From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 08:57:30 +0200
Subject: [Buildroot] [git commit] package/python-aenum: drop test_v3.py file
 for python 2.x to fix pycompile issue
Message-ID: <20201003065707.A22B58E1C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=753c031977cfda84237366a98098bde828692f33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4ca459d54545c0e20b0f0cdc63bd81844ecd7f36/

aenum has conditional logic to load python 3.x code located in test_v3.py:

if pyver >= 3.0:
    from aenum.test_v3 import TestEnumV3, TestOrderV3, TestNamedTupleV3

And contains logic in setup.py to drop that file during setup.py install if
building for python 2.x:

py3_only = ('aenum/test_v3.py', )
..
if __name__ == '__main__':
    if 'install' in sys.argv:
        import os, sys
	..
        if sys.version_info[0] != 3:
            for file in py3_only:
                try:
                    os.unlink(file)

But this doesn't work in Buildroot as pkg-python.dk first does setup.py
build (which copies test_v3.py to the build directory) before setup.py
install, so test_v3.py gets installed, leading to errors from pycompile:

error:   File "/usr/lib/python2.7/site-packages/aenum/test_v3.py", line 12
    class MagicAutoNumberEnum(Enum, settings=AutoNumber):
                                            ^
SyntaxError: invalid syntax

As a workaround, add a hook to drop it from the target directory when
building for python 2.x.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aenum/python-aenum.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 1d5322ef41..97fcbb5e86 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -11,4 +11,13 @@ PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+# only needed/valid for python 3.x
+define PYTHON_AENUM_RM_PY3_FILE
+	rm -f $(TARGET_DIR)/usr/lib/python*/site-packages/aenum/test_v3.py
+endef
+
+PYTHON_AENUM_POST_INSTALL_TARGET_HOOKS += PYTHON_AENUM_RM_PY3_FILE
+endif
+
 $(eval $(python-package))
