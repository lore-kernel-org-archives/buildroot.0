From: Leonid <Leonid@a-k-a.net>
Date: Sun, 14 Oct 2007 10:31:55 -0700
Subject: [Buildroot] Some devices are not created in the ext2 filesystem.
In-Reply-To: <47120EE5.9040508@promwad.com>
References: <20071012210141.1DF69A5E1B@busybox.net>	<0710131046500.9729@somehost>	<1192269439.26495.4.camel@elrond.atmel.sweden>	<0710131212520.9729@somehost>	<1192300638.26495.13.camel@elrond.atmel.sweden>	<0710132115250.9729@somehost>	<1192307460.26495.27.camel@elrond.atmel.sweden><0710132305350.9729@somehost>	<47116C13.9020701@promwad.com><406A31B117F2734987636D6CCC93EE3C02528F70@ehost011-3.exch011.intermedia.net>
	<47120EE5.9040508@promwad.com>
Message-ID: <406A31B117F2734987636D6CCC93EE3C02528F79@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Ivan:

Your guess was right: I have learnt that udev is used in my build indeed
and my (proprietary) driver doesn't bother to register its nodes with
sysfs filesystem. Now everything is clear thank you. 

For the time being (I didn't want to change code just yet) I added mknod
commands to rcS file, so necessary nodes are created upon restart. 

I also see some error from udev:

Populating /dev using udev: cannot open /dev/null
done

/dev/null is certainly present:

# ls -al /dev/null
crw-rw----    1 root     root       1,   3 Dec 31 17:00 /dev/null

What this error is about?

Thanks,

Leonid.

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Ivan Kuten
Sent: Sunday, October 14, 2007 5:43 AM
To: Leonid
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Some devices are not created in the ext2
filesystem.

> I see that correspondent files are indeed created in the root
filesystem
> tree:
> 
> [leonid at jaipur buildroot]$ ls -al root/dev/mc*
> -rw-r----- 1 root root 0 2007-10-13 21:56 root/dev/mcfp-0
> -rw-r----- 1 root root 0 2007-10-13 21:56 root/dev/mcfp-1
> 
> However when I load my ext2 root filesystem, I don't see these device
> nodes in /dev directory. What is wrong?
> 

Check that you are not using udev, because udev is mounted over /dev
thus hiding your entries.

BR,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
