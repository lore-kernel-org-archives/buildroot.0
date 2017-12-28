From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Dec 2017 17:23:07 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
Message-ID: <20171228162307.GD3428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-12-14 08:58 +0200, Baruch Siach spake thusly:
> Hi Thomas,
> 
> On Thu, Dec 14, 2017 at 06:18:50AM +0100, Thomas Petazzoni wrote:
> > On Wed, 13 Dec 2017 16:43:05 +0200, Baruch Siach wrote:
> > > This means that a custom Busybox .config will automagically be transformed 
> > > to something quite different. This is a significant change in behaviour.
> > 
> > We already tweak the Busybox .config file quite significantly in
> > busybox.mk, so it's not really new. But I agree that the scale of the
> > change is very different.
> > 
> > > Can't we just move the symlink removal logic into busybox.mk instead?
> > > That would leave the busybox binary alone, and keep the magic .config
> > > transformations to minimum.
> > 
> > If I understand your proposal, we would not tweak the Busybox .config
> > file, but instead add a post install target hook that would remove the
> > symbolic links installed by Busybox "make install" when such symbolic
> > links are going to conflict with full-blown versions of the
> > corresponding applications, added by other packages. Is that correct ?
> > 
> > If so, then I see two drawbacks with this approach. They are not
> > unacceptable, but they are drawbacks:
> > 
> >  1. We have to keep the optional dependency on Busybox in util-linux,
> >     coreutils, fbset, and all those packages that conflict with Busybox.
> >     Indeed, removing the symbolic link installed by Busybox only works
> >     if Busybox is installed first. Unless Busybox "make install" is
> >     careful enough to not install a given symlink if a file of the
> >     same name already exists.
> 
> Quoting busybox.mk:
> 
> # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
> # full-blown versions of apps installed by other packages with sym/hard links.
> 
> Unfortunately, the noclobber implementation is racy.

How is it racy?

At the moment we're gonna call it, no other package will be installing
at the same time (in the location seen by busybox at least), so there
should be no race.

Regards,
Yann E. MORIN.

> So the alternative is to 
> remove apps from the generated busybox.links file that install.sh uses as 
> input.
> 
> >  2. The Busybox binary would contain lots of useless code, which simply
> >     can't be reached, except by calling explicitly "busybox cmd".
> 
> This is not different than the situation we have now. The added useless code 
> size is in most cases negligible compared to any one of the full-blown 
> version. In the end it's the responsibility of the user to fine tune the 
> target image size.
> 
> > So neither are unacceptable drawbacks, but they are drawbacks. If the
> > general opinion is that we should do what you propose, I'm fine with
> > implementing that.
> > 
> > What do others think ?
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
