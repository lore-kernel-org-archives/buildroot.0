From: Ben Whitten <ben.whitten@gmail.com>
Date: Mon, 26 Mar 2018 22:05:52 +0100
Subject: [Buildroot] [PATCH RESEND 1/2] fs/ubi: decouple ubi & ubifs
In-Reply-To: <CANQCQpYPx=ZVSV_1fPK-FSERipL5xPpLBoKNd-kcTJmnQ-deBw@mail.gmail.com>
References: <1521829279-5156-1-git-send-email-ben.whitten@gmail.com>
 <1521829279-5156-2-git-send-email-ben.whitten@gmail.com>
 <CANQCQpYPx=ZVSV_1fPK-FSERipL5xPpLBoKNd-kcTJmnQ-deBw@mail.gmail.com>
Message-ID: <CAF3==ivL4e4vT5jxoYWb=VQH9wdG0q-qCGH1FP=EK8OtLR19CA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 March 2018 at 03:17, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Ben,
>
> On Fri, Mar 23, 2018 at 1:21 PM, Ben Whitten <ben.whitten@gmail.com> wrote:
>> As ubi is a container it shouldn't enforce a ubifs rootfs to be built,
>> it is reasonable to have a squashfs ro filesystem within a ubi.
>> If ubifs is selected ubi containing ubifs is automatically selected as
>> to not break existing configs
>
> What are you thoughts on the usecase of needing the Kernel/DTB FIT (or
> other firmware) images also in UBI?
>
> i.e. when online creating the UBI partitions, I can see creating a
> single UBI and then just treating it like a raw device to store a
> series of blobs (firmware, rootfs & kernel).  Generation of something
> like that offline feels like a post image activity.

So in my context the final 'image' is something I would deliver to our
factory for
flashing in production. In this case our UBI needs it all, kernel a/b
rootfs a/b etc.
And its the individual artifacts that sw update gets generated from.

> However, I guess
> that case could just be a new image containerization option which acts
> like a general hook to take a series of files (for each create a UBI
> container).  On target for that option, there would be more MTD
> devices vs a single (I'd have to revisit the limitations of a single
> UBI vs one for each image as I'm unsure of which is better).

It makes sense to have the UBI as large as possible to take advantage of wear
leveling across the full flash, instead of artificially limiting their
range. Thats what
the volumes would be for within the UBI.

> I wonder how often a design would end up using a combination of a post
> script and buildroot doing UBI generation where they have to maintain
> both?  Depending on that,  I think I'd argue for defaulting to a post
> script

True. I think justing having BR generate artifacts then have genimage assemble
to what ever format required seems to be the defacto solution.
Perhaps that could be integrated as an option instead of having to call it in
numerous boards as a post script.

Ben
