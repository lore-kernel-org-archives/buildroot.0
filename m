From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2008 13:09:22 +0200
Subject: [Buildroot] kernel image size depends on toolchain?
In-Reply-To: <484FA6F4.5010408@gin.de> (Andreas Kuehn's message of "Wed\,
	11 Jun 2008 12\:20\:36 +0200")
References: <484F8157.2050902@gin.de> <87hcc0pfrr.fsf@macbook.be.48ers.dk>
	<484F8F05.2040105@gin.de> <87lk1cmi7d.fsf@macbook.be.48ers.dk>
	<484FA6F4.5010408@gin.de>
Message-ID: <87k5gwkz31.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:

 Andreas> Here it comes...
 Andreas>                                           old        actual
 Andreas> -------------------------------------------------------------
 Andreas> linux/System.map                          695909      695917
 Andreas> linux/vmlinux                           27876137    27875949
 Andreas> linux/vmlinux.o                         46429585    46507157
 Andreas> linux/arch/arm/boot/Image                2896464  3224138320

So Image is around 3G. There afaik was a problem in arch/arm about
some binutils versions creating huge images because of a new section.
What binutils version are you using (old and new)?

Ahh, this seems to be it:

commit 1e621a8e3752367d4aae78a8ab00a18fb2793f34
Author: Lennert Buytenhek <buytenh@wantstofly.org>
Date:   Fri Oct 12 14:38:54 2007 +0100

    [ARM] 4600/1: fix kernel build failure with build-id-supporting binutils
    
    Newer versions of binutils support --build-id, which adds an ELF
    note section called ".note.gnu.build-id" to the output.  On the ARM
    kernel build, because there is no explicit mention of this section
    in the shipped ld script, this section is placed at vaddr 0x00000000
    (whereas the normal kernel text/data typically starts at vaddr
    0xc0008000), causing the output of objcopy (Image) to produce a 3G+
    file.
    
    This patch makes objcopy strip the .note.gnu.build-id section from
    the Image file along with all other note sections, which fixes the
    build.
    
    Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
Bye, Peter Korsgaard
