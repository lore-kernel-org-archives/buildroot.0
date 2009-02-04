From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Feb 2009 08:46:43 +0100
Subject: [Buildroot] mksquashfs for big endian
In-Reply-To: <1233715795.17973.14.camel@penguin> (jeff angielski's message of
	"Tue\, 03 Feb 2009 21\:49\:55 -0500")
References: <1233715795.17973.14.camel@penguin>
Message-ID: <877i46eja4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jeff" == jeff angielski <jeff@theptrgroup.com> writes:

Hi,

 jeff> Has anybody been able to get a big endian squashfs filesystem built on a
 jeff> x86 host (little endian) to run on a powerpc target (big endian)?

Yes, several times a week ;)

 jeff> When I build the rootfs as big endian, the kernel always fails when it
 jeff> tries to find the magic number because the bytes are swapped incorrectly
 jeff> in flash.

 jeff> If you look in super.c for the squashfs driver in the kernel, it would
 jeff> seem that Linux always assumes the rootfs is little endian.
	
 sb-> s_magic = le32_to_cpu(sblk->s_magic);
 jeff> 	if (sb->s_magic != SQUASHFS_MAGIC) {\
 jeff> 		<fail>
 jeff> 	}

 jeff> How can this ever work?  

 jeff> I recall seeing patches proposed for supporting big endian but alas,
 jeff> they do not appear to have been accepted.

To buildroot?

 jeff> I was just looking for a sanity check to see if somebody else has it
 jeff> working.

 jeff> BTW, I am using the DENX 2.6 kernel.

I think you are getting confused about the different squashfs versions
in existence. The squashfs version supported in BR is 3.4 (the latest
released version), which supports big AND little endian file
systems. The thing that got merged into the mainline kernel after
2.6.28 is squashfs 4, which is a different filesystem format and
purely little endian. You'll need an updated mksquashfs to create a
version 4 filesystem, but that's sadly not released yet (available in
cvs though).

I'll add v4 support to BR when there's a new mksquashfs release
supporting it, until then I suggest you stay with 2.6.28.

-- 
Bye, Peter Korsgaard
