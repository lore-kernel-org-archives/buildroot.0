From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 15 Sep 2015 19:49:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: disable use of stack
	protector when not available
Message-ID: <1442342953-20312-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d93/d9390b929328e6253b883f000f6f09972df90f47/

sudo, by default, attempts to use the stack protector if configure detects
that it exists. The stack protector detection does not attempt to link
libssp, which can cause a false positive.

Instead, check if the stack protector is enabled in the buildroot
toolchain config, and pass --disable-hardening if it is not - similar to
psmisc and sox.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/sudo/sudo.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 4327c8a..b839ee4 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -30,6 +30,11 @@ else
 SUDO_CONF_OPTS += --without-pam
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+# Don't force -fstack-protector when SSP is not available in toolchain
+SUDO_CONF_OPTS += --disable-hardening
+endif
+
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
-- 
2.4.3
