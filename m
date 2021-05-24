From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon, 24 May 2021 19:33:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgit2: disable NTLM support
 inconditionally.
Message-ID: <20210524173310.4568-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.32.0.rc0
