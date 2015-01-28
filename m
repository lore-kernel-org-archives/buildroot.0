From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jan 2015 22:00:43 +0100
Subject: [Buildroot] [git commit] python-jinja2: allow build as host-package
Message-ID: <20150128210052.E4F2B7F8DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8e13fbeb97826d0dd158115852a1445250372a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Jinja2 is a general purpose templating language for python and can be
required during build time for python scripts that generate code.

While currently there are no in-tree Buildroot packages which depend on
host-python-jinja2, I'm currently having to deal with a proprietary
software build system that requires it.

I have tested that it builds and works correctly as a host python
package for a Buildroot host-python and someone else might require it,
so I'm proposing its inclusion.

python-jinja2 for target builds fine without python-markupsafe as a
build dependency, but when building host-python-jinja2 without
host-python-markupsafe installed, the python package manager tries to
download and install it.
To avoid that and install host-python-markupsafe properly through
Buildroot, the host build dependency is needed. Host support for
python-markupsafe was submitted in a previous patch from this patchset.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jinja2/python-jinja2.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 49625e3..8440b64 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -10,5 +10,8 @@ PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3c
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
+# In host build, setup.py tries to download markupsafe if it is not installed
+HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 
 $(eval $(python-package))
+$(eval $(host-python-package))
