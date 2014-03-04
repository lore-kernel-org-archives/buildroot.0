From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 4 Mar 2014 11:00:14 +0100
Subject: [Buildroot] Linux won't build any more?
In-Reply-To: <5315A35B.30204@barkynet.com>
References: <531584D4.3060301@freescale.com> <20140304090918.5eef0cd5@skate>
 <5315A35B.30204@barkynet.com>
Message-ID: <CAHkwnC-yZKhj7ux9SOTYKjd1y71nhV1o18MjvG26rurMTNk0yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 4, 2014 at 10:56 AM, Martin Bark <martin@barkynet.com> wrote:
> Thomas,
>
>
> On 04/03/14 08:09, Thomas Petazzoni wrote:
>>
>> Dear Vincent Stehl?,
>>
>> On Tue, 4 Mar 2014 08:46:28 +0100, Vincent Stehl? wrote:
>>
>>> FYI I wonder if the recent commits on the master branch have not broken
>>> linux kernel build in some cases. For example:
>>>
>>>     $ make freescale_imx6sabresd_defconfig
>>>     $ make
>>>     linux/linux.mk:171: *** Configuration file
>>> '/arch/arm/configs/imx6_defconfig' not found..  Stop.
>>>
>>> Same with qemu_arm_vexpress_defconfig.
>>>
>>> Git bisect points at commit b4cacbf5b15db06132b5f401d39b4c8d4e79158e,
>>> "linux: check the configuration file exists". If I revert this commit
>>> build will indeed still complain about the config but will go further.
>>
>>
>> Thanks for the report. Do you still see this problem with the current
>> Git head, including commits
>>
>> http://git.buildroot.net/buildroot/commit/?id=477c28cf1d637b224b819dd278103a05fb6f9dbb
>> and
>>
>> http://git.buildroot.net/buildroot/commit/?id=4ad1ea59a59f951fad072dcb19429e6f468abf05
>> ?
>>
>> If you still see it, then I believe I'll just revert Yann's patches,
>> they have caused too much troubles already.
>>
>> Again, thanks for your report!
>>
>> Thomas
>>
>
> I see this issue still, those two commit did not fix it.  I noticed the
> issue using raspberrypi_defconfig
>
>         $ make raspberrypi_defconfig
>         $ make
>         linux/linux.mk:171: *** Configuration file
> '/arch/arm/configs/bcmrpi_quick_defconfig' not found.. Stop.

I confirm this issue:

$ git describe
2014.02-214-gce3044e

$ cat defconfig
BR2_x86_i686=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="i386"

make
linux/linux.mk:171: *** Configuration file
'/arch/x86/configs/i386_defconfig' not found..  Stop.

Regards
-- 
Fabio Porcedda
