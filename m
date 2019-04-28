From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 28 Apr 2019 10:52:15 -0400
Subject: [Buildroot] Installing kernel headers after building Linux
In-Reply-To: <fac9a539-23b0-7e0d-b294-6b6545757034@mind.be>
References: <EAEE4C8D-B3C1-4310-8D48-24B29A066A97@troodon-software.com>
 <fac9a539-23b0-7e0d-b294-6b6545757034@mind.be>
Message-ID: <CA+-urNQuRoRP5XTYVOEPunRBPdeENZh20Ys1w40C_35_hfH5Uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 27, 2019 at 2:28 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/04/2019 14:35, Frank Hunleth wrote:
> > Hello,
> >
> > I have a setup where I?m using a non-Buildroot external toolchain, and I'm trying to add a package that requires the kernel headers from the same version of Linux that?s running. The kernel headers in the external toolchain don?t match the version of Linux that I?m using as you?d expect.
>
>  I don't see how you could ever depend on *the same* headers as the running
> kernel...
>
>  What you might get, though, is that you need some feature (typically an ioctl
> definition, or netlink attribute, or something like that) which is only
> available in a recent-enough kernel.
>
>  What many packages do for such a case is to carry their own recent copy of the
> relevant kernel header.
>
>  Could that be an option for you?
>

One of the eBPF calls requires the kernel version to be passed in and
does an exact match.

> > I?m wondering why the Linux build step doesn?t run `make headers_install` at the end so that the header files could be available. Would doing this for external toolchains cause an issue? Before I head too far down that path, I wanted to check.
>
>  There are two potential problems with that.
>
>  The first one is that you will overwrite the headers that were bundled with the
> toolchain, which could lead to conflicting types being used. However, this is in
> practice not an issue (I think) because of the ABI stability promise.
>
>  The second problem is how to handle this in the Buildroot packaging. I guess
> you'd need to add a conditional dependency, i.e.
>
> ifeq ($(BR2_LINUX_KERNEL)$(BR2_KERNEL_HEADERS_AS_KERNEL),y)
> FOO_DEPENDENCIES += linux
> endif
>

Thanks, that's helpful.

>
> > Or is there another way of making the kernel headers available (aside from switching to an internally generated toolchain)?
>
>  I think you can do the horrible hack of setting
>
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage headers_install
> INSTALL_HDR_PATH=$(@D)/usr"
> BR2_LINUX_KERNEL_IMAGE_NAME="zImage"
>
>  It hurts my eyes but it might work :-)

lol

>
>  But you're probably better off just patching linux.mk.
>
>
> > In case it matters, the package I?m looking at adding is `ply` so that I can run a couple eBPF traces.
>
>  Doesn't that require the headers to be present *on the target* as well?

I didn't think so and I don't see any references in the ply source to
open header files, but it's not working even with matched kernel
headers. So... Unfortunately, I gave up and solved my issue with
strace to move forward. I'll see if I can give it another try this
week. It doesn't feel far off.

Thanks again for the help!
