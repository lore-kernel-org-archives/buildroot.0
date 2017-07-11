From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 22:32:47 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 10 Jul 2017 18:26:19 +0200")
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
Message-ID: <87lgnur9xs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The Linux kernel will refuse to mount a squashfs image/partition that is
 > not padded to a 1MiB boundary.

 > We already have this as a workaround in the testing infrastructure, in
 > support/testing/tests/fs/test_squashfs.py at 26.

 > Use that workaround directly during the squashfs generation.

How are you testing this? I don't seem to be able to reproduce it here.

ls -la images/rootfs.squashfs
-rw-r--r-- 1 peko peko 933888 Jul 11 22:24 images/rootfs.squashfs

933888 is 0xe4000, E.G. 16KB (0x4000) alignment.

mkdir /tmp/blah
sudo mount -o loop,ro images/rootfs.squashfs /tmp/blah
ls -lah /tmp/blah
total 64K
drwxr-xr-x 17 root root 225 Jul 11 22:24 .
drwxrwxrwt 99 root root 60K Jul 11 22:30 ..
drwxr-xr-x  2 root root 899 Jul 11 22:24 bin
drwxr-xr-x  4 root root  63 Jul 11 22:24 dev
drwxr-xr-x  4 root root 240 Jul 11 22:24 etc
drwxr-xr-x  2 root root 216 Jul 11 22:24 lib
lrwxrwxrwx  1 root root   3 Jul 11 22:22 lib32 -> lib
lrwxrwxrwx  1 root root  11 Jul 11 22:23 linuxrc -> bin/busybox
drwxr-xr-x  2 root root   3 Oct 24  2013 media
drwxr-xr-x  2 root root   3 Oct 24  2013 mnt
drwxr-xr-x  2 root root   3 Oct 24  2013 opt
drwxr-xr-x  2 root root   3 Oct 24  2013 proc
drwx------  2 root root   3 Aug 24  2016 root
drwxr-xr-x  2 root root   3 Aug 24  2016 run
drwxr-xr-x  2 root root 773 Jul 11 22:23 sbin
drwxr-xr-x  2 root root   3 Oct 24  2013 sys
drwxrwxrwt  2 root root   3 Oct 24  2013 tmp
drwxr-xr-x  6 root root  75 Jul 11 22:23 usr
drwxr-xr-x  4 root root 108 Jul 11 22:24 var

This is with the standard squashfs options (E.G. gzip) and my PC is
using a 4.9 kernel.

-- 
Bye, Peter Korsgaard
