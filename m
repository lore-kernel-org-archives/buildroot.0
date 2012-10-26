From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri, 26 Oct 2012 18:00:27 +0200
Subject: [Buildroot] QT application display problem
In-Reply-To: <1351266121304-33621.post@n4.nabble.com>
References: <1351263719950-33619.post@n4.nabble.com>
 <508AA9BF.8000704@gmail.com> <1351266121304-33621.post@n4.nabble.com>
Message-ID: <508AB39B.2030902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/26/2012 05:42 PM, herve Bourricaud wrote:
> Hi zoltan
>
> yes I'have compiled testapp and QT sample  framebuffer app  myself !
> ( just running the right qMake and then make with the right compiler  :-)
>
> running it I have 3 beautifuls rectangles Red,gree,blue  on my LCD !
> and this output on my console
>
> # ./framebuffer
> The framebuffer device was opened successfully.
>
> Fixed screen info:
>          id:
>          smem_start:  0x23940000
>          smem_len:    261120
>          type:        0
>          type_aux:    0
>          visual:      2
>          xpanstep:    0
>          ypanstep:    1
>          ywrapstep:   0
>          line_length: 960
>          mmio_start:  0x700000
>          mmio_len:    4096
>          accel:       0
>
> The framebuffer device was mapped to memory successfully.
>
> Successfully switched to graphics mode.
>
> Variable screen info:
>          xres:           480
>          yres:           272
>          xres_virtual:   480
>          yres_virtual:   272
>          yoffset:        0
>          xoffset:        0
>          bits_per_pixel: 16
>          grayscale: 0
>          red:    offset:  0, length:  5, msb_right:  0
>          green:  offset:  5, length:  6, msb_right:  0
>          blue:   offset: 11, length:  5, msb_right:  0
>          transp: offset:  0, length:  0, msb_right:  0
>          nonstd:       0
>          activate:     0
>          height:       0
>          width:        0
>          accel_flags:  0x0
>          pixclock:     120816
>          left_margin:  2
>          right_margin: 2
>          upper_margin: 2
>          lower_margin: 2
>          hsync_len:    41
>          vsync_len:    10
>          sync:         3
>          vmode:        0
>
> Frame Buffer Performance test...
>          Average:   6083 usecs
>          Bandwidth: 40.938 MByte/Sec
>          Max. FPS:  164.393 fps
>
> Will draw 3 rectangles on the screen,
> they should be colored red, green and blue (in that order).
>    Done.
> #
>
>
> so I suppose bit per pixels for frame buffer is 16 !
> else how to check the frame buffer configuration ?
>
> in buildroot
>       -> Package Selection for the target
>     ?       -> Graphic libraries and applications (graphic/text)
>     ?         -> Qt (BR2_PACKAGE_QT [=y])
>     ?           -> Gui Module (BR2_PACKAGE_QT_GUI_MODULE [=y])
>     ?             -> Pixel depths  selected    8/15/16
>
> must I only select 16 ?
>
> thanks for your help !
> herv?.
>
>
>
>
>
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/QT-application-display-problem-tp33619p33621.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Yes, it seems your framebuffer is set to 16 pixel colordepth, so either 
set your framebuffer's color depth to the value you used when compiled 
Qt (you have to modify the kernel boot command line for that in your 
U-Boot config, and this is the place well you can check it as well), or 
set it to 16 in your Qt configuration, and recompile Qt. The first 
solution is quicker ;)

  Otherwise if you check the      examples/qws/framebuffer/main.c file 
in your Qt source tree, then you see, that this test app is checking the 
color depth of the framebuffer, and uses a color palette according to 
the framebuffer's set value. You might want to set up a similar 
mechanism in your code, if you want to use it in different environments.

Good luck
