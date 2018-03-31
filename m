From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 11:35:15 +0200
Subject: [Buildroot] [PATCH RESEND 1/2] fs/ubi: decouple ubi & ubifs
In-Reply-To: <CAF3==ivL4e4vT5jxoYWb=VQH9wdG0q-qCGH1FP=EK8OtLR19CA@mail.gmail.com>
References: <1521829279-5156-1-git-send-email-ben.whitten@gmail.com>
 <1521829279-5156-2-git-send-email-ben.whitten@gmail.com>
 <CANQCQpYPx=ZVSV_1fPK-FSERipL5xPpLBoKNd-kcTJmnQ-deBw@mail.gmail.com>
 <CAF3==ivL4e4vT5jxoYWb=VQH9wdG0q-qCGH1FP=EK8OtLR19CA@mail.gmail.com>
Message-ID: <ee361b37-469b-0202-a8af-768da7108b28@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ben,

On 26-03-18 23:05, Ben Whitten wrote:
> On 24 March 2018 at 03:17, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> Ben,
>>
>> On Fri, Mar 23, 2018 at 1:21 PM, Ben Whitten <ben.whitten@gmail.com> wrote:
>>> As ubi is a container it shouldn't enforce a ubifs rootfs to be built,
>>> it is reasonable to have a squashfs ro filesystem within a ubi.
>>> If ubifs is selected ubi containing ubifs is automatically selected as
>>> to not break existing configs
>>
>> What are you thoughts on the usecase of needing the Kernel/DTB FIT (or
>> other firmware) images also in UBI?
>>
>> i.e. when online creating the UBI partitions, I can see creating a
>> single UBI and then just treating it like a raw device to store a
>> series of blobs (firmware, rootfs & kernel).  Generation of something
>> like that offline feels like a post image activity.
> 
> So in my context the final 'image' is something I would deliver to our
> factory for
> flashing in production. In this case our UBI needs it all, kernel a/b
> rootfs a/b etc.

 I generally find it easier in practice to format the UBI partition "online" in
a production script, and then add the UBI(FS) volumes to it one by one. That
makes it easier to make sure the UBI extends to the full partition. Otherwise,
it depends a bit on your flasher what is done with bad blocks in your image.

> And its the individual artifacts that sw update gets generated from.
> 
>> However, I guess
>> that case could just be a new image containerization option which acts
>> like a general hook to take a series of files (for each create a UBI
>> container).  On target for that option, there would be more MTD
>> devices vs a single (I'd have to revisit the limitations of a single
>> UBI vs one for each image as I'm unsure of which is better).
> 
> It makes sense to have the UBI as large as possible to take advantage of wear
> leveling across the full flash, instead of artificially limiting their
> range. Thats what
> the volumes would be for within the UBI.
> 
>> I wonder how often a design would end up using a combination of a post
>> script and buildroot doing UBI generation where they have to maintain
>> both?  Depending on that,  I think I'd argue for defaulting to a post
>> script
> 
> True. I think justing having BR generate artifacts then have genimage assemble
> to what ever format required seems to be the defacto solution.
> Perhaps that could be integrated as an option instead of having to call it in
> numerous boards as a post script.

 Well, you can usually use support/scripts/genimage.sh directly as the
post-image script and just set the appropriate options in
BR2_ROOTFS_POST_SCRIPT_ARGS. Like is done in numerous defconfigs.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
