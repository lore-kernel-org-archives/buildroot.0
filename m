From: Maxim Grigoriev <maxim@tensilica.com>
Date: Tue, 03 Mar 2009 14:09:38 -0800
Subject: [Buildroot] Xtensa BUILDROOT support
In-Reply-To: <20090303093420.77f7c3dd@surf>
References: <49ACD317.6060205@hq.tensilica.com> <20090303093420.77f7c3dd@surf>
Message-ID: <49ADAAA2.2040806@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-- Resending previous email. It was bounced because
attachment was too big - 32 Kb. I was trying to attach a tar
file with binutils source overlay.

                       * * * * *

Hello Thomas,

Thomas Petazzoni wrote:
 > Le Mon, 02 Mar 2009 22:49:59 -0800,
 > Maxim Grigoriev <maxim@tensilica.com> a ?crit :
 >
 >>       Xtensa BUILDROOT uses a concept of source overlays,
 >>       which are necessary because Xtensa processors are
 >>       configurable and extensible. Xtensa tools, e.g.
 >>       gcc, gdb, and binutils, use source overlays, which
 >>       can not be substituted by the current BUILDROOT
 >>       patching mechanism. This update makes patch-kernel.sh
 >>       script capable of handling these overlays.
 >
 > Can you detail how this concept of source overlays work, technically ?
 >
 > Thomas

We use overlays because

(a) gcc/binutils/gdb/etc don't currently support multiple
   Xtensa processor variants in a single source base
   (longer term project), and
(b) it makes it trivial for someone to build tools for a new Xtensa
   processor variant, given that Tensilica gives them the customized
   overlay for their new processor, or customers come up with their
   own overlay.

Essentially, Xtensa processors can use instructions and unique
processor-specific registers that are designed by the user in
addition to a set of built-in instructions and registers.

Xtensa tools need to know how to encode/decode these instructions
and handle all the registers.  That knowledge is encapsulated in
the source overlays that are included in the binutils/gcc/gdb/etc
build process.

Let's take a look at binutils overlay for Xtensa dc232b (Diamond
Standard 232L) as an example. The overlay will be placed into

   .../buildroot/toolchain/binutils/binutils-xtensa_dc232b.tgz

I was trying to attach this tar-file, but it exceeds BUILDROOT
40Kb restriction. It contains :

./bfd
./bfd/xtensa-modules.c
./include
./include/xtensa-config.h
./ld
./ld/emulparams
./ld/emulparams/xtensa-config.sh

After modified kernel-patch.sh script handles this overlay,
these files will end up, say, in

   .../buildroot/toolchain_build_xtensa_dc232b/binutils-2.19

and Xtensa binutils will "learn" how to deal with dc232b processor.

Xtensa FSF tools ( binutils, gcc, and gdb ) work based on
overlay concept for years. The default processor is called
Xtensa FSF. Xtensa GNU/Linux can be run on this processor.

Thanks,
-- Maxim
