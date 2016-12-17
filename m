From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Dec 2016 17:48:00 +0100
Subject: [Buildroot] [PATCH] BeagleBoard X15: new board
In-Reply-To: <20161217141218.1a10616a@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 17 Dec 2016 14:12:18 +0100")
References: <20161215223730.4890-1-theo.debrouwere@skynet.be>
 <87d1gsasv8.fsf@dell.be.48ers.dk>
 <20161216222749.p2qhprdn3arg2bpc@skynet.be>
 <20161217141218.1a10616a@free-electrons.com>
Message-ID: <87mvfua4e7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri, 16 Dec 2016 23:27:49 +0100, Theo Debrouwere wrote:

 >> U-boot (both ti's release & mainline) currently contains 'console=ttyO2',
 >> but the kernel 'changes' it to ttyS2.
 >> 
 >> *snip*
 >> [    0.000772] WARNING: Your 'console=ttyO2' has been replaced by 'ttyS2'
 >> [    0.000779] This ensures that you still see kernel messages. Please
 >> [    0.000784] update your kernel commandline.
 >> *snip*
 >> 
 >> This can be fixed with this config line, although I can also provide a patch.
 >> Or fix it inside the uEnv.txt

 > Then I think it makes sense to provide your own uEnv.txt to fix this.

I had a look, and it is from:

commit 61929cf0169d91366fd3f30d6ee60681b037bc19
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Mon Sep 29 20:06:39 2014 +0200

    tty: serial: Add 8250-core based omap driver

    This patch provides a 8250-core based UART driver for the internal OMAP
    UART. The long term goal is to provide the same functionality as the
    current OMAP uart driver and DMA support.
    I tried to merge omap-serial code together with the 8250-core code.
    There should should be hardly a noticable difference. The trigger levels
    are different compared to omap-serial:
    - omap serial
      TX: Interrupt comes after TX FIFO has room for 16 bytes.
          TX of 4096 bytes in one go results in 256 interrupts

      RX: Interrupt comes after there is on byte in the FIFO.
          RX of 4096 bytes results in 4096 interrupts.

    - this driver
      TX: Interrupt comes once the TX FIFO is empty.
          TX of 4096 bytes results in 65 interrupts. That means there will
          be gaps on the line while the driver reloads the FIFO.

      RX: Interrupt comes once there are 48 bytes in the FIFO or less over
          "longer" time frame. We have
              1 / 11520 * 10^3 * 16 => 1.38? ms
          1.38ms to react and purge the FIFO on 115200,8N1. Since the other
          driver fired after each byte it had ~5.47ms time to react. This
          _may_ cause problems if one relies on no missing bytes and has no
          flow control. On the other hand we get only 85 interrupts for the
          same amount of data.

    It has been only tested as console UART on am335x-evm, dra7-evm and
    beagle bone. I also did some longer raw-transfers to meassure the load.

    The device name is ttyS based instead of ttyO. If a ttyO based node name
    is required please ask udev for it. If both driver are activated (this
    and omap-serial) then this serial driver will take control over the
    device due to the link order


The old omap-serial driver (which uses ttyOx) is still available, so one
workaround is simply to disable CONFIG_SERIAL_8250_OMAP (and enable
CONFIG_SERIAL_OMAP).

-- 
Bye, Peter Korsgaard
