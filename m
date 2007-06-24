From: Rick Foos <rick@synchromeshcomputing.com>
Date: Sat, 23 Jun 2007 21:12:02 -0500
Subject: [Buildroot] Can "make <>_defconfig" rules be restored?
References: <01c301c7b519$52679b40$6e02a8c0@k2> <20070623093927.GG4096@aon.at>
Message-ID: <003801c7b605$0e32cb10$6604a8c0@shukson>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: "Rick Foos" <rick@synchromeshcomputing.com>
Cc: "Buildroot" <buildroot@uclibc.org>
Sent: Saturday, June 23, 2007 4:39 AM
Subject: Re: [Buildroot] Can "make <>_defconfig" rules be restored?


> On Fri, Jun 22, 2007 at 05:04:35PM -0500, Rick Foos wrote:
>>Hi All,
>>
>>I would like to use "_defconfig" files to save and restore specific 
>>defaults
>>for several platforms.
>>
>>The Makefile at one point supported loading of user defined "_defconfig"
>>files. In the current Makefile the noconfig_targets part of "_defconfig" 
>>is
>>commented out.
>>
>>Is there a problem with restoring "_defconfig" file loading?
>
> Yes, the problem with this kind of _defconfig was that in a tree that
> had already one or two compiled arches lying around, the find was the
> cause for a delay in the order of several minutes on my box.
The purpose of this patch is to have several arches lying around.

The -maxdepth 4 addresses the speed problem, and also keeps the search out 
of the kernel arch _defconfigs.
#	$(shell find . -name *_defconfig |sed 's/.*\///')
TARGETS_DEFCONFIG = $(shell find $(TOPDIR) -maxdepth 4 -name \*_defconfig | 
sed 's|.*\/||')

The defconfig target won't work for kernels, so you shouldn't pick them 
up.This will pick up from down to the packages directory.

>>
>>I searched the list archives on defconfig, but could not find any decision
>>on this.
>
> http://busybox.net/cgi-bin/viewcvs.cgi/trunk/buildroot/Makefile
> revision 16763
- andersee, what was that good for? It just slows down rebuilds as it delves 
into each sub-file needlessly.. Ripping out.
fair enough.

There weren't any other alternatives to save and restore entire 
configurations to .config. The standard way to do this appeared to be using 
defconfig.

>>
>>The following patch, restores "_defconfig" file loading limited to files 
>>at
>>a maxdepth of 4.
>>
>>This allows "_defconfig" files in packages and tools while avoiding the
>>_defconfig files in the linux source directories.
>>
>>The patch also fixes the find syntax, and allows "_defconfig" files to be 
>>in
>>the same directory as make.
>>
>>I'd like to propose that this patch be added, or let me know a better way 
>>to
>>manage multiple default configurations.
>
> What is this _defconfig thing supposed to do? Please give an example of
> what this accomplishes and how it does this.
>

I would like to handle multiple platforms and save everything from .config 
in _defconfig files. The purpose would be to pass off finished 
configurations to other development groups and for releases to a platform 
for customers. The intent is that the downstream users would have a complete 
system without further configuration for application development, testing, 
and release.

Using the _defconfig mechanism rather than copying files to .config seemed 
to be the right way to do this part of the problem. Merges from the main 
buildroot tree could continue, and the default configurations kept up to 
date through the standard defconfig method.

As a platform involves more scripting and dependencies the other definitions 
would move down to target, or package.

While target looks like a place to define platforms, target has lot of 
dependencies on other elements of target. For a platform, package actually 
has more control, and is the only place to override target setting - I don't 
see a clear answer here.

I think the way that I modifed the old code takes care of the searching 
problem, and is the most flexible way to use _defconfig files. Whether 
platforms are defined in target or platform or a new directory, the 
_defconfig method will work without further changes to the Makefile. Any 
package or target could supply defconfig.,

Since _defconfig changes the .config file, it's definition should be in the 
top level Makefile. It looks like _defconfig was intended to be this way, 
and the patch submitted resolves the issues causing it to be removed in rev 
16763.

Best Regards,
Rick Foos
