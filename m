From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 24 Mar 2015 13:47:46 +0100
Subject: [Buildroot] package/erlang: OpenSSL is configured for kerberos
	but no krb5.h found
In-Reply-To: <CAJtjsKZajs_97abb1Nr=WzKoAQeuMokS0CzUF2bs-1U1nuKM_Q@mail.gmail.com>
References: <CAJtjsKZajs_97abb1Nr=WzKoAQeuMokS0CzUF2bs-1U1nuKM_Q@mail.gmail.com>
Message-ID: <CAJtjsKaHd35k+F7Y2XyDWcDN4KdCxFONB-n6iD2S1Z1ftN4NBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

On Tue, Mar 24, 2015 at 11:39 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> I'm having trouble to get the ssl.app from Erlang installed on my target.
> Since BR2_ERLANG_OPENSSL is activated, it does configure Erlang with
> --with-ssl but there is a test for krb5.h that fails in
> $BUILD_DIR/erlang-17.4/erts/configure.in
>
> Actually, I don't even understand why it's trying to look for krb5.h
> since opensslconf.h defines OPENSSL_NO_KRB5. So, the test for kerberos
> support should fail.

>
> The configure.in test that should fail is as follows:
> -----8<----------8<----------8<----------8<----------8<----------8<----------8<-----
> if test "x$SSL_APP" != "x" ; then
>     dnl We found openssl, now check if we use kerberos 5 support
>     AC_MSG_CHECKING(for OpenSSL kerberos 5 support)
>     old_CPPFLAGS=$CPPFLAGS
>     CPPFLAGS=$SSL_INCLUDE
>     AC_EGREP_CPP(yes,[
> #include <openssl/opensslconf.h>
> #ifndef OPENSSL_NO_KRB5
>   yes
> #endif
> -----8<----------8<----------8<----------8<----------8<----------8<----------8<-----

I found out why the test doesn't fail. it uses AC_EGREP_CPP and grep
for 'yes'. Unfortunately, my path to buildroot contains the string
yes. Therefore, this test always return true :-\
I'm going to patch this test, then send the patch to Erlang upstream
and to buildroot.
-- 
Johan
