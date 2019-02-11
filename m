From: Robert Heywood <robert.heywood@codethink.co.uk>
Date: Mon, 11 Feb 2019 11:17:20 +0000
Subject: [Buildroot] [PATCH 0/8] board/raspberrypi: post-image
 customisations.
In-Reply-To: <f1b3bf83-23a7-ea4f-c552-25d25824a0ab@mind.be>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
 <bda143a4-0e98-773a-2eed-3cbbad26b7c5@mind.be>
 <413514e4-ab4a-9e64-3110-9bfb73bedb75@codethink.co.uk>
 <f1b3bf83-23a7-ea4f-c552-25d25824a0ab@mind.be>
Message-ID: <e5641c36-15cc-1a2e-7b86-1e41d7ec188b@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/02/2019 21:15, Arnout Vandecappelle wrote:
> 
>> 
>>> 
>>>> Hi all.
>>>>
>>>> I wanted to do use u-boot and mainline kernel sources with my raspies
>>>> but in trying to do so, found that doing it required a lot of changes
>>>> to the genimage cfg files.
>>>
>>>  ? Note that the intention is actually that when you change the configuration of
>>> your target, you also change the genimage.cfg file.
>>
>> This is something that I found pretty confusing. It seems illogical to have to
>> set the same options in two distinct places.
> 
>   True, but this patch series doesn't really change that, does it? E.g. for the
> zImage/image kernel, you still have to select both the correct
> BR2_LINUX_KERNEL_xxIMAGE option and pass --kernel= (rather than updating
> config.txt).
> 

No. Not for the kernel. I could have changed that, but the script already does 
some level of faffing with the "kernel=" option. And I decided it would be 
better to not change the script's behaviour for that option, in case anyone were 
depending on that particular behaviour.

I was referring to the device trees. Which are first defined in the .config, and 
then have to be redefined in each genimage.cfg.

>>>
>>>  ? In fact, I don't really like the way the post-image script is updating the
>>> config.txt. I think it makes much more sense to have a different config.txt for
>>> each board instead of SEDing it. There are two options to handle this: either
>>> copy the board-specific config.txt in the post-image script, or (more
>>> generically) extend support/scripts/genimage.cfg with options that point to
>>> directories/files that have to be copied to IMAGES_DIR before running genimage.
>>
>> I enjoy the sed approach. It means buildroot is able to take advantage of
>> upstream changes to the config.txt file, and we're not made to maintain a hoard
>> of copies with minor changes.
> 
>   Only, config.txt doesn't come from upstream; it comes from
> package/rpi-firmware/config.txt and it says "we recommend you to change it to
> fit your needs".
> 
>   Okay, it goes on saying to override it in a post-build script, but that's
> because there is no other way to put a file into genimage.cfg.
> 
The package/rpi-firmware/config.txt file is downloaded from the raspberrypi 
github. While its true that the file won't change without someone updating the 
commit in the respective .mk file, its not a file that buildroot maintains or 
authored. It is being pulled from upstream.

If you really wanted to keep separate versions of config.txt around for each 
board, genimage does support renaming files as it copies them into the image.
You could feasibly add a line such as this to each cfg file;
     file config.txt { image = "board/raspberrypi/config_raspberrypi0w.txt" }


> 
>   Regards,
>   Arnout
> 

kind regards, rob.
