From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Dec 2017 10:45:15 +0100
Subject: [Buildroot] [PATCH 0/3] fs: make it behave more like the
 package infra
In-Reply-To: <20171227225531.30c62b76@windsurf.home>
References: <cover.1514330428.git.yann.morin.1998@free.fr>
 <20171227225531.30c62b76@windsurf.home>
Message-ID: <20171228094515.GA3428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-27 22:55 +0100, Thomas Petazzoni spake thusly:
> On Wed, 27 Dec 2017 00:20:41 +0100, Yann E. MORIN wrote:
> > Currently, to register a new filesystem, one has to call:
> > 
> >     $(eval $(call ROOTFS_TARGET,blabla))
> > 
> > This is different from the package infrastructure, where the name of the
> > package needs not be specified, and is automatically guessed. This makes
> > the fs infra a bit different, when there is no reason for that.
> > 
> > Well, it turns out that there is a reason: we currently register two
> > filesystems from the same directory: ubifs and ubi. But it turns out
> > that these are in fact not two filesystems, but ubi can be considered
> > only as a post-preocessing of the ubifs one.
> > 
> > So, after we fix the ubifs filesystem to register only one filesystem,
> > we eventually turn the rootfs infra into a package-like infra, whereby
> > naming the filesystem is no longer needed, which allows one to simply
> > write:
> >    $(eval $(rootfs))
> > 
> > The 'rootfs' keyword may seem rather generic, but it is currently unused
> > in our tree (except in a post-image script for the chromebook defconfig):
> > 
> >     $ git grep -E '\<rootfs[[:space:]]*:?='
> >     board/chromebook/snow/mksd.sh:rootfs=$BINARIES_DIR/rootfs.ext2
> 
> I've applied PATCH 1/3, which is a preparation patch. However, I'm not
> 100% convinced with the value of PATCH 2/3 and 3/3. And PATCH 2/3 has a
> significant drawback: it breaks all existing configurations that build
> an UBI filesystem. That's a rather high price to pay for an internal
> change that isn't that important IMO.

I made it so that the legacy infra would take care of converting the old
configurations over to the new options, though. ;-)

> So I'd like to gather more feedback on this change, but at this point,
> I'm a bit reluctant I have to say.

As discussed on IRC, I'll submit a different patch that converts ubi in
a full filesystem of its own, in its opwn ubi/ directory, so we can
compare.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
