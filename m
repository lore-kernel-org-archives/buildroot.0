From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jan 2017 18:19:39 +0100
Subject: [Buildroot] [PATCH] package/skeleton: remove legacy mkdir
In-Reply-To: <87fuky245z.fsf@dell.be.48ers.dk>
References: <1483477263-15610-1-git-send-email-yann.morin.1998@free.fr>
 <87fuky245z.fsf@dell.be.48ers.dk>
Message-ID: <20170104171939.GB3177@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-01-04 17:14 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > We've had this mkdir, in various forms, for aeons. It dates back to
>  > the inception of Buildroot, at the dawn of ages, when the toolchain
>  > support was still nascent. Evolution had it morph from /include, to
>  > a tuple-prefixed directory and a symlink there-to, then back to the
>  > /include directory, to the final /usr/include directory we've had
>  > for the last 9 years.
> 
>  > Anything that wants to install headers is supposed to be creating
>  > that directory beforehand; we don't need this legacy mkdir now.
> 
> But how is that different from the {lib,bin,sbin} directories we also
> create?

Hmm, you would seem to make a rather good point.

But there is a difference: for lib, bin and sbin, we want to ensure
consistency with the merged-usr setup, so we need the directories to
exist to create the /lib, /bin and /sbin symlinks to their /usr
counterparts.

For lib, we also want it to exist because we also create the lib{32,64}
symlink.

So, we need to create those because Buildroot needs them by itself.

This is not the case for /usr/include.

This commit is not strictly necessary, but it makes it a little bit
easier to split the skeleton for systemd (to come later: the series is
too big and unmanageable as a single piece, so I'm sending bits of it
separately, such as this one).

Regards,
Yann E. MORIN.

>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  > ---
>  > OK, we can keep it, just for nostalgia; I just felt like writing some
>  > prose tonight. ;-)
>  > ---
>  >  package/skeleton/skeleton.mk | 1 -
>  >  1 file changed, 1 deletion(-)
> 
>  > diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
>  > index 1000161..e65ef61 100644
>  > --- a/package/skeleton/skeleton.mk
>  > +++ b/package/skeleton/skeleton.mk
>  > @@ -107,7 +107,6 @@ define SKELETON_INSTALL_STAGING_CMDS
>  >  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
>  >  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
>  >  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
>  > -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
>  >  	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
>  >  	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
>  >  	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
>  > -- 
>  > 2.7.4
> 
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> Bye, Peter Korsgaard

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
