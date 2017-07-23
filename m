From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 11:48:55 +0200
Subject: [Buildroot] [PATCH 12/20] package/skeleton: split out into
 skeleton-common
In-Reply-To: <6bcf485a-e334-33d6-4fb1-17553670d2fb@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <af100c0e2b252ccec7e9e2b8ebc88964c78bb4dc.1500398733.git.yann.morin.1998@free.fr>
 <6bcf485a-e334-33d6-4fb1-17553670d2fb@mind.be>
Message-ID: <20170723094855.GB26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-23 01:06 +0200, Arnout Vandecappelle spake thusly:
> On 18-07-17 19:25, Yann E. MORIN wrote:
> > Move all the handling of the default skeleton into a new package,
> > skeleton-common.
> > 
> > We don;t name it skeleton-default, because it will be further split
>      don't
> 
> > later, into a skeleton for sysv and another for systemd, with some parts
> > still common between the two. So just name it skeleton-common right now;
> > this will save us a rename later.
> > 
> > We keep in the skeleton package all definitions of macros and variables
> > that can be used by other skeleton packages and/or init systems, and
> > just offload the actual feeding of the skeleton to the new package.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> [snip]
> > +# The skeleton can't depend on the toolchain, since all packages depends on the
> > +# skeleton and the toolchain is a target package, as is skeleton.
> > +# Hence, skeleton would depends on the toolchain and the toolchain would depend
> > +# on skeleton.
> 
>  I don't think this comment is very useful - it's pretty obvious. Actually, it
> would make sense for SKELETON_COMMON_ADD_SKELETON_DEPENDENCY=NO to imply
> SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY=NO, but really we don't need to
> complicate the infra for that...

Yeah, it is obvious. But since there was a comment about the toolchain
already in the skeleton, I stubornly duplicated it for the skeleton as
well, and then stubornly propagated to all skeleton packages...

I am entirely fine with dropping both, though.

>  You can't have too many comments though, so let's not block the patch for that.
> 
> > +SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
> > +SKELETON_COMMON_ADD_SKELETON_DEPENDENCY = NO
> > +
> > +# The skeleton also handles the merged /usr case in the sysroot
> 
>  This comment, on the other hand, *is* very useful.
> 
> > +SKELETON_COMMON_INSTALL_STAGING = YES
> > +
> > +SKELETON_COMMON_PATH = system/skeleton
> 
>  Not for this patch of course, but I think it would make sense to also move that
> here. But you probably thought of that already :-)

Yes, that's is what I did in the first iteration, but Thomas was against
moving it, so I left it alone to stay there.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> [snip]
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
