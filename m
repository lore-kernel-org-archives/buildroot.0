From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 11 Apr 2013 10:09:02 +0800
Subject: [Buildroot] [PATCH v4 5/7] package: Introduce package-specific
	BINFMT_FLAT options.
In-Reply-To: <1365646144-8214-1-git-send-email-sonic.adi@gmail.com>
References: <1365646144-8214-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1365646144-8214-5-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Add new option <PKG>_FLAT_STACKSIZE. The document needs to be updated.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

---

v4-change:
- Use late binding in make to expand package specific flat stack size
to TARGET_LDFLAGS.

v2-changes:
- Fix typo error in macro BINFMT_FLAT
---
 package/Makefile.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a8bf36b..f813961 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,6 +103,10 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+ifeq ($(BR2_BINFMT_FLAT),y)
+TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
-- 
1.7.0.4
