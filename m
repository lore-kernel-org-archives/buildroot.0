From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 19:07:33 +0100
Subject: [Buildroot] [PATCH v2 08/17] uclibc: context functions are not
 Thumb-compatible
In-Reply-To: <56ED7C39.6010104@mind.be>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <56ED7C39.6010104@mind.be>
Message-ID: <20160319190733.7d7c0535@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 17:20:09 +0100, Arnout Vandecappelle wrote:
> On 03/18/16 22:08, Thomas Petazzoni wrote:
> > On Thumb1 platforms and Thumb2 platforms that support the ARM
> 
>   This sentence is a bit weird, unless you realise that we don't have any thumb1 
> platforms that don't have ARM instructions.

Right.

>   It may be useful to note that this will break packages that rely on the 
> context functions, so that these packages must be disabled for that architecture 
> combination.

Correct, but we already have such a case with musl, which doesn't
implement the context functions.

>   BTW, for that reason, it may be better to create a Kconfig blind option to 
> encode this situation.

I think we need to see how many packages use such functions. Probably
not many.

> uclibc: context functions are not Thumb-compatible
> 
> On platforms that do support the ARM instruction set, there is no problem, as 
> the context functions are built unconditionally in ARM mode.
> 
> However, on platforms that only support the Thumb instruction set, the context 
> functions cannot be built since the assembler code is not Thumb-ready. 
> Therefore, these functions must be disabled. All Thumb1 platforms support ARM 
> instructions, so this is only relevant for Thumb2 platforms (i.e., Cortex-M).

I would do: "only relevant for Thumb2-only platforms". Cortex-A is a
Thumb2 platform, but does not have any problem as it also supports the
ARM instruction set.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
