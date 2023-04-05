Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251EAC76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A254380DAD;
	Wed,  5 Apr 2023 20:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A254380DAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dK8cx_r8gzPY; Wed,  5 Apr 2023 20:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1807580EC3;
	Wed,  5 Apr 2023 20:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1807580EC3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B58DB1BF34C
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A63760F3A
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A63760F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0B9mYAMMKjd for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:08:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4871B60F17
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4871B60F17
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:08:35 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9341434fe3cso80461866b.1
 for <buildroot@buildroot.org>; Wed, 05 Apr 2023 13:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680725313;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5eiY+IeIScySAp82/8dPbPFw68/uDXW5iF9JiXyDJ8Q=;
 b=10tjm+/OqZ1YENErLcsi+J4KSLUXeHdhHKiNyEjEcWrCjRoeulqs0qLyIAdmGyMtGW
 nuGwMOfV4HsffZz27GLjqZmbuQn6/AV12bXjZ4XJ2cKfHj5rz2nsi7lm6P242xjrmQj1
 4uQ0njl+ajyqy+ek5Jg1BFEAQcOcxMuwaUQxTTFW5vJS4MQzGDwTh/0pKMWapz2Nd496
 QIiQqVUFCot8EFehgbD1V8N35hpZnLoVvq6Ptv+aU5sHij+nwVIkfbMCXuNu9EMbiiml
 HkSuL1W3acyZ4XuA4VkuAbwNB8UHMyx6yM6HJlV9ltn6cwj6gbxBFHwqprRw7KvfpRu6
 IQZA==
X-Gm-Message-State: AAQBX9dYabqXQHVWZQ2n5TYa1JGdHzkBP9n5hhvv4rHot2QnCIW1XWMX
 /EglpoyWGkrILmGtFke2Jl90yA==
X-Google-Smtp-Source: AKy350YsyiI1ITIlblv3g5xvMB7OWltMLHP1d8DHgjXPpffWpfnCV5tVfbkPSqplr9rTRT/qFYZzgQ==
X-Received: by 2002:a05:6402:4e:b0:500:58d8:b339 with SMTP id
 f14-20020a056402004e00b0050058d8b339mr3098182edu.20.1680725313107; 
 Wed, 05 Apr 2023 13:08:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cq5-20020a056402220500b005023ddb37eesm7629251edb.8.2023.04.05.13.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 13:08:32 -0700 (PDT)
Message-ID: <52ab86d4-8008-9044-47e4-628c3da5ef7b@mind.be>
Date: Wed, 5 Apr 2023 22:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
References: <20230201204848.2099336-1-laurent@vivier.eu>
 <20230201204848.2099336-2-laurent@vivier.eu>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230201204848.2099336-2-laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1680725313;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5eiY+IeIScySAp82/8dPbPFw68/uDXW5iF9JiXyDJ8Q=;
 b=MuZa+6tzizU4c0ArX4yPkbBnhSD6CJPgjq28DKo2DnLhHq0/ouVyuQXMEFOsIpvqBk
 TpACsikR3ac/ZfNObpxdDJS/OFnN2wiAhOkFDq8BR+XUCDpRd3z1/lHeofXQnuX6vWXl
 z62I7OZwvfa+9RDQ2laAmB8CkRYLWCZEZ2qA44BVEnjBQ8uN9cdEAbz3wJFMmqA0YKJq
 xM7Gwgt47y6vHNpvUfwHYmEMh+h4XXC/ZPQPdcc6vSRe2OB9u7+0DET7tIPBb8NhDU7s
 s/3/kUFzh8wJId05cTqCGNaYen40ixcYhs3PPdaipPCnG2cUZ6MyfNOmMxLer1TL2Rqn
 TnHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MuZa+6tz
