From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Mar 2014 11:13:20 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: do not add the toolchain
 target to the TARGETS variable
In-Reply-To: <CAHkwnC9=EDb8aBGGF_KxR_=1=0PumYOnn68S7b1T5_hXuKA1cQ@mail.gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-7-git-send-email-fabio.porcedda@gmail.com>
 <5326A778.7070507@mind.be>
 <CAHkwnC8+MsDLUd5XMU1GDmfNBCVU0p9JTaUmpWiYReTrSsAnKQ@mail.gmail.com>
 <532983A0.9050107@mind.be>
 <CAHkwnC9=EDb8aBGGF_KxR_=1=0PumYOnn68S7b1T5_hXuKA1cQ@mail.gmail.com>
Message-ID: <532ABF40.1070602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/14 10:38, Fabio Porcedda wrote:
> On Wed, Mar 19, 2014 at 12:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>  toolchain, toolchain-buildroot and toolchain-external are not added to
>> TARGETS because BR2_PACKAGE_TOOLCHAIN... is not defined.
> 
> They are added to targets, just use this command to check it:
> 
> $ make defconfig && make show-targets
> 
> toolchain-buildroot toolchain busybox target-generic-securetty
> target-generic-hostname target-generic-issue target-root-passwd
> target-generic-getty-busybox target-generic-do-remount-rw rootfs-tar
> 
>>>
>>> I was thinking that the "toolchain" target is a package that uses tha
>>> package infrastructure, what about using the Config.in:
>>>
>>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>>> index 44f3ac6..94a0c7d 100644
>>> --- a/toolchain/Config.in
>>> +++ b/toolchain/Config.in
>>> @@ -1,5 +1,9 @@
>>>  menu "Toolchain"
>>>
>>> +config BR2_TOOLCHAIN
>>> +       bool
>>> +       default y
>>
>>  That would indeed be an option (it would have to be
>> BR2_PACKAGE_TOOLCHAIN, but that's a minor detail). I'm not sure, however,
>> if this is better than TARGETS := toolchain in the Makefile.
> 
> I've not used the PACKAGE prefix because it's not used at all for the
> toolchain config options, like the  BR2_TOOLCHAIN_BUILDROOT option.

 Yeah, I forgot about this condition in pkg-generic.mk:

else ifneq ($(filter toolchain/%,$(pkgdir)),)
$(2)_KCONFIG_VAR = BR2_$(2)

> 
>>
>>  Actually, I am in favour of adding blind options for everything that
>> uses the package infrastructure. That will allow us to do things like
>> checking select/DEPENDENCIES consistency, and generally makes things more
>> consistent.
> 
> In next revision of the patch i will send the proposed patch.

 Can you mention in the commit log this second advantage?

 But first, Peter, (and other buildroot maintainers as well), do you
agree that it would be a good idea to have blind Kconfig symbols for
everything that uses the package infrastructure?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
