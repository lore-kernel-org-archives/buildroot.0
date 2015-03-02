From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  2 Mar 2015 22:40:24 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsrtp: don't error out if libdl
	and zlib are not found
Message-ID: <1425332425-7034-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depending on how openssl was compiled, libdl and zlib may not be
necessary for linking with libcrypto.a.

Upstream turn the error to a warning.
https://github.com/cisco/libsrtp/commit/13fd694ae216fcdbc7165bcf77be9e5a1acbecfa

Ref:
https://github.com/cisco/libsrtp/issues/97

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
index acb2c9a..1240d9f 100644
--- a/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
+++ b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
@@ -22,9 +22,9 @@ index ee30daf..71df46b 100644
     CFLAGS="$CFLAGS $(pkg-config --cflags openssl)";
  
 +   AC_CHECK_LIB([dl], [dlopen], [],
-+             [AC_MSG_FAILURE([can't find libdl])])
++             [AC_MSG_WARN([can't find libdl])])
 +   AC_CHECK_LIB([z], [inflate], [],
-+             [AC_MSG_FAILURE([can't find libz])])
++             [AC_MSG_WARN([can't find libz])])
     AC_CHECK_LIB([crypto], [EVP_EncryptInit], [],
               [AC_MSG_FAILURE([can't find openssl >1.0.1 crypto lib])])
     AC_CHECK_LIB([crypto], [EVP_aes_128_ctr], [],
-- 
1.9.3
