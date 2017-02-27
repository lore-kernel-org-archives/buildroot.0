From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Feb 2017 21:59:23 +0100
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <20170227183547.GA1242@megas.kitware.com>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <1488215544.31837.9.camel@embedded.rocks>
 <20170227172540.GA17670@free.fr> <20170227183016.GC17670@free.fr>
 <20170227183547.GA1242@megas.kitware.com>
Message-ID: <20170227205923.GE17670@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben, All,

On 2017-02-27 13:35 -0500, Ben Boeckel spake thusly:
> On Mon, Feb 27, 2017 at 19:30:16 +0100, Yann E. MORIN wrote:
> > Of course, this is only for when we build out own cmake, not when we use
> > the host pre-installed one. I'll try to see tonight if we can do similar
> > for it, too.
> 
> It may make sense to support this upstream. CMake already has platform
> files for things such as Cray and Android (among others) which are just
> special kinds of Linux, like Buildroot.
> 
> How often does that toolchain file change? Or does it depend on
> Buildroot settings?

The toolchainfile.cmake is really specific to one build: it contains the
path to the compiler, linker... It contains place-holders that get
replaced by a sed invocation:

    https://git.buildroot.org/buildroot/tree/package/pkg-cmake.mk#n236

However, the Modules/Platform/Buildroot.cmake would be just as simple
as (which is what I use currently):

    include(Platform/Linux)
    set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS FALSE)
    set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS FALSE)

I don;t see that changing anytime soon. So, if that would be aceptable
for upstream, then we could submit it, yes.

However, I wonder if that's worth the effort...

After all, this is a setting specific to us. I would have a hard time
arguing that upstream cmake should carry all such files for all
imaginable buildsystems.

And if the solution is that simple and also works for host pre-installed
cmake, then we can carry that ourselves, I believe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
