From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 21:46:00 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-networkx: install for
 host-python3
In-Reply-To: <20200723194600.3491282-1-thomas.petazzoni@bootlin.com>
References: <20200723194600.3491282-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200723194600.3491282-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.26.2
