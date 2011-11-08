From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Nov 2011 23:46:51 +0100
Subject: [Buildroot] [git commit] gmp: work around ARM thumb build breakage
Message-ID: <20111108231130.5C80C8F4D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7139cd936e0cb793dc552ddf484aacac1b8dd45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gmp/gmp.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5eb6ecc..2222465 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -9,5 +9,10 @@ GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
 
+# Bad ARM assembly breaks on pure thumb
+ifeq ($(ARCH),arm)
+GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
