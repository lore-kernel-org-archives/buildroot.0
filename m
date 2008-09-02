From: Steven Woody <narkewoody@gmail.com>
Date: Tue, 2 Sep 2008 19:26:44 +0800
Subject: [Buildroot] Login exited
In-Reply-To: <MJEBLBOLLBKOACLOGNPBGEIHCBAA.e.krueper@solcon-systemtechnik.de>
References: <ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<MJEBLBOLLBKOACLOGNPBGEIHCBAA.e.krueper@solcon-systemtechnik.de>
Message-ID: <ed4892840809020426s36489484t7ca0a5dd2863733e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 2, 2008 at 2:24 PM, Emil Kruper
<e.krueper@solcon-systemtechnik.de> wrote:
> Alter the device table file you have selected in your buildroot config (for
> example target/generic/device_table.txt) and rebuild your system. By default
> these files don't fit your needs.
>
> In particular have a look at the section # Normal system devices, I think
> this could be the origin of your problems.


Emil,

I think the origin of the "can't open /dev/ttySxxx" problem is differ
with the origin of the "getty exited" problem.  And, for the former, I
think it has nothing to do with my device_table.txt,  since if I
comment out the following line in etc/inittab:
   ::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
and replace it with
   ::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
then, the "can't open /dev/ttySxxx" problem gone away.  so I think,
the original inittab file gives a wrong option to 'mount -t tmpfs'.
That's the origin of the problem --  the /dev did not created
successfuuly, so no /dev/ttySxxx can be opened.

But, as you know, this problem had been resoved, I finally get the
login problem and the system is waiting for me to login.  My new
problem is that I can not login.  When I type in user name 'root' at
the prompt, I got the on-console log message:
    Dec 31 17:24:45 ffcplus daemon.info init: init: process
'/usr/bin/tail -f /var/log/messages' (pid 7568) exited. Scheduling for
restart.

Did you ment to say that the login problem itself has something to do
with my device_table.txt?  I belive the /dev/ttyS0 has already created
properly anyhow, otherwise I should not get the login prompt, am I
right?

I still need your help.


>
> Best regards,
>
> Emil Kruper
>
>
> -----Ursprungliche Nachricht-----
> Von: buildroot-bounces at uclibc.org
> [mailto:buildroot-bounces at uclibc.org]Im Auftrag von Steven Woody
> Gesendet: Dienstag, 2. September 2008 02:47
> An: buildroot at uclibc.org; busybox at busybox.net
> Betreff: Re: [Buildroot] Login exited
>
>
> Hi,
>
> The buildroot I am using is the 080831 snapshot, the busybox is
> 1.11.2. Now I see the boot
> prompt finally!  But I can't login:
>
> ---
> Welcome to uClibc
> uClibc login: root
> Dec 31 17:01:05 nlmt auth.info login[195]: root login on 'ttyS0'
> Dec 31 17:01:05 nlmt daemon.info init: init: process '/sbin/getty -L
> ttyS0 115200 vt100' (pid 195) exited. Scheduling for restart.
> Dec 31 17:0
>
> Welcome to uClibc
> uClibc login: default
> Dec 31 17:01:05 nlmt daemon.info init: init: process '/sbin/getty -L
> ttyS0 115200 vt100' (pid 195) exited. Scheduling for restart.
> Dec 31 17:0
> ---
>
> And, I got see a suspicious messages just after the kernel booted:
> ---
> VFS: Mounted root (cramfs filesystem) readonly.
> Freeing init memory: 84K
> Error -3 while decompressing!
> c0925384(-7384812)->c3e38000(4096)
> ---
>
> I think I am so near to success, please help me! Thanks.
>
> -
> narke
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
