From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Nov 2013 23:12:33 +0100
Subject: [Buildroot] [git commit] tstools: perform shared library linking
	step using gcc rather than ld
Message-ID: <20131112222456.78F769BBD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a7ec2dd3758a9832471db2ccf0f8bf7b08ad6dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c45/c45bbdaff6cff56b5646add38032f29bb5520f16

Using ld directly breaks with certain toolchain configurations.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tstools/tstools.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/tstools/tstools.mk b/package/tstools/tstools.mk
index 377cc34..c9ac9f9 100644
--- a/package/tstools/tstools.mk
+++ b/package/tstools/tstools.mk
@@ -10,7 +10,8 @@ TSTOOLS_SOURCE  = tstools-$(TSTOOLS_VERSION).tgz
 TSTOOLS_LICENSE = MPL v1.1
 
 define TSTOOLS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) LD="$(TARGET_CC)" $(TARGET_MAKE_ENV) \
+		$(MAKE) -C $(@D)
 endef
 
 define TSTOOLS_INSTALL_TARGET_CMDS
