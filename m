From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2017 19:07:04 +1100
Subject: [Buildroot] [git commit] nodejs: unbreak 0.10.x host build
Message-ID: <20170123080713.5A80F80DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b1fc3451cab9952f5a64591b512e3c21d088961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/833/8334631b54fdfd43d38ca00f42e4d5a98e3a70c4/
http://autobuild.buildroot.net/results/9c0/9c08e0b745fab671123facb4a46f60eec5afd718/

Commit 24d90db52a74 (package/nodejs: disable icu support for host build)
added --with-intl=none to host configure flags to fix an issue related to
icu.  The 0.10.x version unfortunately doesn't understand this configure
flag and errors out when provided, breaking the build:

configure: error: no such option: --with-intl

The 0.10.x version doesn't seem to have this icu issue (E.G. no autobuilder
issues before this commit and unable to reproduce locally), so fix it by
only passing --with-intl=none for the 6.9.x version.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 82a012a..042cc3f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -63,7 +63,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--without-dtrace \
 		--without-etw \
 		--shared-zlib \
-		--with-intl=none \
+		$(if $(BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS),--with-intl=none) \
 	)
 endef
 
