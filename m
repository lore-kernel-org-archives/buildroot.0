From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Jan 2017 10:33:41 +0100
Subject: [Buildroot] [PATCH 1/1] toybox: new package
In-Reply-To: <54DBCBA5.7010307@landley.net>
References: <5422DBCD.10505@landley.net>
 <CA+TH9Vk+5EVM7xFgcjQG8C1qWFmRwb-fNhu=HSzJ2YKwDT9kmw@mail.gmail.com>
 <54DBCBA5.7010307@landley.net>
Message-ID: <CA+TH9Vmveq-bH2x1PnYg5zC=dDgy079N6sSdqe-+Gn2aUab5eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rob,

Sorry for asking you again, but it will be a new toybox patch any time soon?

I would really like to have toybox in buildroot!

Sincerely, Angelo

2015-02-11 22:37 GMT+01:00 Rob Landley <rob@landley.net>:
> Sorry, shortly after I sent that patch toybox got merged into Android
> (and became an optional package in Tizen), and I've been paying
> attention to those:
>
> https://lwn.net/Articles/629362/
> https://wiki.tizen.org/wiki/Toybox
>
> I'm doing a new release this weekend, I can send a buildroot patch
> updated for that version.
>
> Thanks,
>
> Rob
>
> On 02/11/2015 03:24 PM, Angelo Compagnucci wrote:
>> Hello list, Rob,
>>
>> Any news on this patch? It would be really great to have toybox in buildroot!
>>
>> Sincerely, Angelo
>>
>> 2014-09-24 16:57 GMT+02:00 Rob Landley <rob@landley.net>:
>>> From: Rob Landley <rob@landley.net>
>>>
>>> Add toybox.
>>>
>>> For toybox to show up you have to switch on largefile and wchar in uClibc
>>> (or just use musl or glibc). To switch off busybox you have to disable
>>> busybox init in the system settings.
>>>
>>> Signed-off-by: Rob Landley <rob@landley.net>
>>> ---
>>>
>>>  package/Config.in                            |    1
>>>  package/toybox/Config.in                     |   24 ++
>>>  package/toybox/toybox-0001-portability.patch |   14 +
>>>  package/toybox/toybox.config                 |  169 +++++++++++++++++
>>>  package/toybox/toybox.mk                     |   26 ++
>>>  5 files changed, 234 insertions(+)
>>>
>>> This is the same patch as
>>> http://lists.busybox.net/pipermail/buildroot/2014-September/106763.html
>>> with more standard header info.
>>>
>>> --- /dev/null   2014-08-15 22:36:13.247368743 -0500
>>> +++ buildroot/package/toybox/Config.in  2014-09-20 18:07:19.821569067 -0500
>>> @@ -0,0 +1,24 @@
>>> +config BR2_PACKAGE_TOYBOX
>>> +       bool "Toybox"
>>> +       depends on BR2_LARGEFILE && BR2_USE_WCHAR
>>> +       help
>>> +         Toybox combines common Linux command line utilities together into
>>> +         a single executable that's simple, small, fast, and reasonably
>>> +         standards compliant.
>>> +
>>> +         It was started by an ex-maintainer of BusyBox, and uses the same
>>> +         "multicall binary configured at build time via menuconfig" approach,
>>> +         but is a fresh implementation that uses no busybox code.
>>> +
>>> +         Toybox is licensed under a "zero clause" BSD variant which grants
>>> +         the same blanket permissions but removes the requirement to copy
>>> +         specific license text into derivative works, essentially placing
>>> +         its code into the public domain.
>>> +
>>> +config BR2_PACKAGE_TOYBOX_CONFIG
>>> +       string "Toybox configuration file:"
>>> +       default "package/toybox/toybox.config"
>>> +       depends on BR2_PACKAGE_TOYBOX
>>> +       help
>>> +         Specify an alternative config file location enabling a different
>>> +         set of commands in toybox. The default file equals "make defconfig".
>>> --- /dev/null   2014-08-15 22:36:13.247368743 -0500
>>> +++ buildroot/package/toybox/toybox-0001-portability.patch      2014-09-20 18:44:23.813511200 -0500
>>> @@ -0,0 +1,14 @@
>>> +Workaround for uClibc's lack of posix-2008 compliance.
>>> +
>>> +diff -r 74b29c369420 lib/portability.h
>>> +--- a/lib/portability.h
>>> ++++ b/lib/portability.h
>>> +@@ -74,6 +74,8 @@
>>> + #include <unistd.h>
>>> + #include <stdio.h>
>>> + ssize_t getdelim(char **lineptr, size_t *n, int delim, FILE *stream);
>>> ++char *stpcpy(char *dest, const char *src);
>>> ++pid_t getsid(pid_t pid);
>>> +
>>> + // uClibc's last-ever release was in 2012, so of course it doesn't define
>>> + // any flag newer than MS_MOVE, which was added in 2001 (linux 2.5.0.5),
>>> --- /dev/null   2014-08-15 22:36:13.247368743 -0500
>>> +++ buildroot/package/toybox/toybox.config      2014-09-20 18:38:24.897520539 -0500
>>> @@ -0,0 +1,169 @@
>>> +CONFIG_TOYBOX_CONTAINER=y
>>> +CONFIG_TOYBOX_FIFREEZE=y
>>> +CONFIG_TOYBOX_ICONV=y
>>> +CONFIG_TOYBOX_FALLOCATE=y
>>> +
>>> +#
>>> +# Posix commands
>>> +#
>>> +CONFIG_BASENAME=y
>>> +CONFIG_CAL=y
>>> +CONFIG_CAT=y
>>> +CONFIG_CHGRP=y
>>> +CONFIG_CHMOD=y
>>> +CONFIG_CKSUM=y
>>> +CONFIG_CMP=y
>>> +CONFIG_COMM=y
>>> +CONFIG_CP=y
>>> +CONFIG_CP_MORE=y
>>> +CONFIG_CP_MV=y
>>> +CONFIG_CP_MV_MORE=y
>>> +CONFIG_CPIO=y
>>> +CONFIG_CUT=y
>>> +CONFIG_DATE=y
>>> +CONFIG_DF=y
>>> +CONFIG_DF_PEDANTIC=y
>>> +CONFIG_DIRNAME=y
>>> +CONFIG_DU=y
>>> +CONFIG_ECHO=y
>>> +CONFIG_ENV=y
>>> +CONFIG_EXPAND=y
>>> +CONFIG_FALSE=y
>>> +CONFIG_GREP=y
>>> +CONFIG_HEAD=y
>>> +CONFIG_ID=y
>>> +CONFIG_ID_GROUPS=y
>>> +CONFIG_ID_LOGNAME=y
>>> +CONFIG_KILL=y
>>> +CONFIG_KILLALL5=y
>>> +CONFIG_LINK=y
>>> +CONFIG_LN=y
>>> +CONFIG_LS=y
>>> +CONFIG_LS_COLOR=y
>>> +CONFIG_MKDIR=y
>>> +CONFIG_MKFIFO=y
>>> +CONFIG_NICE=y
>>> +CONFIG_NL=y
>>> +CONFIG_NOHUP=y
>>> +CONFIG_OD=y
>>> +CONFIG_PASTE=y
>>> +CONFIG_PATCH=y
>>> +CONFIG_PWD=y
>>> +CONFIG_RENICE=y
>>> +CONFIG_RM=y
>>> +CONFIG_RMDIR=y
>>> +CONFIG_SLEEP=y
>>> +CONFIG_SLEEP_FLOAT=y
>>> +CONFIG_SORT=y
>>> +CONFIG_SORT_BIG=y
>>> +CONFIG_SORT_FLOAT=y
>>> +CONFIG_SPLIT=y
>>> +CONFIG_STRINGS=y
>>> +CONFIG_TAIL=y
>>> +CONFIG_TAIL_SEEK=y
>>> +CONFIG_TEE=y
>>> +CONFIG_TIME=y
>>> +CONFIG_TOUCH=y
>>> +CONFIG_TRUE=y
>>> +CONFIG_TTY=y
>>> +CONFIG_UNAME=y
>>> +CONFIG_UNIQ=y
>>> +CONFIG_UNLINK=y
>>> +CONFIG_UUDECODE=y
>>> +CONFIG_UUENCODE=y
>>> +CONFIG_WC=y
>>> +CONFIG_WHO=y
>>> +CONFIG_XARGS=y
>>> +
>>> +#
>>> +# Other commands
>>> +#
>>> +CONFIG_ACPI=y
>>> +CONFIG_BLKID=y
>>> +CONFIG_BZCAT=y
>>> +CONFIG_CATV=y
>>> +CONFIG_CHROOT=y
>>> +CONFIG_CHVT=y
>>> +CONFIG_CLEAR=y
>>> +CONFIG_COUNT=y
>>> +CONFIG_DOS2UNIX=y
>>> +CONFIG_EJECT=y
>>> +CONFIG_FALLOCATE=y
>>> +CONFIG_FREE=y
>>> +CONFIG_FREERAMDISK=y
>>> +CONFIG_FSFREEZE=y
>>> +CONFIG_HELP=y
>>> +CONFIG_HELP_EXTRAS=y
>>> +CONFIG_IFCONFIG=y
>>> +CONFIG_INSMOD=y
>>> +CONFIG_LOGIN=y
>>> +CONFIG_LOSETUP=y
>>> +CONFIG_LSATTR=y
>>> +CONFIG_CHATTR=y
>>> +CONFIG_LSMOD=y
>>> +CONFIG_LSUSB=y
>>> +CONFIG_MAKEDEVS=y
>>> +CONFIG_MKPASSWD=y
>>> +CONFIG_MKSWAP=y
>>> +CONFIG_MODINFO=y
>>> +CONFIG_MOUNTPOINT=y
>>> +CONFIG_NETCAT=y
>>> +CONFIG_NETCAT_LISTEN=y
>>> +CONFIG_ONEIT=y
>>> +CONFIG_PARTPROBE=y
>>> +CONFIG_PIVOT_ROOT=y
>>> +CONFIG_PMAP=y
>>> +CONFIG_PRINTENV=y
>>> +CONFIG_PWDX=y
>>> +CONFIG_READAHEAD=y
>>> +CONFIG_READLINK=y
>>> +CONFIG_REALPATH=y
>>> +CONFIG_REBOOT=y
>>> +CONFIG_REV=y
>>> +CONFIG_RFKILL=y
>>> +CONFIG_RMMOD=y
>>> +CONFIG_SETSID=y
>>> +CONFIG_STAT=y
>>> +CONFIG_SWAPOFF=y
>>> +CONFIG_SWAPON=y
>>> +CONFIG_SWITCH_ROOT=y
>>> +CONFIG_SYSCTL=y
>>> +CONFIG_TAC=y
>>> +CONFIG_TASKSET=y
>>> +CONFIG_TIMEOUT=y
>>> +CONFIG_TRUNCATE=y
>>> +CONFIG_UNSHARE=y
>>> +CONFIG_UPTIME=y
>>> +CONFIG_USLEEP=y
>>> +CONFIG_VCONFIG=y
>>> +CONFIG_VMSTAT=y
>>> +CONFIG_W=y
>>> +CONFIG_WHICH=y
>>> +CONFIG_YES=y
>>> +
>>> +#
>>> +# Linux Standard Base commands
>>> +#
>>> +CONFIG_DMESG=y
>>> +CONFIG_HOSTNAME=y
>>> +CONFIG_KILLALL=y
>>> +CONFIG_MD5SUM=y
>>> +CONFIG_MD5SUM_SHA1SUM=y
>>> +CONFIG_MKNOD=y
>>> +CONFIG_MKTEMP=y
>>> +CONFIG_PASSWD=y
>>> +CONFIG_PIDOF=y
>>> +CONFIG_SEQ=y
>>> +CONFIG_SU=y
>>> +CONFIG_SYNC=y
>>> +CONFIG_UMOUNT=y
>>> +
>>> +#
>>> +# Toybox global settings
>>> +#
>>> +CONFIG_TOYBOX=y
>>> +CONFIG_TOYBOX_SUID=y
>>> +CONFIG_TOYBOX_FLOAT=y
>>> +CONFIG_TOYBOX_HELP=y
>>> +CONFIG_TOYBOX_HELP_DASHDASH=y
>>> +CONFIG_TOYBOX_I18N=y
>>> --- /dev/null   2014-08-15 22:36:13.247368743 -0500
>>> +++ buildroot/package/toybox/toybox.mk  2014-09-20 18:38:17.509520730 -0500
>>> @@ -0,0 +1,26 @@
>>> +################################################################################
>>> +#
>>> +# toybox
>>> +#
>>> +################################################################################
>>> +
>>> +TOYBOX_VERSION = 0.4.9
>>> +TOYBOX_SITE = http://landley.net/toybox/downloads
>>> +TOYBOX_SOURCE = toybox-$(TOYBOX_VERSION).tar.bz2
>>> +TOYBOX_LICENSE = Public domain, BSD-0c
>>> +TOYBOX_LICENSE_FILES = LICENSE
>>> +
>>> +TOYBOX_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_TOYBOX_CONFIG))
>>> +
>>> +define TOYBOX_BUILD_CMDS
>>> +       $(TARGET_MAKE_ENV) CROSS_COMPILE="$(TARGET_CROSS)" \
>>> +               $(MAKE) -C $(@D)
>>> +endef
>>> +
>>> +define TOYBOX_INSTALL_TARGET_CMDS
>>> +       $(TARGET_MAKE_ENV) PREFIX="$(TARGET_DIR)" \
>>> +               $(MAKE) -C $(@D) install
>>> +endef
>>> +
>>> +
>>> +$(eval $(kconfig-package))
>>> diff --git a/package/Config.in b/package/Config.in
>>> index 73ba86a..742a8c0 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -1,6 +1,7 @@
>>>  menu "Target packages"
>>>
>>>         source "package/busybox/Config.in"
>>> +       source "package/toybox/Config.in"
>>>
>>>  menu "Audio and video applications"
>>>         source "package/alsa-utils/Config.in"
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
