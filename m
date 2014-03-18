From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Mar 2014 21:28:22 +0100
Subject: [Buildroot] [PATCH 2/4] legal-info: save license files even for
 no-redistribute packages
In-Reply-To: <532887A9.3010901@lucaceresoli.net>
References: <cover.1395097170.git.yann.morin.1998@free.fr>
 <dbdd65bfe908d6eead2e047dff4c8bb96e236ee3.1395097170.git.yann.morin.1998@free.fr>
 <532887A9.3010901@lucaceresoli.net>
Message-ID: <20140318202822.GB26810@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-03-18 18:51 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >The reason to save license files even for no-redistribute packages
> >is that the license still applies to the files distributed as part
> >of the rootfs, even if the sources are not themselves redistributed.
[--SNIP--]
> I like this change in general, but I have another minor nit here.
> 
> You moved code out of the big
>   ifneq ($(call qstrip,$$($(2)_SOURCE)),)
> cited above.
> 
> So we're now doing stuff also for packages that are part of Buildroot.
> 
> Assuming these will never have _LICENSE_FILES defined, which is fair,
> we not have one more warning:
>   WARNING: toolchain: cannot save license (TOOLCHAIN_LICENSE_FILES \
>         not defined)

Ah, I see. 'toolchain' is a special package, indeed, and will probably
never have a _LICENSE_FILES defined.

What I think is we should not fo:

    ifeq ($$($(2)_LICENSE_FILES),)

but probably:

    ifeq ($$(origin $(2)_LICENSE_FILES),undefined)

And then:

    TOOLCHAIN_LICENS_FILES =

Which means that TOOLCHAIN_LICENSE_FILES *is* defined. Empty, but
defined nonetheless.

In which case, a defined but empty _LICENSE_FILES meanns: no license
file to deal with.

> Probably that ifneq should be moved just before the part of code you're
> moving up, but that should be checked carefully.
> 
> If you feel like this bunch of lines are an annoying mess to handle, I'm
> with you.

OK, I'll see what I can do about that.

Thanks for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
