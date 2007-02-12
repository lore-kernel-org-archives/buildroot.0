From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:54 -0800
Subject: [Buildroot] [buildroot 0000371]: Fakeroot ext2 root some /dev
	entries are just files, erratic rootfs creation behaviour
Message-ID: <1a3ddd430767216c25c19a7317c041cb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=371 
====================================================================== 
Reported By:                emalkowski
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   371
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-08-2005 12:38 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    Fakeroot ext2 root some /dev entries are just files,
erratic rootfs creation behaviour
Description: 
Using ext2root filesystem synced through 11060 this morning, my /dev/hda*
or /dev/hdb* inodes are showing up as regular files.  Sometimes both hda
and hdb entries are files, other times just hdb entries.

I can't tell if makedevs is broken or fakeroot is playing havoc here
(hosed $(STAGING_DIR)/fakeroot.env file?)

Also -- the recent change to makedevs.mk to add these lines seem bogus:

-$(STAGING_DIR)/fakeroot.env:
-       cat $(STAGING_DIR)/.fakeroot.* > $(STAGING_DIR)/fakeroot.env
-       touch -c $(STAGING_DIR)/fakeroot.env
-

w/o ltp testsuite configured, $(STAGING_DIR)/.fakeroot.* will NOT exist! 
but in my builds, cat of something that doesn't exist doesn't error out
the make and it seems to zero fakeroot.env which is what I was doing
before to get consistency when changing around my rootfs and rebuilding.

If I hack the top level makefile to delete fakeroot.env and also manually
purge my $(TARGET_DIR), I get my /dev/hda entries as devices and hdb as
files.  If I don't delete fakeroot.env and manually purge $(TARGET_DIR)
and rebuild, I get both /dev/hda and /dev/hdb entries as all files.

This is frustrating -- how can I debug this further?  I really can't tell
what's going on.

What I'd like to be able to do is simply this:

tweek something in my target/device/*/target_skeleton
rm -rf build_i386/root
make

An have the newly built build_i386/root be correct...  Shouldn't a purge
of $(STAGING_DIR)/fakeroot.env before doing the make above just make it
rebuild everything?

====================================================================== 

---------------------------------------------------------------------- 
 emalkowski - 08-08-05 14:01  
---------------------------------------------------------------------- 
Ok -- I figured out what the heck's going on here:

It seems filesystem cache on the host is the root cause of my problem. 
After makedevs is done doing it's work, it exits and all of the relevant
fakeroot inode info doesn't get synced out into
$(STAGING_DIR)/fakeroot.env -- in my case it's some or all of my /dev/hd*
entries in my rootfs.  It turns out my /dev/hd* entries are the last ones
listed in the device table -- which makes sense as the last handful of
work makedevs is doing is getting lost due to the fate of the filessytem
cache.

My fix for this is to add a "sync" to the end of the makedevs.c sourcecode
right before it exits although that seems kind of drastic / kludgy /
hackish etc.

I'll leave it up to you guys how you'd like to fix it for real.  Sorry
about my frustrating report above...  this was really making me pull some
hair out.

Here's my diff to makedevs.c:

malk at malk-lt-lnx:~/athena/buildroot$ svn diff target/makedevs/makedevs.c
Index: target/makedevs/makedevs.c
===================================================================
--- target/makedevs/makedevs.c  (revision 16)
+++ target/makedevs/makedevs.c  (working copy)
@@ -527,5 +527,7 @@
        }
        fclose(table);
 
+    system("/bin/sync");
+
        return 0;
 }

The part above about getting different amounts /dev/hd* entries correct is
explained by different amounts of filesystem activity depending on how I
re-made my root.  Sometimes I would get lucky and a good portion of the
inodes makedevs would modify would make it into fakeroot.env.

One possible fix that comes to mind would be to try and have the fakeroot
related work all get done in one invocation of fakeroot (make a script?)
and thus avoid the usage of fakeroot.env file.  Or perhaps fakeroot needs
to be changed so when the program under the faked root is done running (in
this case makedevs), make sure fakeroot.env is all dumped out properly... 
perhaps fakeroot is at too high of a layer to know some of those inodes
are just cached on the host's filesystem.

Hope this helps save on some other folks' hair pulling :) 

---------------------------------------------------------------------- 
 andersen - 04-10-06 17:07  
---------------------------------------------------------------------- 
latest buildroot now executes all fakeroot commands as a script
using a single invocation of fakeroot, which should prevent any
such problems. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-05 12:38  emalkowski     New Issue                                    
08-08-05 12:38  emalkowski     Status                   new => assigned     
08-08-05 12:38  emalkowski     Assigned To               => uClibc          
08-08-05 14:01  emalkowski     Note Added: 0000395                          
04-10-06 17:07  andersen       Note Added: 0001250                          
04-10-06 17:07  andersen       Status                   assigned => closed  
04-10-06 17:07  andersen       Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
