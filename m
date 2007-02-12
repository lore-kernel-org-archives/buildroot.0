From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:30 -0800
Subject: [Buildroot] [buildroot 0000273]: add support for nios2 to buildroot
Message-ID: <0a1054fec955fdac871adb5742a406a0@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=273 
====================================================================== 
Reported By:                marc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   273
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-25-2005 03:19 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    add support for nios2 to buildroot
Description: 
uclibc had support for nios2, but buildroot has not. This patch adds the
possibility to create a 
   * nios2 toolchain from scratch
in very much the same way as it is done for other architectures.

The patches include
   * patch against binutils 2.15
   * patch against gcc-3.4.3 (other 3.4.x patches can be added)
   * patch against linux-headers 2.6.9

====================================================================== 

---------------------------------------------------------------------- 
 marc - 06-01-05 21:49  
---------------------------------------------------------------------- 
The elf2flt functionality in the patch is currently not yet functional, the
rest is (did a testbuild yesterday).

support for gcc 3.4.1, 3.4.2 are added.

However, uclibc-dev is broken (undefined references to __start_main_uclibc
or something). Older snapshots (20050517) of uclibc work fine. 

---------------------------------------------------------------------- 
 jocke - 06-02-05 06:34  
---------------------------------------------------------------------- 
You need to update your crt* file(s) to match the new ABI.
See i386 or powerpc and ml for details on that. 

---------------------------------------------------------------------- 
 marc - 06-02-05 06:47  
---------------------------------------------------------------------- 
tnx, I'll do that from the moment I get elf2flt hacked in the toolchain for
uclinux archs (nios2 here). 

---------------------------------------------------------------------- 
 jocke - 06-02-05 06:52  
---------------------------------------------------------------------- 
You also have to pass a fini function ptr(_dl_fini) from ldso. See
the startup asm. See i386 or powerpc startup code in ldso. 

---------------------------------------------------------------------- 
 marc - 06-02-05 07:18  
---------------------------------------------------------------------- 
elf2flt.diff should replace the version in the tarball. It includes and
modifies the toolchain to create BFLT binaries instead of ELF with the
flag -Wl,-elf2flt

The one in the tarball was not yet fully finished... 

---------------------------------------------------------------------- 
 marc - 06-02-05 07:19  
---------------------------------------------------------------------- 
jocke, tnx for the pointers, I don't have the deep insight in uclibc to fix
this without your pointers :)

 

---------------------------------------------------------------------- 
 vapier - 01-03-06 20:53  
---------------------------------------------------------------------- 
please sync up and check out current buildroot ... i cleaned up the
binutils/gcc patches and incorporated most of what you have here into
current svn 

---------------------------------------------------------------------- 
 vapier - 01-09-06 21:57  
---------------------------------------------------------------------- 
and elf2flt is in, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-25-05 03:19  marc           New Issue                                    
05-25-05 03:24  marc           Issue Monitored: marc                        
05-29-05 01:37  marc           Note Added: 0000218                          
06-01-05 07:56  marc           Note Edited: 0000218                         
06-01-05 07:57  marc           Note Edited: 0000218                         
06-01-05 21:46  marc           File Added: buildroot_quilt_patches.tar.bz2      
             
06-01-05 21:47  marc           Note Deleted: 0000218                        
06-01-05 21:49  marc           Note Added: 0000222                          
06-02-05 06:34  jocke          Note Added: 0000223                          
06-02-05 06:47  marc           Note Added: 0000224                          
06-02-05 06:52  jocke          Note Added: 0000225                          
06-02-05 07:16  marc           File Added: elf2flt.diff                     
06-02-05 07:18  marc           Note Added: 0000226                          
06-02-05 07:19  marc           Note Added: 0000227                          
06-02-05 07:19  marc           Note Edited: 0000227                         
01-03-06 16:43  thomas_chou    Note Added: 0000845                          
01-03-06 16:57  thomas_chou    Note Deleted: 0000845                        
01-03-06 20:53  vapier         Note Added: 0000847                          
01-09-06 21:57  vapier         Note Added: 0000901                          
01-09-06 21:57  vapier         Status                   assigned => closed  
01-09-06 21:57  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
