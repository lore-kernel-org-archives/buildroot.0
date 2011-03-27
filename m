From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Mar 2011 23:12:51 +0200
Subject: [Buildroot] Booting with ramdisk
In-Reply-To: <201103211546.22271.dargaud@lpsc.in2p3.fr> (Guillaume Dargaud's
	message of "Mon, 21 Mar 2011 15:46:22 +0100")
References: <201103211546.22271.dargaud@lpsc.in2p3.fr>
Message-ID: <8739m8mfn0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

Hi,

 Guillaume> Now I want to embed that OS in the kernel (no need for a
 Guillaume> network anymore as the kernel is on a flash mem). So I did
 Guillaume> the following: - add ROOTFS CPIO to the buildroot options
 Guillaume> and make a new version - point CONFIG_INITRAMFS_SOURCE to
 Guillaume> the resulting rootfs.cpio file

That sounds correct. If you build your kernel in buildroot we even have
initramfs option that handles it all, but the above should afaik work
as well.

 Guillaume> - change the kernel parameters to "console=ttyUL0,115200 root=/dev/ram" (that's in a dts file)

That shouldn't be needed.

 Guillaume> The kernel stops instantly without even a blip on the
 Guillaume> console. A debugger reveals that it stops at 0x401718... I
 Guillaume> have no idea what's going on at this stage.

Strange. What architecture/system is this? How much did the (compressed)
kernel grow? Perhaps it's too big / you'll need to load it higher. For
most archs, the kernel want to decompress into address 0, so if you load
it too low, you might end up overwriting the compressed kernel as you're
decompressing it.

Perhaps you could add some debugging prints to the bootloader handover /
kernel decompression?

-- 
Bye, Peter Korsgaard
