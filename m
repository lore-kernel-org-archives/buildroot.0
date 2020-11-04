From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Nov 2020 20:24:38 +0100
Subject: [Buildroot] [git commit] package/python-remi: downgrade to 2020.8.6
 and move to pypi
Message-ID: <20201104191228.50C52829FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=601f93b3e4c5d84395340464d6829fa7fa970521
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since
https://github.com/dddomodossola/remi/commit/481ee7ca3df55be127db35560978a36997a2c088

remi use setuptools-scm to obtain version, but .git directory is dropped when
the archive is fetched. The result is a build failure like:

Traceback (most recent call last):
  File "setup.py", line 22, in <module>
    include_package_data=True,
  File "/tmp/instance-0/output-1/host/lib/python2.7/site-packages/setuptools/__init__.py", line 145, in setup
    return distutils.core.setup(**attrs)
  File "/tmp/instance-0/output-1/host/lib/python2.7/distutils/core.py", line 111, in setup
    _setup_distribution = dist = klass(attrs)
  File "/tmp/instance-0/output-1/host/lib/python2.7/site-packages/setuptools/dist.py", line 448, in __init__
    k: v for k, v in attrs.items()
  File "/tmp/instance-0/output-1/host/lib/python2.7/distutils/dist.py", line 287, in __init__
    self.finalize_options()
  File "/tmp/instance-0/output-1/host/lib/python2.7/site-packages/setuptools/dist.py", line 740, in finalize_options
    ep.load()(self)
  File "/tmp/instance-0/output-1/host/lib/python2.7/site-packages/setuptools/dist.py", line 747, in _finalize_setup_keywords
    ep.load()(self, ep.name, value)
  File "/tmp/instance-0/output-1/host/lib/python2.7/site-packages/setuptools_scm/integration.py", line 17, in version_keyword
    dist.metadata.version = _get_version(config)
  File "/tmp/instance-0/output-1/host/lib/python2.7/site-packages/setuptools_scm/__init__.py", line 147, in _get_version
    parsed_version = _do_parse(config)
  File "/tmp/instance-0/output-1/host/lib/python2.7/site-packages/setuptools_scm/__init__.py", line 118, in _do_parse
    "use git+https://github.com/user/proj.git#egg=proj" % config.absolute_root
LookupError: setuptools-scm was unable to detect version for u'/tmp/instance-0/output-1/build/python-remi-2020.10.30'.

Make sure you're either building from a fully intact git repository or PyPI tarballs. Most other sources (such as GitHub's tarballs, a git checkout without the .git folder) don't contain the necessary metadata and will not work.

For example, if you're using pip, instead of https://github.com/user/proj/archive/master.zip use git+https://github.com/user/proj.git#egg=proj
make: *** [package/pkg-generic.mk:250: /tmp/instance-0/output-1/build/python-remi-2020.10.30/.stamp_built] Error 1
make: Leaving directory '/tmp/instance-0/buildroot'

Fix:
- http://autobuild.buildroot.net/results/3a6/3a62359d0e183d45e50e999fc2c58f7805bda142/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Peter: drop _LICENSE_FILES, tarball does not include LICENSE file]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-remi/python-remi.hash | 5 ++---
 package/python-remi/python-remi.mk   | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index aecdbc0bb0..5788d7d923 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,3 +1,2 @@
-# Locally computed
-sha256  afe28d799d147d39954e18377e81101d045affe9c634eed5bf8dfdf888202650  python-remi-2020.10.30.tar.gz
-sha256  bc198f9846c1da3a1c1b1fa2b12909b021365d1e7fe9b4039245edfcec3b7f7f  LICENSE
+# sha256 from https://pypi.org/pypi/remi/json
+sha256  2a1953747fd01bfda25381624f6b84d83586d247f6b47282dbafff348fd05d88  remi-2020.8.6.tar.gz
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 53836be9eb..04f2e1abee 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 2020.10.30
-PYTHON_REMI_SITE = $(call github,dddomodossola,remi,$(PYTHON_REMI_VERSION))
+PYTHON_REMI_VERSION = 2020.8.6
+PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
+PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/d1/74/e2a1f5df4e57170369b221017c954ce9002901b9cc136365de0cf300e72a
 PYTHON_REMI_LICENSE = Apache-2.0
-PYTHON_REMI_LICENSE_FILES = LICENSE
 PYTHON_REMI_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
