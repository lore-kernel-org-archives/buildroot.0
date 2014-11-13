From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 23:40:50 +0100
Subject: [Buildroot] [git commit] python3: don't use wcsftime() on uClibc
Message-ID: <20141113224628.B56F3B450F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ad4ac083276b3504889c39351a56d947f172b5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As investigated in bug #7646, wcsftime() doesn't work properly with
uClibc. Until it gets fixed in uClibc, let's tell Python 3 to not use
it. Python 3 will fall back to strftime(), which works properly.

[Peter: fix typo in comment]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Beyonlo <beyonlo@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2c1ef2a..5c72c6e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -107,6 +107,12 @@ PYTHON3_CONF_ENV += \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes
 
+# uClibc is known to have a broken wcsftime() implementation, so tell
+# Python 3 to fall back to strftime() instead.
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+PYTHON3_CONF_ENV += ac_cv_func_wcsftime=no
+endif
+
 PYTHON3_CONF_OPTS += \
 	--without-ensurepip	\
 	--without-cxx-main 	\
