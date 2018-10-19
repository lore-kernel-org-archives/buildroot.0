From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 00:14:04 +0200
Subject: [Buildroot] [PATCH] netsnmp: improve linking avoiding useless
 -lz listing in shared build
In-Reply-To: <20181015215955.51023-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Mon, 15 Oct 2018 23:59:55 +0200")
References: <20181012220845.07b266ea@windsurf>
 <20181015215955.51023-1-giulio.benetti@micronovasrl.com>
Message-ID: <87sh11eg9f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > In commit:
 > https://git.buildroot.net/buildroot/commit/?id=13722d58f77d0e9fea9eefc50bf083d19f835433
 > Patch "0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch"
 > was intended to fix AC_CHECK_FUNCS() failure on openssl functions. This
 > was due to missing -lz during static linking.
 > But the patch is wrong and results in explicitly linking against -lz in
 > both shared and static build.
 > This makes no sense, since shared linking has transitive dependency so
 > it doesn't need to list -lz after -lssl, -lssl is enough.
 > Differently static linking needs -lz to be listed after -lssl.

 > So the real cause of previous build failure:
 > http://autobuild.buildroot.net/results/881/881139fb049738b16609d39ad5a49bd77ff6b4aa/
 > is that when AC_CHECK_FUNCS(), $LIBS variable is overwritten with
 > $LIBCRYPTO without taking into accout previous $LIBS content(i.e. where
 > -lz is present). This results in AC_CHEC_FUNCS() to fail while trying to
 > statically link without listing -lz.

 > Then:
 > - Remove current "0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch"
 > - Add patch "0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch"
 >   where add $LIBS content to tail of new $LIBS variable like this:
 >   LIBS="$LIBCRYPTO $LIBS"
 >   NOTE: $LIBS is at the end to ensure static linking to work correctly.
 > - Add patch 0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
 >   where add $LIBS content to tail of new $LIBS variable like this:
 >   LIBS="-lssl $LIBCRYPTO $LIBS"
 >   NOTE: $LIBS is at the end to ensure static linking to work correctly.

 > This way AC_CHECK_FUNCS(), when static linking, try to link with -lz too
 > appending it at the end of linking library list.
 > And after every AC_CHECK_FUNCS(), previously saved $LIBS variable gets
 > back to its original value(i.e. containing -lz if present) resulting in
 > having or not -lz appended to library list according to static or
 > shared build.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
