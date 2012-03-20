From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 20 Mar 2012 09:53:32 +0100
Subject: [Buildroot] [PATCH 4/6] Rework of the init system
In-Reply-To: <201203200045.18897.arnout@mind.be>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <a9e780200fae5528ff46ffb3ff5351fc1a57ff84.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200045.18897.arnout@mind.be>
Message-ID: <4F68458C.5070605@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 20/03/2012 00:45, Arnout Vandecappelle a ?crit :
> On Monday 19 March 2012 16:59:38 Maxime Ripard wrote:
>> +choice
>> +       prompt "Init system"
>> +       default BR2_INIT_BUSYBOX
>> +       help
>> +         To select systemd, you first need to have dbus and udev enabled
>  Only udev.  Anyway, the help text of a choice is never shown, so
> this won't work.  I don't know if it's possible to add comments in a
> choice, but that would be the way to go.

Ah. I didn't know that.

>> +
>> +config BR2_INIT_BUSYBOX
>> +       bool "Busybox init"
>> +       select BR2_PACKAGE_BUSYBOX
>> +
>> +config BR2_INIT_SYSV
>> +       bool "Use systemV init"
>> +       select BR2_PACKAGE_SYSVINIT
>> +
>> +config BR2_INIT_SYSTEMD
>> +       bool "Use systemd"
>> +       select BR2_PACKAGE_DBUS
>> +       depends on BR2_PACKAGE_UDEV
>  Would it be an option to make this a select 
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV instead?  (With a depends
> on LARGEFILE and WCHAR, of course.)  Or is that a bad idea?

Well, while the select on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is
indeed a good idea, like you said, we are still to depends on WCHAR and
LARGEFILE support. So from the user point of view, we are still left
without an option, and no way of getting how to select it (and we
definitely don't want to select LARGEFILE and WCHAR)

Peter, do you have an idea about that ?

> 
>> +       select BR2_PACKAGE_SYSTEMD
> 
>  The latter two selects are only possible if 
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected.  The select/depends 
> combination breaks the dependency of BR2_PACKAGE_SYSVINIT and
> BR2_PACKAGE_SYSTEMD on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.  So the
> systemd package will be selected, but it's not visible to the user.
> 
>  Of course, there's nothing strictly wrong with that.  It's just
> a bit strange.
> 
>  Clearly, adding a select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS here is
> a bad idea.  I also don't like much to add a dependency on it
> either.  So instead, I propose to move sysvinit and systemd out
> of the BR2_PACKAGE_BUSYBOX_SHOW_OTHERS condition (in package/Config.in).
> They anyway can't be selected or deselected by the user, since their
> selection is fully determined by the BR2_INIT_* option.

I agree here.
Peter, are you ok with this change ?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