Subject: Re: [Buildroot] [PATCH v10 1/3] package: add petitboot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/02/2023 21:48, Laurent Vivier wrote:
> from https://github.com/glevand/petitboot--buildroot
> 
> Updated to work with m68k architecture rather than PlayStation3
> (focused on qemu-system-m68k virt machine)
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Thomas Huth <huth@tuxfamily.org>

  Partially applied to master, thanks, with a large number of modifications. See 
below. Note that it mixes changes that I did with requests for future changes, 
so please pay attention...

> ---
>   DEVELOPERS                                   |  3 +
>   package/Config.in                            |  1 +
>   package/kexec/Config.in                      |  2 +-
>   package/petitboot/63-md-raid-arrays.rules    | 41 +++++++++++
>   package/petitboot/65-md-incremental.rules    | 69 ++++++++++++++++++
>   package/petitboot/66-add-sg-module.rules     |  2 +

  There's really way too much stuff here to easily review. Therefore, I applied 
the minimum, basic petitboot package and removed all the additional files. They 
can be added in later commits.

  I do have a few comments on these files though!

>   package/petitboot/Config.in                  | 23 ++++++
>   package/petitboot/S14silence-console         |  9 +++
>   package/petitboot/S15pb-discover             | 38 ++++++++++
>   package/petitboot/fs-overlay/etc/inittab     | 34 +++++++++
>   package/petitboot/fs-overlay/etc/locale      |  1 +
>   package/petitboot/fs-overlay/init            |  8 ++

  These files are not even used, at least not in this commit (I didn't look at 
the subsequent two).

>   package/petitboot/kexec-restart              |  8 ++
>   package/petitboot/petitboot-console-ui.rules |  6 ++

  Why is this one not numbered, unlike the other two?

>   package/petitboot/petitboot.hash             |  2 +
>   package/petitboot/petitboot.mk               | 77 ++++++++++++++++++++
>   package/petitboot/removable-event-poll.rules |  4 +
>   package/petitboot/shell_config               | 19 +++++
>   package/petitboot/shell_profile              |  2 +

[snip]
> diff --git a/package/kexec/Config.in b/package/kexec/Config.in
> index 90a7bc2672bd..092a80b171fc 100644
> --- a/package/kexec/Config.in
> +++ b/package/kexec/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_KEXEC
>   	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
>   		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
>   		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> -		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x
> +		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || BR2_m68k

  This is unrelated to the introduction of petitboot and should have been in a 
separate commit.

>   	help
>   	  Kexec is a user space utility for loading another kernel
>   	  and asking the currently running kernel to do something with
> diff --git a/package/petitboot/63-md-raid-arrays.rules b/package/petitboot/63-md-raid-arrays.rules
> new file mode 100644
> index 000000000000..92aec36e69d4
> --- /dev/null
> +++ b/package/petitboot/63-md-raid-arrays.rules
> @@ -0,0 +1,41 @@
> +# do not edit this file, it will be overwritten on update

  This comment is not super useful.

  Where does this file come from? Did you produce it yourself? If yes, please 
add an Author line - cfr. e.g. package/tvheadend/S99tvheadend. If you took it 
from somewhere else (possibly modified), please add an Original Author line (and 
check its license) - cfr. e.g. package/transmission/S92transmission.

  Can you also explain why this rules set is needed to begin with? It looks like 
generic distro stuff, not something that should be needed by petitboot at all. 
Same for the other rules files.

> +
> +SUBSYSTEM!="block", GOTO="md_end"
> +
> +# handle md arrays
> +ACTION!="add|change", GOTO="md_end"
> +KERNEL!="md*", GOTO="md_end"
> +
> +# partitions have no md/{array_state,metadata_version}, but should not
> +# for that reason be ignored.
> +ENV{DEVTYPE}=="partition", GOTO="md_ignore_state"
> +
> +# container devices have a metadata version of e.g. 'external:ddf' and
> +# never leave state 'inactive'
> +ATTR{md/metadata_version}=="external:[A-Za-z]*", ATTR{md/array_state}=="inactive", GOTO="md_ignore_state"
> +TEST!="md/array_state", ENV{SYSTEMD_READY}="0", GOTO="md_end"

  AFAIU, petitboot is (at least currently) tied to traditional sysvinit, so this 
