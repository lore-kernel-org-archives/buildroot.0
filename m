From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 06:18:50 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
Message-ID: <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 16:43:05 +0200, Baruch Siach wrote:

> This means that a custom Busybox .config will automagically be transformed to 
> something quite different. This is a significant change in behaviour.

We already tweak the Busybox .config file quite significantly in
busybox.mk, so it's not really new. But I agree that the scale of the
change is very different.

> Can't we just move the symlink removal logic into busybox.mk instead?
> That would leave the busybox binary alone, and keep the magic .config
> transformations to minimum.

If I understand your proposal, we would not tweak the Busybox .config
file, but instead add a post install target hook that would remove the
symbolic links installed by Busybox "make install" when such symbolic
links are going to conflict with full-blown versions of the
corresponding applications, added by other packages. Is that correct ?

If so, then I see two drawbacks with this approach. They are not
unacceptable, but they are drawbacks:

 1. We have to keep the optional dependency on Busybox in util-linux,
    coreutils, fbset, and all those packages that conflict with Busybox.
    Indeed, removing the symbolic link installed by Busybox only works
    if Busybox is installed first. Unless Busybox "make install" is
    careful enough to not install a given symlink if a file of the
    same name already exists.

 2. The Busybox binary would contain lots of useless code, which simply
    can't be reached, except by calling explicitly "busybox cmd".

So neither are unacceptable drawbacks, but they are drawbacks. If the
general opinion is that we should do what you propose, I'm fine with
implementing that.

What do others think ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
