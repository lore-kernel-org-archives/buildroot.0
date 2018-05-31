From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 May 2018 11:13:11 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <cd9bc020-7228-60f5-187e-70c9c4274c37@st.com>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
 <98410cef-37c3-0450-9142-e1df5df34eaa@st.com>
 <20180530174257.616403f2@windsurf.home>
 <a478a326-805a-0b80-2df6-4779211fdfd9@mind.be>
 <20180530224134.0b87b6ad@windsurf.home>
 <cd9bc020-7228-60f5-187e-70c9c4274c37@st.com>
Message-ID: <1361d61a-fa1b-f887-be88-136c5dfbcb27@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-05-18 10:34, Christophe PRIOUZEAU wrote:
> Hello Thomas,
> ? I'm ok to provide the patches.
> 
> ? For the warning, can you point to me an example or a documentation
> to write a "conditional warning" on Kconfig.

comment "Unpatched Linux will not boot with binutils >= 2.29"
	depends on BR2_ARM_INSTRUCTIONS_THUMB2
	depends on BR2_BINUTILS_VERSION_2_29_X || BR2_BINUTILS_VERSION_2_30_X

 Although, that would only show the warning for internal toolchains. So we
should probably introduce a BR2_TOOLCHAIN_HAS_BINUTILS_FIXED_BUG_21458 that is
selected by internal and external toolchains which have that "fix". Custom
external toolchains unfortunately still don't have that option...

 Also I'm not sure about the THUMB2 condition - is the kernel automatically
built as thumb when we select THUMB2 on a Cortex-A? I think not, actually... So
maybe it should be BR2_ARM_CPU_ARMV7M then.

 Regards,
 Arnout

> 
> Regards
> Christophe
> ?
> 
> On 05/30/2018 10:41 PM, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Wed, 30 May 2018 22:35:50 +0200, Arnout Vandecappelle wrote:
>>
>>>  How about:
>>>
>>> 1. Applying http://patchwork.ozlabs.org/patch/898748/, so the default is still
>>> 2.28, but the user can choose another version.
>>> 2. Reverting these two patches (no longer needed).
>>> 3. Add a conditional warning to linux/Config.in that an unpatched kernel will
>>> fail to boot.
>>> 4. Eventually, add the patch that fixes the kernel to the stm32* defconfigs.
>> Sounds like a good plan to me.
>>
>> Christophe, do you think you can provide the patches implementing this ?
>>
>> Best regards,
>>
>> Thomas
> 
> 
> -- 
> 
> Best regards / Cordialement,
> 
> 
> Christophe Priouzeau | TINA: 166 7320 | Tel: +33 244027320
> 
> STMicroelectronics 
> ST oneline: www.st.com <http://www.st.com> 
> 
> ?
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
