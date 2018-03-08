From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 8 Mar 2018 15:13:26 +0200
Subject: [Buildroot] Unable to build Buildroot
In-Reply-To: <20180308130135.GA1675@pema>
References: <20180308130135.GA1675@pema>
Message-ID: <20180308131326.r3ero3f7mrpzn7pr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sh?rab,

On Thu, Mar 08, 2018 at 02:01:35PM +0100, Sh?rab wrote:
> Dear all,
> 
> I am not able to build Buildroot any longer, although it used to work
> and I can't remember of any change on the machine used tobuild.
> 
> Here is what happens just before the failure:
> 
> making all in debugfs
> 	MK_CMDS debug_cmds.c
> 	CC debugfs.c
> 	CC util.c
> 	CC ncheck.c
> 	CC icheck.c
> 	CC lsdel.c
> 	CC ls.c
> 	CC set_fields.c
> 	CC dump.c
> 	CC logdump.c
> 	CC htree.c
> 	CC unused.c
> 	CC e2freefrag.o
> 	CC filefrag.c
> 	MK_CMDS extent_cmds.c
> 	CC extent_inode.c
> 	CC zap.c
> 	CC create_inode.o
> ./../misc/create_inode.c: In function ?set_inode_xattr?:
> ./../misc/create_inode.c:140:9: warning: implicit declaration of function ?llistxattr?; did you mean ?lstat64?? [-Wimplicit-function-declaration]
>   size = llistxattr(filename, NULL, 0);
>          ^~~~~~~~~~
>          lstat64
> ./../misc/create_inode.c:176:16: warning: implicit declaration of function ?lgetxattr?; did you mean ?getdate_r?? [-Wimplicit-function-declaration]
>    value_size = lgetxattr(filename, name, NULL, 0);
>                 ^~~~~~~~~
>                 getdate_r
> ./../misc/create_inode.c: At top level:
> ./../misc/create_inode.c:399:18: error: conflicting types for ?copy_file_range?
>  static errcode_t copy_file_range(ext2_filsys fs, int fd, ext2_file_t e2_file,
>                   ^~~~~~~~~~~~~~~
> In file included from ./../misc/create_inode.c:19:0:
> /usr/include/unistd.h:1110:9: note: previous declaration of ?copy_file_range? was here
>  ssize_t copy_file_range (int __infd, __off64_t *__pinoff,

Your host seems to have glibc 2.27 installed. In this version glibc added 
copy_file_range() which collides with a local definition of the same symbol in 
e2fsprogs. This issue is fixed in e2fsprogs commit 01551bdba1 (misc: rename 
copy_file_range to copy_file_chunk), which is included in version 1.43.8. The 
latest Buildroot release, 2018.02, has 1.43.9.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
