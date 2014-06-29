From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 29 Jun 2014 10:13:28 +0200
Subject: [Buildroot] [PATCH 0 of 5 RFC] uclibc/busybox: fix handling of
 configuration file
In-Reply-To: <CAAXf6LXoqTxwUj1VgqBrv=TWQ2vZ1gbm3wiCsqM8gfeyxxJ77Q@mail.gmail.com>
References: <patchbomb.1403444739@localhost> <53AA66F5.3090706@mind.be>
 <CAAXf6LXoqTxwUj1VgqBrv=TWQ2vZ1gbm3wiCsqM8gfeyxxJ77Q@mail.gmail.com>
Message-ID: <CAAXf6LVC9vDUTiCmL0wGt4eHkeQYRO1CihoPJUx8eOzpf9keJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 25, 2014 at 9:24 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Arnout,
>
> On Wed, Jun 25, 2014 at 8:06 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Thomas,
>>
>> On 22/06/14 15:45, Thomas De Schampheleire wrote:
>>>
>>> This patch series reworks the uclibc/busybox config file handling, based on
>>> following requirements:
>>>
>>> - neither foo-menuconfig nor foo-update-config should have a dependency on
>>>   the toolchain (which means we cannot depend on foo-configure)
>>> - 'clean foo-menuconfig' should start from the specified (custom) config
>>>   file
>>> - 'foo-menuconfig foo-update-config' should preserve the changes made in the
>>>   menuconfig step (this problem is reported for uclibc with bug #7154
>>>   (https://bugs.busybox.net/show_bug.cgi?id=7154).
>>
>>  I agree with these requirements. With of course the additional requirement
>> mentioned by ThomasP:
>>
>> - 'make foo-menuconfig; make foo-menuconfig' should preserve the changes made in
>> the menuconfig step.
>
> And additionally:
>
> - 'make clean foo-update-config' should copy the initial file, do any
> fixups, and then save the config
>
>>
>>  However, I think it would be better to add infrastructure for kconfig packages,
>> instead of repeating the work for uclibc, busybox, linux and barebox. I was
>> thinking along the lines of:
>>
>> $(eval $(generic-package))
>>
>> LINUX_KCONFIG_TARGETS = menuconfig xconfig gconfig nconfig
>> LINUX_HAS_DEFCONFIG = YES
>>
>> $(eval $(kconfig-package))
>>
>>
>
> This sounds like a very interesting idea, I'll explore it further in
> the context of this patch series.

I'm working on this now, but I wonder which is the right approach wrt
the organization of the patch series:

- first line up linux, busybox, uclibc in the way they handle the
kconfig stuff, then extract this to a kconfig-package framework
- or first introduce a kconfig-package framework with the 'right'
handling, then convert each of linux, busybox, uclibc in subsequent
patches?

Thanks,
Thomas
