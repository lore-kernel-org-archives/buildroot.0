From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:21 -0800
Subject: [Buildroot] [buildroot 0000592]: Passing the "j" option to tar
	causes /dev to be populated incorrectly.
Message-ID: <4a15a2fbac0334312c0b79fb28ee4f2b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=592 
====================================================================== 
Reported By:                mikee
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   592
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-09-2005 14:10 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    Passing the "j" option to tar causes /dev to be
populated incorrectly.
Description: 
In the menuconfiguration, you can select to tar the root file system once
it is built. There is also a place to pass options to tar. If you pass the
'j' option (compress the archive using bzip2), the contents of the /dev/
folder will just be regular files instead of character devices and such.

Also, perhaps a test should be run on the options passed to tar and if 'z'
or 'j' are included, rename the end file to rootfs_xxx.tar.gz or
rootfs_xxx.tar.bz2.


====================================================================== 

---------------------------------------------------------------------- 
 vapier - 12-09-05 18:33  
---------------------------------------------------------------------- 
i'm pretty sure this is unrelated to tar at all

last i checked, the device nodes were always screwed up 

---------------------------------------------------------------------- 
 mikee - 12-10-05 09:07  
---------------------------------------------------------------------- 
I guess I can't say for sure that this is a tar thing or not.
Here is what I did:

- make menuconfig
- pass the "j" option to tar
- make
- sudo cp rootfs_xxx.tar /usr/local/nfs-export-dir
- cd /usr/local/nfs-export-dir
- sudo tar -xjf rootfs_xxx.tar
- ls -l dev

This is when I noted that the device nodes had not been
properly created. So, I went back to the buildroot directory
and did:

- rm rootfs_xxx.tar
- make menuconfig
- clear passing the "j" option to tar
- make
- sudo cp rootfs_xxx.tar /usr/local/nfs-export-dir
- cd /usr/local/nfs-export-dir
- sudo tar -xjf rootfs_xxx.tar
- ls -l dev

This time, everything was fine. I've noticed this happen
before as well but can't say for certain that passing
the "j" option to tar always messes it up.

Perhaps this is just a general bug in the script used
to create the device nodes?

--mikee 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-09-05 14:10  mikee          New Issue                                    
12-09-05 14:10  mikee          Status                   new => assigned     
12-09-05 14:10  mikee          Assigned To               => uClibc          
12-09-05 18:33  vapier         Note Added: 0000756                          
12-10-05 09:07  mikee          Note Added: 0000757                          
02-10-06 12:44  prpplague      Status                   assigned => closed  
02-10-06 12:44  prpplague      Resolution               open => won't fix   
02-10-06 12:44  prpplague      Additional Information Updated                   

02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
