From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 27 Feb 2017 21:04:06 +0100
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <20170227172540.GA17670@free.fr>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <1488215544.31837.9.camel@embedded.rocks> <20170227172540.GA17670@free.fr>
Message-ID: <1488225846.14030.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2017-02-27 at 18:25 +0100, Yann E. MORIN wrote:
> J?rg, All,
> 
> Thanks for the follow-up! :-)
> 
> On 2017-02-27 18:12 +0100, J?rg Krause spake thusly:
> > On Sun, 2017-02-26 at 23:42 +0100, Yann E. MORIN wrote:
> > > cmake-3.7 has a bug in how it handles rpath, linking with
> > > libraries
> > > from
> > > the host.
> > > 
> > > Until we completely understand the issue, just blacklist cmake-
> > > 3.7.
> > > 
> > > The issue has been reported upstream:
> > > ????http://public.kitware.com/pipermail/cmake/2017-February/06497
> > > 0.ht
> > > ml
> > 
> > Brad King from Kitware replied today [1]. In short, Brad does not
> > think
> > there anything wrong about handling the rpath and supposes to load
> > a
> > custom platform cmake file instead of the Linux one.
> > 
> > [1] http://public.kitware.com/pipermail/cmake/2017-February/065063.
> > html
> 
> OK, so what we would have to do (basically):
> 
> ? - copy Modules/Platform/Linux.cmake to
> Modules/Platform/Buildroot.cmake
> 
> ? - tweak that file so that the two settings (lib32 and lib64) are
> now
> ????FALSE in that file
> 
> ? - tweak our support/misc/toolchain.cmake to set(CMAKE_SYSTEM_NAME
> Buildroot)
> 
> and we'd be all good?
> 
> Or alternatively:
> 
> ? - add Modules/Platform/Buildroot.cmake, which:
> ????- includes Modules/Platform/Linux.cmake
> ????- sets the the two settings (lib32 and lib64) to FALSE
> 
> ? - tweak our support/misc/toolchain.cmake to set(CMAKE_SYSTEM_NAME
> Buildroot)
> 
> Thoughts?

I still think this is a bug! A host rpath should not be used when
cross-compiling whether lib32 is used or not. Somehow, it feels weird
to say that Buildroot is not a Linux platform, in the sense of CMake.

I will reply my thoughts to the CMake mailing list. Lets see what they
suppose.

J?rg
