From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Tue, 27 Dec 2011 13:09:16 +0100
Subject: [Buildroot] SOLVED! Re: Buildroot 2011.11 on x86_64 - neither
 udev nor mdev loads needed modules at startup
In-Reply-To: <CALR4fEJVV8N5sqJ0GouHMUCVJApQPyQrcyp5FLy9iKAakhjZvQ@mail.gmail.com>
References: <4EF8FABB.9060104@gmail.com> <4EF90A67.7030202@gmail.com>
 <CALR4fEJVV8N5sqJ0GouHMUCVJApQPyQrcyp5FLy9iKAakhjZvQ@mail.gmail.com>
Message-ID: <CAMduVEcAPBY0Bry9cgibZ1=LaRfEpctv+CW97Yn4Q4E-BK052A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 27, 2011 at 12:56 PM, Diego Iastrubni <diegoiast@gmail.com> wrote:
> On Tue, Dec 27, 2011 at 1:59 AM, Wojciech Zabolotny <wzab01@gmail.com>
> wrote:
>>
>> I've tested yet another configuration. With modprobe provided by busybox
>> and without external module-init-tools.
>> In this setup the modprobe is located correctly in /sbin, so the only
>> modification needed to assure automatic loading of modules is addition of
>> "udevadm trigger --action=add" to the /etc/init.d/S10udev file right after
>> the ?$UDEV_BIN -d || (echo "FAIL" && exit 1) line.
>>
> ...
>>
>> #!/bin/sh
>> [ "$ACTION" = add ]&& ?[ "$MODALIAS" != "" ]&& ?modprobe $MODALIAS
>> [ "$ACTION" = remove ]&& ?[ "$MODALIAS" != "" ]&& ?modprobe -r $MODALIAS
>> /sbin/mdev $@
>>
>> and passing it's path to the /sys/kernel/uevent_helper
>
>
> Still not working here using udev. Everything seems to be as you described.
> Next step - making that wrapper with add/remove actions.
>
> [/root 10.10.10.44] $ cat /sys/kernel/uevent_helper
> /sbin/udevadm
> [/root 10.10.10.44] $ cat /etc/init.d/S10udev ?| grep adm
> # ? ? ? (including startup time!) and administration. ?For example, if
> ? ? ? ? #udevadm trigger
> ? ? ? ? udevadm trigger --action=add
> ? ? ? ? udevadm control --stop_exec_queue
> [/root 10.10.10.44] $ grep modprobe /lib/udev/rules.d/*
> /lib/udev/rules.d/75-probe_mtd.rules:KERNEL=="mtd*ro",
> ENV{MTD_FTL}=="smartmedia", RUN+="/sbin/modprobe -bv sm_ftl"
> /lib/udev/rules.d/80-drivers.rules:DRIVER!="?*", ENV{MODALIAS}=="?*",
> RUN+="/sbin/modprobe -bv $env{MODALIAS}"
> /lib/udev/rules.d/80-drivers.rules:SUBSYSTEM=="tifm",
> ENV{TIFM_CARD_TYPE}=="SD", RUN+="/sbin/modprobe -bv tifm_sd"
> /lib/udev/rules.d/80-drivers.rules:SUBSYSTEM=="tifm",
> ENV{TIFM_CARD_TYPE}=="MS", RUN+="/sbin/modprobe -bv tifm_ms"
> /lib/udev/rules.d/80-drivers.rules:SUBSYSTEM=="memstick",
> RUN+="/sbin/modprobe -bv --all ms_block mspro_block"
> /lib/udev/rules.d/80-drivers.rules:SUBSYSTEM=="i2o", RUN+="/sbin/modprobe
> -bv i2o_block"
> /lib/udev/rules.d/80-drivers.rules:SUBSYSTEM=="scsi",
> ENV{DEVTYPE}=="scsi_device", TEST!="[module/sg]", RUN+="/sbin/modprobe -bv
> sg"
> /lib/udev/rules.d/80-drivers.rules:SUBSYSTEM=="module",
> KERNEL=="parport_pc", RUN+="/sbin/modprobe -bv ppdev"
> [/root 10.10.10.44] $ which modprobe
> /sbin/modprobe
>

My complete S10udev looks like below:
#!/bin/sh
#
# udev	This is a minimal non-LSB version of a UDEV startup script.  It
#	was derived by stripping down the udev-058 LSB version for use
#	with buildroot on embedded hardware using Linux 2.6.12+ kernels.
#
#	You may need to customize this for your system's resource limits
#	(including startup time!) and administration.  For example, if
#	your early userspace has a custom initramfs or initrd you might
#	need /dev much earlier; or without hotpluggable busses (like USB,
#	PCMCIA, MMC/SD, and so on) your /dev might be static after boot.
#
#	This script assumes your system boots right into the eventual root
#	filesystem, and that init runs this udev script before any programs
#	needing more device nodes than the bare-bones set -- /dev/console,
#	/dev/zero, /dev/null -- that's needed to boot and run this script.
#

# Check for missing binaries
UDEV_BIN=/sbin/udevd
test -x $UDEV_BIN || exit 5

# Check for config file and read it
UDEV_CONFIG=/etc/udev/udev.conf
test -r $UDEV_CONFIG || exit 6
. $UDEV_CONFIG

case "$1" in
    start)
        echo -n "Populating $udev_root using udev: "
        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
        $UDEV_BIN -d || (echo "FAIL" && exit 1)
        udevadm trigger --action=add
        echo "done"
        ;;
    stop)
        # Stop execution of events
        udevadm control --stop_exec_queue
        killall udevd
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac


exit 0

-- 
HTH & Regards,
Wojtek
