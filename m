From: Nicolas Ferre <nicolas.ferre@microchip.com>
Date: Tue, 27 Apr 2021 17:20:08 +0200
Subject: [Buildroot] [PATCH] boot: introduce at91bootstrap4
In-Reply-To: <20210427085850.5ee8f336@windsurf>
References: <20210423070822.1351638-1-eugen.hristev@microchip.com>
 <20210426220343.003df308@windsurf>
 <3dba2a91-26d5-12fa-ec05-adc6395f5e59@microchip.com>
 <20210427085850.5ee8f336@windsurf>
Message-ID: <7eccf626-5f12-9cac-2d0e-4e57451799ab@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I don't recognize our intention in the discussion below, so I would like 
to add a little clarification.


On 27/04/2021 at 08:58, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 27 Apr 2021 06:07:22 +0000
> <Eugen.Hristev@microchip.com> wrote:
> 
>>> Why would we need a new package for this? It still like just a new
>>> version of at91bootstrap. I just had a look a the differences between
>>> at91bootstrap3/ and at91bootstrap4/ and here are the only meaningful
>>> differences:
>>
>> One big reason for this is the fact that some MPUs are no longer
>> supported. We have to keep the 3.x series available for MPUs like 9x5,
>> 9260, etc, which are not supported in bootstrap4.

Having 2 packages for addressing at91bootstrap3 and at91bootstrap4 (or 
next-generation, 4-and-beyond, or whatever) was fine with me.
Even if we are duplicating some content, it's far more readable and less 
confusing for the users (BR2_TARGET_AT91BOOTSTRAP3_V4=y: whaaat?, 
possible changes in defconfigs, future SoC not supported by 3.x branch, 
...).
Ok, we already have 2 versions of this package and a weird numbering 
added to it, but the arguments given back in the days might apply just 
as well today ;-):
https://git.busybox.net/buildroot/commit/boot/at91bootstrap3/at91bootstrap3.mk?id=ca0d69c61cce256e0a6abd144cea4a2e26c46df8

... BUT as I'm a sensible person, I agree that having 
"at91dataflashboot", "at91bootstrap", "at91bootstrap3" + one more (out 
of 21 directories)... might be a little bit too much for a single AT91 
family...

>> Bootstrap4 only supports sama5d2, sama5d3, sama5d4, sam9x60 and sama7g5.
>> For these variants only, the user could possibly use either
>> at91bootstrap3 or at91bootstrap4.
>> But all the older boards still need bootstrap3.
>>
>> How would you manage this ?
>> I thought the easiest way is to have two separate packages, rather than
>> trying to obtain two pretty much different versions of bootstrap in the
>> same recipe.
>> And buildroot does not really have the 'machine concept' like yocto
>> project does. So you don't really know for which machine you are
>> building a package, inside that package's recipe. And probably in
>> buildroot you don't even want to know and you don't care.
>>
>> So, what do you think ?
> 
> Well, I think what I suggested in my previous e-mail: to have a single
> package, which allows to chose between the 3.x series and the 4.x
> series.
> 
>>> So, shouldn't we instead have a single package covering both? Perhaps
>>> with a sub-option to select "latest 3.x version" and "latest 4.x
>>> version" ?
>>
>> 3.x versions series will be phased out. I mean, no longer updated . And
>> not in long term, but , very soon.

"phased out" -> maybe not the proper term.

> No longer updated by Microchip maybe. But no longer used by Buildroot
> users, certainly not. There are plenty of people that still have AT91
> platforms around, in production, and that continue to update them.

Sure, no problem with that, we certainly don't want users of one AT91 
chips to be blocked on older versions of Buildroot or Yocto Project. No 
code will be made unreachable and certainly not the 3.x "branch".

So I don't see why people will be impacted.

>>> (Side note: I find it somewhat annoying that such vendor-provided
>>> solutions tend to drop support for older platforms... It seems that
>>> open-source communities do a better job at maintaining long-term

Note that at91bootstrap is fully Open-Source and has a community with it 
(even if little).

>>> support for older platforms. What would you say if you had to use a
>>> decade old Buildroot or Yocto to build a system for an AT91SAM9263
>>> processor ?)

Here, I don't see why it should be like you describe. We do not remove, 
delete, hide older code. We'll accept patches and fixes for 
at91bootstrap 3, that will be queued in at91bootstrap-3.x branch, like 
any other open-source project out there, no question about that.

AT91Bootstrap 4 is about new features, code refactoring that we 
*back-ported* to sama5d3 (release in 2013) and SoCs onward.

>> Well. This happens with everything. Even in open source. Some old
>> architectures are being removed. You cannot use kernel 5.12 for
>> computers with floppy disks anymore. Such is life... things get
>> obsoleted. There are still buildroot and yocto available for older
>> processors, just not the latest versions.

I wouldn't use these images for qualifying what we're doing, as we don't 
"remove" anything.
And new buildroot and YP will still be available for older processors, 
that's for sure... But with at91bootstrap 3, eventually fixed if needed 
and maintained.

> Well, it depends on the speed at which things get phased out, and
> whether they are still used in production. Linux 5.12 still has support
> for AT91RM9200, and all ARMv5 AT91 processors, for example. And so has
> the latest U-Boot release. For your own product line, Linux, U-Boot,
> Buildroot, in their latest versions all continue to have support for
> your oldest products, and AT91Bootstrap is the first component to phase
> out support for these platforms, and ironically, it's the
> vendor-provided software component.

That's a way to present it. We're talking about a new version of a 
software component, and as the old branch won't go away, I don't agree 
with the shortcut taken in your description.

We're not forcing anyone to abandon anything;
We're making a good job in addressing nearly a decade-old processor with 
our latest features and code refactoring;
The project we're talking about is Open-Source, with BSD-1 Clause, open 
to anyone to participate;
Same git tree will address processors as old as AT91RM9200 up to latest 
sama7g5 in same project
There are projects that we use, support and promote that our customers 
can run if at91bootstrap don't fit their needs (namely U-Boot or Barebox).

That's already an achievement and I hope to have shed a different light 
on this update for at91bootstrap project.

Best regards,
-- 
Nicolas Ferre