line looks weird...

[snip]
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> new file mode 100644
> index 000000000000..d87f9d2450a0
> --- /dev/null
> +++ b/package/petitboot/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_PETITBOOT
> +	bool "petitboot"
> +	# petitboot needs udev /dev management

  This comment doesn't add anything, the line below already says it.

> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_ELFUTILS

  Elfutils has a bunch of dependencies that need to be propagated here.

> +	select BR2_PACKAGE_LVM2

  lvm2 has an additional dependency on MMU.

> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_NCURSES_TARGET_PANEL
> +	select BR2_PACKAGE_NCURSES_TARGET_FORM
> +	select BR2_PACKAGE_NCURSES_TARGET_MENU

  These three options were removed six years ago, in commit 
0c5946acc24a36f9dff079edd054d948c69434f6. I guess you've been carrying around 
this patch for a very, very long time already? :-)

> +	# run-time dependency only
> +	select BR2_PACKAGE_KEXEC_LITE if !BR2_PACKAGE_KEXEC

  Architecture dependencies need to be propagated here. I added a separate 
commit that introduces _ARCH_DEPENDS options for these two packages to simplify 
the dependencies.

  However, kexec-lite is for PPC only, so the line above is not going to work at 
all for any other architecture. Solutions are possible with auxiliary symbols 
that select kexec on non-PPC platforms, but to simplify things, I just swapped 
the two, i.e.

	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE

> +	# run-time dependency only
> +	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
> +	# run-time dependency only
> +	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
> +	help
> +	  Petitboot is a small kexec-based bootloader

  It would be useful to extend the help text with some explanation how to use 
it, or refer to a package/petitboot/README.md that does that.

> +
> +	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
> +
> +comment "petitboot requires udev to be enabled"

  Although we do have this formulation for e.g. usbmount, the vast majority uses 
"... needs udev /dev management".

> +	depends on !BR2_PACKAGE_HAS_UDEV
> diff --git a/package/petitboot/S14silence-console b/package/petitboot/S14silence-console
> new file mode 100755
> index 000000000000..2ce6b39f427b
> --- /dev/null
> +++ b/package/petitboot/S14silence-console
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +case "$1" in
> +    start)
> +        echo 1 1 1 1 > /proc/sys/kernel/printk

  This also looks weird... Normally you'd just set  CONSOLE_LOGLEVEL_DEFAULT=1 
in the kernel config if you want that, or set "loglevel=1" on the kernel 
commandline.

  Also, is it really what we want? IIRC 1 is emergency. I think 4 (warning) 
would be plenty.

  Also, is this relevant at all for petitboot? I would say this is something 
that is fully under control of the developer and has nothing to do with what 
packages or bootloader you select.

  And finally, shell scripts should use tab for indentation. check-package 
nowadays checks for that.

> +        ;;
> +esac
> +
> +exit 0
> diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
> new file mode 100755
> index 000000000000..9d9ec57de3f0
> --- /dev/null
> +++ b/package/petitboot/S15pb-discover
> @@ -0,0 +1,38 @@
> +#!/bin/sh
> +
> +LOGFILE=/var/log/petitboot/pb-discover.log

  There's no reason to put this in a subdirectory I think.

> +PIDFILE=/var/run/petitboot.pid

  Please use the init script pattern that we normally use. It's not really 
documented, but take package/rsyslog/S01rsyslogd as an example.

