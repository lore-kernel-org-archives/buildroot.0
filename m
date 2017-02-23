From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 23:03:19 +0100
Subject: [Buildroot] [git commit] package/python: apply unicode config to
	host build
Message-ID: <20170223221313.0198582248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01464f56bd8a61b461fce4c108be299a47a6a405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the host build of Python 2 defaults to narrow unicode (UCS2),
ignoring the BR2_PACKAGE_PYTHON_UCS4 configuration option which may be
set to wide (UCS4).

This results in host and target Python packages which are incompatible
in subtle ways.

For example, installing wheels into the target fails when they are made
with the host python, citing incompatibility (as can be seen by the
package tags which may be "cp27u-manylinux1" instead of
"cp27mu-manylinux1").

Compiling the host Python 2 with the same UCS configuration as the
target ensures that the packages are compatible (and the tags match).

This does not affect Python 3 as support for narrow unicode was
deprecated in version 3.3, see https://www.python.org/dev/peps/pep-0393/

Thanks to Tony Breeds <tony@bakeyournoodle.com> for reporting this.

Signed-off-by: Chris Smart <mail@csmart.io>
[Thomas: add comment in the code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 7b20434..281130c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -105,6 +105,9 @@ endif
 
 # Default is UCS2 w/o a conf opt
 ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
+# host-python must have the same UCS2/4 configuration as the target
+# python
+HOST_PYTHON_CONF_OPTS += --enable-unicode=ucs4
 PYTHON_CONF_OPTS += --enable-unicode=ucs4
 endif
 
