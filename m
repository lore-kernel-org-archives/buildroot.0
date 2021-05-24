From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 19:44:00 +0200
Subject: [Buildroot] [git commit branch/next] package/libgit2: disable NTLM
 support unconditionally.
Message-ID: <20210524171637.6190A80F77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb53b131f64adfb6bba86d1f466665721241b684
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

NTLM is an old authentication protocol depending on DES and MD4 and
its creator, Microsoft, discourage its use since 2010, because it is
weak and vulnerable to many attacks.

libgit2 has support for NTLM and it is enabled by default if openssl
is used, however, since commit a83d41867c8d ("package/libopenssl: add
option to enable some features"), support for DES and MD4 can be
disabled in openssl.

Since openssl is an optional dependency to libgit2 and getting rid of
NTLM is a goal in itself for many windows administrators, disable NTLM
by default.

Fixes: http://autobuild.buildroot.net/results/efb4ce2174cb6944558e895ce852182ba2738a70
Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgit2/libgit2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index e5d17fa3dd..668fa758f8 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -17,6 +17,7 @@ LIBGIT2_CONF_OPTS = \
 	-DUSE_ICONV=ON \
 	-DREGEX_BACKEND=regcomp \
 	-DUSE_HTTP_PARSER=system \
+	-DUSE_NTLMCLIENT=OFF \
 	-DTHREADSAFE=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
 LIBGIT2_DEPENDENCIES = zlib libhttpparser
