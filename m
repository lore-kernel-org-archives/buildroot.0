From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Nov 2020 22:00:09 +0100
Subject: [Buildroot] [RFC PATCH] toolchain/toolchain-wrapper: remove
 --build-id=none option
In-Reply-To: <20201111205816.GD3971474@scaer>
References: <20201111194840.2949984-1-john@metanate.com>
 <20201111205816.GD3971474@scaer>
Message-ID: <20201111210009.GE3971474@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2020-11-11 21:58 +0100, Yann E. MORIN spake thusly:
> Jihn, all,

Woops, sorry... Fat finger struck again... My apologies.

> On 2020-11-11 19:48 +0000, John Keeping spake thusly:
> > The only build-id style that is not reproducible is "uuid", but the
> > default is "sha1" so packages would have to go out of their way to
> > choose a non-reproducible build-id.  Having build IDs in general is
> > useful as it can be used to match split debuginfo.
> 
> I would think we would then want to make sha1 the explicit build-id,
> rather than merely depend on the default (even though it has been sha1
> since 2007, it may change with future binutils versions).
> 
> > I haven't seen any packages that do this, and if there are any that use
> 
> Try mot to use first person in commit message; instead, use a neutral
> third-person. Also, I find your commit message to have things a bit
> shuffled around. We usually liek to have commit logs that explain the
> current status, explain why this is a problem, and explain what is done
> to overcome the problem, For example:
> 
>     When a reproducible build is attempted (with BR2_REPRODUCIBLE=y), we forcibly
>     disable the use of build-ids, on the assumption that they are not reproducible,
>     as explained in b285c80143 (toolchain/toolchain-wrapper: explicitly pass
>     --build-id=none if BR2_REPRODUCIBLE).
> 
>     However, only the 'uuid' build-id is not reproducible. 'sha1' (and 'md5') are
>     based on the "normative parts of the output contents", so are stable accross
>     builds.
> 
>     Re-enable use of the build-id even in reproducible builds. We do ensure that
>     the same build-id type is used, by forcing it to 'sha1'
> 
> However, I would still doubt that build-ids are reproducible, even when
> explicitly set to 'sha1', which has been the default since 2007 now, and
> given that the commit referenced above was done because indeed they were
> not reproducible...
> 
> So, I am not sure what the "normative parts of the output contents" are,
> but it seems that there is something that is not reproducible, that
> influences the build-id. See also the snippet referenced from that
> commit https://gitlab.com/snippets/1886180/raw , which found that the
> the only delta between two reproducible builds was exactly only the
> sha1-based build-id...
> 
> Regards,
> Yann E. MORIN.
> 
> > non-reproducible build-ids then that should be treated as a bug in that
> > package like any other reproducibility issue; there is no reason to
> > globally disable build IDs when BR2_REPRODUCIBLE is set.
> > 
> > Signed-off-by: John Keeping <john@metanate.com>
> > ---
> >  toolchain/toolchain-wrapper.mk | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> > index 8b551e3a18..56d86fa1ea 100644
> > --- a/toolchain/toolchain-wrapper.mk
> > +++ b/toolchain/toolchain-wrapper.mk
> > @@ -22,7 +22,6 @@ TOOLCHAIN_WRAPPER_OPTS = \
> >  	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
> >  
> >  ifeq ($(BR2_REPRODUCIBLE),y)
> > -TOOLCHAIN_WRAPPER_OPTS += -Wl,--build-id=none
> >  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
> >  TOOLCHAIN_WRAPPER_OPTS += -ffile-prefix-map=$(BASE_DIR)=buildroot
> >  else
> > -- 
> > 2.29.2
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
