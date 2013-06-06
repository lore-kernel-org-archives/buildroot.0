From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jun 2013 08:18:14 +0200
Subject: [Buildroot] Buildroot and {Open,DD-}WRT
In-Reply-To: <E8FDE7E9-FA85-44C8-A6BE-04D152334B7B@sonic.net>
References: <E8FDE7E9-FA85-44C8-A6BE-04D152334B7B@sonic.net>
Message-ID: <20130606081814.40171835@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Musser,

On Wed, 5 Jun 2013 15:16:49 -0700, Charles Musser wrote:
> My (limited, but pleasing) experience with Buildroot is this:
> 
> - Configured Buildroot for the "mipsel" architecture and included
> (via "menuconfig") some libraries I was interested in.
> 
> - Added an additional package to build another library.
> 
> - Used the built cross-compiler to build a binary for the target.
> 
> - Popped the built application and libraries onto the target machine,
> which runs DD-WRT and ran them successfully.
> 
> My question is: where do Buildroot and DD-WRT (or for that matter
> OpenWRT) intersect? Buildroot is a complete solution, all the way to
> producing a flashable image. Are the *WRT distributions based on
> Buildroot (or use it). Can you add the *WRT sources to Buildroot and
> maybe take advantage of extra hardware support? How do these pieces
> interact (or do they)?

Thanks for those questions. I will only discuss OpenWRT, which I know a
little bit. I had only heard about the name DD-WRT in the past, and I
have no idea what it is exactly compared to OpenWRT.

OpenWRT was originally a fork of Buildroot, but that fork happened
many, many years ago, and since that time, Buildroot and OpenWRT have
diverged significantly. Today, you can't re-use OpenWRT packages in
Buildroot as-is, or the opposite. However, the extra hardware support
in OpenWRT is generally in the form of bootloader and kernel patches,
so there's absolutely no reason you would not be able to re-use these
in Buildroot.

OpenWRT is focused on producing ready-to-use images for Wireless
routers and similar type of devices. So they include a lot of
"product-specific" things, such as a Web configuration interface to
configure the Wireless router settings, they have a lot of extra
hardware support for specific Wireless routers, etc. So it's really a
tool that produces images for Wireless routers, even though you can
also use it for other purposes.

On the other hand, Buildroot doesn't target any specific type of
device, be it in terms of features or hardware type. Buildroot doesn't
package any sort of specific Web configuration interface, it only
packages upstream software, and allows you to select these for your
image. But if you want to reach a final product, you have to make some
integration: add your own applications, configure some applications
installed by Buildroot, maybe write some addition init scripts. So
Buildroot is really a tool that allows to build an embedded Linux, but
it isn't designed to produce immediately "a Wireless router" or a
"set-top box" or such or such product. You can achieve that, but the
selection of packages, the configuration, the integration is left in
the hands of the user.  

A good illustration of that is our default configuration for various
hardware platforms (in the configs/ directory). They only configure the
minimum to boot those platforms into a shell prompt, and that's it.
Since Buildroot is so product-agnostic, we can't decide for the user
whether we should install Gtk or Qt, Qt4 or Qt5, no GUI at all, whether
Dropbear or OpenSSH should be there, etc. So we simply make no choice
at all, and those configurations only define the architecture, the
bootloader version/configuration and the kernel version/configuration.

So Buildroot by itself doesn't really need any specific hardware
support for a given platform. As long as you have bootloader sources
and kernel sources that work for this platform, you can simply point
Buildroot to them, and that's it.

Another difference is that OpenWRT is capable of generating binary
packages (.ipk) while Buildroot is not.

Does that answer your questions? If not, do not hesitate to ask for
additional clarifications.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
