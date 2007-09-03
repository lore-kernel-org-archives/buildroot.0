From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 03 Sep 2007 19:39:48 -0400
Subject: [Buildroot] [Fwd:  [patch] OCF cryptodev patchset]
Message-ID: <46DC9B44.4000108@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any comments on this?

Everything is conditionally enabled, and defaults to off, so it
shouldn't affect anyone not selecting the OCF option for the
kernel headers and the OCF option for OpenSSL.

Thanks.
-Brad


-------- Original Message --------
Subject: [Buildroot] [patch] OCF cryptodev patchset
Date: Wed, 29 Aug 2007 22:41:15 -0400
From: Brad House <brad@mainstreetsoftworks.com>
To: buildroot at uclibc.org

Patch: http://www.monetra.com/~brad/buildroot/ocf-linux.patch.bz2

This is a patchset to provide userland access to kernel
cryptographic interfaces.  This means that hardware crypto
accelerators supported by the kernel can now be utilized by
userland applications and libraries such as OpenSSL, OpenSwan,
and OpenSSH.

Reference: http://ocf-linux.sourceforge.net

The patchset also provides support for these additional
hardware crypto devices (which are not currently part
of the linux kernel):
	Hifn 7951
	Hifn 7956
	SafeNet SafeXcel 1741
	SafeNet SafeXcel 1142
	Intel IXP465
	Intel IXP425
	Intel IXP422
	Freescale SEC

Note: to take advantage of hardware crypto accelerators
already in the kernel (such as GeodeLX AES, or Via Padlock)
you must, counter-intuitively, enable the 'cryptosoft' feature
of OCF.  Also, don't forget to enable 'cryptodev' for userland
support.

The kernel patchset is from the 20070727 release, but had
to be re-diffed to apply cleanly to 2.6.22.1.

The openssl patchset included here is from the 20051110
release, which is the last release supporting the 0.9.7
series of OpenSSL which is what buildroot currently
provides.  Some minor manual patching was needed to make
this apply cleanly to 0.9.7m.

Since hardware cryptographic acceleration is becoming
common in embedded devices, it makes sense for buildroot
to support this natively.

On a Soekris net5501-60 (433MHz GeodeLX), with the built-in
GeodeLX AES accelerator, using openssl's speed test with and
without cryptodev, here are some statistics:

software, single-threaded:
openssl speed -evp aes128 -elapsed
 type             16 bytes     64 bytes    256 bytes   1024 bytes   8192
bytes
aes-128-cbc       3823.26k     4329.37k     4467.63k     4510.92k
4527.16k

hardware, single-threaded:
openssl speed -evp aes128 -engine cryptodev -elapsed
 type             16 bytes     64 bytes    256 bytes   1024 bytes   8192
bytes
aes-128-cbc       1359.10k     4837.19k    13548.04k    25759.01k
34166.10k

software, multi-threaded:
openssl speed -evp aes128 -elapsed -multi 10
 type             16 bytes     64 bytes    256 bytes   1024 bytes   8192
bytes
aes-128-cbc       3921.08k     4247.58k     4483.26k     4539.02k
5722.35k

hardware, multi-threaded:
openssl speed -evp aes128 -engine cryptodev -elapsed -multi 10
 type             16 bytes     64 bytes    256 bytes   1024 bytes   8192
bytes
aes-128-cbc       4058.10k    16153.17k    26851.91k    74207.78k
123592.85k

Obviously the hardware acceleration is a huge win for large block sizes.

I've bzip2'd the entire patch for size.
Please make sure the  toolchain/kernel-headers/ocf and
package/openssl/ocf  directory and contents get committed.

My first attempt to send this sent it as an attachment, I've uploaded
it now to my webserver so it can be downloaded since it was rejected
by the mailinglist for size:
http://www.monetra.com/~brad/buildroot/ocf-linux.patch.bz2

Thanks.
-Brad
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
