From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Jan 2017 18:32:23 +0100
Subject: [Buildroot] [RFC] external toolchain scanner
In-Reply-To: <c542e7c5-39e9-5d1f-1611-63ad49d26371@mentor.com>
References: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
 <8037285d-a8b2-39c9-30c4-cba364583ae9@mentor.com>
 <20161208210228.GA27341@free.fr>
 <df15f689-fb98-5710-6c90-2ee0e5efb0be@mentor.com>
 <c542e7c5-39e9-5d1f-1611-63ad49d26371@mentor.com>
Message-ID: <20170112173223.GA3716@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, All,

On 2017-01-09 15:07 -0800, Hollis Blanchard spake thusly:
> On 12/19/2016 12:07 PM, Hollis Blanchard wrote:
[--SNIP--]
>   A few thoughts:
> 
>   1. I can't escape the observation that what I have is actually useful for my limited case of a 1:1 target:sysroot relationship.
>   Given that it works with Linaro's free downloadable toolchains, which I believe are popular, I suspect it could help many people.
> 
>   2. What options exactly determine the CFLAGS? If not a lot of processing is involved, those options could also be fed into the
>   scanner for it to calculate CFLAGS independently, i.e.
>     * .config -> scanner -> combined.config
>     * combined.config -> make -> output/*

Well, the whole point of the scanner is to come up with an initial
.config pre-filled with the toolchain settings.

Going to the menuconfig then back to the shell to run the scanner, then
back to the menuconfig is not user-friendly... :-/

>   3. Currently, the only user input for this script is the target architecture tuple, from which it tries to figure out the sysroot.
>   3.1. Perhaps that should be flipped: the user could instead be required to input the sysroot, from which the target architecture
>   could be determined?

No, that is not a viable solution.

The underlying reason is that we do determine the sysroot from the
CFLAGS, and we would risk a mis-match between the sysroot as set by the
user and the settings as determined by Buildroot.

We do not want to risk such a mis-match.

Besides, most users are totally oblivious at what a sysroot is. All they
get is a toolchain.

And back to your first comment: yes, Linaro toolchains might be very
common and widely used by hobbyists that use Buildroot. But in an
enterprise situation, the toolchain more often than not comes from a SoC
or system vendor. So in such a setup, pre-built public toolchains are
seldom used.

>   3.2. Perhaps the user could be required to input both the architecture and sysroot. That would be an optional prompt if multiple
>   sysroots are preset. Just like with the multiarch prompting that's done today, it could look like this:

Or the scanner could just bail out, instructing the user to go to the
menuconfig and fill the values all by himself. Which defeats the very
purpose of the toolchain in the first place.

We don't want a scanner if all it is able to do is just fill the obvious
values. The scanner only becomes interesting if it can do the job in the
most complex cases (IMHO).

>  aurora:buildroot$ ./support/scripts/scan-ext-toolchain \
>  > host/opt/ext-toolchain/bin/mips-img-linux-gnu-gcc
>  > Toolchain supports multiple targets. Please choose one of the following:
>  >   aarch64-linux-gnu  arm-none-eabi  arm-none-linux-gnueabi
>  > aurora:buildroot$ ./support/scripts/scan-ext-toolchain \
>  > -t arm-none-linux-gnueabi \> host/opt/ext-toolchain/bin/mips-img-linux-gnu-gcc
>  > Multiple sysroots available for target arm-none-linux-gnueabi. Please choose one of the following:
>  >   mipsel-r2-hard-uclibc  mips-r2-hard-nan2008-uclibc
>  >   mipsel-r2-hard-nan2008-uclibc

Again, in most cases, the user has no way to know before-hand what
sysroot to use, even less so what a sysroot is.

And suffice that the user chooses the wrong sysroot (all to probable),
we would end up setting the wrong values in the generated .config, and
thus the checks we do would still kick in and refuse the configuartion.

>  > aurora:buildroot$ ./support/scripts/scan-ext-toolchain \
>  > -t arm-none-linux-gnueabi \> -s mipsel-r2-hard-uclibc \
>  > host/opt/ext-toolchain/bin/mips-img-linux-gnu-gcc
>  BR2_TOOLCHAIN_EXTERNAL=yBR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
>  ...
> 
>   (I have no idea is this is feasible, just trying to figure out the right approach before I go digging.)

If it were only for me, I would say that it is not posible to do a
scanner. As I already explained, there are un-breakable chicken-n-egg
problems...

However, what we could do is spit-out all the incorrect settings on
first run, rather than stop on the first problem. That way, the user
would have a single run to check the settings and fix them, rather than
the current behaviour of going back to the menuconfig for each and every
incorrect setting...

I would rather that we work toward this goal, which would be a
termendous improvement on what we currently have.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
