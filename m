From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 21:41:57 +0100
Subject: [Buildroot] [PATCH] dmalloc: fix parallel builds
In-Reply-To: <20150104190204.GA4224@vostro>
References: <20150103110503.GA11955@vostro>
 <20150104183513.0cdff028@free-electrons.com>
 <20150104190204.GA4224@vostro>
Message-ID: <20150104214157.4057d1ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sun, 4 Jan 2015 21:02:04 +0200, Alex Suykov wrote:

> The following sequence seems to trigger it more or less reliably for me:
> 
>     ./configure --disable-static --enable-shared --enable-cxx --enable-threads
>     sed -i -e "s at cat \$(srcdir)/dmalloc.h.1.*@&; sleep 1@" Makefile
>     make clean
>     make -j4
> 
> What happens is a race condition between "cat ...; mv ... dmalloc.h"
> and "g++ -c dmallocc.cc". As long as cat-mv pair is faster, it works well.
> But if there's a delay, it breaks.
> 
> This should be rare, I can only reproduce it with an artificial delay,
> and only with --disable-static. But on the other hand, it did happen
> on autobuild somehow.

Ok, thanks a lot for the explanation! I've committed your patch, with a
few minor tweaks:

    [Thomas:
     - Rename patch to the new naming convention.
     - Add SoB line from Alex inside the patch itself.
     - Adjust the commit log to contain the reference to the autobuilder
       failure.]

If you're using dmalloc, I just noticed that the version we have in
Buildroot is 5.4.3, while upstream has a 5.5.2 release. If you want to
send a patch to bump the dmalloc version, that would be great.

Also, don't hesitate to send your patch to the upstream dmalloc
developers.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
