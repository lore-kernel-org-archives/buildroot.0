From: brianclements <brian@brianclements.net>
Date: Thu, 1 May 2014 11:25:12 -0700 (PDT)
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <CAAXf6LUM+sLYvcGFEBEaXXfpHRDVaED1W1cM87pg3De6ynLWTw@mail.gmail.com>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
 <1396855570069-66989.post@n4.nabble.com>
 <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
 <1396897179003-67022.post@n4.nabble.com>
 <CAAXf6LUM+sLYvcGFEBEaXXfpHRDVaED1W1cM87pg3De6ynLWTw@mail.gmail.com>
Message-ID: <1398968712814-68658.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
I finally have an update for you. I was able to import your rootfs.tar into
docker and use it to successfully pull that git repo without any issue. This
is great! I've tested numerous times and it seems to be sticking that way.
Now, to figure out what's different between your image and mine. I suspect
it's one of two things you did that made the difference:

1) using ext2 in the image and specifying that disksize (less likely) or
2) using an external toolchain (most likely)

the ext2 option is no problem, I'll just include that in the config, but how
do you specify and use an external toolchain? Where do I obtain the
toolchain you used and compile using it?


Thomas De Schampheleire wrote
> Hi Brian,
> 
> On Mon, Apr 7, 2014 at 8:59 PM, brianclements &lt;

> brian@

> &gt; wrote:
>> Hi Thomas,
>>
> [..]
> 
>> Let me ask you this, can you possibly just compile a version of busybox
>> with
>> x86_64, largefile, and git and link me up with the resulting tar? (only
>> probably around 10mb). That might be a quicker way to duplicate this
>> error
>> then me trying to learn my way through qemu and introduce another set of
>> variables for me to mess up. That way I can see if a working version is
>> even
>> possible when implemented with Docker and we can possibly get rid of that
>> variable as well, especially if your image works for you.
>>
> 
> I now took the time to generate such an image.
> I started from the qemu_x86_64 defconfig, and changed:
> - use of external toolchain rather than buildroot-built toolchain (to
> save built time). This external toolchain includes largefile support.
> - add git, dhcpcd (I needed this to get proper networking from qemu)
> 
> When running the image, I did:
> - login (root)
> - dhcpcd (get ip address)
> - echo 'nameserver 8.8.8.8' > /etc/resolv.conf  (set up DNS with
> Google's public DNS)
> - git clone git://github.com/EllisLab/CodeIgniter
> 
> This works fine. I had to increase the size of the ext2 rootfs (used
> in qemu instead of rootfs.tar) to get enough space, but other than
> that no problems.
> 
> The rootfs.tar is 15M, the bzImage (kernel) is 2.2M. If you have a
> place where I can upload it to, let me know.
> 
> The defconfig is as below:
> 
> BR2_x86_64=y
> BR2_DL_DIR="/home/tdescham/repo/contrib/dl"
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.13.config"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_GIT=y
> BR2_PACKAGE_DHCPCD=y
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_BLOCKS=200000
> 
> Best regards,
> Thomas
> _______________________________________________
> buildroot mailing list

> buildroot@

> http://lists.busybox.net/mailman/listinfo/buildroot





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-7016-New-Git-issues-in-resulting-buildroot-tar-tp66457p68658.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
