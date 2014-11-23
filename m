From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 18:36:03 +0100
Subject: [Buildroot] [PATCH 5/5] radvd: add a patch to fix build failure on
	architectures without sysctl()
In-Reply-To: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416764163-12826-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Modern architectures such as ARC do not provide the sysctl() system
call, since it is deprecated. However, uClibc still installs
<sys/sysctl.h> in such cases, which defeats radvd check for the
availability of sysctl(). This commit adds a patch to radvd which
improves the sysctl() checking.

Fixes:

  http://autobuild.buildroot.org/results/458/4581c4220adeaebbf6761e3b923088d8de8522d5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0003-Improve-check-of-the-sysctl-function.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/radvd/0003-Improve-check-of-the-sysctl-function.patch

diff --git a/package/radvd/0003-Improve-check-of-the-sysctl-function.patch b/package/radvd/0003-Improve-check-of-the-sysctl-function.patch
new file mode 100644
index 0000000..3053f7b
--- /dev/null
+++ b/package/radvd/0003-Improve-check-of-the-sysctl-function.patch
@@ -0,0 +1,49 @@
+From 4c86b3cbf52f810615d92835e98d83e9555a4d88 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 23 Nov 2014 12:13:47 +0100
+Subject: [PATCH 3/3] Improve check of the sysctl() function
+
+Since sysctl is a deprecated system call, new architectures such as
+ARC don't implement it. In such cases, uClibc installs the
+<sys/sysctl.h> header, but dos not implement the sysctl()
+function. This has the annoying side effect of breaking the sysctl
+detection of radvd, which is purely based on the header file being
+present.
+
+To fix this, this commit adds a check based on the existence of the
+sysctl() function.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac   | 1 +
+ device-linux.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5dde3b2..5518f71 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -161,6 +161,7 @@ AC_CHECK_HEADERS( \
+ 	time.h \
+ )
+ AC_HEADER_TIME
++AC_CHECK_FUNCS([sysctl])
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_MSG_CHECKING(whether struct sockaddr_in6 has sin6_scope_id)
+diff --git a/device-linux.c b/device-linux.c
+index 1ecaa6b..d9b56b8 100644
+--- a/device-linux.c
++++ b/device-linux.c
+@@ -183,7 +183,7 @@ int check_ip6_forwarding(void)
+ 		value = -1;
+ 	}
+ 
+-#ifdef HAVE_SYS_SYSCTL_H
++#if defined(HAVE_SYS_SYSCTL_H) && defined(HAVE_SYSCTL)
+ 	int forw_sysctl[] = { SYSCTL_IP6_FORWARDING };
+ 	size_t size = sizeof(value);
+ 	if (!fp && sysctl(forw_sysctl, sizeof(forw_sysctl) / sizeof(forw_sysctl[0]), &value, &size, NULL, 0) < 0) {
+-- 
+2.1.0
+
-- 
2.1.0
