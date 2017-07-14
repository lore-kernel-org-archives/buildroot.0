From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 14:38:18 +0200
Subject: [Buildroot] /etc//init.d init scripts in buildroot
In-Reply-To: <CALtfCQZAis0fX+J6NWTX+u=ZJB-0ZKoKgkBcteAJU4f+c46BJA@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Fri, 14 Jul 2017 12:16:36 +0200")
References: <CALtfCQZAis0fX+J6NWTX+u=ZJB-0ZKoKgkBcteAJU4f+c46BJA@mail.gmail.com>
Message-ID: <87shhzb3d1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Hi everyone,
 > I'm trying to use init scripts from /etc/init.d to activate one gpio just
 > before to halt my HW platform (a raspberry Pi): S00gpioff

 > I've created a script like this:

 > #!/bin/sh
 > #
 > # S00gpioff
 > #

 > GPIO_CMD_OFF=13

 > case "$1" in
 > start)
 >         echo $GPIO_CMD_OFF > /sys/class/gpio/export
 >         ;;
 > stop)
 >         echo "Activated CMD OFF output"
 >         echo 1 > /sys/class/gpio$GPIO_CMD_OFF/value
 >         ;;
 > *)
 > exit 1
 > ;;

 > esac

 > The problem is I need to activate the gpio just before halt:

How late does this need to happen? You cannot do much later than this in
user space. E.G. the default inittab is:

# Stuff to do before rebooting
::shutdown:/etc/init.d/rcK
::shutdown:/sbin/swapoff -a
::shutdown:/bin/umount -a -r

rcK calls you init script (as the very last one because of S00), and
then only swapoff + umount gets executed before the kernel is asked to
power down.

If this is not good enough then you need to handle the gpio in a kernel
driver instead by registering a reboot notifier.

-- 
Bye, Peter Korsgaard
