From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 19 Dec 2016 12:07:09 -0800
Subject: [Buildroot] [RFC] external toolchain scanner
In-Reply-To: <20161208210228.GA27341@free.fr>
References: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
 <8037285d-a8b2-39c9-30c4-cba364583ae9@mentor.com>
 <20161208210228.GA27341@free.fr>
Message-ID: <df15f689-fb98-5710-6c90-2ee0e5efb0be@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/08/2016 01:02 PM, Yann E. MORIN wrote:
> Well, finding the correct syseroot is not trivial: you need to know the
> CFLAGS that are to be used, because they directly influence what sysroot
> gcc will be searching for.
>
> ...
>      # host/opt/ext-toolchain/bin/mips-img-linux-gnu-gcc -print-multi-lib
>      mipsel-r2-hard-uclibc/lib;@muclibc at mips32r2@mabi=32 at EL
>      mips-r2-hard-nan2008-uclibc/lib;@muclibc at mips32r2@mabi=32 at EB@mnan=2008
>      mipsel-r2-hard-nan2008-uclibc/lib;@muclibc at mips32r2@mabi=32 at EL@mnan=2008
>
> Yes, that's 65 different ways to use a specific sysroot. The last three
> lines mean:
>
>      when these flags flags are in use,              then use this sysroot
>      -muclibc -mips32r2 -mabi=32 -EL                 mipsel-r2-hard-uclibc/lib
>      -muclibc -mips32r2 -mabi=32 -EB -mnan=2008      mips-r2-hard-nan2008-uclibc/lib
>      -muclibc -mips32r2 -mabi=32 -EL -mnan=2008      mipsel-r2-hard-nan2008-uclibc/lib
>
> The last two are pretty obvious: big vs. little endian. But when you
> look at the antepenultimate line, you'll see that it differs only by not
> specifying the way to treat NaNs.
>
> So, without the actual CFLAGS, you can't find the sysroot...
>
> And you can't know the actual CFLAGS untill you actually have a
> Buildroot .config file.
>
> But you need the sysroot...
>

A few thoughts:

1. I can't escape the observation that what I have is actually useful 
for my limited case of a 1:1 target:sysroot relationship. Given that it 
works with Linaro's free downloadable toolchains, which I believe are 
popular, I suspect it could help many people.

2. What options exactly determine the CFLAGS? If not a lot of processing 
is involved, those options could also be fed into the scanner for it to 
calculate CFLAGS independently, i.e.

  * .config -> scanner -> combined.config
  * combined.config -> make -> output/*


3. Currently, the only user input for this script is the target 
architecture tuple, from which it tries to figure out the sysroot.
3.1. Perhaps that should be flipped: the user could instead be required 
to input the sysroot, from which the target architecture could be 
determined?
3.2. Perhaps the user could be required to input both the architecture 
/and/ sysroot. That would be an optional prompt if multiple sysroots are 
preset. Just like with the multiarch prompting that's done today, it 
could look like this:

aurora:buildroot$ ./support/scripts/scan-ext-toolchain \
> host/opt/ext-toolchain/bin/mips-img-linux-gnu-gcc
Toolchain supports multiple targets. Please choose one of the following:
   aarch64-linux-gnu
   arm-none-eabi
   arm-none-linux-gnueabi

aurora:buildroot$ ./support/scripts/scan-ext-toolchain \
> -t arm-none-linux-gnueabi \
> host/opt/ext-toolchain/bin/mips-img-linux-gnu-gcc
Multiple sysroots available for target arm-none-linux-gnueabi. Please choose one of the following:
   mipsel-r2-hard-uclibc
   mips-r2-hard-nan2008-uclibc
   mipsel-r2-hard-nan2008-uclibc

aurora:buildroot$ ./support/scripts/scan-ext-toolchain \
> -t arm-none-linux-gnueabi \
> -s mipsel-r2-hard-uclibc \
> host/opt/ext-toolchain/bin/mips-img-linux-gnu-gcc
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
...

(I have no idea is this is feasible, just trying to figure out the right 
approach before I go digging.)

Hollis Blanchard <hollis_blanchard@mentor.com>
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161219/955618bc/attachment.html>
