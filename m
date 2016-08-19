From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri, 19 Aug 2016 19:29:21 +0300
Subject: [Buildroot] [PATCH] binutils: disable warning flags to prevent
	build failures
Message-ID: <1471624161-30283-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils-arc-2016.09-eng008 build fails sometimes.

This happens due to the following issue:

binutils configure script has CC variable that stores compiler for
target and CC_FOR_BUILD variable that stores compiler for host.

WARN_FLAGS are verified by the script to be compatible only with CC
compiler but not with CC_FOR_BUILD compiler. Despite this WARN_FLAGS
are passed to both CC and CC_FOR_BUILD compilers. This leads to
unevident errors when cross-compiling. More information you can find
in the binutils mailing list:
https://sourceware.org/ml/binutils/2016-08/msg00117.html

We are going to write a patch for bunutils that fixes the initial
issue. Current patch contains temporary workaround. It should be
deleted after real fix.

Fixes:
http://autobuild.buildroot.net/results/004/00455b6a8324920ad843d90ce0413451522691a8//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index aeabf75..2936eb5 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -58,6 +58,7 @@ BINUTILS_CONF_OPTS = \
 	--host=$(GNU_TARGET_NAME) \
 	--target=$(GNU_TARGET_NAME) \
 	--enable-install-libiberty \
+	--enable-build-warnings=no \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
-- 
2.6.3
