From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 29 Apr 2014 09:18:43 +0200
Subject: [Buildroot] [PATCH 3/6] upstream glibc 2.18/2.19 works fine
 with microblaze
In-Reply-To: <CAPALihNu56_2XK5+oVrwON=pWS22xisVNTJc5Z6GX0vCvftScg@mail.gmail.com>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
 <1397382423-4939-4-git-send-email-wbx@openadk.org>
 <53553336.2020401@zacarias.com.ar>
 <CAPALihO_K2VsaYO9erhFrKZpY9755ACOjsm56O6VvxO9MA6-0Q@mail.gmail.com>
 <535EA993.8080108@zacarias.com.ar>
 <CAPALihNu56_2XK5+oVrwON=pWS22xisVNTJc5Z6GX0vCvftScg@mail.gmail.com>
Message-ID: <20140429071843.GI14063@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi William,

William Welch wrote,

> Hi again,
> 
> Thank you for your help on this -- I should have said, that I am using the
> 'git' buildroot from earlier today ( a few hours ago), with no luck on the
> native toolchain. ?So am I correct, that, for example, using the 'git
> buildroot', then ' make qemu_microblazeel_mmu_defconfig' ?should build the
> native toolchain and the resulting image should boot? ?Or, maybe the patches
> are not merged into the git tree yet?

It seems that they will be merged now. I had not the time to respin a
new patch set because I didn't know how to do it correctly ;)
On sunday I got a nice git workshop by a friend and now I am able to
do it right. May be I will add a patch to the manual.

The changes do not show up yet on
http://git.buildroot.net/buildroot. May be Peter did not pushed the
changes yesterday.
 
> I am not very skilled with qemu, so to confirm, are the directions in the
> boards/qemu/microblazeel-mmu/readme.txt correct? ?It is a little confusing,
> since they mention the s3adsp1800, whereas the system.dts mentions a ML505
> design. ?Also the readme mentions qemu 1.7.0? I have 1.5.0 at the moment but I
> can install 1.7.0 if required.

If you want to use Qemu with -initrd you should use Qemu 1.7.x or
above. I only tested the microblaze stuff with Qemu 1.7.x and 2.0.
There is no need for a separate system.dts, because the Qemu
provided dtb matches the emulated hardware the best.
The default is to emulate s3adsp1800, but ml605 could be used, too.
Networking does work better with s3adsp1800 emulation.
Both little endian and big endian targets are tested with default
configuration.

Some more Qemu microblaze stuff can be found here:
http://blog.waldemar-brodkorb.de/index.php?archives/10-English.html&serendipity[lang_selected]=en&serendipity[user_language]=en

Unfortunately I was again wrong with my assumption that gcc 4.9.0
solves the linking error with libgcc_eh. I accidently had my patches
applied while testing with gcc 4.9.0. 

There seems to be a fix in https://github.com/Xilinx/gcc, but I am
unsure how to get it extracted. The snapshot for the gcc used in
buildroot does not contain the git history and the short tag from
the directory (Xilinx-gcc-b93bb00) is not available as an object in
the git repository. I would use git bisect to find the required
patch to gcc to avoid the eglibc/glibc workaround, but I don't know
which branch and commit is used as the basis for the gcc tarball.

Anyone know this?

So the glibc patch is still required.

Have fun
 Waldemar
 
> thank you,
> 
> William
> 
> 
> 
> On Mon, Apr 28, 2014 at 2:18 PM, Gustavo Zacarias <gustavo@zacarias.com.ar>
> wrote:
> 
>     On 04/28/2014 04:08 PM, William Welch wrote:
> 
>     > Greetings,
>     >
>     > When you say BR works fine for microblaze 'on QEMU', could you be more
>     > specific? ?little endian? ?mmu? which 'defconfig' did you use with
>     > buildroot? ?Which version of QEMU, what command line?
>     >
>     > I'd like to recreate your working setup and maybe that will give me a
>     > clue to my troubles here...
>     >
>     > I am trying to use the 'buildroot native toolchain' with a Spartan 6
>     > little endian microblaze MMU design, but I don't get very far with the
>     > native toolchain. However, using the older 'external' toolchain boots
>     > linux fine.
>     >
>     >
>     > thanks,
>     >
>     > William
> 
>     Hi.
>     It means all relevant buildroot qemu sample defconfigs boot to a login
>     prompt where you can login and get dhcp working on the emulated network
>     (if said config has networking).
>     For microblaze this means big and little endian with MMU, we don't have
>     a nommu configuration since i've never managed to get that working in a
>     satisfactory way.
>     And that's with Waldemar's patches, not as it is right now which broke
>     those qemu defconfigs when the toolchain was changed to the internal
>     backend.
>     I do not know if it's the toolchain to blame and/or some Qemu
>     limitation, i just know that Waldemar's patches fix it for what i have
>     at hand (no microblaze hardware, just emulation).
>     Regards.
> 
> 
> 
