From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Nov 2020 21:58:51 +0100
Subject: [Buildroot] [RFC PATCH] toolchain/toolchain-wrapper: remove
 --build-id=none option
In-Reply-To: <20201112110717.634931e0.john@metanate.com>
References: <20201111194840.2949984-1-john@metanate.com>
 <20201111205816.GD3971474@scaer>
 <20201112110717.634931e0.john@metanate.com>
Message-ID: <20201112205851.GB771438@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2020-11-12 11:07 +0000, John Keeping spake thusly:
> On Wed, 11 Nov 2020 21:58:16 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > On 2020-11-11 19:48 +0000, John Keeping spake thusly:
> > > The only build-id style that is not reproducible is "uuid", but the
> > > default is "sha1" so packages would have to go out of their way to
> > > choose a non-reproducible build-id.  Having build IDs in general is
> > > useful as it can be used to match split debuginfo.  
> > I would think we would then want to make sha1 the explicit build-id,
> > rather than merely depend on the default (even though it has been sha1
> > since 2007, it may change with future binutils versions).
> Unfortunately this is difficult to do - we can't just force
> --build-id=sha1 globally as some files really do need to be compiled
> without a build ID (the glibc build breaks if you try this).

This is... "interesting"...

> We could intercept the command line and override the type if --build-id
> is specified, but I don't think that's really necessary.

Indeed, this would be going a bit too far...

>  Given the
> wider push for reproducible builds, it seems that the defaults are
> likely to remain reproducible

Well, I would not be so sure... sha1 is now an old hash, it would not be
too surprising that sha2 build-ids appear at some point in the future...

> - so as long as the toolchain is the same
> then the output will be too.

We're obviously only conisdering reproducible buils with the same input
*and* the same tools.

> >     When a reproducible build is attempted (with BR2_REPRODUCIBLE=y), we forcibly
> >     disable the use of build-ids, on the assumption that they are not reproducible,
> >     as explained in b285c80143 (toolchain/toolchain-wrapper: explicitly pass
> >     --build-id=none if BR2_REPRODUCIBLE).
> The comment on that commit says it's about building in different output
> directories, but commit 71d6901 a month later added -ffile-prefix-map
> (or overrides of __FILE__/__BASE_FILE__ for older compilers), so perhaps
> that has resolved the problem that b285c80143 saw?

Maybe, that would be interesting ideed to analyse the impact of 71d6901
on the build id.

> > So, I am not sure what the "normative parts of the output contents" are,
> > but it seems that there is something that is not reproducible, that
> > influences the build-id. See also the snippet referenced from that
> > commit https://gitlab.com/snippets/1886180/raw , which found that the
> > the only delta between two reproducible builds was exactly only the
> > sha1-based build-id...
> 
> I'm not sure there's any way to find out without trying it more widely
> :-(
> 
> Having done a bit more research to spot the -ffile-prefix-map issue, I'm
> actually more confident that this should be okay, so what would you
> think about a patch with an improved commit message explaining why
> b285c80143 may no longer apply?

Yes, referencing past commits and explaining why they no longer apply,
and when they were superseded, is a very valuable resource.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
