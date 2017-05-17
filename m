From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:46:14 +0200
Subject: [Buildroot] [git commit] ntp: add patch to fix -fPIC issue
Message-ID: <20170517194628.761F38267D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fde83cdf0da338937dae13144eea2923e5c2730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch that fixes the build on AArch64 and MIPS of the
ntp package, which was caused by some parts of ntp being built without
-fPIC.

Fixes:

  [aarch64] http://autobuild.buildroot.net/results/866b1d28595efd8b6becf83d0a64b596538d58b0
  [mips]    http://autobuild.buildroot.net/results/c2a945855172970736a8ffea9c564f029a023344

Thanks to Romain Naour for the initial analysis.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/0003-ntpq-fpic.patch | 23 +++++++++++++++++++++++
 package/ntp/ntp.mk               |  1 +
 2 files changed, 24 insertions(+)

diff --git a/package/ntp/0003-ntpq-fpic.patch b/package/ntp/0003-ntpq-fpic.patch
new file mode 100644
index 0000000..6e05a67
--- /dev/null
+++ b/package/ntp/0003-ntpq-fpic.patch
@@ -0,0 +1,23 @@
+ntpq/Makefile.am: add NTP_HARD_CFLAGS
+
+Pass NTP_HARD_CFLAGS when building ntpq, like in all other ntp
+modules, to make sure -fPIC is passed.
+
+Originally taken from
+https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=494143c3b4921a5c8b8596d58f2c8b98296bf688.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/ntpq/Makefile.am
+===================================================================
+--- a/ntpq/Makefile.am
++++ b/ntpq/Makefile.am
+@@ -23,7 +23,7 @@
+ ntpq_LDADD += $(LDADD_NTP)
+ noinst_HEADERS=	ntpq.h
+ noinst_LIBRARIES=	libntpq.a
+-libntpq_a_CFLAGS=	-DNO_MAIN_ALLOWED -DBUILD_AS_LIB
++libntpq_a_CFLAGS=	$(NTP_HARD_CFLAGS) -DNO_MAIN_ALLOWED -DBUILD_AS_LIB
+ CLEANFILES=
+ DISTCLEANFILES=	.version version.c config.log $(man_MANS)
+ ETAGS_ARGS=	Makefile.am
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index cd6cb16..26f5862 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -21,6 +21,7 @@ NTP_CONF_OPTS = \
 	--with-crypto
 
 # 0002-ntp-syscalls-fallback.patch
+# 0003-ntpq-fpic.patch
 NTP_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
