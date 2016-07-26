From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Jul 2016 11:43:53 +0930
Subject: [Buildroot] [PATCH v2] package/pdbg: new package
In-Reply-To: <20160726000944.3fd80fc1@free-electrons.com>
References: <1469427392-25228-1-git-send-email-joel@jms.id.au>
 <1469429593-28546-1-git-send-email-joel@jms.id.au>
 <20160726000944.3fd80fc1@free-electrons.com>
Message-ID: <CACPK8XcN=fCduHVVkALoRhr5t_=Y=gqPdjkpJvX2-uKE87O2Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 26, 2016 at 7:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 25 Jul 2016 16:23:12 +0930, Joel Stanley wrote:
>
>> diff --git a/package/pdbg/Config.in b/package/pdbg/Config.in
>> new file mode 100644
>> index 000000000000..cf37eb8aca41
>> --- /dev/null
>> +++ b/package/pdbg/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_PDBG
>> +     bool "pdbg"
>> +     depends on BR2_arm
>
> Anything that makes it ARM-specific?

Upstream has only ever tested the code on ARM. It does build for x86
(and power, and anything else I guess), but as you point out below it
is only useful when run from a processor that is attached to a p8
host.

What's the general rule in this circumstance?

>
>> +     help
>> +       PowerPC FSI Debugger, for low level debugging of a PowerPC CPU
>> +       over FSI.
>
> It would have been good to explain somewhere than pdbg runs on the BMC,
> which is generally an ARM-powered system monitoring/controlling a
> number of PowerPC CPUs. Otherwise, it feels odd to have a
> PowerPC-related package available only on the ARM architecture.

Sure, I will add some more text.

>
>> +PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
>> +PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
>> +PDBG_LICENSE = Apache 2.0
>> +PDBG_LICENSE_FILES = COPYING
>> +PDBG_AUTORECONF = YES
>
> Side note (unrelated to Buildroot packaging): had a look at the code,
> and this mapping of /dev/mem to then bing-bang some protocol on GPIOs
> from userspace is really, really nasty :-/

Yep! You and I are the same page here. To date the tool has been used
on a BIOS vendor's BMC firmware, running a very old kernel that lacks
the proper linux APIs for access to hardware. It's not ideal.

I've been slowly upstreaming a from-scratch kernel port. Once we have
that in place pdbg can add support for doing GPIO through the kernel.

In the future near future we will add FSI support in the kernel, and
from there perhaps use the Coldfire processor inside the Aspeed SoC to
offload the bitbanging. Lots of work to do, but we're getting there.

Cheers,

Joel
