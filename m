From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Oct 2012 19:40:03 +0200
Subject: [Buildroot] [PATCH RFC] grub2: new boot loader
In-Reply-To: <1350400302-19752-1-git-send-email-arnout@mind.be>
References: <1350400302-19752-1-git-send-email-arnout@mind.be>
Message-ID: <20121016194003.27ba31f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Tue, 16 Oct 2012 17:11:42 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The difference between grub 0.97 and grub 2.00 is so large that it
> doesn't make much sense to use the same package infrastructure.
> In addition, this is still a bit experimental so we may not want to
> remove grub 0.97 right away.  Therefore, grub2 is created as a new
> package.  If it stabilizes enough before it's merged, I'll rename it
> to grub and remove the old grub.

Great! Nice to see some work around Grub2. We have been lacking support
for this in Buildroot since a while.

I /think/ that for now grub2 should be integrated as a separate
package, as you did. We probably want to keep the legacy grub around
for a while, even if we have support for grub2.

> One major controversial item is that there is a host and a target
> version.  The host version creates the bootloader binaries for the
> target, but the grub installer binaries for the host.  The target
> version also creates the bootloader binaries for the target, and the
> grub installer binaries for the target as well.  This makes it
> possible to re-run grub-setup on the target.

This looks ok, but isn't possible to make it more similar to what we
have for U-Boot, i.e:

 * A host package that only builds the host utilities (and not the
   target images)

 * A target package that builds the target utilities and the target
   images?

> Because the pkg-infra doesn't really support host/target split for
> boot loaders, I created it as a normal package instead of a bootloader.
> The Config.in is still included from the bootloader menu, though.

Well, the pkg-infra perfectly support host/target split for boot
loaders. See package/syslinux/syslinux.mk for example.

So I would suggest to move your package in boot/grub2/, and then have
boot/grub2/Config.in sourced by boot/Config.in, and
boot/grub2/Config.in.host sourced by package/Config.in.host.

Or alternatively, do it like we do for U-Boot and have two completely
separate things (boot/grub2 for the target images only,
package/grub2-tools for the tools only), but that will duplicate some
code between the two .mk file.

> The grub2-0001-grub-setup-make-it-possible-to-specify-the-root-devi
> patch isn't strictly required to build grub, but it is to make it
> useful in the typical buildroot use case.  Without it, you need root
> privileges to be able to install grub, even when writing to an image
> file.

Ok, sounds good. Any chance of getting things merged upstream, at some
point?

> +# --with-platform=$(BR2_TARGET_GRUB2_PLATFORM)
> +#   i386-efi) ;;
> +#   x86_64-efi) ;;
> +#   i386-pc) ;;
> +#   i386-multiboot) ;;
> +#   i386-coreboot) ;;
> +#   i386-ieee1275) ;;
> +#   i386-qemu) ;;			  Requires unifont in /usr!

Just curious, what does "requires unifont in /usr" means?

Other than my general comments, I don't have any others, this looks
good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
