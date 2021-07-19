From: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 19 Jul 2021 09:53:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libteam: new package
In-Reply-To: <20210717170411.GW12203@scaer>
References: <20210715083433.865943-1-troglobit@gmail.com>
 <20210715083433.865943-2-troglobit@gmail.com> <20210717170411.GW12203@scaer>
Message-ID: <87o8ayviwg.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Yann!

On Sat, Jul 17, 2021 at 19:04, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2021-07-15 10:34 +0200, Joachim Wiberg spake thusly:
>> [snip]
>> Team devices require the following kernel config, the most common modes
>> have been included to be enabled when this package is selected:
>>     CONFIG_NET_TEAM=y
> This also needs NETDEVICES and NET_CORE. Arguably, those two will most
> probably be selected, but still...

Ah, thanks or course!

>>     CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=y
>>     CONFIG_NET_TEAM_MODE_LOADBALANCE=y
> Is it really necessary to select those last two?

I think least one mode should be enabled, but then I'm just focusing
too much on my particular use-case (active-backup).

> Load-balancing requires BPF, too, to load the BPF function that will do
> the port selection.

True, so that one goes without saying.

> But I would really just leave it up to the user to enable whatever mode
> they need/want; just enforce CONFIG_NET_TEAM=y (and NETDEVICES and
> NET_CORE, of course).

Hmm, OK you're right.  We shouldn't guess what the user needs and this
being an advanced component make that pretty clear.  Thank you!

>> [snop]
>> +++ b/package/libteam/Config.in
>> @@ -0,0 +1,26 @@
>> +config BR2_PACKAGE_LIBTEAM
>> +	bool "libteam"
>> +	depends on BR2_USE_MMU # fork()
>> +	select BR2_PACKAGE_JANSSON
>> +	select BR2_PACKAGE_LIBDAEMON
>> +	select BR2_PACKAGE_LIBNL
>> +	select BR2_PACKAGE_LIBNL_TOOLS
> As noted by Yegor previopusly, you need to propagate the dependencies of
> the packags you select;
>     depends on BR2_TOOLCHAIN_HAS_THREADS  # libnl
>     depends on !BR2_STATIC_LIBS  # libnl-tools
>     select BR2_PACKAGE_LIBNL
>     select BR2_PACKAGE_LIBNL_TOOLS

Ahaa, now I'm finally starting to understand! :)

>> +comment "libnl tools needs a toolchain w/ dynamic library"
> This is not libnl, but libteam (the comment is about this package).

Got it, that makes much more sense.  I really didn't get it
the first time around.  Sorry for the mess.

>> +	depends on BR2_STATIC_LIBS
> The comment should also depend on MMU, so that it is not visible when
> MMU is not enabled.

OK, fixing.

>> +comment "libnl needs a toolchain w/ threads"
>> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> Ditto, this is libteam, and it should also depend on MMU.

Just read through a ton of other Config.in's, and I think I've got
it now how depe?dencies and the user-friendly comment helper work.

>> [snip]
>> +LIBTEAM_VERSION = 1.31
>> +LIBTEAM_SITE = $(call github,jpirko,libteam,v$(LIBTEAM_VERSION))
>> +LIBTEAM_AUTORECONF = YES
>> +LIBTEAM_LICENSE = LGPL-2.1+
>> +LIBTEAM_LICENSE_FILES = COPYING
>> +LIBTEAM_INSTALL_STAGING = YES
>> +LIBTEAM_DEPENDENCIES = host-pkgconf jansson libdaemon libnl
> Pet-peeve of mine, about the ordering:
> This is enforced nowhere, is decribed nowhere, but it follows quite a
> logical ordering and grouping:

Thank you for taking the time to explain, it does indeed make sense,
I will fix that too in v3.

Cheers
 /Joachim
