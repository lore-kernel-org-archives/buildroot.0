From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Dec 2013 17:45:51 +0100
Subject: [Buildroot] genimages comments
Message-ID: <20131207164551.GA3339@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here are a few comments on behalf of Ryan (which is mail-less for a
moment). I'll try to address them in-line.

> Submit patches 1/5 and 3/5 separate from this genimages proposal. I
> think that the current RPi could benefit from this without being
> included with your genimages proposal.

Path 1/5 already applied. Patch 3/5 is still controversial, so I
postponed it.

> How does this address the issue of using SD cards of different sizes?

Size of the final device is not handled for now. This is smething we can
add later.

> * Normally your SD card has different cylinder sizes which can only be
>   figured out while flashing the card. How does your genimages things
>   handle this?

genimages by itself does not know about device 'geometry'.

When you define a 'device' in genimages, you say what 'type' it is. For
example you could say "this device is MBR-based". Then genimages
delegates to the MBR handler the responsibility to assemble the
partition images into the final device image.

It all depends on what the handler is capable of. For now, the MBR
handler is the only one we have, and it only deals woth LBA (since it
uses 'genparts' which does not know about CHS). But if we switch the MBR
handler to use another tool that knows about CHS (eg. parted), then we
can handle CHS just fine without changing the genimages infrastructure.

> * Maybe we could have it so that the genimages, generates a shell
>   script for loading of the SD card?

I prefer to generate complete images. This is easier to pass to another
team (eg. the QA team) than a bunch of scripts and tarballs and whatnot.

> How does you this help for cases where the first part of an SD card
> for certain architectures must be raw 'dd' of files to certain block
> location/offsets?

We just need to add a new handler that knows how to generate such a
partition content.

>  * For example, the Freescale P-series of processors (QorIQ), requires
>    the u-boot image to be placed at 0x1000 on the SD card. Then it
>    requires firmware for the ethernet interfaces to be placed at
>    0x2280 (somewhere around there as I don't remember off the top of
>    my head) on the SD card. Finally the u-boot environment is placed
>    at some raw location too on the SD card at like 0x2300.
> 
>  * Another example is Altera's SoCFPGA where you have to put the MLO 
>    file in the first 4 64 KB blocks of the SD card. It would be nice
>    to be able to handle this gracefully with the genimages
>    infrastructure. I'm not necessarily asking for it at first but at
>    least we are taking this into mind for future growth for the 
>    genimages infrastructure.

Yes, Thomas P. has already expressed such needs. It is totally valid,
and I believe not too difficult to add.

But I prefered to submit a simple patchset (which is already complex in
itself) rather than a full-fledged solution.

genimages knows about two types of handlers:
  - 'boot' handlers, that can generate device images. For now, I've only
    added the 'mbr' boot handler, since that's the only I have needed so
    far
  - 'fs' handlers, that can generate filesystem images for partitions.
    Currently, we have 'ext' and 'vfat' fs handlers.

For 'raw' partitions, we can add a new 'raw' handler. How we define it
is still to be devised, though.

> Another interesting use-case that sometimes comes up for me is that
> there may be an embedded product that has different storage options.
> For example, let say I have a board - foo - that utilizes both NOR 
> flash and eSDHC card. However, I want to be able to lay out my BR
> project as follows so that the things are stored as follows:
> 
> foo board
>  |-- NOR flash
>  |    |- kernel
>  |    |- u-boot
>  |    |- minimal fs required to boot (squashfs)
>  |    |- some other firmware files
>  |
>  |-- eMMC memory
>       |- Full filesystem (minus minimal fs part)

genimages already handles multiple devices. If you look at the manual
[0], the second example is exactly similar to what you describe above.

(note: of course, the 'raw' partition is not possible, as explained
above, but we can add it later on.)

> It would be great if I could accomplish this with a single BR config
> but I believe right now I would have use two BR configs. One for the
> NOR flash partition and a second to build the other packages that
> would reside on the eMMC memory. If genimages could help accomplish
> this it would be great but I have my doubts that this is the
> intentions of the proposal.

Yes it is in the scope (I have something almost ready, but it's still in
my head!).

Of course, very complex setups might be out-of-reachmages (or any other
infrastructure), and will always require site-local post-image scripts.

> However, if we could have a vision for how
> this be incorporated on-top of genimages, I would be interested in
> that. But for now I think this use case is too complicated and
> specialized for your proposal. However, if somebody has suggestions on
> how to accomplish this within the current way BR is structured, I
> would appreciate any feedback.

Thanks for your feedback.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
