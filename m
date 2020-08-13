From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:23:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: add openssl optional
 dependency
In-Reply-To: <20200809165215.GB13263@scaer>
References: <20200727124145.1825309-1-fontaine.fabrice@gmail.com>
 <20200727125140.GY19818@scaer>
 <20200808234052.4e6ff454@windsurf.home>
 <20200809165215.GB13263@scaer>
Message-ID: <20200813232326.0ea90e56@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 9 Aug 2020 18:52:15 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> So, I got the answer, at least partially:
> 
>   - the code snippet above is only executed when auto-detection is done
> 
>     - before this patch, it would alwasys fail in static builds, so
>       capnproto would always be built without ssl/tls support, and a
>       shared build would depend on the build ordering;
> 
>     - with this patch, we explicitly enable or disable openssl support,
>       so the code snippet is not executed.
> 
>   - the dependency on openssl is only used to build a library, that is
>     not used to link an executable in capnproto, and does not seem to be
>     used by of our in-tree packages that use capnproto.
> 
> And indeed, the link forget -lz )indentation mine):
> 
>     /bin/bash ./libtool --tag=CXX \
>         --mode=link /home/ymorin/dev/buildroot/O/host/bin/arm-linux-g++ \
>         [...] \
>         -DKJ_HAS_OPENSSL \
>         -o libkj-tls.la \
>         [...] \
>         -lssl -lcrypto -latomic
> 
> so indeed, no -lz.
> 
> Furthermre, capnproto does install a bunch of .pc file, but installs
> none for libkj-tls. And none of the .pc files insalled ever reference
> libkj-tls or ssl or crypto.
> 
> That's why we have no build failure in our autobuilders.
> 
> Yet, I wonder how openssl support works in capnproto, and if this patch
> ever makes sense in the context of Buildroot...

Thanks for the exhaustive research! I think we should not only look at
packages that are in Buildroot: people may be having their own custom
stuff that links against libkj-tls, so overall I think the patch makes
sense. There is something that optionally links against OpenSSL in
capnproto, so we should have an optional dependency on OpenSSL.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
