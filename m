From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 23:36:59 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] mcookie: correct wrong
 memset argument
Message-ID: <20180130225021.55B0E8813E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49daa38f61c9f66bd3c41d06a8a7916481be8068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes #10216

Building mcookie generates a warning about possible wrong arguments to
memset:

mcookie.c:207:26: warning: argument to ???sizeof??? in ???memset??? call is the same expression
  as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
     memset(ctx, 0, sizeof(ctx)); /* In case it's sensitive */

ctx is a pointer to a structure, so the code should use the size of the
structure and not the size of the pointer when it tries to clear the
structure, similar to how it got fixed upstream back in 2009:

https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/lib/md5.c?id=6596057175c6ed342dc20e85eae8a42eb29b629f

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 40f4191f2a1246b792ffc0c02b6c9bd2d62649f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/mcookie/mcookie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/mcookie/mcookie.c b/package/x11r7/mcookie/mcookie.c
index 902d92fc47..3c38f6f3b3 100644
--- a/package/x11r7/mcookie/mcookie.c
+++ b/package/x11r7/mcookie/mcookie.c
@@ -204,7 +204,7 @@ void MD5Final(unsigned char digest[16], struct MD5Context *ctx)
     MD5Transform(ctx->buf, (uint32 *) ctx->in);
     byteReverse((unsigned char *) ctx->buf, 4);
     memcpy(digest, ctx->buf, 16);
-    memset(ctx, 0, sizeof(ctx));	/* In case it's sensitive */
+    memset(ctx, 0, sizeof(*ctx));	/* In case it's sensitive */
 }
 
 /* The four core functions - F1 is optimized somewhat */
