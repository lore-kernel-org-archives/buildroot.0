From: Vineet Gupta <vgupta@synopsys.com>
Date: Thu, 7 Jan 2021 21:18:20 -0800
Subject: [Buildroot] ARC no console output (was Re: [PATCH 1/2]
 init/console: Use ttynull as a fallback when there is no console)
In-Reply-To: <X/fWGjYI5LapMdGW@jagdpanzerIV.localdomain>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
 <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com> <X/c/ONCYz2QQdvOP@alley>
 <466644f5-bed7-caef-9fcd-e66208f65545@synopsys.com>
 <X/fWGjYI5LapMdGW@jagdpanzerIV.localdomain>
Message-ID: <d7db7948-4831-8dac-0d16-7933bcd9d995@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/7/21 7:48 PM, Sergey Senozhatsky wrote:
> On (21/01/07 09:58), Vineet Gupta wrote:
>> On 1/7/21 9:04 AM, Petr Mladek wrote:
>>> On Thu 2021-01-07 08:43:16, Vineet Gupta wrote:
>>>> Hi John,
>>>>
>>>> On 1/7/21 1:02 AM, John Ogness wrote:
>>>>> Hi Vineet,
>>>>>
>>>>> On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
>>>>>> This breaks ARC booting (no output on console).
>>>>>
>>>>> Could you provide the kernel boot arguments that you use? This series is
>>>>> partly about addressing users that have used boot arguments that are
>>>>> technically incorrect (even if had worked). Seeing the boot arguments of
>>>>> users that are not experiencing problems may help to reveal some of the
>>>>> unusual console usages until now.
>>>>
>>>>
>>>> Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8
>>>> console=ttyS0,115200n8 debug print-fatal-signals=1
>>>
>>> This is strange, the problematic patch should use ttynull
>>> only as a fallback. It should not be used when a particular console
>>> is defined on the command line.
>>
>> What happens in my case is console_on_rootfs() doesn't find /dev/console and
>> switching to ttynull. /dev is not present because devtmpfs doesn't automount
>> for initramfs.
> 
> I wonder if we'll move the nulltty fallback logic into printk code [1]
> will it fix the problem?
> 
> [1] https://lore.kernel.org/lkml/X6x%2FAxD1qanC6evJ at jagdpanzerIV.localdomain/

Your reasoning in the post above makes total sense.

I tired the patch: adding register_ttynull_console() call in 
console_device(), removing from console_on_rootfs() band that works too.


| Warning: unable to open an initial console. Fallback to ttynull.
| Warning: Failed to add ttynull console. No stdin, stdout, and stderr 
for the init process!
| Freeing unused kernel memory: 3096K
| This architecture does not have kernel memory protection.
| Run /init as init process
| with arguments:
|    /init
|  with environment:
|    HOME=/
|    TERM=linux
| Starting System logger (syslogd)
| Bringing up loopback device
| Starting inetd
| Mounting Posix Mqueue filesys
| 
CONFIG_INITRAMFS_SOURCE="~/arc/RAMFS/archs/ramfs_2011-GNU-2020-03-glibc-2.32-tiny"
| **********************************************************************
|			Welcome to ARCLinux
| **********************************************************************
| [ARCLinux]#
