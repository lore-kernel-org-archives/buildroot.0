From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Oct 2012 11:40:56 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] appended device tree blobs on uImage fails
In-Reply-To: <bug-5516-163@https.bugs.busybox.net/>
References: <bug-5516-163@https.bugs.busybox.net/>
Message-ID: <20121003114056.929B099797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

--- Comment #1 from Maxime Ripard <maxime.ripard@free-electrons.com> 2012-10-03 11:40:55 UTC ---
I can't reproduce the problem here, doing :

$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j8 zImage
$ cat arch/arm/boot/<random>.dtb >> arch/arm/boot/zImage
$ ls -l arch/arm/boot/zImage
-rwxrwxr-x 1 max max 2577673 oct.   3 13:36 arch/arm/boot/zImage
$ md5sum arch/arm/boot/zImage
d88b9ddc04847e06b34f80841a973ce5  arch/arm/boot/zImage
$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j8 uImage
$ ls -l arch/arm/boot/zImage
-rwxrwxr-x 1 max max 2577673 oct.   3 13:36 arch/arm/boot/zImage
$ ls -l arch/arm/boot/uImage
-rw-rw-r-- 1 max max 2577737 oct.   3 13:37 arch/arm/boot/uImage
$ md5sum arch/arm/boot/zImage
d88b9ddc04847e06b34f80841a973ce5  arch/arm/boot/zImage

So it definitely looks to me like the zImage is left untouched.

What are you doing to see that behaviour? What is your configuration file? What
kernel version are you using?

(In reply to comment #0)
> that's because in the kernel, the uImage rule is :
> $(obj)/uImage:  $(obj)/zImage FORCE
>         @$(check_for_multiple_loadaddr)
>         $(call if_changed,uimage)
>         @echo '  Image $@ is ready'

I don't get by looking at that code why the zImage should be overwritten?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
