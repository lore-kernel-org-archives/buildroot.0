From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 9 Nov 2010 16:25:23 +0100
Subject: [Buildroot] Buildroot creates broken jffs2 image
Message-ID: <AANLkTi=zp_NcMLOBTK5v+Hc=ryLOwT5YuNg9TXrrtdu=@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

It seems to me that Buildroot creates broken jffs2 image. And I really
do not understand why because using mkfs.jffs2 from the package
manager (both report version 1.60) with the *same* arguments as
Buildroot did produces a working image. So here's what I do:

1) build Buildroot with jffs2 image

2) flash jffs2 image and try to mount. Watch errors on console:

# mount -t jffs2 /dev/mtdblock7 /mnt
[ snip ]
[ 3628.114395] jffs2_scan_eraseblock(): Node at 0x02800000 {0x1985,
0xe002, 0x00000415) has invalid CR)
[ 3628.127268] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800004: 0x0415 instead
[ 3628.138850] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800008: 0xe46f instead
[ 3628.148470] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x0280000c: 0x134b instead
[ 3628.160049] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800010: 0x0001 instead
[ 3628.169675] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800014: 0x81a4 instead
[ 3628.181252] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x0280001c: 0x165d instead
[ 3628.190865] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800020: 0xa68f instead
[ 3628.202587] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800024: 0xa68f instead
[ 3628.211430] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x02800028: 0xa68f instead
[ 3628.220395] Further such events for this erase block will not be printed
[ 3628.272389] Old JFFS2 bitmask found at 0x0280b86c
[ 3628.277079] You cannot use older JFFS2 filesystems with newer kernels
[ 3628.788134] Cowardly refusing to erase blocks on filesystem with no
valid JFFS2 nodes
[ 3628.796023] empty_blocks 191, bad_blocks 0, c->nr_blocks 512
mount: mounting /dev/mtdblock7 on /mnt failed: Input/output error

3) look at the build log and retrieve the mkfs.jffs2 command that
buildroot used:
echo "	/home/bjornfor/forks/buildroot-skipper/output/host/usr/sbin/mkfs.jffs2
-e 0x20000 -p -l -s 0x800 -n -d
/home/bjornfor/forks/buildroot-skipper/output/target -o
/home/bjornfor/forks/buildroot-skipper/output/images/rootfs.jffs2" >>
/home/bjornfor/forks/buildroot-skipper/output/build/_fakeroot.fs

4) issue the command with *host* mkfs.jffs2 instead (using the exact
same arguments):
mkfs.jffs2 -e 0x20000 -p -l -s 0x800 -n -d
/home/bjornfor/forks/buildroot-skipper/output/target -o
/home/bjornfor/forks/buildroot-skipper/output/images/rootfs.jffs2.v2

5) flash new jffs2 image and mount. This time with *no errors*.

Any ideas on why this is happening?

I'm running from git master but on a commit some time after the
2010.08 tag (I haven't updated in a while).

Best regards,
Bj?rn Forsman
