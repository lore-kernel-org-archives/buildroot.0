From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:47:29 +0200
Subject: [Buildroot] [git commit] package/python-simplegeneric: Switch setup
	type to 'setuptools'
Message-ID: <20170611124806.679B68186F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d69d8033469228968043087fd31300af1e1453a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Specifying setup type to be 'distutils' results in this package being
installed as .egg, a zipped file, which inadvertantly makes
'simplegeneric' to be dependent on BR2_PACKAGE_PYTHON*_ZLIB. In order
to avoid that specify setup type to be 'setuptools' which makes use of
--single-version-externally-managed and therefore installs the package
as .pyc and a .egg-info folder.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-simplegeneric/python-simplegeneric.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/python-simplegeneric/python-simplegeneric.mk b/package/python-simplegeneric/python-simplegeneric.mk
index 556a478..cc84320 100644
--- a/package/python-simplegeneric/python-simplegeneric.mk
+++ b/package/python-simplegeneric/python-simplegeneric.mk
@@ -8,7 +8,12 @@ PYTHON_SIMPLEGENERIC_VERSION = 0.8.1
 PYTHON_SIMPLEGENERIC_SOURCE = simplegeneric-$(PYTHON_SIMPLEGENERIC_VERSION).zip
 PYTHON_SIMPLEGENERIC_SITE = https://pypi.python.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b
 PYTHON_SIMPLEGENERIC_LICENSE = ZPL-2.1
-PYTHON_SIMPLEGENERIC_SETUP_TYPE = distutils
+
+# Force setup-type to be 'setuptools' in order to force the package to
+# be installed with --single-version-externally-managed. Otherwise we
+# end up with a .egg file, which is a zip archive, and as such forces
+# us to have 'zlib' as a runtime dependency
+PYTHON_SIMPLEGENERIC_SETUP_TYPE = setuptools
 
 define PYTHON_SIMPLEGENERIC_EXTRACT_CMDS
 	unzip $(DL_DIR)/$(PYTHON_SIMPLEGENERIC_SOURCE) -d $(@D)
