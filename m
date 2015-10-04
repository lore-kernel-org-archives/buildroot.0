From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 11:43:21 +0200
Subject: [Buildroot] [git commit] ibrdtn-tools: fix linking problem when
	building statically
Message-ID: <20151004094458.986FE7F931@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d3f4752af7a11215c1ef05f1b4f32bfca7d5a1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The problem looks like this:

/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr//lib/librt.a(timer_routines.os):
In function `__start_helper_thread':
timer_routines.c:(.text+0x2f4): undefined reference to `pthread_atfork'
collect2: error: ld returned 1 exit status

Adding -pthread to LDFLAGS fixes the problem.

Fixes:

  http://autobuild.buildroot.net/results/a87/a87a764d3a28f835ed8645923594f7023a662ae8/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ibrdtn-tools/ibrdtn-tools.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/ibrdtn-tools/ibrdtn-tools.mk b/package/ibrdtn-tools/ibrdtn-tools.mk
index 34f05a6..97ec3c9 100644
--- a/package/ibrdtn-tools/ibrdtn-tools.mk
+++ b/package/ibrdtn-tools/ibrdtn-tools.mk
@@ -10,6 +10,10 @@ IBRDTN_TOOLS_LICENSE = Apache-2.0
 IBRDTN_TOOLS_LICENSE_FILES = COPYING
 IBRDTN_TOOLS_DEPENDENCIES = ibrcommon ibrdtn host-pkgconf
 
+ifeq ($(BR2_STATIC_LIBS),y)
+IBRDTN_TOOLS_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
 IBRDTN_TOOLS_CONF_OPTS += --with-libdaemon
 IBRDTN_TOOLS_DEPENDENCIES += libdaemon
