From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 12:07:29 +0100
Subject: [Buildroot] [PATCH 04/33] igh-ethercat: disable drivers build
 with kernel 3.6
In-Reply-To: <20121122111257.7cbf0562@skate>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-5-git-send-email-s.martin49@gmail.com>
 <20121122111257.7cbf0562@skate>
Message-ID: <CAHXCMMKftDZ9td5fC7WveH8g0-ozFUi-aja85DfRe7NnK4io3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/22 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Thu, 22 Nov 2012 01:17:54 +0100, Samuel Martin wrote:
>> Since hardware specific support is available for some given kernel
>> releases (mostly for kernel <=3.2), then disable them if kernel 3.6 is
>> enable. However, this still allows the generic driver build.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/igh-ethercat/Config.in | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
>> index 890bb12..4a0fd75 100644
>> --- a/package/igh-ethercat/Config.in
>> +++ b/package/igh-ethercat/Config.in
>> @@ -6,7 +6,12 @@ config BR2_PACKAGE_IGH_ETHERCAT
>>
>>         http://www.etherlab.org/en/ethercat/index.php
>>
>> -if BR2_PACKAGE_IGH_ETHERCAT
>> +if BR2_PACKAGE_IGH_ETHERCAT && !BR2_LINUX_KERNEL_3_6
>> +
>> +comment "The following drivers are only available for some"
>> +comment "releases of the kernel (mostly 2.6.x)."
>> +comment "Further details about the kernel/hardware support at:"
>> +comment "http://www.etherlab.org/en/ethercat/hardware.php"
>
> I'm sorry but I don't quite understand neither the commit log nor the
> comment here. Could you explain a bit more? Is this fixing any sort of
> build problem?
You are right, it's not so clear... so lemme try to rephrase this:

igh-ethercat porvides some drivers for some specific kernel releases.

At configure time, we pass the kernel build directory.

igh-ethercat somehow finds the kernel version, then try to match it
among the available driver sources.

Here is what looks like the source tree:
z$ (cd output/build/igh-ethercat-1.5.1/ ; find devices/e1000e/ | sort
| head -n20)
devices/e1000e/
devices/e1000e/82571-2.6.32-ethercat.c
devices/e1000e/82571-2.6.32-orig.c
devices/e1000e/82571-2.6.33-ethercat.c
devices/e1000e/82571-2.6.33-orig.c
devices/e1000e/82571-2.6.34-ethercat.c
devices/e1000e/82571-2.6.34-orig.c
devices/e1000e/82571-2.6.35-ethercat.c
devices/e1000e/82571-2.6.35-orig.c
devices/e1000e/82571-2.6.37-ethercat.c
devices/e1000e/82571-2.6.37-orig.c
devices/e1000e/defines-2.6.32-ethercat.h
devices/e1000e/defines-2.6.32-orig.h
devices/e1000e/defines-2.6.33-ethercat.h
devices/e1000e/defines-2.6.33-orig.h
devices/e1000e/defines-2.6.34-ethercat.h
devices/e1000e/defines-2.6.34-orig.h
devices/e1000e/defines-2.6.35-ethercat.h
devices/e1000e/defines-2.6.35-orig.h
devices/e1000e/defines-2.6.37-ethercat.h

So whatever is your kernel release, it should match one of the
supported release listed at:
http://www.etherlab.org/en/ethercat/hardware.php

Otherwise, it fails :-/

Hope, it's clearer.
If you have any suggestion about how to rephrase both the help text
and/or the commit message,
please, share them.


Regards,


-- 
Sam
