From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] sysvinit: make sure to link
	against libcrypt
Message-ID: <20100825153146.600EC89016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3de556d28b0e92541ade939a58706bc94ed8ab4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sysvinit Makefile checks if /usr/lib/libcrypt.a exists to determine
whether it should link against libcrypt or not. This test fails on
distributions such as Fedora, in which /usr/lib/libcrypt.a does not
exist (it is in /usr/lib64), but where libcrypt is available on the
target. As libcrypt is available in both uClibc and gclibc, we just
force sysvinit to link against libcrypt.

Fixes bug #2401.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysvinit/sysvinit.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 0b827e6..09aaf74 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -21,7 +21,9 @@ $(SYSVINIT_DIR)/.unpacked: $(DL_DIR)/$(SYSVINIT_SOURCE)
 	touch $@
 
 $(SYSVINIT_DIR)/$(SYSVINIT_BINARY): $(SYSVINIT_DIR)/.unpacked
-	CFLAGS="$(TARGET_CFLAGS)" $(MAKE) CC="$(TARGET_CC)" -C $(SYSVINIT_DIR)/src
+	# Force sysvinit to link against libcrypt as it otherwise
+	# use an incorrect test to see if it's available
+	CFLAGS="$(TARGET_CFLAGS)" $(MAKE) CC="$(TARGET_CC)" LCRYPT="-lcrypt" -C $(SYSVINIT_DIR)/src
 
 $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY): $(SYSVINIT_DIR)/$(SYSVINIT_BINARY)
 	for x in halt init shutdown; do \
-- 
1.7.1