> +
> +PATH=/usr/bin:/usr/sbin:/bin:/sbin
> +export PATH
> +
> +verbose=
> +if pb-config debug | grep -q enabled
> +then
> +	verbose=-v
> +fi
> +
> +case "$1" in
> +    start)
> +        ulimit -c unlimited
> +        mkdir -p -m 0775 $(dirname $LOGFILE)
> +        mkdir -p -m 0775 /var/petitboot
> +        # Set permissions for normal users
> +        chown -R root:petitgroup $(dirname $LOGFILE)
> +        chown -R root:petitgroup /var/petitboot

  I guess the idea is that petitboot tools run as "petitboot" user? You should 
then create that user and group with a PETITBOOT_USERS definition in the .mk file.

> +
> +        export $(cat /etc/locale)
> +        pb-discover -l $LOGFILE $verbose &

  ... but it's not actually running as the petitboot user... Please use 
start-stop-daemon to start it in the background, create the pidfile, set the 
user, etc.

  Also please use the full path (i.e. /usr/sbin/pb-discover).

> +        echo $! > $PIDFILE
> +        ;;
> +    stop)
> +        pid=$(cat $PIDFILE)
> +        [ -n "$pid" ] && kill -TERM $pid

  Same here, use start-stop-daemon to stop it.

> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop}"
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/package/petitboot/fs-overlay/etc/inittab b/package/petitboot/fs-overlay/etc/inittab
> new file mode 100644
> index 000000000000..1f503d5d56f7
> --- /dev/null
> +++ b/package/petitboot/fs-overlay/etc/inittab
> @@ -0,0 +1,34 @@
> +# /etc/inittab
> +#
> +# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
> +#
> +# Note: BusyBox init doesn't support runlevels.  The runlevels field is

  Inittab is different between Busybox and SysV init, so it's better if you 
don't need to include a specific inittab.

> +# completely ignored by BusyBox init. If you want runlevels, use
> +# sysvinit.
> +#
> +# Format for each entry: <id>:<runlevels>:<action>:<process>
> +#
> +# id        == tty to run on, or empty for /dev/console
> +# runlevels == ignored
> +# action    == one of sysinit, respawn, askfirst, wait, and once
> +# process   == program to run
> +
> +# Startup the system
> +::sysinit:/bin/mount -t proc proc /proc
> +::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
> +::sysinit:/bin/mkdir -p /dev/pts
> +::sysinit:/bin/mkdir -p /dev/shm
> +::sysinit:/bin/mount -a
> +::sysinit:/bin/hostname -F /etc/hostname
> +# now run any rc scripts
> +::sysinit:/etc/init.d/rcS
> +::sysinit:/sbin/petitboot-nc

  Why can't this be done as /etc/init.d/S80petitboot or something similar?

> +# Stuff to do for the 3-finger salute
> +::ctrlaltdel:/sbin/reboot
> +
> +# Stuff to do before rebooting
> +::shutdown:/etc/init.d/rcK
> +::shutdown:/bin/umount -a -r
> +::shutdown:/sbin/swapoff -a
> +
> +::restart:/usr/sbin/kexec-restart

  What? The restart option is for when you do "kill -QUIT 1". It's supposed to 
re-exec /init. Is that how petitboot does the kexec? Doesn't it use the normal 
shutdown flow?

  Some explanation would be good.

> diff --git a/package/petitboot/fs-overlay/etc/locale b/package/petitboot/fs-overlay/etc/locale
> new file mode 100644
> index 000000000000..655683630776
> --- /dev/null
> +++ b/package/petitboot/fs-overlay/etc/locale
> @@ -0,0 +1 @@
> +LANG=en_US.utf-8

  This is also something that really shouldn't have anything to do with petitboot.

> diff --git a/package/petitboot/fs-overlay/init b/package/petitboot/fs-overlay/init
> new file mode 100755
> index 000000000000..1e56178db162
> --- /dev/null
> +++ b/package/petitboot/fs-overlay/init
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +# devtmpfs does not get automounted for initramfs
> +/bin/mount -t devtmpfs devtmpfs /dev
> +exec 0</dev/console
> +exec 1>/dev/console
> +exec 2>/dev/console
> +exec /sbin/init "$@"

  Why is this needed? Buildroot already adds this to a cpio image.

