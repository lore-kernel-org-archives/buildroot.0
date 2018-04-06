From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 05 Apr 2018 23:21:33 -0300
Subject: [Buildroot] [RFC PATCH] download/git: fix basename for files
 inside tarballs
References: <87zi2imagg.fsf@dell.be.48ers.dk>
Message-ID: <5ac6d9ad67156_74562ac455ee4c30280aa@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Apr 05, 2018 at 03:30 AM, Peter Korsgaard wrote:

>>>>>> "Ricardo" == Ricardo Martincoski writes:
[snip]
>  > NOTICE: linux-firmware is NOT fixed by this. I don't know why.
[snip]
>  > Could it be related to my setup?
>  > tar (GNU tar) 1.29
>  > git version 2.14.1
> 
> Hmm, it works here. I again moved my old tarball and .hash file:
[snip]
> So I guess there is something else going on. I'm using tar 1.29 and git 2.11.0.

It seems related to tar options. And we use the same version, so I don't
understand the reason we get different results.

At the very end of 'tar --help' I see:
*This* tar defaults to:
--format=gnu -f- -b20 --quoting-style=escape --rmt-command=/usr/lib/tar/rmt
--rsh-command=/usr/bin/rsh

I am using Ubuntu 17.10.


Inspecting the tarball, what makes linux-firmware uncommon is that it has
symlinks to upper directories.
Based on my tests, it seems '--transform=' operates on the symlink destination
as well. See at the end:
..."bin -> linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2./mrvl/"...

Based only on this, assuming there are no other variables, my tweak to the
transform regexp still does not cover all cases. Sorry.


My tests:
I also moved the tarball and hash file and downloaded using 2018.02 and current
master (e509e04dedd0). Sorry about the long lines, it's the raw output.

$ sha256sum 2018.02/linux-firmware-* master/linux-firmware/linux-firmware-*
d253f7abb32e0407bcc840a5bddba1dc20190bb4a4bb6d40512f279fde384671  2018.02/linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz
246a0de9ef9de5076e7695c9e9399b5358bb77278ef375ed9360466d00a1a39b  master/linux-firmware/linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz

$ tar -tvf 2018.02/linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz > 2018.02/log.txt
$ tar -tvf master/linux-firmware/linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz > master/log.txt

$ diff -U3 2018.02/log.txt master/log.txt | head
--- 2018.02/log.txt     2018-04-05 20:48:31.408302590 -0300
+++ master/log.txt      2018-04-05 20:48:49.031955640 -0300
@@ -893,8 +893,8 @@
 -rw-r--r-- 0/0            2464 2018-01-04 13:06 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2/libertas/sd8686_v8_helper.bin
 -rw-r--r-- 0/0          124252 2018-01-04 13:06 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2/libertas/sd8686_v9.bin
 -rw-r--r-- 0/0            2516 2018-01-04 13:06 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2/libertas/sd8686_v9_helper.bin
-lrwxrwxrwx 0/0               0 2018-01-04 13:06 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2/libertas/sd8688.bin -> ../mrvl/sd8688.bin
-lrwxrwxrwx 0/0               0 2018-01-04 13:06 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2/libertas/sd8688_helper.bin -> ../mrvl/sd8688_helper.bin
+lrwxrwxrwx 0/0               0 2018-01-04 13:06 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2/libertas/sd8688.bin -> linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2./mrvl/sd8688.bin
+lrwxrwxrwx 0/0               0 2018-01-04 13:06 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2/libertas/sd8688_helper.bin -> linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2./mrvl/sd8688_helper.bin


Thoughts?

Regards,
Ricardo
