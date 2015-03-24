From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 24 Mar 2015 11:39:27 +0100
Subject: [Buildroot] package/erlang: OpenSSL is configured for kerberos but
	no krb5.h found
Message-ID: <CAJtjsKZajs_97abb1Nr=WzKoAQeuMokS0CzUF2bs-1U1nuKM_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm having trouble to get the ssl.app from Erlang installed on my target.
Since BR2_ERLANG_OPENSSL is activated, it does configure Erlang with
--with-ssl but there is a test for krb5.h that fails in
$BUILD_DIR/erlang-17.4/erts/configure.in

Actually, I don't even understand why it's trying to look for krb5.h
since opensslconf.h defines OPENSSL_NO_KRB5. So, the test for kerberos
support should fail.
Here the extract from $BUILD_DIR/erlang-17.4/erts/config.log
-----8<----------8<----------8<----------8<----------8<----------8<----------8<-----
configure:18537: checking for OpenSSL >= 0.9.7 in standard locations
configure:18668: /path/to/buildroot/output/host/usr/bin/ccache
/path/to/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64   -Os -g3 -fstack-protector-all
-I/path/to/buildroot/output/build/erlang-17.4/erts/arm-buildroot-linux-uclibcgnueabi
 -fno-tree-copyrename
-I/path/to/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_GNU_SOURCE  -L/path/to/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
conftest.c -lutil -ldl -lm -latomic_ops -lcrypto >&5
/path/to/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.so:
warning: gethostbyname is obsolescent, use getnameinfo() instead.
configure:18668: $? = 0
configure:18681: result:
/path/to/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
configure:18843: checking for OpenSSL kerberos 5 support
configure:18859: result: yes
configure:18908: checking for krb5.h in standard locations
configure:18923: result: not found
configure:18928: WARNING: OpenSSL is configured for kerberos but no krb5.h found
-----8<----------8<----------8<----------8<----------8<----------8<----------8<-----

The configure.in test that should fail is as follows:
-----8<----------8<----------8<----------8<----------8<----------8<----------8<-----
if test "x$SSL_APP" != "x" ; then
    dnl We found openssl, now check if we use kerberos 5 support
    AC_MSG_CHECKING(for OpenSSL kerberos 5 support)
    old_CPPFLAGS=$CPPFLAGS
    CPPFLAGS=$SSL_INCLUDE
    AC_EGREP_CPP(yes,[
#include <openssl/opensslconf.h>
#ifndef OPENSSL_NO_KRB5
  yes
#endif
-----8<----------8<----------8<----------8<----------8<----------8<----------8<-----

Honestly, I don't understand how this test can succeed. Any idea what
the problem could be?
-- 
Johan
