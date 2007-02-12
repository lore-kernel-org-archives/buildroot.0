From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:56 -0800
Subject: [Buildroot] [buildroot 0001117]: Building toolchains fails with
	libstdc++-v3 enabled
Message-ID: <7efc20c6f06bb59926003876f27ce9b6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1117 
====================================================================== 
Reported By:                lalla521
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1117
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-14-2006 09:29 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    Building toolchains fails with libstdc++-v3 enabled
Description: 
hi there, i am trying to compile a toolchain for mips32, i can compile just
fine but when i enable c++ in configuration make fails with apparently no
reason.

this is what i get:

make[4]: Leaving directory
`/home/bracco/buildroot/toolchain_build_mips_nofpu/gcc-3.4.2-final/mips-linux-uclibc/libstdc++-v3/src'
make[3]: *** [install-am] Error 2
make[3]: Leaving directory
`/home/bracco/buildroot/toolchain_build_mips_nofpu/gcc-3.4.2-final/mips-linux-uclibc/libstdc++-v3/src'
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory
`/home/bracco/buildroot/toolchain_build_mips_nofpu/gcc-3.4.2-final/mips-linux-uclibc/libstdc++-v3'
make[1]: *** [install-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/home/bracco/buildroot/toolchain_build_mips_nofpu/gcc-3.4.2-final'
make: ***
[/home/bracco/buildroot/toolchain_build_mips_nofpu/gcc-3.4.2-final/.installed]
Error 2

i think it is just the compile of libstdc++ that fails because some lines
before there's this:

make[4]: Nothing to be done for `install-data-am'.
 /bin/sh ../libtool --mode=install /usr/bin/install -c  libstdc++.la
/home/bracco/buildroot/build_mips_nofpu/staging_dir/mips-linux-uclibc/lib/libstdc++.la
mips-linux-uclibc-ar: .libs/*.o: Nessun file o directory
make[4]: *** [install-exec-local] Error 1

how can i solve that? it is  veeeeeeeery annoying, i spent hours on it,
searched with google and found severeal other libstdc++ issues but none of
the solutions seems to be working for me

====================================================================== 

---------------------------------------------------------------------- 
 lalla521 - 12-14-06 10:32  
---------------------------------------------------------------------- 
forgot to say i'm compiling gcc 3.4.2 and that "Nessun file o directory"
means no "file or directory" 

---------------------------------------------------------------------- 
 js - 12-15-06 07:54  
---------------------------------------------------------------------- 
I've seen this too (with gcc-3.4.6), and I think it is caused
by not setting BR2_GCC_SHARED_LIBGCC.

However, it seems that removing the offending .libs/ part
from toolchain/gcc/3.4.x/300-libstdc++-pic.patch
makes it build with either BR2_GCC_SHARED_LIBGCC setting. 

---------------------------------------------------------------------- 
 js - 12-15-06 08:32  
---------------------------------------------------------------------- 
...or maybe not:
It seems libtool builds -fPIC versions of the objects
in .libs/, and versions without -fPIC in ., which
are the same for mips-linux (because -fPIC is implied),
but maybe not for other platforms.

libtool doesn't build the -fPIC versions when
BR2_GCC_SHARED_LIBGCC is unset. 

---------------------------------------------------------------------- 
 bernhardf - 12-21-06 03:51  
---------------------------------------------------------------------- 
Can somebody attach a working patch, please?
thanks, 

---------------------------------------------------------------------- 
 bernhardf - 12-28-06 01:05  
---------------------------------------------------------------------- 
Works for me with the fixes i just installed (revision 17099) for gcc-4.2
on i386. Please try 4.2 and report back. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-14-06 09:29  lalla521       New Issue                                    
12-14-06 09:29  lalla521       Status                   new => assigned     
12-14-06 09:29  lalla521       Assigned To               => uClibc          
12-14-06 10:32  lalla521       Note Added: 0001862                          
12-15-06 07:54  js             Note Added: 0001867                          
12-15-06 08:32  js             Note Added: 0001868                          
12-21-06 03:51  bernhardf      Note Added: 0001901                          
12-28-06 01:05  bernhardf      Note Added: 0001941                          
12-28-06 01:05  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
