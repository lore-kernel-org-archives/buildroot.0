From: Christian Stewart <christian@paral.in>
Date: Wed, 21 Oct 2015 21:37:49 +0000
Subject: [Buildroot] Fwd:  [PATCHv6] package/golang: new package
In-Reply-To: <CA+h8R2p5xgF7rJJW5z0AzB7b359F=S9yWrXpiTmCVK-D0Sk8pw@mail.gmail.com>
References: <1438277053-10053-1-git-send-email-yann.morin.1998@free.fr>
 <20151021230701.4701e646@free-electrons.com>
 <CA+h8R2p5xgF7rJJW5z0AzB7b359F=S9yWrXpiTmCVK-D0Sk8pw@mail.gmail.com>
Message-ID: <CA+h8R2rbM2BTMLLuczMk741Otm3EBySYPEZi8QbPZrGzf=41zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ---------
From: Christian Stewart <christian@paral.in>
Date: Wed, Oct 21, 2015 at 5:16 PM
Subject: Re: [Buildroot] [PATCHv6] package/golang: new package
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


Thomas,

On Wed, Oct 21, 2015 at 5:11 PM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> As discussed on IRC, I tested the host package, and it is not a
> cross-compiler, but a regular compiler, which makes it pretty useless:
>

Odd. Yann, can you look into this? I think it works to cross-compile Docker.

I think this is fairly confusing. We should instead say:
>
>           Go interpreter.
>
> and indicate that if people want to run Go applications that have been
> built on their host machine, then they don't need the golang target
> package.
>

Sounds Ok to me.


> should be lower case, as already noted by Jerzy.
>

OK.


> > +# We must install both the src/ and include/ subdirs because they
> > +# contain the go "runtime".
> > +define GOLANG_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/go
> $(TARGET_DIR)/usr/bin/go
> > +     $(INSTALL) -D -m 0755 $(@D)/bin/linux_$(GOLANG_ARCH)/gofmt
> $(TARGET_DIR)/usr/bin/gofmt
>
> Why do we install gofmt on the target? Buildroot doesn't install tools
> to do development on the target, so installing gofmt seems weird.
>

I believe as an "interpreter" go uses gofmt a lot.


>
> > +     mkdir -p $(TARGET_DIR)/usr/lib/go/
> > +     cp -a $(@D)/src $(TARGET_DIR)/usr/lib/go/
> > +     cp -a $(@D)/include $(TARGET_DIR)/usr/lib/go/
> > +     cp -a $(@D)/pkg $(TARGET_DIR)/usr/lib/go/
>
> If I understand correctly, all of this "runtime" is actually only
> needed if you use "go" as an interpreter on the target. If you use "go"
> on the host as a cross-compiler to build your application, you don't
> need any of this "runtime". This stuff is actually quite huge (around
> 70 MB!).
>

Yes you don't need this as long as you've pre-compiled everything on the
target and don't want to use it as an interpreter. it shouldn't be copied
if the host is selected only.


> Note that we more commonly use "cp -dprf" in Buildroot rather than "cp
> -a", but I guess it's not a super-strict rule.


~ Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151021/4b7a00f5/attachment.html>
