From: Luca Ellero <luca.ellero@brickedbrain.com>
Date: Thu, 12 May 2016 12:23:52 +0200
Subject: [Buildroot] uClibc debug symbols
In-Reply-To: <20160511233304.2c528c3b@gmx.net>
References: <ddfc826b-9bf7-38c8-a442-bea33bf05621@brickedbrain.com>
 <20160511233304.2c528c3b@gmx.net>
Message-ID: <38268c60-77cb-a127-4d16-35ea58fc5766@brickedbrain.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
thanks for your reply.
See comment at the end.

On 11/05/2016 23:33, Peter Seiderer wrote:
> Hello Luca,
>
> On Wed, 11 May 2016 11:43:12 +0200, Luca Ellero <luca.ellero@brickedbrain.com> wrote:
>
>> Hi everybody,
>> I'm trying to debug uClibc with a debugger, but even if I enable "build
>> packages with debugging symbols" it seems that debug symbols are not
>> present in the final binaries.
>>
>> My .config reports:
>> BR2_ENABLE_DEBUG=y
>> BR2_DEBUG_2=y
>>
>> I'm using binaries in output/staging/lib (is this the correct place to go?)
>>
>> If I do "objdump -h | grep debug" on this libraries I get the following:
>>
>> $ arm-buildroot-linux-uclibcgnueabi-objdump -h ld-uClibc-1.0.12.so |
>> grep debug
>>
>> $ arm-buildroot-linux-uclibcgnueabi-objdump -h libuClibc-1.0.12.so |
>> grep debug
>>    20 .debug_aranges 00000180  00000000  00000000  0004b310  2**3
>>    21 .debug_info   00000c7a  00000000  00000000  0004b490  2**0
>>    22 .debug_abbrev 00000353  00000000  00000000  0004c10a  2**0
>>    23 .debug_line   000008ce  00000000  00000000  0004c45d  2**0
>>    24 .debug_frame  00000124  00000000  00000000  0004cd2c  2**2
>>    25 .debug_str    00000330  00000000  00000000  0004ce50  2**0
>>    26 .debug_loc    0000068c  00000000  00000000  0004d180  2**0
>>    27 .debug_ranges 00000038  00000000  00000000  0004d80c  2**0
>>
>> Could someone please tell me what is wrong with this approach?
>>
>
> For remote debugging this should work, the staging/sysroot libs
> should have all debugging information, the libs on the target are
> stripped until you enable:
>
>   # BR2_STRIP_strip is not set
>   BR2_STRIP_none=y
>
> Worked for me with glibc/xserver etc. for local debugging on the
> target, not tested with uClibc (do not forget to complete rebuild)...
>

I managed to get uClibc with debug symbols using a "dirty hack".

I've added "DODEBUG=y" at the end of file:
~/buildroot-2016.02/package/uclibc/uClibc-ng.config

Anyway I think this is not the right solution.

Doing a "grep BR2_ENABLE_DEBUG" on Buildroot dir I can see that only few 
packages are using BR2_ENABLE_DEBUG.
In particular in "buildroot-2016.02/package/glibc/glibc.mk" (that you 
are referring) there is this code:

ifeq ($(BR2_ENABLE_DEBUG),y)
GLIBC_EXTRA_CFLAGS += -g
endif

But I cannot find anything similar in UClibc.

So my questions are:
- what is the clean way to enable debug symbols on all packages (or at 
least on some of them)?
- what is the purpose of BR2_ENABLE_DEBUG if it doesn't enable debug on 
all packages?


Thanks
Regards
Luca
