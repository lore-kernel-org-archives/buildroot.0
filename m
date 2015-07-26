From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 19:14:09 +0200
Subject: [Buildroot] [PATCH 1/1] xterm: force detection of libICE
In-Reply-To: <20150726161346.GE3770@free.fr>
References: <1437749654-29431-1-git-send-email-bas@bmail.ru>
 <20150725212807.GD1847@free.fr> <alpine.LNX.2.20.1507261047230.883@bas>
 <20150726133211.GD3770@free.fr> <alpine.LNX.2.20.1507261839280.883@bas>
 <20150726161346.GE3770@free.fr>
Message-ID: <55B51561.5040909@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Mikhail, Yann, All,

Le 26/07/2015 18:13, Yann E. MORIN a ?crit :
> Mikhail, All,
> 
> [Please, do not top-post]
> 
> On 2015-07-26 18:49 +0300, kyak spake thusly:
>> Sure, i should've attached this information in the first place. After all, i
>> too used it for debugging of this problem.
>>
>> Full build log: http://paste.pound-python.org/show/dQ2gfhqx7aQMHAQlRVfK/
>>
>> config.log: http://paste.pound-python.org/show/EsWJPVSwSaYKN2S0UYJH/
>>
>> Basically, when configure tests for libICE, it attempts to use host search
>> path looking for IceConnectionNumber symbol:
>>
>> "warning: library search path "/usr/lib64" is unsafe for cross-compilation"
> 
> Ah, but then that's what we must fix, instead of forcing detectin of
> libICE. So, I'm marking your patch as "Changes Requested" in Patchwork.
> 
> Unfortunately, I can't reproduce that leakage on my setup... :-(

Me neither but I made a diff between your build.log and mine:

Yours:
checking for X... libraries /usr/lib64, headers
Mine:
checking for X... libraries , headers

I recommends you to add --x-includes and --x-libraries in xterm.mk:

./configure --help
X features:
  --x-includes=DIR    X include files are in DIR
  --x-libraries=DIR   X library files are in DIR

like we did for libecore package:
http://git.buildroot.net/buildroot/commit/?id=0d9d8984a9240a27f5ed2e15f1977ada67266906

Also it seems that a dependency on freetype is missing

Mine:
freetype-config... /usr/bin/freetype-config
Yours:
checking for FreeType config...
/home/user/build/buildroot/output/host/usr/bin/pkg-config xft

but even with freetype builded before xterm, it still use
/usr/bin/freetype-config... Also, I guess that you don't have freetype installed
on your host.

./configure --help
  --disable-freetype      disable freetype library-support
  --with-freetype-config  configure script to use for FreeType
  --with-freetype-cflags  -D/-I options for compiling with FreeType
  --with-freetype-libs    -L/-l options to link FreeType

So, the xterm package seems incomplete in Buildroot and your initial patch is
not correct.
Can you rework this package by adding (at least) X features options and freetype
options in xterm.mk?

Thanks for your report!

Best regards,
Romain Naour

> 
> Regards,
> Yann E. MORIN.
> 
