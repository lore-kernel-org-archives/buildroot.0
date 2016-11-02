From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed, 2 Nov 2016 19:01:24 -0400
Subject: [Buildroot] [PATCH v4 4/4] lttng-babeltrace: add debug info
	support
In-Reply-To: <20161102231023.392100c6@free-electrons.com>
References: <20161102065508.3162-1-eeppeliteloop@gmail.com>
 <20161102065508.3162-5-eeppeliteloop@gmail.com>
 <20161102231023.392100c6@free-electrons.com>
Message-ID: <CAB4xu_3SxjOQ-KV=46wNR0PqO1PmW8XticcqstaW6hJJyUD8cA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 2, 2016 at 6:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed,  2 Nov 2016 02:55:08 -0400, Philippe Proulx wrote:
>
>> diff --git a/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch b/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
>> new file mode 100644
>> index 0000000..b592d7f
>> --- /dev/null
>> +++ b/package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch
>> @@ -0,0 +1,74 @@
>> +From 697ab0905c59561562dc52cd3b925781e07814f3 Mon Sep 17 00:00:00 2001
>> +From: Philippe Proulx <eeppeliteloop@gmail.com>
>> +Date: Wed, 2 Nov 2016 01:40:12 -0400
>> +Subject: [PATCH 1/3] m4/ax_lib_elfutils.m4: add cache variable
>
> Please use git format-patch -N to generate the patches. I've fixed that
> up manually.

I always forget this, sorry.

>
>> +
>
> This patch really needed a better commit log, so I've added some
> details here.
>
> Essentially: an empty commit log for a non-trivial patch is always a
> bug. And I believe this rule is not Buildroot specific.
>
>> +if BR2_PACKAGE_LTTNG_BABELTRACE
>> +
>> +config BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO
>> +     bool
>> +     default y
>> +     depends on !BR2_bfin # elfutils
>> +     depends on !BR2_STATIC_LIBS # elfutils
>> +     depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
>> +     select BR2_PACKAGE_ELFUTILS
>> +
>> +comment "handling debug info in traces needs a glibc or uClibc toolchain w/ dynamic library"
>> +     depends on !BR2_bfin # elfutils
>> +     depends on BR2_STATIC_LIBS \
>> +             || !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
>> +
>> +endif
>
> This stuff is really complicated, so I've instead removed the
> sub-option, and simply made lttng-babeltrace.mk enable debug info
> support when BR2_PACKAGE_ELFUTILS=y.

But then, if BR2_PACKAGE_ELFUTILS=n, you don't know that you could have
debug info support in Babeltrace if BR2_PACKAGE_ELFUTILS=y.

Or maybe it's not the job of menuconfig to tell the available features.

Phil

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
