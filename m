From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 02 Jul 2013 20:12:06 +0200
Subject: [Buildroot] [PATCH] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <CAG2jQ8iqGmmMNn7v1ko7==gVxKGtjjmkrd26WD_6_K2hvk-Ukg@mail.gmail.com>
References: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
 <51D26C51.8070108@mind.be>
 <CAG2jQ8j2iucPz356Wkz8=xSOQ=QC2u_7ebZZimRhycBGu4_nvg@mail.gmail.com>
 <51D30004.7060200@mind.be>
 <CAG2jQ8iqGmmMNn7v1ko7==gVxKGtjjmkrd26WD_6_K2hvk-Ukg@mail.gmail.com>
Message-ID: <51D317F6.4090205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/13 19:55, Markos Chandras wrote:
> On 2 July 2013 17:29, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 07/02/13 15:36, Markos Chandras wrote:
>
>>> Is this preferred?
>>>
>>> +ifeq ($(BR2_MIPS_NABI64)$(BR2_aarch64)$(BR2_sh64)$(BR2_x86_64),)
>>
>>
>>   I was going to say:
>>
>> ifeq ($(BR2_ARCH_IS_64),)
>>
>> but only now I realise you're talking about n32 on a 64-bit MIPS. Though I
>> must say, I don't understand why we call it BR2_ARCH_IS_64 if the ABI is 32
>> bit - or is it actually a 64-bit ABI that is just called n32 by accident?
>
> n32 is a 64-bit ABI with 32-bit pointers (something like the new x32 for x86).

  Okay, so it's a 64-bit ABI that is called n32 by accident :-)

  Since it's not clear if lib32 is needed for other architectures, and 
since we don't always do it for the 64-bit architectures, it's probably 
better to keep your original condition on $(BR2_MIPS_NABI32).


>>   I also noticed now that for lib64, we only create the symlinks if they
>> exists in the external toolchain, and we remove the lib64 directory in the
>> internal toolchain. Perhaps this can be simplified into creating the
>> lib64/lib32 links unconditionally after installing the toolchain?
>
> Whatever works best. I have no strong preference on this.

  Probably it's best if your patch goes in as is, and it can be 
refactored later.

>>> +       ln -sfn lib $(TARGET_DIR)/lib32; \
>>> +               ln -sfn lib $(TARGET_DIR)/usr/lib32;
>>

  By the way, shouldn't the same be done in STAGING_DIR?


  Regards,
  Arnout

>>
>>   No need for the semicolon and the backslash, this can be done as two
>> separate commands.
>
> Ok I will fix that.
>
> --
> Regards,
> Markos Chandras
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
