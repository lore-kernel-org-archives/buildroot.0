From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Jan 2015 00:30:24 +0100
Subject: [Buildroot] [PATCH] pkg-autotools: fix patching libtool for version
	2.4
Message-ID: <1422315024-14602-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the libtool used by the package is 2.4 (i.e. with no patchlevel), we
end up with a confusing message:

    /bin/sh: line 0: test: -gt: unary operator expected

That's because patchlevel is empty, and thus there is nothing to comapre
to 2, and test complains.

Fake a patchlevel of 0 (which is really what a missing patchlevel means
anyway) in that case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b20e20e..b6b83f8 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -69,7 +69,7 @@ define LIBTOOL_PATCH_HOOK
 		elif test $${ltmain_version} = "2.2"; then\
 			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 		elif test $${ltmain_version} = "2.4"; then\
-			if test $${ltmain_patchlevel} -gt 2; then\
+			if test $${ltmain_patchlevel:-0} -gt 2; then\
 				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.4.patch; \
 			else \
 				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
-- 
1.9.1
