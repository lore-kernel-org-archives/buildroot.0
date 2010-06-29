From: Bryan Hundven <bryanhundven@gmail.com>
Date: Mon, 28 Jun 2010 18:45:14 -0700
Subject: [Buildroot] [PATCH 1/3] Fix kexec 'bin-to-hex' build failure
In-Reply-To: <1277775916-333-1-git-send-email-bryanhundven@gmail.com>
References: <1277775916-333-1-git-send-email-bryanhundven@gmail.com>
Message-ID: <1277775916-333-2-git-send-email-bryanhundven@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the kexec build, bin-to-hex is built to run on the host to help
generate purgatory.c.
BUILD_CC is set to the same thing as TARGET_CC, which does not run on my
host.
This change sets BUILD_CC to HOSTCC so that bin-to-hex is runnable on
the host.
---
 package/kexec/kexec.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 4367885..2094d65 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -8,6 +8,7 @@ KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/horms/kexec-tools/
 # no install-strip/install-exec
 KEXEC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+KEXEC_MAKE_OPT = BUILD_CC="$(HOSTCC)"
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPT += --with-zlib
-- 
1.7.0.4
