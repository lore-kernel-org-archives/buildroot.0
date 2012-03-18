From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Sun, 18 Mar 2012 22:57:52 +0100
Subject: [Buildroot] [PATCH 1/3 v3] uboot: Add support for U-Boot SPL
In-Reply-To: <201203181516.21974.arnout@mind.be>
References: <1331592072-32327-1-git-send-email-n-dechesne@ti.com>
 <1331592072-32327-2-git-send-email-n-dechesne@ti.com>
 <201203181516.21974.arnout@mind.be>
Message-ID: <CALB96N=oJNCHNo6tzXoun-NX7F9WpFrtjixb8k8P3aH41M4nfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 18, 2012 at 3:16 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

>  I didn't realize before, but it's only on OMAP that the SPL is called
> MLO.  Its normal name is u-boot-spl.bin.
>
>  I'm not sure how this could be solved.  The simplest way would be
> something like (untested, as usual):
>
> ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> define UBOOT_INSTALL_IMAGES_SPL
>        if [ -e $(@D)/MLO ]; then \
>                cp -dpf $(@D)/MLO $(BINARIES_DIR)/; \
>        else \
>                cp -dpf $(@D)/u-boot-spl.bin  $(BINARIES_DIR)/; \
>        fi
> endef
> endif
>
>
>  The alternative would be to make a separate config entry for MLO and
> other SPLs.  Which does make some kind of sense, I guess.
>

argh.. thx for pointing this out!

i just tried to implement the 2nd option (adding a new CONFIG var), and it
seems to work fine. I am going to send an updated series.

The reason why I think that a variable is better is that the solution is
more scalable, in case others platforms do the same thing... also because i
know that on OMAP5 for SATA boot the 2st bootloader will be called HLO, not
MLO ;-) so this solution is scalable at least for the next gen OMAP5 boards
...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120318/05281dd2/attachment.html>
