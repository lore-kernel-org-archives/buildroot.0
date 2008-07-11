From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 11 Jul 2008 07:07:29 +0200
Subject: [Buildroot] gunzip slows booting
In-Reply-To: <4876E12E.6010200@ripnet.com>
References: <4876E12E.6010200@ripnet.com>
Message-ID: <4876EA91.1070901@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike Sander skrev:
| Hi All,
|
| I'm building a 2.6.25 kernel and initramfs for an atmel at91sam9260ek
| using buildroot.  I'm not sure if I'm experiencing a buildroot problem
| per se, but hopefully someone here might have some insight.
|
| With the default uImage (uses compressed zImage) and default compressed
| initramfs I have a boot time from exiting u-boot to my user space
| application running (started from iniittab) on the order of 3.0 sec.
|
| If I generate the uImage from Image (uncompressed kernel image),  my
| boot time drops to approx 2.0 sec.    As far as I can see, the only
| difference is that gunzip() is not called for the uncompressed kernel.
| It becomes a simple data copy.  I don't have the image sizes at hand,
| but gzip typically gives a 2:1 compression ratio.
|
| Similarly, if I generate an uncompressed initramfs ( I simply removed
| the gzip from gen_initramfs_list.sh) my boot time further drops to 1.2
| sec.   The filesystem is ~600k compressed and 1.3 MB uncompressed.
| Again, the unzip is replaced by a data copy operation.
|
| I guess the first question is whether there is a problem or not with
| gzip appearing to be slow?   I had expected the compressed kernel &
| initramfs to have quicker boot times than uncompressed.  I suspect the
| default kernel boot may be optimized for relatively slow disk copy and
| very fast processors [typical desktop].    In such a configuration a
| long unzip operation probably is faster than coping a bigger image from
| a slow disk.
|
| Assuming there is a problem here, I have started to debug this.
| basically gunzip() calls inflate().   After a few more calls we get to
| inflate_codes() which ultimate ends in a call to memcpy().  What I have
| observed and find very strange is that memcpy() is being used to
| repeatedly copy a very small number of bytes (typically 1 to 4).
| Occasionally it is called to copy a larger # of bytes.  There are
| literally  tens (or hundreds) of thousands of memcpy to move a few MB
| data.   I suspect this is where the vast majority of the time is being
| spent.
|
| Is it possible that I am seeing an architecture specific problem?
|
|
| Any comments/suggestions are welcome.

I would be very surprised if you could get a compressed kernel
to boot faster than an uncompressed kernel on an ARM
if you store in parallel flash
You can read a 16 bit parallel flash at about ~20 MB/s
and you can write a 32 bit SDRAM at 400 MB/s.

For 1,3 MB the flash read should be ~67 ms
and the SDRAM write should be ~ 3 ms.

With a compressed kernel you would read at ~33 ms.
Then you have to do tab ~20 MB/s out ofle lookup to decompress,
and this could take a lot of time.

zipping the kernel is mainly for reducing the cost
by enabling the use of smaller flash.

Note that if you use NAND flash,then you have to do
ECC calculations on all NAND reads and then
compression becomes more favourable.

BR
Ulf Samuelsson


|
| Mike
| _______________________________________________
| buildroot mailing list
| buildroot at uclibc.org
| http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIduqRAyRRH5cXxqwRArogAJ9LHOFYpUbTkc8I2KaaCq874FYxZQCfQ1wK
QxxqvTKmeXk7GQCVEUmU+V4=
=zE5v
-----END PGP SIGNATURE-----
