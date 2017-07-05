From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Jul 2017 16:17:27 +0200
Subject: [Buildroot] [PATCH] fs/cpio/init: remout / as read-only as a
	first step
In-Reply-To: <20170704190104.24703-1-andrew.smirnov@gmail.com> (Andrey
 Smirnov's message of "Tue, 4 Jul 2017 12:01:04 -0700")
References: <20170704190104.24703-1-andrew.smirnov@gmail.com>
Message-ID: <87r2xvynm0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Smirnov <andrew.smirnov@gmail.com> writes:

 > When /init is present on root file system kernel does not take into
 > accout kernel arguments such as "ro" and does not remount root as
 > read-only. So prior to this commit the system would continue booting
 > with "rw" root filesystem until corresponding line in /etc/fstab to
 > remount it as "ro" was processed.

 > Change the code to immediately remount / as read-only and rely on
 > /etc/fstab processing to remount it as "rw" if that is what's selected
 > in Buildroot configuration.

 > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

I see what you're getting at, but this doesn't actually work (with
busybox mount at least):

NET: Registered protocol family 17
Freeing unused kernel memory: 2528K
This architecture does not have kernel memory protection.
mount: can't read '/proc/mounts': No such file or directory
Starting logging: OK
Initializing random number generator... done.

The reason is that mount had to read the current mount flags (either
directly in /proc/mounts or through /etc/mtab depending on busybox
config, but we symlink /etc/mtab to /proc/mounts) to be able to remount,
and as /proc is not mounted in an initramfs this doesn't work.

We could conceptually mount /proc in /init as well, but then things gets
confusing when /sbin/init does it again.

I don't see any clean way of doing this without adding quite some
complexity, and I think your usecase (systemd in initramfs that you want
ro) is so special that I would suggest you just use a custom /init in
your rootfs overlay.

-- 
Bye, Peter Korsgaard
