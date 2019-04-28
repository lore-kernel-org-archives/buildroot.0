From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Apr 2019 22:08:24 +0200
Subject: [Buildroot] [git commit] package/binutils: don't override the build
 command
Message-ID: <20190428200611.BB95283ABB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c4dd7bb5d96f4529a83ae7061c32062904b5b3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 1d42d0acca (binutils: ensure TARGET_CONFIGURE_ARGS is taken into
consideration for subdirs), the whole BUILD_CMDS was overriden in an
attempt to ensure that the target configure args (in fact, environment
variables) are indeed passed in the environment of the build command.

However, there is no reason to override the whole command, when we can
simply specify additional environment variables, as supported by the
autotools infra.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/binutils.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 6798356ff2..c70ba13b04 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -91,9 +91,7 @@ HOST_BINUTILS_CONF_OPTS = \
 
 # binutils run configure script of subdirs at make time, so ensure
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
-define BINUTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) $(BINUTILS_MAKE_OPTS) -C $(@D)
-endef
+BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
 
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
