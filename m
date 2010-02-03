From: Cameron Hutchison <lists@xdna.net>
Date: Wed, 03 Feb 2010 12:28:51 -0000
Subject: [Buildroot] ip: RTNETLINK answers: File exists? uclibc login:??
References: <SNT129-W58972AB1A1E9CC737751EBB9560@phx.gbl>
Message-ID: <4e1d.4b696c03.c4fdb@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tony Mozi <spooflinux@hotmail.fr> writes:

>When I start the board, I have 2 problems :

>1/ On minicom -s : 
>Starting network...
>ip: RTNETLINK answers: File exists 

This isn't a problem. It occurs (I think) because there are commands in
/etc/inittab to initialise the loopback interface, which get executed
again when "ifup -a" runs from the /etc/init.d/S40network initscript.
You can ignore this error.


>When I write a command, like ls, there is no effect.
>What does it mean?

It means there is nothing listening for your command because...


>2/ On the LCD of the board :
>Welcome to Buildroot
>uclibc login:

>Have you got an idea?

....it looks like you are not running a getty on ttyS0 (or whatever your
console is on).

In "make menuconfig", under Target Options --> Generic serial port
config, there is the option to set the serial port to run a getty on. If
you set this properly, you should end up with a line (uncommented) in
/etc/inittab that reads:

ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

This line will allow you to log into the system through minicom. You
should see the same prompt there you showed above that was on the LCD.
