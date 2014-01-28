From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:56:40 +0100
Subject: [Buildroot] [git commit] package/uClibc: ensure .config is writable
Message-ID: <20140128215820.BF4659C6AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbb1e7ae218701b74c88ee8d1f9fde7c763df54e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If $(UCLIBC_CONFIG_FILE) is read-only (eg. because Buildroot's
source dir is), the sed fixups to .config fail.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 1978bbd..7df9721 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -414,7 +414,7 @@ UCLIBC_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)"
 
 define UCLIBC_SETUP_DOT_CONFIG
-	cp -f $(UCLIBC_CONFIG_FILE) $(@D)/.config
+	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
 	$(call UCLIBC_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
 	$(call UCLIBC_OPT_SET,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D))
