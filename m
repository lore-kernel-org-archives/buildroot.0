From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:16 -0800
Subject: [Buildroot] [buildroot 0000652]: rev 12223 breaks g++: undefined
	reference to `dl_iterate_phdr'
Message-ID: <42956eb611e4beef205fba5165ac8cf7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=652 
====================================================================== 
Reported By:                ensc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   652
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-20-2006 04:33 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    rev 12223 breaks g++: undefined reference to
`dl_iterate_phdr'
Description: 
SVN revision 12223 breaks the g++ compiler; now, I get:

| $ echo 'int main() { }' >bar.cc
| $ g++ bar.cc
| /usr/lib/gcc/arm-xscale-linux-uclibc/4.0.2/libgcc_s.so: undefined
reference to `dl_iterate_phdr'

Going back to revision 12211 of toolchain/gcc/4.0.2/100-uclibc-conf.patch
makes g++ work again.

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 01-20-06 10:09  
---------------------------------------------------------------------- 
looks more like your toolchain is broken

libgcc_s.so should be linked against libc.so which should be linked
against ld-uClibc.so which contains the dl_iterate_phdr symbol 

---------------------------------------------------------------------- 
 ensc - 01-21-06 02:03  
---------------------------------------------------------------------- 
ok, then it's an 'uClibc' bug. ld-uClibc.so does not contain this
symbol. The code

| #ifdef __USE_GNU
| #if ! defined LIBDL || (! defined PIC && ! defined __PIC__)
| int
| __dl_iterate_phdr (int (*callback) (struct dl_phdr_info *info, size_t
size, void *data), void *data)

in uClibc-0.9.28/ldso/ldso/dl-elf.c gets never be evaluated because
'__USE_GNU' is not defined. 

---------------------------------------------------------------------- 
 ensc - 01-21-06 02:30  
---------------------------------------------------------------------- 
Correction: the static 'libdl.a' contains this symbol because in
ldso/libdl/libdl.c the '__USE_GNU' macro will be defined.

But this does not happen in ldso/ldso/ 

---------------------------------------------------------------------- 
 vapier - 01-23-06 07:57  
---------------------------------------------------------------------- 
this has been fixed in uClibc head already, search the uClibc mailing lists
for a patch for 0.9.28 if you wish to use that version 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-20-06 04:33  ensc           New Issue                                    
01-20-06 04:33  ensc           Status                   new => assigned     
01-20-06 04:33  ensc           Assigned To               => uClibc          
01-20-06 10:09  vapier         Note Added: 0000959                          
01-21-06 02:03  ensc           Note Added: 0000969                          
01-21-06 02:30  ensc           Note Added: 0000970                          
01-23-06 07:57  vapier         Note Added: 0000980                          
01-23-06 07:57  vapier         Status                   assigned => closed  
01-23-06 07:57  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
