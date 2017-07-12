From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 18:28:00 +0200
Subject: [Buildroot] [PATCH 7/8] python-treq: needs host-python-incremental
In-Reply-To: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
References: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170712162801.31131-8-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python-treq package lists the incremental Python module as part of
its setup_requires variable in setup.py, so it must be added as a host
dependency of the python-treq package to avoid build failures.

So far, this issue wasn't visible because python-treq selects
python-twisted, which itself selects the target python-incremental
package. Because python-incremental was before python-treq in the
alphabetic ordering, it was always built before python-treq. And due
to the fact that PYTHONPATH currently contains the directory with
target Python modules, the host Python interpreter was happily using
the target python-incremental while running on the host. But as we are
going to clean up PYTHONPATH, this will no longer be the case, and
hence python-treq needs to be fixed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-treq/python-treq.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index aa8c191..051b8ff 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -10,5 +10,6 @@ PYTHON_TREQ_SITE = https://pypi.python.org/packages/26/4b/303880fb5bab1111654df2
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
+PYTHON_TREQ_DEPENDENCIES = host-python-incremental
 
 $(eval $(python-package))
-- 
2.9.4
