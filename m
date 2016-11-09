From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  9 Nov 2016 10:25:08 +0100
Subject: [Buildroot] [PATCH 2/2] python3: fix double format detection
In-Reply-To: <20161109092508.4503-1-jezz@sysmic.org>
References: <20161109092508.4503-1-jezz@sysmic.org>
Message-ID: <20161109092508.4503-2-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python is not able to detect if compiler double representation is
compliant with IEE754:

  checking whether C doubles are little-endian IEEE 754 binary64... no
  checking whether C doubles are big-endian IEEE 754 binary64... no
  checking whether C doubles are ARM mixed-endian IEEE 754 binary64... no

Accordingly 'legacy' mode isused. It is possible to check this at runtime by
check if 'sys.float_repr_style' contains 'short' or 'legacy'. Calculus
correctness is not garanteed with 'legacy'.

Problem is better described here:

  http://stackoverflow.com/questions/29920294/what-causes-pythons-float-repr-style-to-use-legacy
  https://bugs.python.org/issue7117

However, all gcc architecture use a representation compliant with IEE754. So,
we can enable it unconditionnaly.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/python3/python3.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b3f31c0..cdbe6f0 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -126,6 +126,13 @@ PYTHON3_CONF_ENV += \
 	ac_cv_working_tzset=yes \
 	ac_cv_prog_HAS_HG=/bin/false
 
+# GCC is always compliant with IEEE754
+ifeq ($(call qstrip,$(BR2_ENDIAN)),LITTLE)
+PYTHON3_CONF_ENV += ac_cv_little_endian_double=yes
+else
+PYTHON3_CONF_ENV += ac_cv_big_endian_double=yes
+endif
+
 # uClibc is known to have a broken wcsftime() implementation, so tell
 # Python 3 to fall back to strftime() instead.
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.9.3
