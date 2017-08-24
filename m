From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Aug 2017 19:33:54 +0200
Subject: [Buildroot] simicsfs 1.18 does not build with kernel 4.12.2
In-Reply-To: <CAEUhbmWTZY-zU6c_yEFpp+HR2xuGj5FiZjGVDumSrAuAg+kG5A@mail.gmail.com>
References: <CAEUhbmWTZY-zU6c_yEFpp+HR2xuGj5FiZjGVDumSrAuAg+kG5A@mail.gmail.com>
Message-ID: <20170824193354.782bae38@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm adding in Cc Matt Weber, who has added the simicsfs package. Matt,
if you can have a look at Bin's e-mail and my reply, and give some
feedback, it would be useful. Thanks!

On Thu, 24 Aug 2017 20:47:39 +0800, Bin Meng wrote:

> I am using buildroot 2017.08-rc3 to build a rootfs for minnowboard
> max. What I did is:
> 
> $ make minnowboard_max_defconfig
> $ make menuconfig
> 
> Select "Target packages" -> "File system and flash utilities" -> simicsfs
> 
> $ make
> 
> The error message is:
> 
> buildroot/output/build/simicsfs-1.18/./hostfs_file.c:67:43: error:
> ?struct file? has no member named ?f_dentry?; did you mean ?f_owner??
>   DPRINT1("hostfs: hostfs_read %ld\n", file->f_dentry->d_inode->i_ino);
> 
> buildroot/output/build/simicsfs-1.18/./hostfs_file.c:151:2: error:
> unknown field ?aio_read? specified in initializer
>   .aio_read = hostfs_aio_read,
> 
> buildroot/output/build/simicsfs-1.18/./hostfs_file.c:152:2: error:
> unknown field ?aio_write? specified in initializer
>   .aio_write = hostfs_aio_write,
> 
> buildroot/output/build/simicsfs-1.18/./hostfs_inode.c:174:10: error:
> implicit declaration of function ?inode_change_ok?
> [-Werror=implicit-function-declaration]
>   error = inode_change_ok(inode, iattr);
> 
> buildroot/output/build/simicsfs-1.18/./hostfs_inode.c:248:25: error:
> ?PAGE_CACHE_SHIFT? undeclared (first use in this function)
>   pgoff_t index = pos >> PAGE_CACHE_SHIFT;
> 
> <snip>
> 
> Although the README in the simicsfs 1.18 package says: Linux kernel
> 2.6.12 and later only. I believe this package does not build for
> latest kernel like v4.12.2.

This is not really Buildroot's fault: simicsfs-1.18 is simply not
compatible with Linux 4.12.

Unfortunately, simicsfs is no longer available at
http://download.simics.net/pub/simicsfs-1.18.tar.gz, where Buildroot
currently downloads it. The build only succeeds because we have a
backup of this tarball at http://sources.buildroot.net.

In addition, when you look at
http://www.cs.sfu.ca/~fedorova/Tech/simics-guides-3.0.26/simics-user-guide-unix/topic33.html,
the https://www.simics.net/pub/simicsfs.tar.gz now redirects to
Windriver. So it seems like Windriver has now taken over the
development of this tool, which generally isn't a very good sign in
terms of openness.

So I guess that if you need simicsfs, compatible with Linux 4.12,
you'll have to patch the source code yourself. Of course, such a patch
would be welcome in Buildroot, so that other users could benefit from
it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
