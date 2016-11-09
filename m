From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:57:18 +0100
Subject: [Buildroot] [git commit] python: fix double format detection
Message-ID: <20161109211541.35C5B81983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a6001f17aba3f405f1aa95b3d95a553761d9b03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python is not able to detect if compiler double representation is
compliant with IEE754:

  checking whether C doubles are little-endian IEEE 754 binary64... no
  checking whether C doubles are big-endian IEEE 754 binary64... no
  checking whether C doubles are ARM mixed-endian IEEE 754 binary64... no

Accordingly 'legacy' mode isused. It is possible to check this at
runtime by check if 'sys.float_repr_style' contains 'short' or
'legacy'. Calculus correctness is not garanteed with 'legacy'.

Problem is better described here:

  http://stackoverflow.com/questions/29920294/what-causes-pythons-float-repr-style-to-use-legacy
  https://bugs.python.org/issue7117

However, all gcc architecture use a representation compliant with
IEE754. So, we can enable it unconditionnaly.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
[Thomas: adjust condition to avoid usage of qstrip, suggested by Baruch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index cc65376..cfd5a0a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -140,6 +140,13 @@ PYTHON_CONF_ENV += \
 	ac_cv_prog_HAS_HG=/bin/false \
 	ac_cv_prog_SVNVERSION=/bin/false
 
+# GCC is always compliant with IEEE754
+ifeq ($(BR2_ENDIAN),"LITTLE")
+PYTHON_CONF_ENV += ac_cv_little_endian_double=yes
+else
+PYTHON_CONF_ENV += ac_cv_big_endian_double=yes
+endif
+
 PYTHON_CONF_OPTS += \
 	--without-cxx-main 	\
 	--without-doc-strings	\
