From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 10:54:39 +0200
Subject: [Buildroot] [git commit] python-treq: needs host-python-incremental
Message-ID: <20170713085046.C3CBE817BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc8a18f927e80a7646d496687f03b3e834ef5a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
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
