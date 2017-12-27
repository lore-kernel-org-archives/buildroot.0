From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 22:55:31 +0100
Subject: [Buildroot] [PATCH 0/3] fs: make it behave more like the
 package infra
In-Reply-To: <cover.1514330428.git.yann.morin.1998@free.fr>
References: <cover.1514330428.git.yann.morin.1998@free.fr>
Message-ID: <20171227225531.30c62b76@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 00:20:41 +0100, Yann E. MORIN wrote:

> Currently, to register a new filesystem, one has to call:
> 
>     $(eval $(call ROOTFS_TARGET,blabla))
> 
> This is different from the package infrastructure, where the name of the
> package needs not be specified, and is automatically guessed. This makes
> the fs infra a bit different, when there is no reason for that.
> 
> Well, it turns out that there is a reason: we currently register two
> filesystems from the same directory: ubifs and ubi. But it turns out
> that these are in fact not two filesystems, but ubi can be considered
> only as a post-preocessing of the ubifs one.
> 
> So, after we fix the ubifs filesystem to register only one filesystem,
> we eventually turn the rootfs infra into a package-like infra, whereby
> naming the filesystem is no longer needed, which allows one to simply
> write:
>    $(eval $(rootfs))
> 
> The 'rootfs' keyword may seem rather generic, but it is currently unused
> in our tree (except in a post-image script for the chromebook defconfig):
> 
>     $ git grep -E '\<rootfs[[:space:]]*:?='
>     board/chromebook/snow/mksd.sh:rootfs=$BINARIES_DIR/rootfs.ext2

I've applied PATCH 1/3, which is a preparation patch. However, I'm not
100% convinced with the value of PATCH 2/3 and 3/3. And PATCH 2/3 has a
significant drawback: it breaks all existing configurations that build
an UBI filesystem. That's a rather high price to pay for an internal
change that isn't that important IMO.

So I'd like to gather more feedback on this change, but at this point,
I'm a bit reluctant I have to say.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
