From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Jun 2019 17:15:49 +0200
Subject: [Buildroot] [PATCH v4] package/exiv2: cleanup options and
 licenses
In-Reply-To: <2a9e28d2-1dfc-5a66-e0f4-16241adca391@mind.be>
References: <20190605134957.27400-1-nicolas.serafini@sensefly.com>
 <20190605234535.1abf3c33@gmx.net>
 <2a9e28d2-1dfc-5a66-e0f4-16241adca391@mind.be>
Message-ID: <20190606151549.GA2560@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Peter, All,

On 2019-06-06 15:02 +0200, Arnout Vandecappelle spake thusly:
> On 05/06/2019 23:45, Peter Seiderer wrote:
> > On Wed, 5 Jun 2019 13:51:06 +0000, Nicolas Serafini <nicolas.serafini@sensefly.com> wrote:
> >> exiv2 no longer requires a non commercial option for lens database
> >> integration since version 0.27. See [1] and [2]
> >>
> >> The BR2_PACKAGE_EXIV2_LENSDATA option is maintained because the
> >> src/nikonmn_int.cpp file always specifies that the Nikon lens name
> >> database is free to use in non-commercial, GPL or open source software
> >> only.
> >>
> >> Legacy handling for the removed option COMMERCIAL is not needed, since
> >> now it's always enabled.
> > 
> > NAK - users which own a commercial license (maybe for an old release
> > of exiv2) may be very surprised if they link, after an buildroot update,
> > against GPL library (which means there own software must published under
> > GPL), instead of linking private/commercial software against a library
> > the bought a commercial license for...
> > 
> > Commercial license for exiv2 is something complete different than
> > an commercial license for the lens data (and the logic is
> > commercial exiv2 excludes the lens data availability (GPL-only (or
> > maybe separate commercial license for the lens data, but no one
> > knows where to get it))...
> > 
> > So please add an Config.in.legacy entry mentioning the commercial
> > license for exiv2 is gone...

No. We have no way to know what package which people may acquire what
license for. A lot of other packages are available under alternate
licenses (free or not, that's beyond the point). We can only act on the
known, public licenses.

Actualy, I think that the existing BR2_PACKAGE_EXIV2_COMMERCIAL license
should have never been added to begin with. Instead, we should have done
something like:

    package/exiv2/exiv2.mk:

    ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
    EXIV2_LICENSE := $(EXIV2_LICENSE), Proprietary/Unknown (Nikon lens database)
    endif

Besides, if people are that much concerned (and rightfully so) about the
licensing of the packages they cary on their device, they do have the
legal-info manifest we generate:

    $ make legal-info
    $ libreoffice output/legal-info/manisfest.cvs

Or programtaically extract the licenses from the new show-info:

    $ make show-info |jq '.[].licenses'
    $ make show-info |jq '.["exiv2"].licenses'

So I stand with Peter K. on this one: we do _not_ need a legacy entry.

>  Okay, apparently I misunderstood again... I didn't realize the commercial
> license was actually gone, I thought it was just the CMake option.
> 
>  This commercial license stuff is anyway tricky... In principle, it only applies
> to the particular version to which it applies - which may even be different
> source code than the one we use. So a simple version bump essentially has the
> same effect as we have here now. In other words, according to the reasoning
> above, every version bump should entail a legacy entry.
> 
>  See also commits ce79e0b23063 and 8569e78.
> 
>  The only reasonable, reliable way to use a package that you get under a
> different license, is to create a separate package for it.

This is not nice when the package has a lot of reverse dependencies.

So, either:
  - cary local patches to Buildroot that change the licensing terms for
    your packages of interest, or
  - tweak the output of legal-info or show-info appropriately.

>  That said, it doesn't really hurt to have a legacy entry, so let's add it after
> all.

We did not add such a legacy entry for the Qt5 license drop, there is no
reason to add one here either.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
