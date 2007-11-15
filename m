From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 15 Nov 2007 02:18:55 -0800
Subject: [Buildroot] [buildroot 0001580]: [PATCH] Updated nios2 support for
	buildroot
Message-ID: <711f7ea003bfa6aa6bbb9120a9090c90@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1580 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1580
Category:                   Architecture Specific
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-08-2007 05:06 PST
Last Modified:              11-15-2007 02:18 PST
====================================================================== 
Summary:                    [PATCH] Updated nios2 support for buildroot
Description: 
The attached patches fixes toolchain build for nios2 with the recent
buildroot, and adds some new features:

* Support for c++
* Support for using 2.6.23 kernel headers

====================================================================== 

---------------------------------------------------------------------- 
 atle - 11-08-07 05:30  
---------------------------------------------------------------------- 
The uClibc build insists on installing ldd/ldconfig even though they are
not built. Suggested solution attached (uclibc-hostutils-install.diff).

 

---------------------------------------------------------------------- 
 vanokuten - 11-14-07 02:27  
---------------------------------------------------------------------- 
I applied your patch: uclibc-hostutils-install.diff and made a test for
avr32 arch - as result I got this:
---------
make[1]: Leaving directory `/opt/buildroot/build_avr32/genext2fs-1.4'
touch -c /opt/buildroot/build_avr32/genext2fs-1.4/genext2fs
test -x
/opt/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ldconfig
&&
/opt/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ldconfig
-r /opt/buildroot/project_build_avr32/atstk1002/root 2>/dev/null
make: *** [/opt/buildroot/binaries/atstk1002/rootfs.avr32-20071114.ext2]
Error 1
---------

seems your skip of ldconfig applied unconditionally. 

---------------------------------------------------------------------- 
 atle - 11-15-07 00:07  
---------------------------------------------------------------------- 
Sorry, I was a little too fast there. HAVE_SHARED is defined in the uClibc
configuration and not visible to the build-system. As far as I can see
there are no global config-options that tell if shared uClibc is built or
not, but I may be wrong (?). Perhaps it is better to just check if the
files exists, see the attached patch (uclibc-hostutils-install_v2.diff). 

---------------------------------------------------------------------- 
 vanokuten - 11-15-07 02:18  
---------------------------------------------------------------------- 
uclibc-hostutils-install_v2.diff applied in rev 20427

other nios2 related patches where applied before, so think we can close an
issue. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-07 05:06  atle           New Issue                                    
11-08-07 05:06  atle           Status                   new => assigned     
11-08-07 05:06  atle           Assigned To               => buildroot       
11-08-07 05:06  atle           File Added: binutils-nios2.diff.gz               
    
11-08-07 05:07  atle           File Added: elf2flt-nios2.diff.gz                
   
11-08-07 05:07  atle           File Added: gcc-nios2.diff.gz                    
11-08-07 05:07  atle           File Added: kernel-headers-nios2.diff.gz         
          
11-08-07 05:12  atle           Note Added: 0002897                          
11-08-07 05:14  atle           Note Edited: 0002897                         
11-08-07 05:27  atle           File Added: uclibc-hostutils-install.diff        
           
11-08-07 05:29  atle           Note Added: 0002898                          
11-08-07 05:30  atle           Note Edited: 0002898                         
11-09-07 05:55  atle           Note Deleted: 0002897                        
11-14-07 02:27  vanokuten      Note Added: 0002914                          
11-14-07 23:58  atle           File Added: uclibc-hostutils-install_v2.diff     
              
11-15-07 00:07  atle           Note Added: 0002919                          
11-15-07 02:18  vanokuten      Note Added: 0002922                          
======================================================================
