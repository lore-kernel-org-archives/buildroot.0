From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  3 Feb 2017 15:29:58 -0500
Subject: [Buildroot] [PATCH 10/11] openvmtools: bump version to
	5a9033ddfa95786d867e4d02bbb9a29bac8fb64f
In-Reply-To: <20170203202959.18916-1-aduskett@codeblue.com>
References: <20170203202959.18916-1-aduskett@codeblue.com>
Message-ID: <20170203202959.18916-10-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Technically this is 10.1.0, however the initial release left out a config
directory causing autoconfig to fail.  See this post:
https://github.com/vmware/open-vm-tools/issues/115#issuecomment-269963907

As such, I specified the hash to fix the release:
https://github.com/vmware/open-vm-tools/commit/5a9033ddfa95786d867e4d02bbb9a29bac8fb64f

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/openvmtools/openvmtools.hash |  2 +-
 package/openvmtools/openvmtools.mk   | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/openvmtools/openvmtools.hash b/package/openvmtools/openvmtools.hash
index ae28377..bf344e5 100644
--- a/package/openvmtools/openvmtools.hash
+++ b/package/openvmtools/openvmtools.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  6b415f6093a15ffce10d3c4b69aa7ff106bdc0efd88e18a70a59d6941d4d2379  openvmtools-stable-9.10.2.tar.gz
+sha256  ff384ab0c11e19db0fd6ddab60e8ae48a4591b141fb3a8e8f1d4e1a489dd293f  openvmtools-5a9033ddfa95786d867e4d02bbb9a29bac8fb64f.tar.gz
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 40a7dac..d3eda5c 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION = stable-9.10.2
+OPENVMTOOLS_VERSION = 5a9033ddfa95786d867e4d02bbb9a29bac8fb64f
 OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
 OPENVMTOOLS_SUBDIR = open-vm-tools
 OPENVMTOOLS_LICENSE = LGPLv2.1
 OPENVMTOOLS_LICENSE_FILES = $(OPENVMTOOLS_SUBDIR)/COPYING
+
 # Autoreconf needed or config/missing will run configure again at buildtime
 OPENVMTOOLS_AUTORECONF = YES
 OPENVMTOOLS_CONF_OPTS = --with-dnet \
@@ -45,13 +46,6 @@ else
 OPENVMTOOLS_CONF_OPTS += --without-pam
 endif
 
-# configure needs execution permission
-define OPENVMTOOLS_PRE_CONFIGURE_CHMOD
-	chmod 0755 $(@D)/$(OPENVMTOOLS_SUBDIR)/configure
-endef
-
-OPENVMTOOLS_PRE_CONFIGURE_HOOKS += OPENVMTOOLS_PRE_CONFIGURE_CHMOD
-
 # symlink needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
 # defined in lib/misc/hostinfoPosix.c
 # /sbin/shutdown needed for Guest OS restart/shutdown from hypervisor
-- 
2.9.3
