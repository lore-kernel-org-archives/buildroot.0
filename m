From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 7 Jul 2007 10:40:55 -0700
Subject: [Buildroot] [buildroot 0000881]: Buildroot new feature: Generate
	initramfs description file of root filesystem for initial
	kernel ramdisk
Message-ID: <930e7c1e952d0d737cff48cfd7425008@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=881 
====================================================================== 
Reported By:                fred
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   881
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-24-2006 16:27 PDT
Last Modified:              07-07-2007 10:40 PDT
====================================================================== 
Summary:                    Buildroot new feature: Generate initramfs
description file of root filesystem for initial kernel ramdisk
Description: 
This patch contains a new target "initramfs" which builds a description
file for the initial kernel ramdisk. I use this together with kernel
2.6.12. The mechanism is based on a shell script "gen_initramfs_list.sh"
which is provided together with the kernel. The description file is then
used to build a cpio filesystem via the gen_init_cpio tool during the
kernel build.

This is inspired by the procedure described here: 

http://www.student.tue.nl/Q/t.f.a.wilms/adm5120/

That procedure produces an ext2 filesystem with buildroot. Then this
filesystem is mounted in the kernel build directory where
"gen_initramfs_list.sh" produces a filesystem description file which is
used then by gen_init_cpio to produce the cpio filesystem. This procedure
requires root rights to mount the filesystem. The idea is to produce the
filesystem description file directly from buildroot. Then the complete
kernel including rootfilesystem as ramdisk can be build as normal user.

The patch adds a new target and modifies the config.in file in the target
directory.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-01-06 10:12  
---------------------------------------------------------------------- 
That's an excellent idea except for the mount.

Please be so kind and update the patch to
     select tarroot # or however the creation of a tarball is named

or just ln -s the build_$()/root to the dir gen_initramfs expects.
Also, it's easier for me if you could (also) send the patch with a copy'n
paste of the adjusted description above to the mailing-list.

TIA! 

---------------------------------------------------------------------- 
 fred - 02-12-07 06:05  
---------------------------------------------------------------------- 
Hi,

thanks for the reply to the patch! Unfortunatly I do not get the
suggestion you made below. Just to make sure: Is it clear that you do not
need to mount any filesystem with this proposed procedure? 

Regards

Friedrich 

---------------------------------------------------------------------- 
 bernhardf - 07-07-07 10:40  
---------------------------------------------------------------------- 
No it was not clear, but you're right: There is no mount involved.

The patch as-is is not terribly useful, though:
We most likely do not want the full root/ in the initramfs (since it
consists of compilers, applications like libtool, perl, etc, eventually).

What we would need is a way to auto-generate a list of files that are
supposed to be in the initramfs, like busybox stuff to load modules/spawn
a shell and so on.

Perhaps the shell script should optionally take a list of files that
should be put in the initramfs_list and only use the full content of
staging_dir/root/ if such a file was not specified?

What do you think? Care to implement this?
cheers, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-24-06 16:27  fred           New Issue                                    
05-24-06 16:27  fred           Status                   new => assigned     
05-24-06 16:27  fred           Assigned To               => uClibc          
05-24-06 16:27  fred           File Added: buildroot_initramfs_target.patch     
              
12-01-06 10:12  bernhardf      Note Added: 0001850                          
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
02-12-07 06:05  fred           Note Added: 0002153                          
07-07-07 10:36  bernhardf      File Added: br2.bug-881.01.diff                  
 
07-07-07 10:40  bernhardf      Note Added: 0002558                          
======================================================================
