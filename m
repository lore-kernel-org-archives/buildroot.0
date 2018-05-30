From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 17:42:57 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <98410cef-37c3-0450-9142-e1df5df34eaa@st.com>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <20180529233219.0eca0f54@windsurf.home>
 <98410cef-37c3-0450-9142-e1df5df34eaa@st.com>
Message-ID: <20180530174257.616403f2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 May 2018 15:24:19 +0000, Christophe PRIOUZEAU wrote:

>   I know that my patches are not a durable solution.
>   My concern are to have a solution for stm32  and not keep
> this state on which stm32 board doesn't boot.

Hence my proposal to generalize your change so that it covers all
Cortex-M platforms and not just the STM32 defconfigs.

Your solution is not even generic enough for STM32: it only makes the
STM32 defconfigs work. But if:

 - Someone uses the defconfig and changes the binutils version to 2.29,
   it won't work anymore.

 - Someone creates his own defconfig for another custom STM32 platform
   and uses binutils 2.29, it won't work.

So I repeat that the change of the defconfigs is the bad solution. If
binutils 2.29 really doesn't work for Cortex-M platforms, the fix is to
change the binutils package to exclude 2.29+ from being selected on
Cortex-M platforms.

>   For the long term solution, I have seen a patch on the kernel
> to correct the issue around 'adr pseudo instruction'.
> Patch: https://patchwork.kernel.org/patch/10072631/
> "arm: ensure symbol is a thumb symbol in new binutils".
> This patch are not merged on the kernel, I have tested it on top
> of kernel 4.11(buildroot config) and kernel 4.17-rc5, the patch
> work correctly, we are able to perform a  complete boot.
> I need to continue my test to see if this patch is sufficient.

Thanks for working on this upstream with the kernel people.

However, we'll of course still have the "gap" that any kernel before
the one having your fix will be broken with binutils 2.29+. I don't
think there anything we can do about this though.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
