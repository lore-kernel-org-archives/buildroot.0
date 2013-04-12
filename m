From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 12 Apr 2013 18:18:27 +0800
Subject: [Buildroot] [PATCH v5 5/7] package: Introduce package-specific
	BINFMT_FLAT options.
In-Reply-To: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1365761909-15305-5-git-send-email-sonic.adi@gmail.com>
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
index dd3bc7d..a449089 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,6 +103,10 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+ifeq ($(BR2_BINFMT_FLAT),y)
+TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
+endif
+
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
 TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
 TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
-- 
1.7.0.4