> +
> diff --git a/package/petitboot/kexec-restart b/package/petitboot/kexec-restart
> new file mode 100755
> index 000000000000..0175e76df4cd
> --- /dev/null
> +++ b/package/petitboot/kexec-restart
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +/usr/sbin/kexec -f -e
> +
> +while :
> +do
> +    sleep 1
> +done
> diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
> new file mode 100644
> index 000000000000..cbf1b7e1d765
> --- /dev/null
> +++ b/package/petitboot/petitboot-console-ui.rules
> @@ -0,0 +1,6 @@
> +
> +# spawn a petitboot UI on common user-visible interface devices
> +SUBSYSTEM=="tty", KERNEL=="ttyGF*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i $name linux"
> +SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i $name linux"
> +SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i $name linux"
> +SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i $name linux"

  We normally handle this with the "GENERIC_SERIAL" line in inittab. It's 
actually going to conflict with that I think.

> diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
> new file mode 100644
> index 000000000000..ccb58eed0e34
> --- /dev/null
> +++ b/package/petitboot/petitboot.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  b42ae4fb2a81e9cf68f727c3f54c6312788c654bd97628ec9ba61b19a68990e6  petitboot-v1.13.tar.gz

  This is missing a hash for the license file.

> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> new file mode 100644
> index 000000000000..f7f54850ee04
> --- /dev/null
> +++ b/package/petitboot/petitboot.mk
> @@ -0,0 +1,77 @@
> +################################################################################
> +#
> +# petitboot
> +#
> +################################################################################
> +
> +PETITBOOT_VERSION = v1.13

  To make release-monitoring and CPE ID working, we need the actual version 
number here, without the v. Therefore, the v is moved to PETITBOOT_SOURCE and 
PETITBOOT_SITE.

> +PETITBOOT_SITE ?= https://github.com/open-power/petitboot/releases/download/$(PETITBOOT_VERSION)

  There's no reason to use ?= here.

> +PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
> +PETITBOOT_LICENSE = GPL-2.0
> +PETITBOOT_LICENSE_FILES = COPYING
> +
> +PETITBOOT_CONF_OPTS += --with-ncurses --without-twin-x11 --without-twin-fbdev \
> +	      --localstatedir=/var \

  Indentation is too high here. I also split the first three options on separate 
lines.

  localstatedir=/var is already set in the overall configure options, so I 
removed that.

> +	      --enable-crypt \

  I reordered those options alphabetially.

  There are a few other options for which I added explicit --disable.

> +	      HOST_PROG_KEXEC=/usr/sbin/kexec \
> +	      HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart \
> +	      $(if $(BR2_PACKAGE_BUSYBOX),--with-tftp=busybox --enable-busybox)

  We also want a --disable-busybox.

  The --with-tftp can just as well always be set to busybox. I added this 
comment to explain:
# HPA and Busybox tftp are supported. Buildroot doesn't have HPA tftp. If
# left to "autodetect" and Busybox is not available, it will error the same
# way as when we just set to busybox. Therefore, always set to busybox.

> +
> +ifdef PETITBOOT_DEBUG

  This variable doesn't exist, so I remove this entire section.

> +PETITBOOT_CONF_OPTS += --enable-debug
> +endif
> +
> +ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
> +PETITBOOT_CONF_OPTS += --with-ncursesw MENU_LIB=-lmenuw FORM_LIB=-lformw

  The MENU_LIB and FORM_LIB are not needed since commit 
0c5946acc24a36f9dff079edd054d948c69434f6. ncursesw is auto-discovered by the 
configure script. We generally like to make things explicit but I don't think 
it's needed here.

  BTW, ncurses is not a strict dependency of petitboot. Still, it's loosing a 
