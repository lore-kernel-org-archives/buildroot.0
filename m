From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 09:41:04 +0200
Subject: [Buildroot] [PATCH] package/rt-tests: add patch to fix
 compatibility with make 3.81
Message-ID: <20210512074104.14180-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/cf7c4f360f5464c700788cc8299fd086544c80e8/build-end.log

Older GNU make versions don't like the explicit undefine.  It isn't really
needed as ifdef handles undefined and defined-to-the-empty-string the same
way, so just drop the undefine logic.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...plicit-undefine-PYLIB-for-compatibil.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch

diff --git a/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch b/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
new file mode 100644
index 0000000000..f71ba09a79
--- /dev/null
+++ b/package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch
@@ -0,0 +1,48 @@
+From 84fea5d784e010f84c860b34e55ea2c855c17b3b Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Wed, 12 May 2021 09:18:33 +0200
+Subject: [PATCH] Makefile: drop explicit undefine PYLIB for compatibility with
+ make 3.81
+
+GNU make 3.81 does not like the explicit tab-indented undefine:
+
+Makefile:41: *** commands commence before first target.  Stop.
+
+Dropping the indentation also doesn't work:
+
+Makefile:41: *** missing separator.  Stop.
+
+So simply drop the undefine logic.  As explained in the GNU make manual,
+undefine is not commonly needed as E.G. ifdef checks for a non-zero string:
+
+https://www.gnu.org/software/make/manual/html_node/Undefine-Directive.html
+https://www.gnu.org/software/make/manual/html_node/Conditional-Syntax.html
+
+Fixes:
+http://autobuild.buildroot.net/results/cf7c4f360f5464c700788cc8299fd086544c80e8/build-end.log
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Upstream: https://marc.info/?l=linux-rt-users&m=162080462211139&w=2]
+---
+ Makefile | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index b17ac09..ec85ac8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -36,11 +36,6 @@ LDFLAGS ?=
+ 
+ PYLIB  ?= $(shell python3 -c 'import distutils.sysconfig;  print (distutils.sysconfig.get_python_lib())')
+ 
+-# Check for errors, such as python3 not available
+-ifeq (${PYLIB},)
+-	undefine PYLIB
+-endif
+-
+ MANPAGES = src/cyclictest/cyclictest.8 \
+ 	   src/pi_tests/pi_stress.8 \
+ 	   src/ptsematest/ptsematest.8 \
+-- 
+2.20.1
+
-- 
2.20.1
