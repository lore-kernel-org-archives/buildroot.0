From: Robert Heywood <robert.heywood@codethink.co.uk>
Date: Fri, 8 Feb 2019 11:41:28 +0000
Subject: [Buildroot] [PATCH 0/8] board/raspberrypi: post-image
 customisations.
In-Reply-To: <bda143a4-0e98-773a-2eed-3cbbad26b7c5@mind.be>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
 <bda143a4-0e98-773a-2eed-3cbbad26b7c5@mind.be>
Message-ID: <413514e4-ab4a-9e64-3110-9bfb73bedb75@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Arnout.

Thanks for your reply.
In retrospect I probably should have reached out and asked if any of this would 
be wanted prior to submitting it. c?est la vie.

On 06/02/2019 12:36, Arnout Vandecappelle wrote:
>   Hi Robert,
> 
>   Thank you for this work, excellent to see the raspberrypi support improved. We
> discussed this at the Buildroot developer meeting.
> 
>   However, we would like to suggest a slightly different approach that is more
> amenable to reuse in other context and also simplifies things in general, we
> think. See below for our thoughts and suggestions. Thus, the series is marked as
> Changes Requested in patchwork.
> 
> On 29/01/2019 14:23, Robert J. Heywood wrote:
>> Hi all.
>>
>> I wanted to do use u-boot and mainline kernel sources with my raspies
>> but in trying to do so, found that doing it required a lot of changes
>> to the genimage cfg files.
> 
>   Note that the intention is actually that when you change the configuration of
> your target, you also change the genimage.cfg file.

This is something that I found pretty confusing. It seems illogical to have to 
set the same options in two distinct places.

> That said, if it is easy to
> support more use cases with a single genimage.cfg file (especially if there are
> in-tree use cases as well), that is something we might want to support in the
> provided genimage.cfg files.
> 

It would be better if the genimage config file could contain a placeholder, such 
as "devicetree" or "kernel" which could then be specified on the commandline. 
Then when buildroot calls genimage, it could fill in the relevant parameters.

It would simplify a lot of the cfg files across all of the boards.

>> --snip--
>> I've improved the situation by first removing the replication in the
>> cfg files (consolidating them into a single generic file). And then
>> parsing the .config file for the board specific pieces; like the
>> device tree files, and the kernel target (zimage vs image).
> 
>   This .config approach we don't like. Instead, we think it is more appropriate
> to add support for wildcards to genimage itself (and send that change upstream
> to pengutronix as well). That way, you can add "*.dtb" to genimage.cfg instead
> of the current board-specific names.
> 

genimage sort of already has this feature for directories. It's a shame we cant 
use that feature here, since the pi's bootloader uses device trees in the root 
of the partition. It would have been nice to have a dtb folder.

>   This approach can then be reused for other boards as well, like the freescale
> boards on which you probably based this approach. Back in the day that approach
> of a post-image script that autodiscovers things looked like the right thing to
> do, but it is actually somewhat complicated and confusing.

I wasn't aware the freescale configs did something similar. That's pretty 
interesting.

> 
>   If you want to do something like this, I really think it's more appropriate to
> make a custom genimage.cfg and config.txt that includes everything you want.
> Note that if you make a custom genimage.cfg, you also don't need to use the
> raspberrypi post-image script. Instead, use support/scripts/genimage.sh as the
> post-image script.
> 
>   For the zImage vs. image, you could use "*mage" but I actually think it's more
> appropriate to keep separate genimage.cfg files for them.
> 
>> - Changing the kernel in the config.txt file,
>>    Allowing me to boot uboot.bin.
> 
>   Cfr. above.

I was really hoping I'd be able to get away with not having to maintain a 
separate set of files outside of buildroot that basically just replicate 
functionality already inside of it.
But I guess what I could do is setup my CI such that it watches the buildroot 
genimage.cfg files and alerts me if any incompatible changes happen.

> 
>   In fact, I don't really like the way the post-image script is updating the
> config.txt. I think it makes much more sense to have a different config.txt for
> each board instead of SEDing it. There are two options to handle this: either
> copy the board-specific config.txt in the post-image script, or (more
> generically) extend support/scripts/genimage.cfg with options that point to
> directories/files that have to be copied to IMAGES_DIR before running genimage.

I enjoy the sed approach. It means buildroot is able to take advantage of 
upstream changes to the config.txt file, and we're not made to maintain a hoard 
of copies with minor changes.



> 
>> - Specifying a different rootfs file,
>>    Since i would like to use btrfs instead of ext4.
> 
>   This one certainly is better done in a custom genimage.cfg.
> 
>> - An option to skip creating the full sdimg.
>>    As I'm using btrfs, in some cases I only need the vfat boot blob
>>    from genimage.
> 
>   Again, make a custom genimage.cfg.
> 

very well.

I have a script that configures buildroot as I want it, from defconfigs and 
fragments. I'll also make it spit out a genimage file.
It'll be easy to do there since that script has access to the devicetree/kernel 
variables from the defconfig anyway.


> 
>> I'm using a conbination of grep and eval to pull specific values out
>> of the .config file and get them into the script. That might not be
>> best practice.
> 
>   I personally prefer to use 'make printvars VARS=...' because you can also
> extract make-derived variables that way (e.g. LINUX_IMAGE_NAME to get the
> zImage/image). But either way is fine.

I think I'll use that from now on. I find the eval approach confusing to look at. :)

kind regards, rob.