lot of its attraction without ncurses, so I left it as a required dependency.

> +endif
> +
> +define PETITBOOT_POST_INSTALL
> +	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
> +		$(TARGET_DIR)/usr/libexec/petitboot

  We want the target file explicitly, i.e.
		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot

  Same for everything below.

> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/petitboot/boot.d

  That is what the -D option does, so this is redundant.

> +	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/01-create-default-dtb \
> +		$(TARGET_DIR)/etc/petitboot/boot.d/
> +	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
> +		$(TARGET_DIR)/etc/petitboot/boot.d/
> +
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S14silence-console \
> +		$(TARGET_DIR)/etc/init.d/
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
> +		$(TARGET_DIR)/etc/init.d/
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/kexec-restart \
> +		$(TARGET_DIR)/usr/sbin/
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/removable-event-poll.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/63-md-raid-arrays.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/65-md-incremental.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/66-add-sg-module.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/
> +
> +	ln -sf /usr/sbin/pb-udhcpc \
> +		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
> +
> +	mkdir -p $(TARGET_DIR)/home/petituser
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_profile \
> +		$(TARGET_DIR)/home/petituser/.profile
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_config \
> +		$(TARGET_DIR)/home/petituser/.shrc
> +
> +	$(MAKE) -C $(@D)/po DESTDIR=$(TARGET_DIR) install

  This is already done by normal 'make install'.

> +endef
> +
> +define PETITBOOT_POST_INSTALL_DTB
> +	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/30-dtb-updates \
> +		$(TARGET_DIR)/etc/petitboot/boot.d/

  We want the definition of the hook inside of the condition as well.

  In addition, there's a --enable-fdt option corresponding to this, and we need 
to depend on dtc to make sure libfdt is available. I added those, and moved 
everything under the corresponding condition.

> +endef
> +
> +PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
> +
> +ifeq ($(BR2_PACKAGE_DTC),y)
> +PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL_DTB
> +endif
> +
> +$(eval $(autotools-package))
> diff --git a/package/petitboot/removable-event-poll.rules b/package/petitboot/removable-event-poll.rules
> new file mode 100644
> index 000000000000..b736aef6101f
> --- /dev/null
> +++ b/package/petitboot/removable-event-poll.rules
> @@ -0,0 +1,4 @@
> +
> +# petitboot needs notification for media change events on removable devices,
> +# which we only get if we've set the poll_msecs sysfs attribute.
> +ACTION!="remove", ATTR{removable}=="1", ATTR{events_poll_msecs}="2000"

  Now *this* is a useful rules file for petitboot :-)

> diff --git a/package/petitboot/shell_config b/package/petitboot/shell_config
> new file mode 100644
> index 000000000000..59337ff53039
> --- /dev/null
> +++ b/package/petitboot/shell_config
> @@ -0,0 +1,19 @@
> +#!bin/sh
> +
> +reset
> +
> +echo "Exiting petitboot. Type 'exit' to return."
> +echo "You may run 'pb-sos' to gather diagnostic data"
> +
> +if [[ "$(id -u)" != "0" ]]; then
> +	echo "" | sudo -S /bin/true 2&>1 >> /dev/null
> +	if [[ $? = 0 ]]; then
> +		echo "No password set, running as root. You may set a password in the System Configuration screen."
> +		sudo -i
> +		sudo -K
> +		exit
> +	fi
> +	export PS1='$ '
> +else
> +	export PS1='# '
> +fi
> diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
> new file mode 100755
> index 000000000000..40062b423b79
> --- /dev/null
> +++ b/package/petitboot/shell_profile
> @@ -0,0 +1,2 @@
> +export ENV="/home/petituser/.shrc"
> +/usr/libexec/petitboot/pb-console

  I don't understand this... The idea is that when you log in as the petitboot 
user (which isn't even possible because you didn't add that user), then 
pb-console is started. But pb-console is already started on all ttys...


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
