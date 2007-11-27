From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 13:28:49 -0800
Subject: [Buildroot] [buildroot 0001568]: "make BOARD=xyz menuconfig" /
	oldconfig etc does not work
Message-ID: <b55faafb87f5cc5a7566708c821671b2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1568 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1568
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-31-2007 22:52 PDT
Last Modified:              11-27-2007 13:28 PST
====================================================================== 
Summary:                    "make BOARD=xyz menuconfig" / oldconfig etc does not
work
Description: 
buildroot allows you to do "make BOARD=xyz world" to compile using the
configuration file in local/xyz/xyz.config, but you can't call menuconfig,
oldconfig etc in this way.

The problem is that the name of the configuration file isn't being passed
to the kconfig tool (package/config/conf). kconfig uses $BUILDROOT_CONFIG,
so all that is needed is to set that environment variable.

Patch attached fixes this so that "make BOARD=xyz oldconfig" works.
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 11-01-07 18:02  
---------------------------------------------------------------------- 
"make BOARD=xyz world" also fails due to a few more hard-coded references
to .config. br2-board-config2.diff fixes those. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 11-27-07 13:28  
---------------------------------------------------------------------- 
Once you have a ".config" file, you can store your board configuration by:

$ make saveconfig

This will store the .config for buildroot, linux, uclibc and busybox.
If the project name is "xyz", then they will be stored in the "local/xyz"


You can retrieve your configuration by:

$ make BOARD=xyz getconfig

It is wrong to make the things depend on BUILDROOT_CONFIG.
They should depend on ".config" 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-31-07 22:52  hmoffatt       New Issue                                    
10-31-07 22:52  hmoffatt       Status                   new => assigned     
10-31-07 22:52  hmoffatt       Assigned To               => buildroot       
10-31-07 22:52  hmoffatt       File Added: br-board-config.diff                 
  
11-01-07 18:01  hmoffatt       File Added: br-board-config2.diff                
   
11-01-07 18:02  hmoffatt       Note Added: 0002885                          
11-27-07 13:28  UlfSamuelsson  Note Added: 0002977                          
======================================================================
