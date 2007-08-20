From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 20 Aug 2007 11:56:44 +0200
Subject: [Buildroot] sstrip vs. strip
In-Reply-To: <0708192347500.12216@somehost>
References: <0708192347500.12216@somehost>
Message-ID: <1187603804.29832.38.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2007-08-19 klockan 23:58 +0200 skrev Cristian Ionescu-Idbohrn:
> If sstrip is selected (instead of the default strip) it needs to be built
> early, else things like this:
> 
> ,----
> | make[1]: Leaving directory `buildroot/build_i486/gmp-4.2.1'
> | buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-sstrip
> | --strip-unneeded buildroot/build_i486/staging_dir/usr/lib/libgmp.so*
> | /bin/sh: buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-sstrip:
> | No such file or directory
> | make: *** [buildroot/build_i486/staging_dir/usr/lib/libgmp.so]
> | Error 127
> `----
> 

> may occur.
> 
> Moreover, sstrip does not have any options, so that options like
> s-/--strip-all, --strip-unneeded, --remove-section and so on need to be
> hidden behind $(STRIP).
> 
> 
> Cheers,
> 


I generated a patch to fix this:

It makes sstrip-host a prerequisite of building binutils
and defines some symbolics for all the flags


I sed'ed package/*/*.mk to replace
--strip-unneeded with $(STRIP_STRIP_UNNEEDED) etc.
and defined STRIP_STRIP_UNNEEDED etc. as empty when sstrip is
to be used and "--strip-unneeded" etc. otherwise.

The patch was too large so I am resending it here zipped.

Pls try it out.

BR
Ulf Samuelsson


-------------- next part --------------
A non-text attachment was scrubbed...
Name: sstrip.patch.bz2
Type: application/x-bzip
Size: 7519 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070820/47927d87/attachment.bin 
