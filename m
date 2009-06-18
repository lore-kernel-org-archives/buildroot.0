From: laurent laffont <laurent.laffont@gmail.com>
Date: Thu, 18 Jun 2009 16:34:46 +0200
Subject: [Buildroot] at91sam9263-ek, Xfbdev wrong resolution
Message-ID: <4a339d7c0906180734nbe75cacwc6b06e4703c4dd61@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On at91sam9263-ek board, I've built an image with tinyx xorg server. When I
run Xfbdev, the only mode which work is 320x240 instead of 240x320.

Here's what I get:

# fbset

mode "240x320-56"
    # D: 4 C997 MHz, H: 17 C910 kHz, V: 55 C622 Hz
    geometry 240 320 240 320 16
    timings 200120 1 33 1 0 5 1
    hsync high
    vsync high
    rgba 5/0,5/5,5/10,0/0
endmode

# Xfbdev -screen 240x320
atmel_lcdfb atmel_lcdfb.0: 56252 KHz pixel clock is too fast
Warning: mode not found, using default
error: Invalid argument

Fatal server error:
no screens found
# Xfbdev -screen 320x240

this start an X server but resolution is inverted.


In board-sam9263.c in the kernel source ( 2.6.28.2 ) I have:


#if defined(CONFIG_FB_ATMEL) || defined(CONFIG_FB_ATMEL_MODULE)
static struct fb_videomode at91_tft_vga_modes[] = {
        {
                .name           = "TX09D50VM1CCA @ 60",
                .refresh        = 60,
                .xres           = 240,          .yres           = 320,
                .pixclock       = KHZ2PICOS(4965),

                .left_margin    = 1,            .right_margin   = 33,
                .upper_margin   = 1,            .lower_margin   = 0,
                .hsync_len      = 5,            .vsync_len      = 1,

                .sync           = FB_SYNC_HOR_HIGH_ACT |
FB_SYNC_VERT_HIGH_ACT,
                .vmode          = FB_VMODE_NONINTERLACED,
        },
};



I don't know what to look for now....

Regards,

Laurent Laffont
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090618/f56b7b58/attachment.htm>
