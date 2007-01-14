From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 14 Jan 2007 12:52:50 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/generic/target_skeleton: etc var
In-Reply-To: <20070114005652.7CBE44858A@busybox.net>
References: <20070114005652.7CBE44858A@busybox.net>
Message-ID: <20070114115250.GI14212@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 13, 2007 at 04:56:52PM -0800, sjhill at uclibc.org wrote:
>Author: sjhill
>Date: 2007-01-13 16:56:52 -0800 (Sat, 13 Jan 2007)
>New Revision: 17269
>
>Log:
>Make '/var/cache' and symbolic link to '/tmp' like the others. We'll need this for Samba and friends. Also, change mount order of filesystems during boot.

>Modified: trunk/buildroot/target/generic/target_skeleton/etc/inittab
>===================================================================
>--- trunk/buildroot/target/generic/target_skeleton/etc/inittab	2007-01-14 00:55:25 UTC (rev 17268)
>+++ trunk/buildroot/target/generic/target_skeleton/etc/inittab	2007-01-14 00:56:52 UTC (rev 17269)
>@@ -14,8 +14,8 @@
> # process   == program to run
> 
> # Startup the system
>+null::sysinit:/bin/mount -o remount,rw /
> null::sysinit:/bin/mount -t proc proc /proc
>-null::sysinit:/bin/mount -o remount,rw /
> null::sysinit:/bin/mount -a
> null::sysinit:/bin/hostname -F /etc/hostname
> null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
>

This will break any of busybox's mount impls that were written by Rob if
you have the BUSYBOX_EXEC_PATH set to "/proc/self/exe", which is the
default.

See http://busybox.net/cgi-bin/viewcvs.cgi?rev=16760&view=rev

What should we do?
I was planning on doing a completely separate skeleton for busybox to
peruse mdev for hotplugging etc, etc. This skeleton should be smaller
than the generic skel since we need only little in e.g. /dev. We need a
different inittab (depending on busybox's .config :( ), of course.

Is that desirable and a worthwhile thing to have? Alternative
approaches?

thanks,
