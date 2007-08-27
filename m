From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 27 Aug 2007 05:03:11 -0700
Subject: [Buildroot] [buildroot 0001090]: stdlibc++ fails putting a double
	in a stream.
Message-ID: <21cbbd9fb426d6d6789a1a3b1ec384e8@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1090 
====================================================================== 
Reported By:                GJanak
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1090
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-14-2006 00:01 PST
Last Modified:              08-27-2007 05:03 PDT
====================================================================== 
Summary:                    stdlibc++ fails putting a double in a stream.
Description: 
The problem was:
putting a double in a stream:
cout << 10.5 ;

Produce an empty string, or some garbage characters.

I could resolve the error down to some wired Code combination between
uclibc and libstdc++
====================================================================== 

---------------------------------------------------------------------- 
 GJanak - 02-12-07 05:50  
---------------------------------------------------------------------- 
I don't think it's an buildroot Problem.

Its an uclibc c++ error... 

---------------------------------------------------------------------- 
 GJanak - 08-27-07 05:02  
---------------------------------------------------------------------- 
New info.

The Problem is: very old files are patched into current gcc releases.
I mean the toolchain/gcc/4.2.1/200-uclibc-locale.patch
which creates 
gcc/libstdc++-v3/config/locale/uclibc/c_locale.cc

The file created by the patch is based on the generic Config and than
patched for uclibc. But the generic is changed with 4.x.x.

Best solution would be to copy the gcc/libstdc++-v3/config/locale/generic
Dir and than add a patch on this Dir.

The Differences needed would be smaller. And perhaps the Patch would work
for multiple gcc versions. 

---------------------------------------------------------------------- 
 GJanak - 08-27-07 05:03  
---------------------------------------------------------------------- 
The Patch gcc_snprintf_double_cssize.patch is a workaround, hacking the
change in gcc. But it isnt a good solution. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-14-06 00:01  GJanak         New Issue                                    
11-14-06 00:01  GJanak         Status                   new => assigned     
11-14-06 00:01  GJanak         Assigned To               => uClibc          
11-14-06 00:05  GJanak         Issue Monitored: GJanak                      
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
02-12-07 05:50  GJanak         Note Added: 0002152                          
08-27-07 05:02  GJanak         Note Added: 0002698                          
08-27-07 05:02  GJanak         File Added: gcc_snprintf_double_cssize.patch     
              
08-27-07 05:03  GJanak         Note Added: 0002699                          
======================================================================
