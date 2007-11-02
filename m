From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 1 Nov 2007 21:22:35 -0700
Subject: [Buildroot] [buildroot 0001570]: external toolchain option not
	copying libraries properly
Message-ID: <d9b9f78eeaf3bf9b771a2e4bf4527204@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1570 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1570
Category:                   Other
Reproducibility:            sometimes
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-01-2007 21:22 PDT
Last Modified:              11-01-2007 21:22 PDT
====================================================================== 
Summary:                    external toolchain option not copying libraries
properly
Description: 
toolchain/ext-tool.mk has a complicated bunch of code for copying libraries
from the external toolchain to the system root. 

It calls gcc -print-file-name and on my system the path returned is
actually a symlinked directory within the staging_dir, for some reason. It
uses the result to call find, but find won't follow the symlink and then
doesn't find the libraries.

My external toolchain was built by a different buildroot project and lives
in the same staging dir. gcc -print-file-name is returning

/home/hamish/work/elara/buildroot/build_armeb/staging_dir/lib/gcc/armeb-linux-uclibcgnu/4.1.2/../../../../armeb-linux-uclibcgnu/lib

which is a symlink to

/home/hamish/work/elara/buildroot/build_armeb/staging_dir/lib/gcc/armeb-linux-uclibcgnu/4.1.2/../../../../lib


Adding -H to find causes it to follow links in the command-line parameters
(but not during the actual find), which solves it.

Another alternative would be some sort of path canonicalisation tool, like
$(realpath ...) in Make, but there doesn't appear to be a standard POSIX
shell function for this.

The attached patch adds -H to the find flags.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-01-07 21:22  hmoffatt       New Issue                                    
11-01-07 21:22  hmoffatt       Status                   new => assigned     
11-01-07 21:22  hmoffatt       Assigned To               => buildroot       
11-01-07 21:22  hmoffatt       File Added: br-ext-toolchain.diff                
   
======================================================================
