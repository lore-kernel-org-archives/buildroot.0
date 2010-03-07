From: Drasko DRASKOVIC <drasko.draskovic@gmail.com>
Date: Sun, 7 Mar 2010 20:28:04 +0100
Subject: [Buildroot] TFTP performance with U-Boot running under QEMU
In-Reply-To: <729565.36936.qm@web44806.mail.sp1.yahoo.com>
References: <729565.36936.qm@web44806.mail.sp1.yahoo.com>
Message-ID: <5ec3d7931003071128h4bc08fedhdbf22403bf3918d7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 7, 2010 at 7:19 PM, Jim Thomas <jimthomasembedded@yahoo.com>wrote:
>
> Now I am exploring adding U-Boot to the mix, where QEMU
> executes u-boot.bin, and U-Boot first transfers the Linux
> kernel uImage via TFTP and then executes it in the QEMU VM.
>

Cool idea, and very close to reality. I tried to do the same thing (I saw
your very nice instructions, thanks!)


>
> It works:
>
>   $ ./run-uboot.sh
>
>   U-Boot 2009.11 (Mar 07 2010 - 11:10:57)
>   DRAM:   0 kB
>   ## Unknown FLASH on Bank 1 - Size = 0x00000000 = 0 MB
>   Flash:  0 kB
>   *** Warning - bad CRC, using default environment
>   In:    serial
>   Out:   serial
>   Err:   serial
>   Net:   SMC91111-0
>   Hit any key to stop autoboot:  0
>   SMC91111: MAC 52:54:00:12:34:56
>   Using SMC91111-0 device
>   TFTP from server 192.168.32.140; our IP address is 192.168.32.150
>   Filename 'uImage'.
>   Load address: 0x7fc0
>   Loading:
> #################################################################
>
> #################################################################
>
> #################################################################
>
> #################################################################
>            ############################
>   done
>
> But the problem is, the TFTP transfer of the 1.4 MB Linux kernel
> takes a full 80 seconds (!) to complete.
>


I have to complain even more:

VersatilePB # tftp uImage
SMC91111: PHY auto-negotiate timed out
SMC91111: MAC 52:54:00:12:34:56
Using SMC91111-0 device
TFTP from server 192.168.0.10; our IP address is 192.168.0.150
Filename 'uImage'.
Load address: 0x7fc0
Loading: #T T T #T T T T #T T T
Retry count exceeded; starting again
SMC91111: PHY auto-negotiate timed out
SMC91111: MAC 52:54:00:12:34:56
Using SMC91111-0 device
TFTP from server 192.168.0.10; our IP address is 192.168.0.150
Filename 'uImage'.
Load address: 0x7fc0
Loading: #T T T #T T T T #T T T
Retry count exceeded; starting again



> When U-Boot is idling at the U-Boot prompt in the QEMU VM, I can
> see by running 'top' in another terminal session in the Ubuntu VM
> that hosts the QEMU VM that the QEMU VM is consuming 99% of the CPU.
>

Same thing here... Even ping takes 20 seconds. Something is fishy in
NetLoop.



> It may also explain the slow TFTP tranfer.  I suspect the QEMU VM
> running U-Boot superloop, consuming 99% of the Ubuntu VM CPU, is
> starving the TFTP server that is also running as a daemon on that
> same Ubuntu VM.  Running QEMU/U-Boot with 'nice' does not improve
> the file transfer performance.
>

> Have you observed this same slow TFTP file transfer under QEMU?
> Is there any known workaround?
>

I would also like to know this. It would be rely interesting to see what is
going on here.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100307/c55ab741/attachment-0001.htm>
