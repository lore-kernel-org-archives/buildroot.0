From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Wed, 15 Feb 2012 22:56:45 +0100
Subject: [Buildroot] [PATCH 1/2] Add support for U-Boot SPL
In-Reply-To: <201202102237.57366.arnout@mind.be>
References: <1328402147-21404-1-git-send-email-n-dechesne@ti.com>
 <201202100058.02053.arnout@mind.be>
 <CALB96Nk748E0taoD_TGpsPyqe098yC6No-xzmLE+2EjHmtaZqw@mail.gmail.com>
 <201202102237.57366.arnout@mind.be>
Message-ID: <CALB96NnRo1zYJRrKkXWwnJGMTJi0n1Ff4mCWWMXAy6TDYJ5FrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 10:37 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

> > > I think the only solution is to add a check in the .mk file if MLO and
>
> > > u-boot.img indeed exist, and fall back to the default instead if not.
>
> > >
>
> >
>
> > indeed, the u-boot.img does not seem to be created unless it's needed
> (e.g.
>
> > in OMAP case). so that might work.
>
> >
>
> > would you accept such a solution? if so i can update my patches with
> that?
>
>
>  I don't see why we would not accept that solution.
>
>
>  However, I just saw that my remark applies to all other possible targets
> as
>
> well. It looks like the u-boot build produces just one of the possible
> images
>
> (kwb, ldr, bin, -nand.bin) so the user is responsible for choosing the
> right
>
> one in the config. So I guess you can disregard my original remark.
> Although
>
> actually, I'd prefer if the BR2_TARGET_UBOOT_FORMAT_* options would just go
>
> away. The install commands can copy all of them, as far as they exist. But
>
> you don't have to worry about that, Nicolas.
>

in fact I didn't realize the usage of BR2_TARGET_UBOOT_FORMAT_* until your
message. so i have prepared a new patch set like this:

03675f3 configs: add support for PandaBoard and PandaBoard ES
8872284 uboot: add a new binary format for u-boot.img
f2157f3 uboot: Add support for U-Boot SPL

basically first I add u-boot SPL support which ensure xloader is not used,
and copy MLO from uboot.

then I create a new UBOOT_FORMAT_IMG set to u-boot.img, which can be set
for the relevant targets.

then in the panda config I set the proper configs.

i will resent the serie shortly


> > > What is also missing is that the choice between the different image
> types
>
> > > should depend on !BR2_TARGET_UBOOT_SPL.
>
> >
>
> > sorry, i don't get this one. what do you mean?
>
>
>  There is a prompt 'U-Boot binary format' that selects which u-boot.* to
>
> install. If you select SPL, the binary format must be .img. So you should
>
> make sure that the Config.in enforces that.
>
>
>  Come to think of it, you can simply make the SPL one of the binary
>
> formats. It's not exactly the same, of course, because MLO is a separate
>
> file. But it serves the same purpose: select the binary format appropriate
>
> for the target. So, move the BR2_TARGET_UBOOT_SPL config up 60 lines
>
> so it becomes part of the binary format choice.
>

well, SPL is not really the format. SPL is where we load the uboot file, it
fact it would work with BIN format or IMG format. it's just that the name
is 'hardcoded' there. if we rename uboot.img uboot.bin, then it works...
when reading the file SPL will first try to detect if it's a IMG format
(looking for MAGIC number), if not it would assume a BIN format...

so really I think that adding another FORMAT is the right solution, and
that would allow other platforms to use SPL with uboot.bin if that's what
they need/want.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/a22b0ff0/attachment.html>
