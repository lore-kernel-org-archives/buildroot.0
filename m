From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 10:51:12 +0100
Subject: [Buildroot] [PATCH 1/1] Odroid XU4: Hardkernel new board support
In-Reply-To: <CABaAnAcZHJRTefHyB8R4ZuHLqAoB9HGP9KUjpkJ_ZxUkD=xU8w@mail.gmail.com>
References: <1517655722-20132-1-git-send-email-pct@crookies.net>
 <20180214224158.7943d151@windsurf.lan>
 <CABaAnAcZHJRTefHyB8R4ZuHLqAoB9HGP9KUjpkJ_ZxUkD=xU8w@mail.gmail.com>
Message-ID: <20180215105112.70b2e028@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 10:36:11 +0100, Pierre Crokaert wrote:

> > Is this condition really needed? Aren't you always going to boot with a
> > DTB ?
> 
> Yes, in this buildroot context, the DTB will always be present. I can
> remove these lines.
> In the meantime, I have removed the boot.cmd and replaced it by a boot.ini
> that is required to adjust some platform parameters (video,..). Should I
> update the patch already or fix your comments first?

It would be better to fix all comments.

> This is actually not used, I have tried to put everything in the genimage
> file, but I have a problem with the boot loader part.
> Hardkernel provides 3 binary files via there uboot github site, the problem
> is that the first 2 files actually overlap when you flash them, the second
> one (bl2.bin) overlaps the first one (bl1.bin). I have described this in an
> issue on github, but there is no reaction:
> https://github.com/hardkernel/u-boot/issues/45
> I suppose the end of bl1.bin is erased by bl2.bin and it works, but this is
> black box.
> Because of this overlap, genimage complains that there there is not enough
> room for the first file (bl1.bin).
> This is why I have used the "dd" command to flash all the bootloader files.
> This  genimage_bootloader_fragment.cfg is the part that should go in the
> genimage.cfg file if the blX.bin files were fixed.
> Do you prefere to remove this file for now?

OK, I understand the problem (it would have been good to explain it in
the commit log!). Since you say that overwriting bl1.bin with bl2 works
fine, then what I suggest is that in your post-build script, you do
something like this:

	truncate -s 15360 $(BINARIES_DIR)/bl1.bin

Then, you can use genimage correctly for everything, including the
bootloader parts. Of course, please add a comment above this "truncate"
line which explains the problem, and points to
https://github.com/hardkernel/u-boot/issues/45.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
