From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue, 3 Mar 2020 22:32:03 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix symlink support
In-Reply-To: <20200303212853.GD12449@scaer>
References: <20200303133356.859800-1-antoine.tenart@bootlin.com>
 <20200303212853.GD12449@scaer>
Message-ID: <20200303213203.GI3179@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Mar 03, 2020 at 10:28:53PM +0100, Yann E. MORIN wrote:
> On 2020-03-03 14:33 +0100, Antoine Tenart spake thusly:
> > Since Linux-firmware's commit 9cfefbd7fbda ("Remove duplicate symlinks")
> > symlinks aren't distributed anymore. They are rather created at
> > installation time by a script provided in the project, copy-firmware.sh.
> > The description of the symlinks is done in the WHENCE file. Since the
> > bump to version 20200122, in commit 48cc1a89ae04, installation for many
> > firmwares was broken as Buildroot tried to install missing symlinks from
> > Linux-firmware.
> > 
> > The fix is not only to remove now missing symlinks, but to add logic to
> > create those symlinks as kernel modules will depend on them. The
> > solution taken by this patch is to create dynamically symlinks based on
> > their description in the WHENCE file *and* only if the file they'll
> > point to was installed in the target directory.
> > 
> > Fixes: 48cc1a89ae04 ("package/linux-firmware: bump to version 20200122")
> > Cc: james.hilliard1 at gmail.com
> > Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
> 
> I did find a problem with some symlinks that is not created.
> 
>     Link: cxgb4/t4fw.bin -> t4fw-1.24.11.0.bin
> 
> The target is itself in the cxgb4/ directory, so your code does not
> catch it as an isntalled blob, and thus does not create the symlink.
> 
> I anyway applied, because it at least fixes the build by dropping the
> entries tht no longer exist as they are symlinks.
> 
> So this patch is just a partial fix.
> 
> Care to send an update to also account for the kind of symlinks above?

Good catch! I'll have a look at this.

Thanks,
Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
