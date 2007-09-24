From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 24 Sep 2007 00:43:12 -0700
Subject: [Buildroot] [buildroot 0001257]: Some build targets use hard-coded
	library names, which causes forced rebuild on Mac OS X
Message-ID: <613f0fec7a9a0ce6a59492a9e448c426@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1257 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1257
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-04-2007 05:38 PST
Last Modified:              09-24-2007 00:43 PDT
====================================================================== 
Summary:                    Some build targets use hard-coded library names,
which causes forced rebuild on Mac OS X
Description: 
Library names ending with .so should have .dylib in makefile targets on OS
X. Otherwise, the build system always thinks that the library isn't built
and tries to (re-)build it on every make invocation. Attached a patch that
adds a config option for library filename extension and fixes the packages
that seemed to suffer from this. 
====================================================================== 

---------------------------------------------------------------------- 
 holin - 06-02-07 00:14  
---------------------------------------------------------------------- 
Attached an updated patch for current SVN. Some EXEEXTs would probably be
needed in binutils.mk makerules for Windows hosts. 

---------------------------------------------------------------------- 
 bernhardf - 06-02-07 01:46  
---------------------------------------------------------------------- 
You have to use LIBTGTEXT where possible (i.e. in packages that can be
built as static or dynamic library). See the toplevel Makefile for
LIBTGTEXT.

Please update the patch accordingly.
thanks, 

---------------------------------------------------------------------- 
 bernhardf - 06-02-07 02:01  
---------------------------------------------------------------------- 
erm. You're concerned about the host extensions, right?

If so, then you'll have to add HOST_EXEEXT et al and use them where
needed. 

---------------------------------------------------------------------- 
 holin - 06-02-07 02:07  
---------------------------------------------------------------------- 
What?!? No way! Buildroot target is always linux, isn't it? And Linux
always uses the same extensions. What other use would EXEEXT, et al. have?
They are derived from the (BR2_GNU_BUILD_SUFFIX) build toolchain suffix,
which comes from the host system. (host=build system, target="run" target) 

---------------------------------------------------------------------- 
 holin - 06-02-07 02:25  
---------------------------------------------------------------------- 
Updated the patch to use LIBTGTEXT. 

---------------------------------------------------------------------- 
 bernhardf - 06-02-07 03:16  
---------------------------------------------------------------------- 
ugh! Let me wake up and get some coffee.. 

---------------------------------------------------------------------- 
 bernhardf - 06-02-07 03:18  
---------------------------------------------------------------------- 
Turns out that of course LIBTGTEXT should rather be HOST_LIBEXT. Not sure
what i was thinking about :-/

May i ask you to fix that too?
Many thanks in advance. 

---------------------------------------------------------------------- 
 holin - 06-02-07 03:35  
---------------------------------------------------------------------- 
Updated patch with LIBTGTEXT -> HOST_LIBEXT. 

---------------------------------------------------------------------- 
 bernhardf - 06-02-07 04:23  
---------------------------------------------------------------------- 
Applied, thanks. Please let me know when you think i can close this bug. 

---------------------------------------------------------------------- 
 holin - 06-03-07 00:41  
---------------------------------------------------------------------- 
Oops. I need my coffee, too. I misunderstood what TGTEXT was for (didn't
follow the corresponding mailing list thread, actually.) Host builds need
to use shared libs as makefile targets, because static ones aren't always
built. Uploaded dlext-fix.patch, which fixes that. Apply the patch and
this report can be closed. 

---------------------------------------------------------------------- 
 bernhardf - 09-24-07 00:43  
---------------------------------------------------------------------- 
This was applied some time ago. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-04-07 05:38  holin          New Issue                                    
03-04-07 05:38  holin          Status                   new => assigned     
03-04-07 05:38  holin          Assigned To               => buildroot       
03-04-07 05:38  holin          File Added: buildroot-070304-dlext.patch         
          
03-31-07 09:43  bendiken       Issue Monitored: bendiken                    
06-02-07 00:13  holin          File Added: buildroot-070602-dlext-v2.patch      
             
06-02-07 00:14  holin          Note Added: 0002427                          
06-02-07 01:46  bernhardf      Note Added: 0002428                          
06-02-07 02:01  bernhardf      Note Added: 0002429                          
06-02-07 02:07  holin          Note Added: 0002430                          
06-02-07 02:24  holin          File Added: buildroot-070602-dlext-v3.patch      
             
06-02-07 02:25  holin          Note Added: 0002431                          
06-02-07 03:16  bernhardf      Note Added: 0002432                          
06-02-07 03:18  bernhardf      Note Added: 0002433                          
06-02-07 03:34  holin          File Added: buildroot-070602-dlext-v4.patch      
             
06-02-07 03:35  holin          Note Added: 0002434                          
06-02-07 04:23  bernhardf      Note Added: 0002435                          
06-03-07 00:38  holin          File Added: buildroot-070603-dlext-fix.patch     
              
06-03-07 00:41  holin          Note Added: 0002440                          
09-24-07 00:43  bernhardf      Status                   assigned => closed  
09-24-07 00:43  bernhardf      Note Added: 0002777                          
======================================================================
