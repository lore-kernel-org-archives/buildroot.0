From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 22:23:23 +0100
Subject: [Buildroot] [PATCH] python3: don't use wcsftime() on uClibc
Message-ID: <1415913803-10416-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As investigated in bug #7646, wcsftime() doesn't work properly with
uClibc. Until it gets fixed in uClibc, let's tell Python 3 to not use
it. Python 3 will fall back to strftime(), which works properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Beyonlo <beyonlo@gmail.com>
---
 package/python3/python3.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2c1ef2a..0cb2630 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -107,6 +107,12 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes
 
+# uClibc is now to have a broken wcsftime() implementation, so tell
+# Python 3 to fall back to strftime() instead.
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+PYTHON3_CONF_ENV += ac_cv_func_wcsftime=no
+endif
+
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip	\
 	--without-cxx-main 	\
-- 
2.1.0
