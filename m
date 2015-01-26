From: Erico Nunes <erico.nunes@datacom.ind.br>
Date: Mon, 26 Jan 2015 15:25:58 -0200
Subject: [Buildroot] [PATCH v2 2/2] python-jinja2: allow build as
	host-package
In-Reply-To: <1422293158-26124-1-git-send-email-erico.nunes@datacom.ind.br>
References: <1422293158-26124-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <1422293158-26124-2-git-send-email-erico.nunes@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/python-jinja2/python-jinja2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 49625e3..2105f3a 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -10,5 +10,7 @@ PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3c
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
+HOST_PYTHON_JINJA2_DEPENDENCIES = host-python-markupsafe
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
