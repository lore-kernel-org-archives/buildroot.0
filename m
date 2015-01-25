From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 23:41:31 +0100
Subject: [Buildroot] [PATCH] toolchain/external: do not accept distro-class
	toolchains
Message-ID: <1422225691-15930-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..61a3639 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -347,6 +347,11 @@ check_unusable_toolchain = \
 		echo "them unsuitable as external toolchains for build systems" ; \
 		echo "such as Buildroot." ; \
 		exit 1 ; \
+	fi; \
+	with_sysroot=`$${__CROSS_CC} -v 2>&1 |sed -r -e '/.* --with-sysroot=([^[:space:]]+)[[:space:]].*/!d; s//\1/'`; \
+	if test "$${with_sysroot}"  = "/" ; then \
+		echo "Distribution toolchains are unsuitable for use by Buildroot," ; \
+		echo "as they were configured in a way that makes them non-relocatable."; \
 	fi
 
 #
-- 
1.9.1
