From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 19 Sep 2010 00:11:17 +0200
Subject: [Buildroot] [PATCH 2/3] zlib: Fix build
In-Reply-To: <AANLkTina7PCqWDL8=TL+kQv89=bnEj40Mw7dtrY5fF9a@mail.gmail.com>
References: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
	<1284812207-31798-3-git-send-email-llandwerlin@gmail.com>
	<8739t66ca0.fsf@macbook.be.48ers.dk>
	<AANLkTina7PCqWDL8=TL+kQv89=bnEj40Mw7dtrY5fF9a@mail.gmail.com>
Message-ID: <1284847877.12897.541.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

Thanks for reporting that problem, I'm having exactly the same error.
Make tries to build libz.a but he didn't finish to compile all the
depending objects.
After relaunching buildroot, he is able to complete the build.

--
Lionel Landwerlin

Le samedi 18 septembre 2010 ? 13:48 -0700, Martin Banky a ?crit :
> Peter,
>      I can confirm that it was reliably breaking for me with parallel
> builds. The error message would say that it couldn't find libz.a, I
> think during linking. I would restart the build process, and it would
> finish just fine after that. I wish I had known about the MAKE1
> option. I guess I should have rtfm a little better.
> 
> Martin
> 
> On Sat, Sep 18, 2010 at 1:13 PM, Peter Korsgaard <jacmet@uclibc.org>
> wrote:
>         >>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com>
>         writes:
>         
>          llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
>          llandwerlin> Using "make -j $(N)" with N > 1 break zlib
>         build.
>         
>         In what way exactly? Zlib is a pretty common package and I've
>         never
>         seen if breaking because of parallel builds.
>         
>         In fact, testing on a big (24 core) machine I don't see it
>         either:
>         
>         tar jxf ~/zlib-1.2.5.tar.bz2
>         mv zlib-1.2.5{,-parallel}
>         tar jxf ~/zlib-1.2.5.tar.bz2
>         cd zlib-1.2.5-parallel ; ./configure --prefix=/usr --shared; \
>           make -j 100 all libz.a; cd ..
>         cd zlib-1.2.5 ; ./configure --prefix=/usr --shared; \
>           make all libz.a; cd ..
>         
>         Gives the same result:
>         
>         ls -la zlib-1.2.5*/libz.{a,so.1.2.5}
>         -rw-r--r-- 1 peko peko 133746 2010-09-18 22:00
>         zlib-1.2.5/libz.a
>         -rwxr-xr-x 1 peko peko 109995 2010-09-18 22:00
>         zlib-1.2.5/libz.so.1.2.5
>         -rw-r--r-- 1 peko peko 133746 2010-09-18 22:00
>         zlib-1.2.5-parallel/libz.a
>         -rwxr-xr-x 1 peko peko 109995 2010-09-18 22:00
>         zlib-1.2.5-parallel/libz.so.1.2.5
>         
>         --
>         Bye, Peter Korsgaard
>         
>         _______________________________________________
>         buildroot mailing list
>         buildroot at busybox.net
>         http://lists.busybox.net/mailman/listinfo/buildroot
>         
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
