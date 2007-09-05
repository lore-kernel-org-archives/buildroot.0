From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 5 Sep 2007 06:34:34 -0700
Subject: [Buildroot] [buildroot 0001487]: [patch] OCF cryptodev patchset
	(hardware crypto acceleration for userland)
Message-ID: <ef4e641343fb51889a29e7f87320b81b@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1487 
====================================================================== 
Reported By:                bradmssw
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1487
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-05-2007 06:34 PDT
Last Modified:              09-05-2007 06:34 PDT
====================================================================== 
Summary:                    [patch] OCF cryptodev patchset (hardware crypto
acceleration for userland)
Description: 
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
without cryptodev, here are some statistics on my hardware:

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

This has been sent to the mailing list without reply...

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-05-07 06:34  bradmssw       New Issue                                    
09-05-07 06:34  bradmssw       Status                   new => assigned     
09-05-07 06:34  bradmssw       Assigned To               => buildroot       
09-05-07 06:34  bradmssw       File Added: ocf-linux.patch.bz2                  
 
======================================================================
