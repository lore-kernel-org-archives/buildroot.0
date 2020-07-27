From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 16:29:18 +0200
Subject: [Buildroot] [git commit] package/python-networkx: install for
 host-python3
Message-ID: <20200727142432.8F4CC813A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f202b2369190661cb224e5871afc30bf5d85dce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This Python module only works for Python 3: the target variant has a
"depends on BR2_PACKAGE_PYTHON3".

However today in Buildroot, when no target python is selected, or when
BR2_PACKAGE_PYTHON=y, all host python modules are installed for
host-python, i.e Python 2. But this module won't install in Python 2,
so let's force its host variant to be installed with Python 3 on the
host. Of course, for that to work, its dependency must also be built
for host-python3, so we change it to the newly introduced
host-python3-decorator package.

Fixes:

  http://autobuild.buildroot.net/results/46a89bd6cd0d0b896b28010db287068309e7a43c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-networkx/python-networkx.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index bcb3f22f8e..2efc53d628 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -10,7 +10,8 @@ PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/bf/63/7b579dd3b1c49ce6b7
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
-HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
+HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python3-decorator
+HOST_PYTHON_NETWORKX_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
