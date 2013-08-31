From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:01 -0000
Subject: [Buildroot] [git commit] uclibc: set MMU usage accordingly
Message-ID: <20130831213336.BB11D9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c798bec25b0f70061dcdb154708e41b962e6b74f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On architectures that lack a MMU (like blackfin) uclibc just undefined
ARCH_HAS_MMU which disabled ARCH_USE_MMU.
But for other architectures which may or may not have one like ARM we
need to set this according to user choice.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 644c531..e3681c7 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -242,6 +242,20 @@ endef
 endif
 
 #
+# MMU
+#
+
+ifeq ($(BR2_USE_MMU),y)
+define UCLIBC_MMU_CONFIG
+	$(call UCLIBC_OPT_SET,ARCH_USE_MMU,y,$(@D))
+endef
+else
+define UCLIBC_MMU_CONFIG
+	$(call UCLIBC_OPT_UNSET,ARCH_USE_MMU,$(@D))
+endef
+endif
+
+#
 # IPv6
 #
 
