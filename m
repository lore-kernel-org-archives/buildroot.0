From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 02 Jul 2013 18:29:56 +0200
Subject: [Buildroot] [PATCH] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <CAG2jQ8j2iucPz356Wkz8=xSOQ=QC2u_7ebZZimRhycBGu4_nvg@mail.gmail.com>
References: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
 <51D26C51.8070108@mind.be>
 <CAG2jQ8j2iucPz356Wkz8=xSOQ=QC2u_7ebZZimRhycBGu4_nvg@mail.gmail.com>
Message-ID: <51D30004.7060200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/13 15:36, Markos Chandras wrote:
> Hi Arnout,
>
> On 2 July 2013 06:59, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 07/01/13 12:51, Markos Chandras wrote:
>>>
>>> From: Markos Chandras <markos.chandras@imgtec.com>
>>>
>>> gcc hardcodes the uClibc interpreter for MIPS64/n32 as follows:
>>> (gcc-4.7.3, gcc/config/mips/linux64.h):
>>> define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
>>>
>>> However, buildroot always creates the $(TARGET_DIR)/lib and
>>> $(TARGET_DIR)/usr/lib directories, therefore for consinstency
>>> reasons, we create a lib32->lib symlink to fix the interpreter
>>> problems for MIPS64/n32.
>>
>>
>>   I would say we do it for all 32-bit platforms. If people feel they can't
>> afford the overhead of two additional inodes in their rootfs, they can still
>> remove the link in a post-build script.
>>
>
> Is this preferred?
>
> +ifeq ($(BR2_MIPS_NABI64)$(BR2_aarch64)$(BR2_sh64)$(BR2_x86_64),)

  I was going to say:

ifeq ($(BR2_ARCH_IS_64),)

but only now I realise you're talking about n32 on a 64-bit MIPS. Though 
I must say, I don't understand why we call it BR2_ARCH_IS_64 if the ABI 
is 32 bit - or is it actually a 64-bit ABI that is just called n32 by 
accident?

  I also noticed now that for lib64, we only create the symlinks if they 
exists in the external toolchain, and we remove the lib64 directory in 
the internal toolchain. Perhaps this can be simplified into creating the 
lib64/lib32 links unconditionally after installing the toolchain?


> +       ln -sfn lib $(TARGET_DIR)/lib32; \
> +               ln -sfn lib $(TARGET_DIR)/usr/lib32;

  No need for the semicolon and the backslash, this can be done as two 
separate commands.


  Regards,
  Arnout

> +endif
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
