From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Mar 2013 08:22:13 +0100
Subject: [Buildroot] [PATCH 4/6] fs/ext2: use the ext2 variant to name
 the generated rootfs image
In-Reply-To: <201303122351.55358.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <1d86b1b76a2c56aaf0098ec389e570862e7aa3fb.1362693453.git.yann.morin.1998@free.fr>
 <20130310145501.7e5dec1f@skate> <201303122351.55358.yann.morin.1998@free.fr>
Message-ID: <51417AA5.7050503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 23:51, Yann E. MORIN wrote:
> So, what next? I see four options:
>
>   0- don't rename anything, continue calling it .ext2 (although it may be
>      ext2, ext3 or ext4): status-quo;
>   1- only rename the fs directory, which*is*  transparent
>        - fs/ext2                 ->  fs/ext
>   2- completely rename the filesystem:
>        - fs/ext2                 ->  fs/ext
>        - BR2_TARGET_ROOTFS_EXT2  ->  BR2_TARGET_ROOTFS_EXT
>      but do not fix the defconfigs and boards doc. Anyway, add a deprecated
>      symbol for BR2_TARGET_ROOTFS_EXT2.
>   3- same as 3, but also fix defconfigs and boards doc.
>
> For all those four options, we can add a post-fs-hook that symlinks the
> image file with the correct extension.
>
> Finally, the curent proposal (allow to specify the FS extension) is not
> incompatible with any of the above four options.

  I don't have a problem with the directory and the config symbol using 
ext2 - these are anyway internal kitchen. I wouldn't want to change only 
the directory name and not the config symbol, because that does make 
reading the code more difficult.

  What is important, is that the name in the images directory has the 
correct extension. This can be done either by the addition ROOTFS_TARGET 
argument, or by symlinking in a post-hook. I'm slightly in favour of the 
latter, because it is much simpler. On the other hand, Yann has done the 
change already and it may be useful for other filesystems at some point too.

  So for me, it is either Yann's implementation, or symlinking in a 
post-hook.


  BTW, note that the image still is an ext2 image (it can be read by ext2 
code). So having the rootfs.ext4 -> rootfs.ext2 symlink is not a problem 
at all.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
