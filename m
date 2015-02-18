From: Steve Kenton <skenton@ou.edu>
Date: Wed, 18 Feb 2015 10:30:10 -0600
Subject: [Buildroot] Grub2 and Splash
Message-ID: <54E4BE12.1090608@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Looking into adding a splash screen to my grub2 menu.
Cobbled together the one below using font from my build host and it works.
Trying to build unicode.pf2 with buildroot immediately ran into snag with freetype.

Finally RTFM and realized how special the grub2 build is.
Is there a reason that grub2 is not just built as a regular host package?

Steve Kenton

$ more grub.cfg
set default="0"
set timeout="3"

if loadfont /boot/grub/fonts/unicode.pf2 ; then
    set gfxmode="640x480"
    insmod gfxterm
    insmod vbe
    terminal_output gfxterm
    if terminal_output gfxterm; then true ; else
        terminal gfxterm
    fi
fi
insmod tga
background_image /boot/grub/splash.tga

menuentry "Buildroot" {
	linux /boot/bzImage root=/dev/sda1 rootfstype=ext4 console=tty1 quiet splash=si
lent
}

menuentry "Memtest86+" {
	linux16 /boot/memtest86+.bin
}
