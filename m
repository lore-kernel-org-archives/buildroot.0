From: Steve Kenton <skenton@ou.edu>
Date: Mon, 30 Oct 2017 20:53:39 -0500
Subject: [Buildroot] Libpng missing a link dependency in 2017-08?
In-Reply-To: <20171030113651.6b4bfc82@windsurf>
References: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
 <20171030113651.6b4bfc82@windsurf>
Message-ID: <5d0519b8-c5d3-6381-bc38-ae21c6ed0905@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/30/2017 05:36 AM, Thomas Petazzoni wrote:Hello,

> On Sun, 29 Oct 2017 15:36:37 -0500, Steve Kenton wrote:
>> I recently began evaluating a switch to buildroot-2017.08 and started
>> getting the following message (transcribed from a screen shot)
>>
>> ffprobe: Relink `/usr/lib64/libpng16.so.16' with
>> `/lib64/libpthread.so.0' for IFUNC symbol `longjmp'
>>
>> As far as I can determine it is because libpng 1.6.31 uses longjmp() and
>> it needs another link dependency to avoid the runtime fixup above.
>>
>> I did not see anything on the list about this and buildroot 2017-08.1
>> did not switch to libpng 1.6.32 although I'm building it anyway on
>> general principles.
>>
>> So, is this likely a libpng build issue or should I start digging into
>> ffmpeg?
> Could you provide a minimal .config that exhibits the problem you're
> seeing ?
>
> Best regards,
>
> Thomas
>
>
Here you go, the small sample jpeg file attached is the one I used for 
testing.
I needed to add USB3 support for my motherboard or I could not login, 
hence the script
Just untar buildroot-2017.08.1 then copy in the jpeg file and the script 
and run it
The resulting bzImage file will illustrate the problem. See comments in 
the script

Steve Kenton

#! /bin/bash
# buildme.sh - Reproduce the following message with a minimal 
configuration for buildroot-2017-08.1 to simplify troubleshooting
# Relink /usr/lib64/libpng16.so.16 with /lib64/libpthread.so.0 for IFUNC 
symbol longjmp
# The most applicable Google hit I found is:
# 
http://lists.openembedded.org/pipermail/openembedded-core/2017-January/130983.html
# "> > > The gdk-pixbuf link does use -lpthread, is this saying that libpng
# should be linked against pthread too?? I can replicate on demand if
# you have any suggestions.
# >
# >
# That's what it's saying, and this was introduced by the fix for:"
#
make clean # nothing up my sleeve
# This is the minimal config resulting from "make savedefconfig"
cat > .config <<'EOF'
BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="x86_64"
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FREETYPE=y
BR2_PACKAGE_LIBPNG=y
BR2_TARGET_ROOTFS_INITRAMFS=y
EOF
make olddefconfig # fill out buildroot .config file
make # build the base buildroot system
cp --force Splash.jpg output/target/root/ # the jpeg file used for testing
# Tweak the kernel config for USB support to allow login with my motherboard
eval $(grep BR2_LINUX_KERNEL_VERSION .config) # grab the kernel config 
variable
kernelver=$BR2_LINUX_KERNEL_VERSION # what kernel are we using
kerneldir=$(readlink -e output/build/linux-$kernelver) # convert 
relative path to absolute
configscript=$kerneldir/scripts/config # a handy utility shipped with 
the kernel source
$configscript --file $kerneldir/.config --enable CONFIG_USB_XHCI_HCD # 
USB 3.x support
make --directory=$kerneldir olddefconfig # change to kernel source 
directory to fill out the kernel .config file
make linux-rebuild # rebuild a bit of stuff due to the kernel config changes
make
# output/images/bzImage should be ready to boot up if copied to 
/boot/bzImage on another system
# login as root with no password and run "ffmpeg -i Splash.jpg junk.jpg"
# The message of interest will be near the top of the FFmpeg output

-------------- next part --------------
A non-text attachment was scrubbed...
Name: Splash.jpg
Type: image/jpeg
Size: 40354 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171030/f165fce6/attachment-0001.jpg>
