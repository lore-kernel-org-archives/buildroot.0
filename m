From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Apr 2014 21:16:55 +0200
Subject: [Buildroot] [PATCH 8/9] boot/syslinux: add option to install
 the EFI image
In-Reply-To: <20140428171514.GA3501@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <b21bd8bd922ebfb71a12cf929f953f384216f43f.1398378217.git.yann.morin.1998@free.fr>
 <535DF2CD.3000100@mind.be> <20140428171514.GA3501@free.fr>
Message-ID: <535EA927.3080701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/04/14 19:15, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2014-04-28 08:18 +0200, Arnout Vandecappelle spake thusly:
>> On 25/04/14 00:30, Yann E. MORIN wrote:
>>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
[snip]
>>> +choice
>>> +	bool "Image type"
>>
>>  Why is this a choice? It's possible to build both, no? Similar to
>> iso/pxe. So it makes more sense to me to add efi as a third option after
>> iso and pxe.
> 
> Well, the target will be either BIOS-based or an EFI-based, not both.
> So it seems more logical to make it a choice (Thomas seemed to agree on
> IRC, as well.)
> 
> But thinking of it, we could go even further: iso/pxe/mbr/efi are all
> _alternate_ methods of booting, so it does not make sense to have more
> than one selected at any one time.
> 
> The only reason pxe/iso are not a choice _currently_ (e.g. syslinux-4.0.7),
> is that they are always built, and there is a no way to only build one or
> the other. This is the same behaviour in 6.0.2: you can build any
> combination of {bios,efi32,efi64} (only one, two, or all of them). But
> bios will always build pxe and iso (and mbr, see next cset).

 Good point. But then of course, it also doesn't make sense to build both
U-Boot and syslinux :-)

 So I'm OK with making iso/pxe/mbr/efi a choice.

 When syslinux/extlinux is added, that does add some difficulty because
those can be combined with mbr. But that can be tackled when the problem
arises :-).



 Regards,
 Arnout

> 
> In the end, I don't really care, although I'd find it strange to be able
> to build both at the same time, since the target will have one or the
> other, not both (well, unless we target a desktop PC with legacy bios
> enabled in the EFI bios; but we ain't do that, do we?) At worse, I'd
> chamge it to a choice for everything (although I could understand a case
> where the user would want both pxe and iso and mbr at the same time.)
> 
>>> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
>>> index bec132f..bf0bae5 100644
>>> --- a/boot/syslinux/syslinux.mk
>>> +++ b/boot/syslinux/syslinux.mk
>>> @@ -15,6 +15,20 @@ SYSLINUX_INSTALL_IMAGES = YES
>>>  
>>>  SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
>>>  
>>> +ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
>>> +SYSLINUX_TARGET = bios
>>
>>  If you follow my suggestion, this would become SYSLINUX_TARGETS of
>> course. And +=
> 
> Yes, of course. I already had that in the beginning, but I believe it
> does not really make sense.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
