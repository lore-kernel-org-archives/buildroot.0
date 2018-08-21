From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2018 15:11:05 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for building toolchains
 against custom kernel headers.
In-Reply-To: <4f183641-61e2-37bb-d3af-3dfd002efbe9@embecosm.com>
References: <20180821110646.5671-1-mark.corbin@embecosm.com>
 <20180821140509.162e6c49@windsurf>
 <4f183641-61e2-37bb-d3af-3dfd002efbe9@embecosm.com>
Message-ID: <20180821131105.GM15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, Thomas, All,

On 2018-08-21 13:51 +0100, Mark Corbin spake thusly:
> On 21/08/18 13:05, Thomas Petazzoni wrote:
> > On Tue, 21 Aug 2018 12:06:46 +0100, Mark Corbin wrote:
> >> Allows the selection of a manual version, custom tarball or custom
> >> git repository for the toolchain kernel headers. This enables
> >> toolchains to be built against custom kernel headers without having
> >> to build a full kernel.
[--SNIP--]
> >>  config BR2_KERNEL_HEADERS_VERSION
> >>  	bool "Manually specified Linux version"
> >> +	help
> >> +	  This option allows you to use a specific official version from
> >> +	  kernel.org, like 2.6.x, 2.6.x.y, 3.x.y, ...
> >> +
> >> +	  Note: you cannot use this option to select a _longterm_ 2.6
> >> +	  kernel, because these kernels are not located at the standard
> >> +	  URL at kernel.org. Instead, select "Custom tarball" and
> >> +	  specify the right URL directly.
> > Adding this help text is good, but somewhat unrelated. Could you do
> > that as a separate, preliminary commit ?
> Do you mean just generate a separate patch?

Yes, a separate, first patch that adds this help text, and only that.

[--SNIP--]
> >> +BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
[--SNIP--]
> > First, I'm not sure why we bother updating the BR_NO_CHECK_HASH_FOR
> > variable. I know we already do it, but linux-headers doesn't have
> > a .hash file, so I don't see the point in doing this. Arnout, you
> > reworked this in commit 24f650aed2d9d92d8cabf0cb160fcf7964f9811e, why
> > didn't you just remove the BR_NO_CHECK_HASH_FOR ?
> I did wonder about this - I'll plan to remove it unless anybody objects.

No, I'd prefer if we were to actualyl add a .hash file for linux-headers
and for linux as well, btw, with the former being a symlink to the
latter.

So, when you respin, prepare a series that:

 1. adds the help text alone,
 2. adds a .hash for linux and a symlink to it from linux-headers
 3. refactors of the variables
 4. adds the custom locations

thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
