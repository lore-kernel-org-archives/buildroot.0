From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 May 2018 22:35:50 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <20180530174257.616403f2@windsurf.home>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
 <98410cef-37c3-0450-9142-e1df5df34eaa@st.com>
 <20180530174257.616403f2@windsurf.home>
Message-ID: <a478a326-805a-0b80-2df6-4779211fdfd9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-05-18 17:42, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 30 May 2018 15:24:19 +0000, Christophe PRIOUZEAU wrote:
> 
>>   I know that my patches are not a durable solution.
>>   My concern are to have a solution for stm32  and not keep
>> this state on which stm32 board doesn't boot.
> 
> Hence my proposal to generalize your change so that it covers all
> Cortex-M platforms and not just the STM32 defconfigs.
> 
> Your solution is not even generic enough for STM32: it only makes the
> STM32 defconfigs work. But if:
> 
>  - Someone uses the defconfig and changes the binutils version to 2.29,
>    it won't work anymore.
> 
>  - Someone creates his own defconfig for another custom STM32 platform
>    and uses binutils 2.29, it won't work.
> 
> So I repeat that the change of the defconfigs is the bad solution. If
> binutils 2.29 really doesn't work for Cortex-M platforms, the fix is to
> change the binutils package to exclude 2.29+ from being selected on
> Cortex-M platforms.

 Since we can assume that broken packages will eventually get patched (or that
we can patch them ourselves in Buildroot), the problem is just with the kernel,
right? But the kernel may also have been patched. I really don't feel
comfortable to make it impossible for the user to build the toolchain he wants
when there is in fact no need to impose that limitation...

 How about:

1. Applying http://patchwork.ozlabs.org/patch/898748/, so the default is still
2.28, but the user can choose another version.
2. Reverting these two patches (no longer needed).
3. Add a conditional warning to linux/Config.in that an unpatched kernel will
fail to boot.
4. Eventually, add the patch that fixes the kernel to the stm32* defconfigs.


 Regards,
 Arnout

>>   For the long term solution, I have seen a patch on the kernel
>> to correct the issue around 'adr pseudo instruction'.
>> Patch: https://patchwork.kernel.org/patch/10072631/
>> "arm: ensure symbol is a thumb symbol in new binutils".
>> This patch are not merged on the kernel, I have tested it on top
>> of kernel 4.11(buildroot config) and kernel 4.17-rc5, the patch
>> work correctly, we are able to perform a  complete boot.
>> I need to continue my test to see if this patch is sufficient.
> 
> Thanks for working on this upstream with the kernel people.
> 
> However, we'll of course still have the "gap" that any kernel before
> the one having your fix will be broken with binutils 2.29+. I don't
> think there anything we can do about this though.
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
