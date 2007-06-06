From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 6 Jun 2007 19:38:26 +0200
Subject: [Buildroot] problems building x86_64 target
In-Reply-To: <3AF470EE-B97B-40FC-B806-12627EC946D0@lanl.gov>
References: <3AF470EE-B97B-40FC-B806-12627EC946D0@lanl.gov>
Message-ID: <20070606173826.GA4543@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 05, 2007 at 10:16:26AM -0700, kevint wrote:
>Hello,
>
>This is my first post to this mailing list, so please excuse (and  
>point out) anything that doesn't follow the list's protocol.
>
>I have been trying to build an x86_64 toolchain using different  
>buildroot snapshots, uClibc versions, gcc versions.  I have  
>successfully built i386 images with several configuration  
>combinations, but no configuration combinations are providing a  
>successful build for x86_64.
>
>The two most common errors I come across are the following (using  
>buildroot-20070605.tar.bz2):
>
>(1)
>Target Architecture: x86_64
>Target Architecture Variant: opteron
>uClibc C library version (uClibc 0.9.29)
>(toolchain/uClibc/uClibc-0.9.29.config) uClibc configuration file to  
>use?
>GCC Compiler version (gcc 3.4.6)
>
>All other options are default.  This is my desired configuration, but  
>I tried different compiler versions, described in (2).

gcc-3.4 certainly is nothing you should want to use, imho.
>
>This configuration appears to build the target toolchain with no  
>errors, but when it starts to compile busybox, it errors out on:
>
>/tmp/buildroot/build_x86_64/staging_dir/lib/gcc/x86_64-linux-uclibc/ 
>3.4.6/../../../../x86_64-linux-uclibc/sys-include/asm/param.h:5:32:  
>asm-x86_64/param.h: No such file or directory
>
>I tried linking /tmp/buildroot/build_x86_64/staging_dir/include/asm  
>to /tmp/buildroot/build_x86_64/staging_dir/include/asm-x86_64 just to  
>see how far it would get, and the busybox compile fails here:
>
>console-tools/resize.c: In function `resize_main':
>console-tools/resize.c:61: error: `TIOCSWINSZ' undeclared (first use  
>in this function)
>console-tools/resize.c:61: error: (Each undeclared identifier is  
>reported only once
>console-tools/resize.c:61: error: for each function it appears in.)
>
>
>(2)
>Target Architecture: x86_64
>Target Architecture Variant: opteron
>uClibc C library version (uClibc 0.9.29)
>(toolchain/uClibc/uClibc-0.9.29.config) uClibc configuration file to  
>use?
>GCC Compiler version (gcc 4.1.2)
>
>Almost the same as above, except for compiler versions.  This  
>configuration does not successfully build gcc, and errors out on:
>
>In file included from /tmp/buildroot/toolchain_build_x86_64/gcc-4.1.2/ 
>libmudflap/mf-hooks1.c:58:
>/tmp/buildroot/build_x86_64/staging_dir/x86_64-linux-uclibc/sys- 
>include/unistd.h:243: error: two or more data types in declaration  
>specifiers

If you don't need mudflap, then i suggest you disable it..
Are you preparing a node-image?
>
>I would appreciate any insight you are willing to offer on x86_64  
>builds, as we will be using buildroot extensively in the months ahead.

I'm about to checkin the gcc-4.2.0 support and will then look a little
bit at gcc-4.3 (this is what i will be using, on ia32 boxes, as always).

Generally, i do not use gcc-3.x, nor any binutils older than 2.17, fwiw.
And generally, i think that mudflap is a little bit odd, doesn't work
for me for the most part:
Consider a binary that links against liba.so; this liba.so links against
libb.so, which has an undefined symbol. Now you'd want to print the
libmudflap help-text, and guess what? Since the option (resp. env var)
parsing of mudflap happens after symbol resolution, you will (currently)
never ever be able to trick mudflap into printing *any* help. Last time
i looked, there was no PR about this and i don't have the time to
provide a testcase for this misfeature (since i don't need mudflap).
