From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jan 2012 23:19:39 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CB45C55B.2D94%donald.poole@swri.org> (Donald R. Poole's message
 of "Wed, 25 Jan 2012 20:56:34 +0000")
References: <CB45C55B.2D94%donald.poole@swri.org>
Message-ID: <87aa5b4e84.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:

 >> Ok, good. How do you create the file system on the SD card exactly?

 Donald> I create the file system by first creating a single partition
 Donald> (sudo fdisk /dev/sdc && sync && sync in my case and selecting
 Donald> the appropriate commands).  Then, I format the partition (sudo
 Donald> mkfs.ext3 /dev/sdc1 && sync && sync).  Finally, I mount the
 Donald> partition (sudo mount /dev/sdc1 <some_mount_point>) and untar
 Donald> the generated root.tar filesystem tarball to the mount point
 Donald> (sudo tar -xvf root.tar -C <some_mount_point> && sync && sync).

That all sounds good.

From your earlier mail you mentioned that you got 'Login incorrect'
right after typing root, so we must end up somewhere here
(busybox/loginutils/login.c):


		if (pw->pw_passwd[0] == '!' || pw->pw_passwd[0] == '*')
			goto auth_failed;

		if (opt & LOGIN_OPT_f)
			break; /* -f USER: success without asking passwd */

		if (pw->pw_uid == 0 && !check_securetty(short_tty))
			goto auth_failed;

		/* Don't check the password if password entry is empty (!) */
		if (!pw->pw_passwd[0])
			break;
..

 auth_failed:
..
		puts("Login incorrect");

As you're using the default fs skeleton, the pw_passwd[0] and
/etc/securetty tests shouldn't fail, but apparently they do. Could you
enable strace and run

strace -f login

And send the output to the list?

-- 
Bye, Peter Korsgaard
