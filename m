From: Nathan Paquin <npaquin@zortlabs.com>
Date: Wed, 9 Jul 2008 12:33:47 -0700
Subject: [Buildroot] built without large file support
In-Reply-To: <87k5fvw28l.fsf@macbook.be.48ers.dk>
References: <4874BD76.5030207@valcom.com> <87k5fvw28l.fsf@macbook.be.48ers.dk>
Message-ID: <47F8B253803FD546A30B21E6DCBEA83978A7F60535@EXVMBX003-2.exch003intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had a couple of problems with grub.  First, not all the patches would apply, so I modified the $(GRUB_DIR)/.unpacked target to break up the patch-kernel.sh wildcard line into two separate lines:

        toolchain/patch-kernel.sh $(GRUB_DIR) target/x86/grub grub.\*.patch
        toolchain/patch-kernel.sh $(GRUB_DIR) target/x86/grub grub.\*.patch.bz2

Doing this allowed all the patches to be applied, but then I still had the LARGEFILE support issue that Robert is seeing.  To fix that, I removed the grub.300-honor_UCLIBC_HAS_LFS.patch entirely (it simply didn't work even though uClibc was compiled without LARGEFILE support) and created a new patch (grub.300-LFS.patch):

--- grub-0.97/grub/asmstub.c.original   2008-06-29 10:22:02.000000000 -0400
+++ grub-0.97/grub/asmstub.c    2008-06-29 10:26:52.000000000 -0400
@@ -18,11 +18,6 @@
  *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */

-/* Try to use glibc's transparant LFS support. */
-#define _LARGEFILE_SOURCE      1
-/* lseek becomes synonymous with lseek64.  */
-#define _FILE_OFFSET_BITS      64
-
 /* Simulator entry point. */
 int grub_stage2 (void);

--- grub-0.97/lib/device.c.original 2008-06-29 10:22:02.000000000 -0400
+++ grub-0.97/lib/device.c      2008-06-29 10:23:16.000000000 -0400
@@ -18,11 +18,6 @@
  *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */

-/* Try to use glibc's transparant LFS support. */
-#define _LARGEFILE_SOURCE       1
-/* lseek becomes synonymous with lseek64.  */
-#define _FILE_OFFSET_BITS       64
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>

and added the following in the grub.mk:

ifneq ($(BR2_LARGEFILE),y)
GRUB_CFLAGS+=-D_FILE_OFFSET_BITS
else
GRUB_CFLAGS+=_FILE_OFFSET_BITS=64
endif

I should probably use sed in the makefile instead of the patch above, but these changes allowed me to compile grub without LARGEFILE support.

Regards,

Nathan


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Peter Korsgaard
Sent: Wednesday, July 09, 2008 10:40 AM
To: Robert B. Williams
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] built without large file support

>>>>> "Robert" == Robert B Williams <rwilliams@valcom.com> writes:

Hi,

 Robert> Am trying to compile grub and it is complaining that large
 Robert> file support is turned off and that _FILE_OFFSET_BITS=64.  I
 Robert> guess one of these things needs to change....

Hmm, it looks like that should be handled by
grub.300-honor_UCLIBC_HAS_LFS.patch - Does that get applied?

 Robert>  From menuconfig I tried to enable large file support in the
 Robert> toolchain area....no affect.

You'll have to remove your *_build_* dirs and run make again to
rebuild your toolchain with large file support.

 Robert> 2nd:
 Robert> What do I need to do to boot linux with root filesystem in flash?

mtd + filesystem support in your kernel and then enable
cramfs/squashfs/jffs2 images under target.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
