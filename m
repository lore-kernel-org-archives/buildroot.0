From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Aug 2020 18:52:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: add openssl optional
 dependency
In-Reply-To: <20200808234052.4e6ff454@windsurf.home>
References: <20200727124145.1825309-1-fontaine.fabrice@gmail.com>
 <20200727125140.GY19818@scaer>
 <20200808234052.4e6ff454@windsurf.home>
Message-ID: <20200809165215.GB13263@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-08 23:40 +0200, Thomas Petazzoni spake thusly:
> On Mon, 27 Jul 2020 14:51:40 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2020-07-27 14:41 +0200, Fabrice Fontaine spake thusly:
> > > openssl is an optional dependency that is enabled by default since
> > > version 0.7.0 and
> > > https://github.com/capnproto/capnproto/commit/23db5e3fd91104a0b2881d8f8ab3c10bf9dd8e75  
> > Seeing how they are testing for openssl, will that no fail for a staitc
> > link, because they forget to link with -lz in that case ?
> > 
> >       AC_CHECK_LIB(ssl, OPENSSL_init_ssl, [:], [
> >         with_openssl=no
> >       ], [-lcrypto])
> > 
> > Why don't they yse pkg-config?
> It is weird, we don't have any build failures for this. I would assume
> that any configuration where OpenSSL gets built before capnproto (by
> chance) and is static should exhibit a build failure, but it's not the
> case.

So, I got the answer, at least partially:

  - the code snippet above is only executed when auto-detection is done

    - before this patch, it would alwasys fail in static builds, so
      capnproto would always be built without ssl/tls support, and a
      shared build would depend on the build ordering;

    - with this patch, we explicitly enable or disable openssl support,
      so the code snippet is not executed.

  - the dependency on openssl is only used to build a library, that is
    not used to link an executable in capnproto, and does not seem to be
    used by of our in-tree packages that use capnproto.

And indeed, the link forget -lz )indentation mine):

    /bin/bash ./libtool --tag=CXX \
        --mode=link /home/ymorin/dev/buildroot/O/host/bin/arm-linux-g++ \
        [...] \
        -DKJ_HAS_OPENSSL \
        -o libkj-tls.la \
        [...] \
        -lssl -lcrypto -latomic

so indeed, no -lz.

Furthermre, capnproto does install a bunch of .pc file, but installs
none for libkj-tls. And none of the .pc files insalled ever reference
libkj-tls or ssl or crypto.

That's why we have no build failure in our autobuilders.

Yet, I wonder how openssl support works in capnproto, and if this patch
ever makes sense in the context of Buildroot...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
