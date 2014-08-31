From: Frank Bergmann <frank@frajasalo.de>
Date: Sun, 31 Aug 2014 18:58:54 +0200
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20140828125217.GA3389@arch.cereza>
References: <20140825063011.07B50101AB1@stock.ovh.net>
 <20140825181614.3f5c22a0@free-electrons.com>
 <20140828125217.GA3389@arch.cereza>
Message-ID: <5403544E.6010506@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28.08.2014 Ezequiel Garcia wrote:
> (Ccing Frank)
>
> On 25 Aug 06:16 PM, Thomas Petazzoni wrote:
>>>       nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/fd30974bf2f976c600717268ce340f73d48dda34/
>>
>> sys-utils/prlimit.o: In function `main':
>> prlimit.c:(.text.startup+0x440): undefined reference to `prlimit64'
>> prlimit.c:(.text.startup+0x5d0): undefined reference to `prlimit64'
>> collect2: error: ld returned 1 exit status
>>
>> Ezequiel, an idea?
>>
>
> This is probably the same missing fallocate64 deal. The function is simply not
> available, yet detected (Frank: please correct me if I'm wrong).
>
> By doing something similar to what we do for e2fsprogs:
>
> +ifeq ($(BR2_nios2),y)
> +UTIL_LINUX_CONF_ENV += ac_cv_func_prlimit=no
> +endif
> +
>
> I can avoid the SYS_prlimit64 usage. However, we then get conflicting types:
>
>    CC       sys-utils/prlimit.o
>    CC       sys-utils/lscpu.o
> sys-utils/prlimit.c:139:12: error: conflicting types for 'prlimit'
> In file included from /home/zeta/buildroot/buildroot-nios2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/sys/resource.h:25:0,
>                   from sys-utils/prlimit.c:28:
> /home/zeta/buildroot/buildroot-nios2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/bits/resource.h:313:12: note: previous declaration of 'prlimit' was here
>
> I wonder if anyone has an idea to disable the prlimit build, and all the
> commands that depend on it.
>
> Notice that we have a similar issue on other packages, but the proposed
> solution's have been too hacky to be accepted:
>
> http://lists.busybox.net/pipermail/buildroot/2014-May/096203.html

I see a new toolchain on the mentor site: 2014.05-47 from August. Maybe
this release fixes some of the issues we have with the current
toolchain. I will make some tests in the next week(s).

Regards,
Frank Bergmann.
