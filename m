From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Feb 2014 14:44:27 +0100
Subject: [Buildroot] [PATCH v7 3/4] systemd: bump to v207.
In-Reply-To: <20140210132657.GC22843@pc-eric>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-4-git-send-email-eric.le.bihan.dev@free.fr>
 <CAHXCMM+rLYDjzBcixCHhXeu0A3jFMBxEEsGRaD-0D2KnLe8GyA@mail.gmail.com>
 <20140210132657.GC22843@pc-eric>
Message-ID: <CAHXCMM+g-jsmYA6JVpiqVfb+FMwsT6WL96xpikX=xCrtkS7g9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,

On Mon, Feb 10, 2014 at 2:26 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> Samuel, all,
>
> On Fri, Feb 07, 2014 at 11:00:00PM +0100, Samuel Martin wrote:
>> > +         Systemd requires a Linux kernel >= 3.0, with inotify, devtmpfs,
>> > +         tmpfs vfs and tmpfs POSIX ACL enabled.
>>
>> Linux >= 3.0, really? IIRC systemd requires devtmpfs (available for a long
>> time), and cgroup which has been available since linux-2.6.36 (though the
>> patch to make them available on older kernel is easy to backport on older
>> kernel).
> I set the restriction to "Linux >= 3.0" as it is the one mentioned in the
> README file of systemd. Linux 3.0 introduced the cgroup.procs file, needed by
> systemd v207.
>
> What should the help menu contain? Should it be only the minimum version
> required with its reason, or the full list of features needed?
>
> The README file contains a list of the kernel configuration options that are
> needed to run systemd:
>
> - CONFIG_DEVTMPFS
> - CONFIG_CGROUPS
> - CONFIG_INOTIFY_USER
> - CONFIG_SIGNALFD
> - CONFIG_TIMERFD
> - CONFIG_EPOLL
> - CONFIG_NET
> - CONFIG_SYSFS
> - CONFIG_PROC_FS
> - CONFIG_FHANDLE
>
> Others are strongly recommended:
>
>  - CONFIG_IPV6
>  - CONFIG_AUTOFS4_FS
>  - CONFIG_TMPFS_POSIX_ACL
>  - CONFIG_TMPFS_XATTR
>  - CONFIG_SECCOMP
>
> The LINUX_CONFIGURE_CMDS in linux/linux.mk forces some kernel options for some
> packages. Should I add all the ones previously listed for systemd?
>
> I'm in favor of setting the help text to:
>
>   Systemd requires a Linux kernel >= 3.0.

Anyway, Buildroot only offers linux >=3.12, and 3.0 is old enough to
keep it like this. ;)

>
>   The following features will be enabled in the Linux kernel:
>   devtmpfs, cgroups, [...]
>
> So the end user is informed and will have a working configuration out of the
> box.

Indeed, you can look at the help message for lttng-modules for example
(having the actual symbol name may be good imho).
BTW, to be consistent, imho, we should automatically enable all the
mandatory kernel options (like Buildroot already does for a couple of
them).

>
>> > diff --git a/system/Config.in b/system/Config.in
>> > index 34726b0..30d8efe 100644
>> > --- a/system/Config.in
>> > +++ b/system/Config.in
>> > @@ -87,20 +87,19 @@ config BR2_INIT_SYSV
>> >
>> >  config BR2_INIT_SYSTEMD
>> >         bool "systemd"
>> > +       depends on !BR2_avr32 # no epoll_create1
>> > +       depends on BR2_TOOLCHAIN_USES_GLIBC
>> >         depends on BR2_LARGEFILE
>> >         depends on BR2_USE_WCHAR
>> >         depends on BR2_INET_IPV6
>> > -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>> >         depends on BR2_TOOLCHAIN_HAS_THREADS
>> > +       depends on BR2_TOOLCHAIN_HAS_SSP
>> >         depends on BR2_USE_MMU
>> > -       select BR2_PACKAGE_DBUS
>> > +       depends on !BR2_PREFER_STATIC_LIB
>> >         select BR2_PACKAGE_SYSTEMD
>>
>> How does this play with kconfig?
>> Does not kconfig complain about some circular dependencies here, because
>> you have BR2_INIT_SYSTEMD selecting BR2_PACAKGE_SYSTEMD, while
>> BR2_PACKAGE_SYSTEMD depends on BR2_INIT_SYSTEMD?
> I do not get any error from kconfig. I used the same trick to hide the
> systemv package when 'SysV' is not chosen as init system. I do not know if it
> is a bug or a feature of kconfig :)

If no bug is trigger, it's nice; otherwise... we'll report it to the
kconfig maintainer :P

Regards,

-- 
Samuel
