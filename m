From: John Keeping <john@metanate.com>
Date: Mon, 19 Jul 2021 12:26:48 +0100
Subject: [Buildroot] [PATCH] board/raspberrypi: use kernel Bluetooth mode
In-Reply-To: <20210718002242.4638b323@gmx.net>
References: <20210714145132.533559-1-john@metanate.com>
 <20210718002242.4638b323@gmx.net>
Message-ID: <20210719122648.1ee4d094.john@metanate.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Peter,

On Sun, 18 Jul 2021 00:22:42 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> On Wed, 14 Jul 2021 15:51:32 +0100, John Keeping <john@metanate.com> wrote:
> 
> > The default setting with miniuart-bt requires hciattach which is a
> > deprecated utility in BlueZ.  Setting the krnbt parameter switches to
> > the modern method of using serdev in the kernel removing the need for
> > any userspace configuration to enable the Bluetooth controller.
> >
> > This is documented as applying to all Raspberry Pi variants so just
> > enable it globally.
> >
> > Signed-off-by: John Keeping <john@metanate.com>
> > ---
> >  board/raspberrypi/post-image.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> > index 9dbd98ef9b..a6728c686e 100755
> > --- a/board/raspberrypi/post-image.sh
> > +++ b/board/raspberrypi/post-image.sh
> > @@ -16,7 +16,7 @@ do
> >  			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> >
> >  # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
> > -dtoverlay=miniuart-bt
> > +dtoverlay=miniuart-bt,krnbt=on
> >  __EOF__
> >  		fi
> >  		;;  
> 
> I fully understand the aim of your patch, but it is beyond the the minimal
> approach of the defconfigs (minimal as as starting point for own
> enhancements - startup and at minimum serial console access if possible,
> so even not all rpi defconfigs provide the DTB overlays) or as strong hint
> your enhancement would not match the comment line above the changed line...

That comment is still correct - the serial console continues to work
with krnbt=on set.  What doesn't work any more is hciattach on the
Bluetooth serial device since that is no longer exposed and handled
internally in the kernel.

I can understand why this isn't the default since RPi want Raspbian to
continue to work in the hciattach configuration without any need to
upgrade in step, but Buildroot doesn't have the same backwards
compatibility requirements and the krnbt=on mode is more usable for
modern systems since Bluetooth "just works" without any need for
hciattach or other userspace configuration.

> But for an alternative config.txt file handling (with better/easier support
> for cutomizations) see [1]...
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20210321114002.31000-1-ps.report at gmx.net/

I missed that series when it was posted, but it does look like an
improvement in configuring the system.  I will try to find some time to
review it in depth.  But I do still think that whenever miniuart-bt is
added as an overlay, the krnbt=on variant should be used.


Regards,
John
