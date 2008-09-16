From: =?ISO-8859-1?Q?St=E9phane?= Mancini <stephane.mancini@grenoble-inp.fr>
Date: Tue, 16 Sep 2008 17:31:48 +0200
Subject: [Buildroot] Login on a ttyS fails
Message-ID: <1221579108.7973.21.camel@chip.lis.inpg.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm trying to set up linux on a Xilinx platform.
The boot starts but the root login fails 
after prompting :


I've made some prompt in login.c (busybox) and I have the following

################ LOG ######################
boot stuff 
init started: BusyBox v1.12.0 (2008-09-16 16:37:51 CEST)
command='/bin/mount -t proc proc /proc' action=1 tty='/dev/null'

command='/etc/init.d/rcS' action=1 tty=''

command='/sbin/getty -L ttyUL0 57600 vt100 ' action=2 tty='/dev/ttyUL0'

command='/bin/touch /var/log/messages' action=1 tty='/dev/null'

command='/sbin/reboot' action=32 tty=''

command='/sbin/swapoff -a' action=64 tty='/dev/null'

Welcome to the Erik's uClibc development environment.
(none) login: root
Dec 31 17:00:12 login[169]: root login succeeded  on the TTY : 'ttyUL0'
-> /bin/ash
Dec 31 17:00:12 login[169]: Run t


Welcome to the Erik's uClibc development environment.
(none) login: 

#######

I've modified the login.c text to be sure of which code is executing.

It appears that it goes up to the call to the shell. But, then, nothing
happens. 
I've put a 
	syslog(LOG_INFO, "Get to the shell ash!!\n");
at the begining of ash.c:ash_main(int argc UNUSED_PARAM, char **argv)
It's never displayed !

I've also modified inittab to execute "ash" instead of "/init" but
nothing happen also.

It seems that there's a trouble with the shell......

I'm using the Xilinx UARTLITE and the driver comming with linux 2.6.26.2

Maybe there's something wrong with this device but it seems to work
perfectly since I can see all the boot process !

Please, can you tell me :
 what are the configuration parameters to be set to run a a shell on
this tty properly ?
To mean, in buildroot, busybox, libc, linux, etc ....

I set the console on ttyUL0. Is it correct ?

Greetings !

St?phane Mancini


-- 
|St?phane Mancini   Ma?tre de Conference ENSIMAG/GIPSA-lab DIS
| Tel : 04 76 57 43 58
| 961 rue de la Houille Blanche
| Domaine universitaire - BP 46
| 38402 Saint Martin d'H?res cedex
| Email : stephane.mancini at grenoble-inp.fr
| http://www.lis.inpg.fr/pages_perso/mancini
================================================
Join us for the DASIP'08 Conference
ULB, Bruxelles, Belgique
Visit http://www.ecsi.org/dasip/
================================================
