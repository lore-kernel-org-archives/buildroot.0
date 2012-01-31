From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Jan 2012 23:27:22 +0100
Subject: [Buildroot] [RFC 00/15] Automatically produce legal compliance
	info
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <201201312327.22738.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On Sunday 29 January 2012 16:11:33 Luca Ceresoli wrote:
> during the latest Buildroot Developers Day in November 2011 and in this
> mailing list there has been some discussion about introducing in Buildroot the
> possibility to derive automatically legally relevant material, such as
> licensing info and source tarballs for open source packages.
> 
> This is a first tentative implementation of these features.
> 
> This code is not yet fully working, but I wanted to share it with you to
> receive some early comments. I also wanted to allow those who will participate
> to the next Buildroot Developer Day next Friday to have an idea of this
> proposal in advance, in case this were object of discussion during the
> meeting.
> 
> My approach is based on the creation of a per-package _LICENSE constant in
> eack .mk file, such as:
>   FOOBAR_LICENSE = GPL_V3
>   MYAPP_LICENSE = PROPRIETARY
> This is the only effort required to the package creator. Where it is not
> specified it defaults to "unknown".
> 
> My overall goal is to add a new 'make legal-info' target that:
>  - produces a manifest file listing all packages, including closed-source ones
>    (and, why not, prints out to stdout the same info);
>  - copies source code tarballs for all non-proprietary packages (although I'm
>    saving also tarballs for BSD-licensed packages for now);
>  - save the complete text of all license files that must be included in the
>    product documentation (typically COPYING and LICENSE files); this is to
>    simplify the work of who must provide these info to documentation writers.
> 
> This patchset implements the first two points, albeit with some issues that I
> discuss below.
> About the third point I devised a few different possible implementations, but
> each of them has relevant drawbacks, so I left this point out for the moment.
> 
> Here's what is currently implmented:
> 
>   $ make legal-info
>   busybox  1.19.3       GPL_V2_ONLY
>   bzip2    1.0.5        BSD
>   directfb 1.4.15       LGPL_V2.1
>   foobar   1.2.3.4      PROPRIETARY
>   freetype 2.4.8        unknown
>   iostat   2.2          GPL_V2
>   ...
>   $ cat output/legal-info/manifest.csv 
>   package,version,license
>   busybox,1.19.3,GPL_V2_ONLY
>   bzip2,1.0.5,BSD
>   directfb,1.4.15,LGPL_V2.1
>   foobar,1.2.3.4,PROPRIETARY
>   freetype,2.4.8,unknown
>   iostat,2.2,GPL_V2
>   ...
>   $ ls output/legal-info/sources/
>   autoconf-2.65.tar.bz2
>   automake-1.11.1.tar.bz2
>   binutils-2.21.1.tar.bz2
>   busybox-1.19.3.tar.bz2
>   bzip2-1.0.5.tar.gz
>   DirectFB-1.4.15.tar.gz
>   fakeroot_1.9.5.tar.gz
>   freetype-2.4.8.tar.bz2
>   ...

That's a pretty nice feature! Great!

However, I can see something missing for GPL/LGPL packages. GPL/LGPL states
that you must also provide "the scripts used to control compilation and
installation of the executable."

Which means that, for packages such as Linux, busybox and uClibc (maybe
others as well), the associated .config file should be bundled as well.

Also, the config/build/install instructions for each GPL/LGPL package
must be provided. This could probably be done by bundling the buildroot
sources too in output/legal-info/sources/, or by leveraging the package
infrastructure to output the executed commands for every packages.

Also, for packages that get patches applied by buildroot, you must make
sure that the tarballs for those packages do contain the pathced code,
or that the patches are bundled as well. From what I see, you currently
only copy the downladed tarballs. Of course, if buildroot is also copied
to the output/legal-info/sources/ the patches will be there.

My 2 cents...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
