From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:52:15 +0200
Subject: [Buildroot] [git commit] uclibc: don't install tools to staging
	when static
Message-ID: <20140715185226.DA8339D246@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddc67dad2cae5dd3e2a6729b6c7e6377062d3f1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't try to install ld* tools to staging when it's a static build,
there's no point and it'll be broken once we build a purely-static
uclibc.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index f88691a..0c04033 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -513,8 +513,8 @@ define UCLIBC_INSTALL_TARGET_CMDS
 	$(UCLIBC_INSTALL_TEST_SUITE)
 endef
 
-# For FLAT binfmts (static) there are no host utils
-ifeq ($(BR2_BINFMT_FLAT),)
+# STATIC has no ld* tools, only getconf
+ifeq ($(BR2_PREFER_STATIC_LIB),)
 define UCLIBC_INSTALL_UTILS_STAGING
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
 	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
