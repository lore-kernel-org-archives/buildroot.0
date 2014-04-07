From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Apr 2014 23:55:20 +0200
Subject: [Buildroot] [git commit] harfbuzz: fix static linking of test
	programs when toolchain has threads support
Message-ID: <20140407225719.8B6A69C647@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d03017f53c2566ed32a0ae76d79eeb1ef4a7feb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/701/701a1a260a58a81f45b3b9eae7eb47b400e05b37/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 23bc848..ed440ed 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -13,6 +13,11 @@ HARFBUZZ_INSTALL_STAGING = YES
 
 HARFBUZZ_CONF_OPT = --without-coretext --without-uniscribe --without-graphite2
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# forgets to link test programs with -pthread breaking static link
+HARFBUZZ_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 	HARFBUZZ_DEPENDENCIES += cairo
 	HARFBUZZ_CONF_OPT += --with-cairo=yes
