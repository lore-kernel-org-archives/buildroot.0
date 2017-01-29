From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 29 Jan 2017 21:37:34 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
 <20170125211534.dugtv6byofg3wvg5@tarshish>
 <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
Message-ID: <1485722254.4549.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Thu, 2017-01-26 at 12:04 +0100, Samuel Martin wrote:
> Hi all,
> 
> On Wed, Jan 25, 2017 at 10:15 PM, Baruch Siach <baruch@tkos.co.il>
> wrote:
> > Hi J?rg,
> > 
> > On Wed, Jan 25, 2017 at 10:05:42PM +0100, J?rg Krause wrote:
> > > On Wed, 2017-01-25 at 08:30 +0100, Thomas Petazzoni wrote:
> > > [snip]
> > > 
> > > > Detail of failures
> > > > ===================
> > > > 
> > > > ????????i586 |????????????????bctoolbox-0.4.0 | NOK | http://au
> > > > tobuil
> > > > d.buildroot.net/results/4b4b00ad3b95ddacc9d5cc31c34e457ee55c936
> > > > 4
> 
> Regarding this package, apologies I missed it during the initial
> review :s

Never mind! That's the autobuilder are there for, right?

> This build failure occurs because it goes in a path it should not.
> In the Config.in: it is mentionned that mbedtls is prefered to
> polarssl [1], hence the select [1] and the dependency in the *.mk
> [2].
> However, the cmake configure flags are not set accordingly to this,
> and the defaults may play against us [3].
> 
> I would suggest to set the ENABLE_{MBEDTLS,POLARSSL} flags in the
> *.mk first.
> This should prevent from following this case [4], as displayed in the
> build log [5].

Support for PolarSSL is only enabled if mbedTLS is not found, but I
agree, it's better to disable it explicitly.

> After this, if the CheckSymbolExists still causes error, we may need
> to patch the bctoolbox
> cmake code to set/fix the variables used by CheckSymbolExists [6].

I prepared a patch of FindMbedTLS.cmake which checks if mbedtls was
build with libz support and if so, add libz to MBEDTLS_LIBRARIES. This
way, CMake should take care of linking against the libz in sysroot.

> > > 
> > > Unfortunately I cannot reproduce this issue. Is it a rpath issue?
> > > cmake
> > > links a test program with host zlib:
> 
> Note: I'm not able to reproduce the error either.

I wonder, what makes the difference to be able to reproduce the issue.

> > > 
> > > [..]/i586-buildroot-linux-musl/bin/ld: warning: libc.so.6, needed
> > > by
> > > /usr/lib32/libz.so.1, not found (try using -rpath or -rpath-link)
> > > /usr/lib32/libz.so.1: undefined reference to `strcpy at GLIBC_2.0'
> > 
> > This is your host library.
> > 
> > > I have no idea how to fix it. bctoolbox' cmakelists.txt does set
> > > CMAKE_INSTALL_RPATH=/usr/lib. Is this a problem?
> > 
> > That is definitely not compatible with cross compilation.
> > 
> > baruch
> > 
> > --
> > ?????http://baruch.siach.name/blog/??????????????????~. .~???Tk
> > Open Systems
> > =}------------------------------------------------ooO--U--Ooo----
> > --------{=
> > ???- baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.
> > il -
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> Regards,
> 
> [1] https://git.buildroot.net/buildroot/tree/package/bctoolbox/Config
> .in#n5
> [2] https://git.buildroot.net/buildroot/tree/package/bctoolbox/bctool
> box.mk#n11
> [3] https://github.com/BelledonneCommunications/bctoolbox/blob/master
> /CMakeLists.txt#L44
> [4] https://github.com/BelledonneCommunications/bctoolbox/blob/master
> /CMakeLists.txt#L88
> [5] http://autobuild.buildroot.net/results/4b4/4b4b00ad3b95ddacc9d5cc
> 31c34e457ee55c9364/build-end.log
> [6] https://cmake.org/cmake/help/v3.0/module/CheckSymbolExists.html
> 
> 
