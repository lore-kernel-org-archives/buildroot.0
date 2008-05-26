From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 26 May 2008 04:54:05 -0700
Subject: [Buildroot] [buildroot 0002914]: X11R7 fails to build with a fork
	bomb.
Message-ID: <756c4c06f316fef0e3d55bff4cdf4339@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2914 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2914
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-14-2008 04:35 PDT
Last Modified:              05-26-2008 04:54 PDT
====================================================================== 
Summary:                    X11R7 fails to build with a fork bomb.
Description: 
X11R7 fails to build in a nasty way. 
The package check is missing (As far as I understand this is
check.sourceforge.net) When ./configure in libxcb-1.1 tries to test for
this it starts a fork bomb making my development machine (a fedora 8
laptop) grind to a halt.

I am using a current buildroot. (svn at 21732)
====================================================================== 

---------------------------------------------------------------------- 
 KHAksnes - 04-14-08 07:22  
---------------------------------------------------------------------- 
Building of RPM shows the same behaviour. The fork bomb involves
pkg-config, glib-config and sed at least. 

---------------------------------------------------------------------- 
 KHAksnes - 04-14-08 07:31  
---------------------------------------------------------------------- 
I forgot to mention that I was trying to build for i686 using, a fairly
standard setup with, kernel: 2.6.24, uclibc: 0.9.29, binutils:
2.18.50.0.1, gcc: 4.2.3, busybox: 1.10. 

---------------------------------------------------------------------- 
 KHAksnes - 05-26-08 04:54  
---------------------------------------------------------------------- 
After meeting similar fork bombs several times I did som further research.
The problem seems to be pkg-config.

pkg-config have a builtin fallback to gnome-config. Sometimes when
pkg-config can't find its gnome-config fallback it forks out of control.
Installing the following shell script as staging_dir/usr/bin/gnome-config
fixes the problem

#! /bin/sh
exit 1 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-14-08 04:35  KHAksnes       New Issue                                    
04-14-08 04:35  KHAksnes       Status                   new => assigned     
04-14-08 04:35  KHAksnes       Assigned To               => buildroot       
04-14-08 07:22  KHAksnes       Note Added: 0006614                          
04-14-08 07:31  KHAksnes       Note Added: 0006624                          
05-26-08 04:54  KHAksnes       Note Added: 0007864                          
======================================================================
