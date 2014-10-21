From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Oct 2014 23:19:43 +0200
Subject: [Buildroot] [PATCH 6/7 v3] package/petitboot: Add petitboot,
 the userspace bootloader
In-Reply-To: <54447FF4.5080506@ozlabs.org>
References: <1402982507.185942.882894195923.6.gpush@pablo>
 <543A9670.4080604@mind.be> <54447FF4.5080506@ozlabs.org>
Message-ID: <5446CDEF.3050103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/10/14 05:22, Jeremy Kerr wrote:
> Hi Arnout,
> 
[snip]
>>> +	help
>>> +	  Petitboot is a small kexec-based bootloader
>>
>>  We probably want a little more explanation about how you can use petitboot,
>> i.e. make a very small buildroot config with just petitboot and an initramfs
>> filesystem, and use that to boot a full-fledged system which doesn't even need
>> to be buildroot-based.
> 
> You mean just in the help section here?

 Yes, I mean in the help section. Petitboot is pretty special, because it's not
just a package that you install in your buildroot-generated rootfs and that you
use at runtime, but it's also not a bootloader in the buildroot sense. This
should be clarified somewhere, and the help text is probably the best place.


>>> diff --git a/package/petitboot/S14silence-console b/package/petitboot/S14silence-console
>>> new file mode 100755
>>> index 0000000..6570200
>>> --- /dev/null
>>> +++ b/package/petitboot/S14silence-console
>>> @@ -0,0 +1,9 @@
>>> +#!/bin/sh
>>> +
>>> +case "$1" in
>>> +    start)
>>> +        echo 0 0 7 0 > /proc/sys/kernel/printk
>>> +        ;;
>>> +esac
>>
>>  Why is this needed? I mean, we could do this in general in buildroot but do we
>> really want it?
> 
> Since the ncurses-based petitboot UI is brought up on init on local
> serial consoles, we want to suppress kernel printk output, otherwise
> it'll corrupt the ncurses terminal state.

 OK I see. Could you add an explanatory comment?

 But does this work? udev is already started before (S10 in case of eudev, and
systemd starts it almost immediately). So it's possible that the pb-console is
already started before you do this printk. So I think this should be in S07 or
something.

[snip]
>>> diff --git a/package/petitboot/kexec-restart b/package/petitboot/kexec-restart
>>> new file mode 100755
>>> index 0000000..0175e76
>>> --- /dev/null
>>> +++ b/package/petitboot/kexec-restart
>>> @@ -0,0 +1,8 @@
>>> +#!/bin/sh
>>> +
>>> +/usr/sbin/kexec -f -e
>>> +
>>> +while :
>>> +do
>>> +    sleep 1
>>> +done
>>
>>  Can you shed some light about why this script is needed and why it's not part
>> of petitboot itself?
> 
> This script is used as busybox init's "restart" action, and is called by
> init, once all processes have been stopped.
> 
> It needs to be invoked by init, as petitboot is no longer running at
> this point. Because it's specific to buildroot with busybox init, I
> haven't included the script in the petitboot distribution.

 OK. Then its installation should also only be done if the init system is
busybox, and probably you'll need to fixup inittab so the restart action is
actually included.

> 
>>> diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
>>> new file mode 100644
>>> index 0000000..7464856
>>> --- /dev/null
>>> +++ b/package/petitboot/petitboot-console-ui.rules
>>> @@ -0,0 +1,5 @@
>>> +
>>> +# spawn a petitboot UI on common user-visible interface devices
>>> +SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name vt100"
>>> +SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name vt100"
>>> +SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name vt100"
>>
>>  It would make a lot more sense to me to use BR2_TARGET_GENERIC_GETTY_PORT and
>> leave it up to the user to update the ui-rules for his particular configuration,
>> if necessary.
> 
> What do you mean by the ui-rules here? 

 I mean: if the user wants to launch the pb-console on more than one port, then
they should install a custom petitboot-console-ui.rules file in their overlay.

> Is this something that could
> still be defined in the general busybox config?

 Yes, petitboot-console-ui.rules could be simplified to

SUBSYSTEM=="tty", KERNEL=="@GETTY_PORT@",
RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name vt100"

and during installation you sed the @GETTY_PORT@ into BR2_TARGET_GENERIC_GETTY_PORT.

 Of course, only if that is defined.

 Oh and BTW in that case the getty line should also be removed from inittab. So
you'd be fighting against the finalize hook that adds that getty line... Hmm, tough.

 Perhaps the solution is to depend on !BR2_TARGET_GENERIC_GETTY (and add an
appropriate comment to Config.in) and to add the equivalent options to the
petitboot Config.in file.



> 
>>> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
>>> new file mode 100644
>>> index 0000000..1bbf522
>>> --- /dev/null
>>> +++ b/package/petitboot/petitboot.mk
>>> @@ -0,0 +1,57 @@
>>> +################################################################################
>>> +#
>>> +# petitboot
>>> +#
>>> +################################################################################
>>> +
>>> +PETITBOOT_VERSION = 509fca5ca2733a741521ae4332400d54d95ee073
>>> +PETITBOOT_SITE = git://ozlabs.org/~jk/petitboot
>>> +PETITBOOT_DEPENDENCIES = ncurses udev host-bison host-flex

 BTW, when the initscripts package is merged, you'll probably have to depend on
that, because you need to fix up the init scripts.

>>> +PETITBOOT_LICENSE = GPLv2
>>> +PETITBOOT_LICENSE_FILES = COPYING
>>> +
>>> +PETITBOOT_AUTORECONF = YES
>>> +PETITBOOT_AUTORECONF_OPT = -i
>>> +PETITBOOT_CONF_OPT += --with-ncurses --without-twin-x11 --without-twin-fbdev \

 _OPT has now been renamed to _OPTS.

>>> +	      --localstatedir=/var \

 localstatedir=/var is now passed automatically.

>>> +	      HOST_PROG_KEXEC=/usr/sbin/kexec \
>>> +	      HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot \
>>> +	      $(if $(BR2_PACKAGE_BUSYBOX),--with-tftp=busybox)

[snip]


 I'm afraid that petitboot is something so intrusive that it will take us a
while to get it working well (much like the problems we have with systemd). The
defconfig that you provide already helps a lot, though.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
