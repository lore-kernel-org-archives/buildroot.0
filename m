From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:43 -0800
Subject: [Buildroot] [buildroot 0000290]: (buildroot) udev doesn't manage
	/dev when it's configured [patch included]
Message-ID: <7b1e6b9a5d9c6c6dbe9016be606a5940@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=290 
====================================================================== 
Reported By:                db
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   290
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-06-2005 00:09 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    (buildroot) udev doesn't manage /dev when it's
configured [patch included]
Description: 
As is well known by now, "devfs" is about to be removed from Linux 2.6
kernels.
Plus it turns out that embedded systems tend to use that more than most
other
systems, for various reasons ... including systems that buildroot makes.

Buildroot hasn't yet been able to rely on "udev" since it doesn't turn it
on.
It just sits there dead, doing nothing useful.

This patch provides a basic working integration of udev-058 (current)
with
buildroot, and has been tested with Linux 2.6.12-rc5 on two ARM9 cores.
The model is a basic one (no initramfs or initrd), and it just sets up a
ramfs /dev holding the system's device nodes.  The integration will
likely
be improved or tweaked in system-specific ways.  And it seems like udev
hasn't yet been tuned for work on embedded systems either...

====================================================================== 

---------------------------------------------------------------------- 
 andersen - 06-09-05 03:08  
---------------------------------------------------------------------- 
I note that udev.mk is trying to run mkdev.  This is bad, because
mkdev requires root, and buildroot should never be run as root,
lest a typo might result in nuking something in your build system.

It would be far better to fix the buildroot tar target to use fakeroot
rather than kluding in calls to mkdev and running as root.  A version
of busybox mkdevs that uses the device tables used for cramfs, jffs2,
and ext2 targets could make generating needed device nodes with fakeroot
a pretty simple task.  The busybox makedevs +
busybox/patches/makdevs_table.diff
would do the trick...

Anyway, for now I've nuked the mkdev calls. 

---------------------------------------------------------------------- 
 db - 06-09-05 13:03  
---------------------------------------------------------------------- 
Hmm, I see this patch has been partially integrated; thanks.  The
result is still an un-bootable system however:

 - The resulting root fs images -- the raw build_*/root image as
   well as the root_fs_*.tar image -- aren't bootable because of
   the missing device nodes.  OK, you've explained why you don't
   like that, but the result is still an un-bootable image.

 - You changed when the UDEV init script is run, so that it's too
   late.  It's got to run _before_ the "mount -a", since it's
   providing a whole new /dev/ file system.  This matters for
   things like accessing the /dev/pts files so "ssh" works, as
   well as (on systems that care) /dev/shm.

I've got a patch fixing these two, which I'll add here after I've
had time to test this with the other stuff I've got in the works.

(No, I can't use jffs2 or cramfs images.  The development cycle
starts with NFS root, and jffs2 comes later.  Also, that busybox
makdevs_table.diff won't solve the problem, since the resulting
filesystem doesn't boot far enough to run busybox ... it's missing
the console, so Linux chokes, as well as two files needed by the
C runtime.) 

---------------------------------------------------------------------- 
 db - 06-14-05 22:38  
---------------------------------------------------------------------- 
Here's the patch I'm using on top of current SVN. 

---------------------------------------------------------------------- 
 andersen - 06-24-05 00:39  
---------------------------------------------------------------------- 
The result is still an un-bootable system however since you did not read my
suggestion about using fakeroot and possibly makedevs.  :-)

Your br2-udev-v2.patch is not acceptible since it relies on using 'mknod',
which requires that buildroot be run as root.  If you run buildroot as root
then the next time someone (me, you, anyone) makes a small typo, your
entire build system could be completely destroyed.  I don't want that on
my conscience, and you certainly don't want that to happen the night
before you have to ship a product or are about to demo your last 6 months
of work to a client.....

Please come up with a different solution.  I recommend taking a look at
target/tar/tarroot.mk and/or target/squashfs/squashfsroot.mk for
acceptible methods of creating device nodes for the target. 

---------------------------------------------------------------------- 
 pnoffke - 08-08-05 02:18  
---------------------------------------------------------------------- 
I think a way to fix this is as follows:

If udev is selected for the target, use a different device table.

I've modified target/generic/Makefile.in, and created a udev device table
in target/generic/udev_table.txt.  I also modified my inittab, init.d/rcS,
and package/udev/init-udev (i.e. S10udev).  Now, rcS is the first thing
run, which mounts /proc and /sys without updating mtab, followed by
remounting the root filesystem in read-write mode and updating the mtab. 
Finally, the init scripts are run, with udev being the first (assuming
there's no script less than S10) if it's used.  Also, the S10udev script
was changed to correctly parse the output of /proc/mounts when looking for
/sys.

I'm not sure if I'm doing things in the correct order, so please have a
quick read of the inittab and scripts and let me know if there's anything
horribly wrong.

I am not yet able to use svn (for doing a diff and producing patches) from
behind my company's firewall, so I will just upload the modified/new files.
 

For naming clarity, it might be better to rename the device_table.txt file
to devfs_table.txt, and update Makefile.in accordingly.

 

---------------------------------------------------------------------- 
 pnoffke - 08-11-05 16:42  
---------------------------------------------------------------------- 
I should have mentioned that the devices are created only when building a
tar/ext2/jffs2/... image of your root filesystem.  It relies on
fakeroot/makedevs to create the devices.  It's also in keeping with
allowing buildroot to be run as a non-root user. 

---------------------------------------------------------------------- 
 bernhardf - 12-01-06 09:57  
---------------------------------------------------------------------- 
hmz. Thanks for the patches, but udev was added a long time ago.
It was updated to udev-100 in r16746.
Thanks alot for the patches and the report anyway. Cheers, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-06-05 00:09  db             New Issue                                    
06-06-05 00:09  db             File Added: br2-udev.patch                    
06-09-05 03:08  andersen       Note Added: 0000239                          
06-09-05 13:03  db             Note Added: 0000241                          
06-14-05 22:38  db             Note Added: 0000243                          
06-14-05 22:39  db             File Added: br2-udev-v2.patch                    
06-24-05 00:39  andersen       Note Added: 0000255                          
08-07-05 22:00  pnoffke        Note Added: 0000391                          
08-07-05 22:01  pnoffke        File Added: udev_table.txt                    
08-07-05 22:02  pnoffke        File Added: Makefile.in                      
08-07-05 22:10  pnoffke        Issue Monitored: pnoffke                     
08-07-05 23:00  pnoffke        Note Edited: 0000391                         
08-08-05 01:52  pnoffke        Note Edited: 0000391                         
08-08-05 01:53  pnoffke        File Added: inittab                          
08-08-05 01:53  pnoffke        File Added: rcS                              
08-08-05 02:13  pnoffke        File Added: S10udev                          
08-08-05 02:18  pnoffke        Note Edited: 0000391                         
08-11-05 16:42  pnoffke        Note Added: 0000406                          
12-01-06 09:57  bernhardf      Status                   assigned => closed  
12-01-06 09:57  bernhardf      Note Added: 0001847                          
12-01-06 09:57  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
