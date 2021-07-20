From: John Keeping <john@metanate.com>
Date: Tue, 20 Jul 2021 12:19:54 +0100
Subject: [Buildroot] [PATCH] board/raspberrypi: use kernel Bluetooth mode
In-Reply-To: <20210719205354.GC1464219@scaer>
References: <20210714145132.533559-1-john@metanate.com>
 <20210718002242.4638b323@gmx.net>
 <20210719122648.1ee4d094.john@metanate.com>
 <20210719205354.GC1464219@scaer>
Message-ID: <20210720121954.66f24494.john@metanate.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yann,

On Mon, 19 Jul 2021 22:53:54 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2021-07-19 12:26 +0100, John Keeping spake thusly:
> > On Sun, 18 Jul 2021 00:22:42 +0200
> > Peter Seiderer <ps.report@gmx.net> wrote:  
> > > On Wed, 14 Jul 2021 15:51:32 +0100, John Keeping <john@metanate.com> wrote:  
> > > > The default setting with miniuart-bt requires hciattach which is a
> > > > deprecated utility in BlueZ.  Setting the krnbt parameter switches to
> > > > the modern method of using serdev in the kernel removing the need for
> > > > any userspace configuration to enable the Bluetooth controller.
> > > >
> > > > This is documented as applying to all Raspberry Pi variants so just
> > > > enable it globally.
> > > >
> > > > Signed-off-by: John Keeping <john@metanate.com>
> > > > ---
> > > >  board/raspberrypi/post-image.sh | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> > > > index 9dbd98ef9b..a6728c686e 100755
> > > > --- a/board/raspberrypi/post-image.sh
> > > > +++ b/board/raspberrypi/post-image.sh
> > > > @@ -16,7 +16,7 @@ do
> > > >  			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> > > >
> > > >  # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
> > > > -dtoverlay=miniuart-bt
> > > > +dtoverlay=miniuart-bt,krnbt=on
> > > >  __EOF__
> > > >  		fi
> > > >  		;;    
> > > 
> > > I fully understand the aim of your patch, but it is beyond the the minimal
> > > approach of the defconfigs (minimal as as starting point for own
> > > enhancements - startup and at minimum serial console access if possible,
> > > so even not all rpi defconfigs provide the DTB overlays) or as strong hint
> > > your enhancement would not match the comment line above the changed line...  
> > 
> > That comment is still correct - the serial console continues to work
> > with krnbt=on set.  What doesn't work any more is hciattach on the
> > Bluetooth serial device since that is no longer exposed and handled
> > internally in the kernel.
> > 
> > I can understand why this isn't the default since RPi want Raspbian to
> > continue to work in the hciattach configuration without any need to
> > upgrade in step, but Buildroot doesn't have the same backwards
> > compatibility requirements and the krnbt=on mode is more usable for
> > modern systems since Bluetooth "just works" without any need for
> > hciattach or other userspace configuration.  
> 
> I was a bit undecided on the topic...
> 
> On one hand, I agree with Peter that we tend to have minimalist
> configurations, while on the other hand we also like to have those
> minimalist configuration to still enable the hardware present on the
> boards, especially if there are tricks to do so.
> 
> Furthermore, we also like to provide configurations that use
> state-of-the-art setups and technologies (for lack of a better word),
> e.g. the recommened kernel-side handling in this case.
> 
> So, in the end, I think John's proposal does make sense.
> 
> However, krnbt is a generic parameter, for the "<The base DTB>". So,
> it feels awkward to have it set as part of the --add-miniuart-bt-overlay
> option... But this option applies to all rpis that havea BT chip, so I
> can see the reasoning...

This is interesting - it's actually an option in *both* the base DT and
the miniuart-bt overlay as documented in:

	https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/overlays/README

I'm not familiar enough with this to say whether the overlay could reset
the value if we were to specify it earlier in the option.

> > > But for an alternative config.txt file handling (with better/easier support
> > > for cutomizations) see [1]...
> > > [1] https://patchwork.ozlabs.org/project/buildroot/patch/20210321114002.31000-1-ps.report at gmx.net/  
> 
> Peter, could you please rebase and respin that series, please?
> 
> There has been no better proposal, especially from my part, so even if I
> am still not 100% convinced, it does improve the situation by a fair
> amount, so I will apply it.
> 
> > I missed that series when it was posted, but it does look like an
> > improvement in configuring the system.  I will try to find some time to
> > review it in depth.  But I do still think that whenever miniuart-bt is
> > added as an overlay, the krnbt=on variant should be used.  
> 
> I think this is the confusing part: miniuart-bt is restoring the UART on
> the usual port, it is not enabling the BT chip. But in Buildroot, we use
> miniuart-bt for all rpis that have a BT chip, so I can see how it fits
> together *in our case*.
> 
> There is however one remaining question: is that kernel-side autorpobing
> specific to the rpi (I guess not)? If not, I guess this is also driven
> by a kernel cmdline parameter, no? And if so, shouldn't we use that
> kernel cmdline parameter instead?

By "kernel-side autoprobing" do you mean the serdev bus support for
Bluetooth?  That's just the standard driver binding as would be used for
any other device; the problem is that the serial device bus is
relatively new, so historically the Bluetooth UART was exposed as a
normal /dev/ttyS* and then hciattach was needed to install the custom
line discipline in order to associate that TTY with a Bluetooth driver
(there's some device-specific configuration but basically it just sets
the line discipline and waits on ppoll() for SIGTERM).

Letting the driver bind via serdev is definitely the right option given
a sufficiently recent kernel (which we have for all the RaspberryPi
defconfigs) - you have to enable BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED to
install hciattach.


Regards,
John
