From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 22:44:54 +0100
Subject: [Buildroot] [git commit] openssl: only build threads configuration
	if toolchain has pthread support
Message-ID: <20131122215507.04AFD9BD97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43becdba4c021b419914a859bcff463350aac426
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gets rid of a large number of warnings (and suboptimal code?):

..sysroot/usr/include/features.h:209:5: warning: #warning requested
reentrant code, but thread support was disabled [-Wcpp]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 4b8b0a4..5416141 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -73,7 +73,7 @@ define OPENSSL_CONFIGURE_CMDS
 			--prefix=/usr \
 			--openssldir=/etc/ssl \
 			--libdir=/lib \
-			threads \
+			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
 			$(if $(BR2_PREFER_STATIC_LIB),no-shared,shared) \
 			no-idea \
 			no-rc5 \
