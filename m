From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Fri, 14 Jul 2017 15:31:22 +0200
Subject: [Buildroot] /etc//init.d init scripts in buildroot
In-Reply-To: <87shhzb3d1.fsf@dell.be.48ers.dk>
References: <CALtfCQZAis0fX+J6NWTX+u=ZJB-0ZKoKgkBcteAJU4f+c46BJA@mail.gmail.com>
 <87shhzb3d1.fsf@dell.be.48ers.dk>
Message-ID: <CALtfCQYpfbuuyfp7TZ1iXJ-OPmGQTPV1kv0XV6d0ck0AzwMQOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


Thanks in advance for your help and quick reply.

I've designed a Back Up System [BUS: DC-DC converter + Voltage monitor +
Boost + Battery] in order to avoid problems when there is a lack of power,
a problem very common in systems with SDs and eMMCs (As you know, I'm
working with a raspberry pi platform). The system detects a failure in the
input power and immediately the boost with the battery is activated. At the
same time, a signal is detected in the raspberry pi (an input) that after 5
minutes, if the failure continuos it'll activate an output called nKILL.

This output (nKILL) is going to be used to power off the power supply of my
device. So I would like to make ensure that I power off your system in a
good way to avoid that the file system could be damaged.

Before activating the signal nKILL that it's going to command the Back Up
System to switch off my system, I execute sync to make sure that all files
are saved.

Do you know if this way is good enough to make sure that the file system is
going to keep the integrity?


Best regards,

Oscar Gomez Fuente

On 14 July 2017 at 14:38, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi everyone,
>  > I'm trying to use init scripts from /etc/init.d to activate one gpio
> just
>  > before to halt my HW platform (a raspberry Pi): S00gpioff
>
>  > I've created a script like this:
>
>  > #!/bin/sh
>  > #
>  > # S00gpioff
>  > #
>
>  > GPIO_CMD_OFF=13
>
>  > case "$1" in
>  > start)
>  >         echo $GPIO_CMD_OFF > /sys/class/gpio/export
>  >         ;;
>  > stop)
>  >         echo "Activated CMD OFF output"
>  >         echo 1 > /sys/class/gpio$GPIO_CMD_OFF/value
>  >         ;;
>  > *)
>  > exit 1
>  > ;;
>
>  > esac
>
>  > The problem is I need to activate the gpio just before halt:
>
> How late does this need to happen? You cannot do much later than this in
> user space. E.G. the default inittab is:
>
> # Stuff to do before rebooting
> ::shutdown:/etc/init.d/rcK
> ::shutdown:/sbin/swapoff -a
> ::shutdown:/bin/umount -a -r
>
> rcK calls you init script (as the very last one because of S00), and
> then only swapoff + umount gets executed before the kernel is asked to
> power down.
>
> If this is not good enough then you need to handle the gpio in a kernel
> driver instead by registering a reboot notifier.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170714/9ed9bc06/attachment.html>
