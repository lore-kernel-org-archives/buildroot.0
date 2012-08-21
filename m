From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Wed, 22 Aug 2012 01:01:48 +0300
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <5033FDFF.7090704@mind.be>
References: <50240DDE.4000901@petroprogram.com>
 <20120810090232.7ca6f885@skate> <5024D8B5.2020605@petroprogram.com>
 <5033FDFF.7090704@mind.be>
Message-ID: <5034054C.6050807@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

22.8.2012 0:30, Arnout Vandecappelle kirjoitti:
> On 08/10/12 11:47, Stefan Fr?berg wrote:
>> Good morning Thomas
>>
>> 10.8.2012 10:02, Thomas Petazzoni kirjoitti:
>
> [snip]
>>>   (3) Is this apng feature something that is being integrated in the
>>>       upstream version of libpng? In Buildroot, we don't like carrying
>>>       patches that add features to packages. Imagine we later want to
>>>       bump libpng to version 1.5.10 or 1.5.11, we'd have to refresh the
>>>       patch, which becomes complicated if we accumulate many large
>>>       patches.
>>
>> That's a good guestion.
>>
>> I had to check from http://en.wikipedia.org/wiki/APNG
>> and it says the following:
>>
>> "The PNG group officially rejected APNG as an official extension on
>> April 20, 2007.[3]
>> There have been several subsequent proposals for a simple animated
>> graphics format based on PNG using several different approaches.[4]
>>
>> Mozilla Firefox added support for APNG in version 3 trunk builds on
>> March 23, 2007.[5]
>> However, because libpng is the PNG Group's reference implementation of
>> the official specification,
>> APNG support can never be supported in the main libpng distribution so
>> long as it remains
>> unratified by the Group. Iceweasel 3 now supports APNG by using
>> Mozilla's unofficial variant of libpng."
>
>  The most logical solution for me seems to be to add a libapng package
> that uses the Mozilla code base.  Of course, that introduces the same
> variants mess we have for expat/libxml2 and lua/luajit.
>

Yes and it would still duplicate libpng code in the target (having
system-wide libpng and libapng package with private  Mozilla libpng +
apng stuff).

I forgotted to mention Thomas that that APNG patch is steadily updated
in http://sourceforge.net/projects/libpng-apng/

So keeping it updated between libpng versions is really not an issue.

It is even less issue if that patch can be made optional.

What I have now in mind is something like this:

################################
ifeq ($(BR2_PACKAGE_LIBPNG_APNG_SUPPORT),y)

define    LIBPNG_ADD_APNG
        cp package/libpng/patches/libpng-apng.patch package/libpng/
endif

LIBPNG_PRE_PATCH_HOOKS += LIBPNG_ADD_APNG

else

    if [ -f package/libpng/libpng-apng.patch ]; then
        rm package/libpng/libpng-apng.patch
    fi

endif
################################

That way apng patch could be switched on and off
and the duplicate code bloat of having two copies of libpng could be
avoided.

Im not even sure if there is a PRE_PATCH_HOOKS.
At least http://buildroot.org/downloads/buildroot.html#add_packages does
not mention it
But I think I saw it somewhere.


Stefan

>  Regards,
>  Arnout
