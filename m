From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 10:08:23 +0200
Subject: [Buildroot] [PATCH 03/19] libcap: fix build failure
In-Reply-To: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
Message-ID: <485ba350324ddf2b457375817110a50e8880818b.1274428595.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On a x86-64 host, libcap tried to install things in
$(STAGING_DIR)/lib64 and $(TARGET_DIR)/lib64. Therefore, pass lib= and
prefix=, as required by the strange build system used by libcap.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap/libcap.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 3ea5e51..301d1b1 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -8,7 +8,7 @@ define LIBCAP_BUILD_CMDS
 endef
 
 define LIBCAP_INSTALL_STAGING_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) install
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
@@ -20,7 +20,7 @@ define HOST_LIBCAP_BUILD_CMDS
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) install
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) prefix=/usr lib=lib install
 endef
 
 $(eval $(call GENTARGETS,package,libcap))
-- 
1.6.3.3
