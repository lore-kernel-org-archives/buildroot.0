From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 13:20:07 +0200
Subject: [Buildroot] [git commit] uclibc: enable parallel building of
	libraries
Message-ID: <20140629140732.AF8F69D10A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8862ca3bc8974dfff3f48e9901811427b67a4ebe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The use of MAKE1 for uClibc dates back 10 years:

commit 8e5fb3fb4ab09b4dc04fe7cb3f7becce6514117b
Author: Eric Andersen <andersen@codepoet.org>
Date:   Sat Dec 11 13:01:10 2004 +0000

    Add initial BR2_JLEVEL support, with some exceptions for apps that
    have broken 'make -j' support

Since that time there were lots of improvements in uClibc that seem to allow
parallel building of libs finally.

Unfortunately uClibc tests have dependences on previously built files,
that's why tests left with MAKE1.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 70705a2..8337bb6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -482,13 +482,13 @@ endef
 endif
 
 define UCLIBC_BUILD_CMDS
-	$(MAKE1) -C $(@D) \
+	$(MAKE) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX= \
 		DEVEL_PREFIX=/ \
 		RUNTIME_PREFIX=/ \
 		all
-	$(MAKE1) -C $(@D)/utils \
+	$(MAKE) -C $(@D)/utils \
 		PREFIX=$(HOST_DIR) \
 		HOSTCC="$(HOSTCC)" hostutils
 	$(UCLIBC_BUILD_TEST_SUITE)
