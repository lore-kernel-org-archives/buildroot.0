From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Feb 2014 18:51:21 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-07
In-Reply-To: <CAAXf6LWUZNKCK8b-K5yGygqv165FaLZdwOVhL4OPDz5jY-YrFQ@mail.gmail.com>
References: <20140208073009.5C3E6100CDC@stock.ovh.net>
 <20140208124907.GA3442@free.fr> <20140210093158.1dc26780@skate>
 <20140210173137.GA5239@free.fr>
 <CAAXf6LWUZNKCK8b-K5yGygqv165FaLZdwOVhL4OPDz5jY-YrFQ@mail.gmail.com>
Message-ID: <20140210175121.GB5239@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-02-10 18:44 +0100, Thomas De Schampheleire spake thusly:
> On Mon, Feb 10, 2014 at 6:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> > On 2014-02-08 08:30 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> >> This one I agree is old. The question is: how do I exclude this package
> >> from being built. Should we introduce hidden Config.in bools for kernel
> >> header versions, so that the packages that need at least the kernel
> >> headers from kernel X.Y are not visible if you have a too old
> >> toolchain? Those bools would be set by linux-headers/Config.in for the
> >> internal backend, automatically set for the well-known external
> >> toolchains, and a custom choice for special external toolchains.
> >>
> >> Thoughts?
> >
> > Something like:
> >
> >     config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> >         bool
> >
> >     config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
> >         select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> >
> >     config BR2_PACKAGE_DVB_APPS
> >         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> >
> > And so on for all the headers version of interest?
> 
> So suppose we need to be able to check on 2_6_3, 3_0 and 3_1, the
> linaro symbol would become:
>      config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
>          select BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6_3
>          select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>          select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> 
> right?

I was thinking of something a bit more complete (just an example, not
actual values):

    config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
        bool

    config BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
        bool
        select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0

    config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
        bool "Linaro 2013.11"
        select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1

    config BR2_PACKAGE_DVB_APPS
        bool "dvb-apps"
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0

That way, the _AT_LEAST_3_0 would be selected automatically since the
toolchain would select _AT_LEAST_3_1

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
