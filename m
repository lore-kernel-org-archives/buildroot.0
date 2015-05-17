From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 14:07:26 +0200
Subject: [Buildroot] [git commit] ipmiutil: openssl support needs shared
	library
Message-ID: <20150517120754.D68738010A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f31cd14d01e306e6475b750c30554043c57491a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0d4/0d4e0ea8fdb233ea8e86f86b6fa406311a0279e2/
http://autobuild.buildroot.net/results/907/907ae0feb9ad2e4a0da4b38290a2b617cb4360a0/

The ipmiutil buildsystem doesn't take dependencies of libcrypto (E.G. zlib)
into consideration, causing link issues when linking statically.

The build system doesn't handle LIBS, so there is no simple way to fix this
outside patching the buildsystem.  As we are very close to the release, lets
just mark it as !static for now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/ipmiutil.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index f03ad9b..011c0b6 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -11,7 +11,8 @@ IPMIUTIL_LICENSE_FILES = COPYING
 # We're patching configure.ac
 IPMIUTIL_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# forgets to link against libcrypto dependencies breaking static link
+ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
 # SKIP_MD2 can be used only if ALLOW_GNU is defined.
