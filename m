From: Steve Kenton <skenton@ou.edu>
Date: Wed, 11 Mar 2015 19:50:44 -0500
Subject: [Buildroot] Obscure bug in Util-Linux umount? -  Solved
In-Reply-To: <54FF3279.80403@ou.edu>
References: <54FE7E8E.20306@ou.edu> <54FF18D4.2030709@ou.edu>
 <20150310185937.280f8497@free-electrons.com> <54FF3279.80403@ou.edu>
Message-ID: <5500E2E4.1080900@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/2015 01:05 PM, Steve Kenton wrote:
> On 3/10/2015 12:59 PM, Thomas Petazzoni wrote:
>> Dear Steve Kenton,
>>
>> On Tue, 10 Mar 2015 11:16:20 -0500, Steve Kenton wrote:
>>
>>> Further testing revealed that it only occurs if the embedded root filesystem is read-only
>>> which I forgot to mention (blush) so it's probably an interaction with a stale /etc/mtab
>>> or something, but only for the root filesystem and only if the mount point directory names
>>> are the same, yada etc. Much less likely to bite anyone else so I guess a heads up is not needed.

I couldn't leave it alone :-) And, it turns out I was pretty far off in some of my original ideas.
The link to "last mounted on" turned out to be an artifact of how I was testing and does not in fact matter.
The link to "read only" was because I could initially only reproduce using a bootable DVD and does not in fact matter.

The link to "mount point directory" having the same name on both host and target systems however was spot on.

The script below can reproduce the problem but it take 3 separate disks and pretty much the exact oddball
file layout that I was using to create the bootable 'recovery' DVD before it can trigger. I would not be
surprised if nobody else has ever run across this particular problem combination before.

That said, the fact that glibc binaries contain an embedded reference to the host build location no matter
where they are ultimately installed could possibly be a problem for others at some point. I for sure was not
aware of it. Read below for more details. It's definitely not specific to just umount though.

Steve


#!/bin/bash
# Reproduce the filesystem "busy" umount problem with util-linux umount but not busybox umount
# Glibc uses shared libraries and building glibc util-linux causes the umount binary to contain a reference to the host build location
# Which in my case was a disk mounted at /data on an Ubuntu 14.04 system where I was building buildroot
# When booting the resulting buildroot system which I installed onto a disk mounted on /ssd the following output was obtained

build=/data
target=/ssd

# which umount
#   /bin/umount
# strings /bin/umount | grep /data
#   /data/buildroot/output/build/util-linux-2.26/.libs

# Apparently this embedded reference is the preferred location on-disk and is checked before anything else
# So, when we mount the build filesystem on a same-named mount point directory on the running target system
# attempting to then umount it fails because the umount command itself is using those libs on the build filesystem
# but as soon as mount exits that use ends and lsof and fuser will not see anything in-use on the build filesystem

# This script reproduces the problem by building a similar system using the i386 minimal configuration embedded in a here-document below
#
# Notice that the default buildroot grub2 assumption is currently MBR (hd0,msdos1) while I'm using GPT (hd0,gpt1) - adjust accordingly for your setup
#
# The build and target mount point directories must be a immediately off the root and must have filesystems (in partition #1) mounted on them
# On the build filesystem we create 'buildroot' which is the buildroot snapshot directory name
# The target filesystem is made bootable and any previously existing system will be over written
if [ $# -lt 2 ]; then
	echo "Usage: $0 <build_mount_point> <target_mount_point>"
	echo "You must be able to sudo and understand the risks of doing so if you run this"
	echo "Read the comments in the script for more details"
	exit 0
fi

# Get the last line of POSIX df output using tail, keep the first space delimited field using cut and delete the last character using sed
rootdev=$(df -P / | tail -n 1 | cut -d' ' -f 1 | sed 's/.$//') # the base (unpartitioned) host root file system device
buildon=$(df -P $build | tail -n 1 | cut -d' ' -f 1 | sed 's/.$//') # the base (unpartitioned) build file system device
installto=$(df -P $target | tail -n 1 | cut -d' ' -f 1 | sed 's/.$//') # the base (unpartitioned) target file system device where GRUB2 will be installed
# A bit of sanity checking
if [ "$installto" == "$rootdev" ]; then
	echo "WRITING OVER YOUR RUNNING ROOT FILE SYSTEM IS A BAD IDEA!"
	exit 1
fi
# Make sure we have buildroot
if [ ! -d $build/buildroot ]; then
	sudo chown $user:$user $build
	mkdir $build/buildroot
	cd $build
	if [ ! -f buildroot-snapshot.tar.bz2 ]; then
		wget http://buildroot.org/downloads/buildroot-snapshot.tar.bz2
	fi
	tar --extract --file buildroot-snapshot.tar.bz2 # tar will automatically figure out the compression
fi
cd $build/buildroot
if [ "$(pwd)" != "$build/buildroot" ]; then
	echo "Can not cd to $build/buildroot"
	exit 1
fi
# The configuration to use
cat > .config <<'EOF'
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="i386"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_BINARIES=y
BR2_PACKAGE_UTIL_LINUX_MOUNT=y
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_BOOT_PARTITION="hd0,gpt1"
EOF
make olddefconfig # fill out the minimal config with default answers
make # and get to work

# A quick summary
ls -ld $build $target
mount | grep /dev/sd | sort
echo "Grub2 and buildroot need to be installed on the target system boot/root filesystem disk to create a bootable system"
read -p "Do you want delete and repopulate buildroot on the target system root filesystem $target (${installto}1) and install Grub2 to make $installto bootable? (yes or no) "
if [ "$REPLY" == "yes" ]; then
	(cd $target; sudo rm -rf bin boot dev etc home init lib lib64 libexec linuxrc media mnt opt proc root run sbin sys tmp usr var) # subshell
	sudo tar --extract --file output/images/rootfs.tar --directory $target # the buildroot root filesystem
	sudo output/host/usr/sbin/grub-bios-setup --boot-image=output/host/usr/lib/grub/i386-pc/boot.img --core-image=output/images/grub.img --directory=. $installto # paths relative to -d
fi
sudo mkdir -p $target$build # this is the poison pill - a mount point directory on the target with the same name as on the build mount point directory on the build system
sudo ln -s /bin/busybox $target/root/umount # root user's home directory on buildroot
echo "Boot the system now installed on $target (${installto}1) and enter the following commands"
echo "mount ${buildon}1 $build"
echo "umount $build" # util-linux umount
echo "./umount $build" # busybox umount
echo "The newly mounted $build filesystem should be 'busy' and not umountable using util-linux umount but should unmount ok with busybox umount"
# I'm guessing that the reason busybox umount works is either that it's statically linked or it's
# dynamically linked but the libraries are already in memory because of other busybox applets running
