From: universe II <universeii@gmx.de>
Date: Fri, 12 Apr 2013 11:51:07 +0200
Subject: [Buildroot] Extending buildroot functionality for creating board
 support packages (BSP) out of buildroot tree
Message-ID: <5167D90B.3020601@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
we are using buildroot for porting an existing embedded PowerPC board to 
linux. For this purpose we have to make modifications to the kernel 
(adding and changing files to support custom hardware). This can easily 
be done by enabling custom patches in the menuconfig.
This is a wonderful solution when the development of the kernel 
modifications is done and the patches are existing but during 
development this could be time consuming. The reason is that we can not 
do the kernel modifcations in the kernel tree itself but in a completely 
separated directory structure. This is caused by our existing version 
control system and by project development requirements.

Imagine that you made a small modification to one of the custom files  
(e.g. changing a printk() statement) and you want to re-build the 
kernel. You have to develop a script which takes a virgin kernel, 
extracts the gz file, makes a copy of the tree, modifies the files in 
the copy and then creates the patch and copies this patch to the 
buildroot tree. Even on a fast hardware this takes some time and you 
have to do it for every change.

I spent some time this morning to evaluate if there could be a more 
elegant solution. Here is what I've done:
1) In linux/Config.in: Add a new entry to the kernel menuconfig which 
allows to enter a script name or a directory name (similar to the custom 
patch option)
2) In linux/linux.mk: After unpacking the kernel and applying the 
patches (if any) the given script or all scripts in the given directory 
are executed.

This allows me to make modification to the unpacked kernel tree without 
the need to create patch files but also opens up flexibility for other 
functionality which may arise in the future.

Let me know what you think about this. If you are interested in 
incorporating these changes into the official buildroot suite, l can 
provide the changes I made.

Regards,
Andreas
