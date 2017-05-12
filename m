From: Steve Kenton <skenton@ou.edu>
Date: Fri, 12 May 2017 23:40:20 +0000
Subject: [Buildroot] libfakeroot problem - solved
In-Reply-To: <f672b599-946e-6bdc-236a-7508df02dc30@ou.edu>
References: <f672b599-946e-6bdc-236a-7508df02dc30@ou.edu>
Message-ID: <188f3de7-0bdc-4bda-0499-6127018e05c0@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/2017 05:06 PM, Steve Kenton wrote:

> I've got an embedded project I would like to update from 2016.05 to 
> 2017.05 so I pulled the latest snapshot late last night.
> The 64-bit build always gets an error with libfakeroot. Is this a 
> known issue? I just resubscribed, but I did not see anything obvious 
> in the archives.
>
> My development box runs Ubuntu and to make testing easier I try to use 
> a compatible kernel/headers, hence the 4.4
>
> hdi at hdi-H110N:~/updatetest/buildroot-2017.05$ uname -a
> Linux hdi-H110N 4.4.0-72-generic #93~14.04.1-Ubuntu SMP Fri Mar 31 
> 15:05:15 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
>
> Here is what I have for a stripped down defconfig after "make 
> savedefconfig"
>
> hdi at hdi-H110N:~/updatetest/buildroot-2017.05$ more defconfig
> BR2_x86_64=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_KERNEL_HEADERS_4_4=y
>
> Here are the last few lines after "make olddefconfig; make"
>
> ERROR: ld.so: object 'libfakeroot.so' from LD_PRELOAD cannot be 
> preloaded (cannot open shared object file): ignored.
> /usr/bin/install -m 0644 support/misc/target-dir-warning.txt 
> /home/hdi/updatetest/buildroot-2017.05/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
>
OK, I found it. It was leakage from the build host. Testing something 
for the embedded system I had run getcap to give /bin/tar some 
capabilities and did not remove them afterwards. Somehow that interacted 
badly with libfakeroot and the creation of output/images/rootfs.tar at 
the end of the build. The reason I did not see it on the 32-bit builds 
is that being intended for recovery and reinstall they used initramfs 
linked into the kernel for the rootfs instead of the  rootfs.tar file. 
When the libfakeroot issue manifested, root did not own the root 
filesystem files in rootfs.tar when it was expanded with "sudo tar xf  
rootfs.tar ....." Which resulted in a system which was bootable but 
would not run properly because of the file ownership/permission problems.

This was clearly a self inflicted problem, but the fact that tar is not 
included in the output/host/* tools and thus the build system /bin/tar 
was used certainly make it "interesting" to find.

Steve Kenton
