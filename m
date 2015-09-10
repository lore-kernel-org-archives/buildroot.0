From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 10 Sep 2015 11:03:00 +0100
Subject: [Buildroot] [PATCH] ibrdtn-tools: fix linking problem when building
	statically
Message-ID: <1441879380-51566-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem looks like this:

/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr//lib/librt.a(timer_routines.os):
In function `__start_helper_thread':
timer_routines.c:(.text+0x2f4): undefined reference to `pthread_atfork'
collect2: error: ld returned 1 exit status

Adding -pthread to LDFLAGS fixes the problem.

Fixes:

  http://autobuild.buildroot.net/results/a87/a87a764d3a28f835ed8645923594f7023a662ae8/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ibrdtn-tools/ibrdtn-tools.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/ibrdtn-tools/ibrdtn-tools.mk b/package/ibrdtn-tools/ibrdtn-tools.mk
index c9a585d..ca26c8a 100644
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
-- 
1.7.1
