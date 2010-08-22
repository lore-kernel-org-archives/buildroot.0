From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:52:11 +0200
Subject: [Buildroot] [PATCH 19/20] sysvinit: make sure to link against
	libcrypt
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <256ec714e6696250a5874afc0a4995d28047fe4d.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
