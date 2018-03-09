From: =?utf-8?Q?Sh=C3=A9rab?= <Sebastien.Hinderer@ens-lyon.org>
Date: Fri, 9 Mar 2018 20:11:51 +0100
Subject: [Buildroot] Unable to build Buildroot
In-Reply-To: <20180308131326.r3ero3f7mrpzn7pr@tarshish>
References: <20180308130135.GA1675@pema>
 <20180308131326.r3ero3f7mrpzn7pr@tarshish>
Message-ID: <20180309191151.GA11285@pema>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

Many thanks for your prompt and helpful response!

Baruch Siach (2018/03/08 15:13 +0200):
> Hi Sh?rab,
> 
> On Thu, Mar 08, 2018 at 02:01:35PM +0100, Sh?rab wrote:
> > Dear all,
> > 
> > I am not able to build Buildroot any longer, although it used to work
> > and I can't remember of any change on the machine used tobuild.
> > 
> > Here is what happens just before the failure:
> > 
> > making all in debugfs
> > 	MK_CMDS debug_cmds.c
> > 	CC debugfs.c
> > 	CC util.c
> > 	CC ncheck.c
> > 	CC icheck.c
> > 	CC lsdel.c
> > 	CC ls.c
> > 	CC set_fields.c
> > 	CC dump.c
> > 	CC logdump.c
> > 	CC htree.c
> > 	CC unused.c
> > 	CC e2freefrag.o
> > 	CC filefrag.c
> > 	MK_CMDS extent_cmds.c
> > 	CC extent_inode.c
> > 	CC zap.c
> > 	CC create_inode.o
> > ./../misc/create_inode.c: In function ?set_inode_xattr?:
> > ./../misc/create_inode.c:140:9: warning: implicit declaration of function ?llistxattr?; did you mean ?lstat64?? [-Wimplicit-function-declaration]
> >   size = llistxattr(filename, NULL, 0);
> >          ^~~~~~~~~~
> >          lstat64
> > ./../misc/create_inode.c:176:16: warning: implicit declaration of function ?lgetxattr?; did you mean ?getdate_r?? [-Wimplicit-function-declaration]
> >    value_size = lgetxattr(filename, name, NULL, 0);
> >                 ^~~~~~~~~
> >                 getdate_r
> > ./../misc/create_inode.c: At top level:
> > ./../misc/create_inode.c:399:18: error: conflicting types for ?copy_file_range?
> >  static errcode_t copy_file_range(ext2_filsys fs, int fd, ext2_file_t e2_file,
> >                   ^~~~~~~~~~~~~~~
> > In file included from ./../misc/create_inode.c:19:0:
> > /usr/include/unistd.h:1110:9: note: previous declaration of ?copy_file_range? was here
> >  ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
> 
> Your host seems to have glibc 2.27 installed. In this version glibc added 
> copy_file_range() which collides with a local definition of the same symbol in 
> e2fsprogs. This issue is fixed in e2fsprogs commit 01551bdba1 (misc: rename 
> copy_file_range to copy_file_chunk), which is included in version 1.43.8. The 
> latest Buildroot release, 2018.02, has 1.43.9.

Okay thanks a lot!

I am facing another problemnow which may be slightly off-topic here but
let me try.

The buildroot I am using is a submoduleof this repository:

https://github.com/mlang/brlpi

Although I did makeclean etc., the buildroot submodule was not updated
and I was not able to find a way to ask git to update it through a
submodule subcommand.

So I went to the buildroot subdirectory, did a git fetch and then
checked out 2018.02, which worked.

But then when I tried to run make cleand and make again to rebuild my
image,

quickly I got the following error message:

umask 0022 && make -C /home/shindere/src/brlpi/buildroot O=/home/shindere/src/brlpi/brlpi0w/.
/home/shindere/src/brlpi/package/brltty/brltty.mk:104: *** Package
'brltty' defined a second time in
'/home/shindere/src/brlpi/package/brltty/'; previous definition was in
'package/brltty/'. Arr?t.

I'm sory but I have no idea how to deal with this. Any suggestion would
be welcome.

Thanks,

Sh?rab.
> 
> baruch
> 
