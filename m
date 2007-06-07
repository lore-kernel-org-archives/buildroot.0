From: kevint <kevint@lanl.gov>
Date: Wed, 6 Jun 2007 17:31:25 -0700
Subject: [Buildroot] problems building x86_64 target
In-Reply-To: <20070606184023.GA7593@aon.at>
References: <3AF470EE-B97B-40FC-B806-12627EC946D0@lanl.gov>
	<20070606173826.GA4543@aon.at> <20070606184023.GA7593@aon.at>
Message-ID: <FC6B700F-A073-4E83-A3AB-BFD8A9E5ED56@lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your tips.  I set --disable-libmudflap in "Additional gcc  
options", and that got past the error I first came across, but I also  
had to modify a couple things to get it to compile the rest of the way:

toolchain_build_x86_64/gcc-4.2.0-final/x86_64-linux-uclibc/libiberty/ 
Makefile (line 368, in install_to_tooldir):

cd $(DESTDIR)$(tooldir)/lib/$(MULTIOSDIR)

to

cd `cd $(DESTDIR)$(tooldir)/lib; pwd -P`/$(MULTIOSDIR)

because my bourne shell was changing directory to the symlinked  
directory, not the physical directory (in which case the relative ../ 
lib64 did not exist).  This is obviously a pretty big hack, so I will  
try to find a more appropriate solution tomorrow.

I also had to copy /tmp/buildroot/toolchain_build_x86_64/linux/ 
include/asm-x86_64 to /tmp/buildroot/build_x86_64/staging_dir/x86_64- 
linux-uclibc/sys-include

to build the rest of the way.  I will try to clean this up a little  
bit in the next couple of days.

Thanks again for your help,

Kevin

On Jun 6, 2007, at 11:40 AM, Bernhard Fischer wrote:

> On Wed, Jun 06, 2007 at 07:38:26PM +0200, Bernhard Fischer wrote:
>> On Tue, Jun 05, 2007 at 10:16:26AM -0700, kevint wrote:
>
>>> Target Architecture: x86_64
>>> Target Architecture Variant: opteron
>>> uClibc C library version (uClibc 0.9.29)
>>> (toolchain/uClibc/uClibc-0.9.29.config) uClibc configuration file to
>>> use?
>>> GCC Compiler version (gcc 3.4.6)
>
> ok. svn up, select gcc-4.2.0, binutils-2.17.50.0.9,
> kernel-headers-2.6.20
> then rm -rf build_* toolchain_* && make
>
> I'll note that the "opteron" support was something i accidentally  
> added
> from a WIP for better CPU selection, which is not yet in trunk. Adjust
> your custom cflags accordingly for now (as you should always do,  
> fwiw),
> via the corresponding menu option.

********************************************
Kevin Tegtmeier
HPC-3 Scientific Computing Resources
Los Alamos National Laboratory
email:  kevint at lanl.gov
********************************************



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070606/881027a5/attachment-0001.htm 
