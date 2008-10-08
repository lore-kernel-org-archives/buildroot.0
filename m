From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 7 Oct 2008 17:54:22 -0700
Subject: [Buildroot] [buildroot 0005234]: Selecting MTD utils from git
	doesn't give you the HEAD
Message-ID: <7ad0fe65bfbec820c7f3db4736197bf1@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5234 
====================================================================== 
Reported By:                mjd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5234
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-03-2008 09:40 PDT
Last Modified:              10-07-2008 17:54 PDT
====================================================================== 
Summary:                    Selecting MTD utils from git doesn't give you the
HEAD
Description: 
If you turn on BR2_PACKAGE_MTD_UTILS_GIT, you can get the mtd-utils
source code from the Linux MTD project's GIT server, rather than use
source that is 1 or 2 years old.

I would have thought that the whole point of this is so that you can
get the latest-and-greatest mtd-utils source.  But
package/mtd/mtd-utils.git/mtd.mk hard-codes a particular (now
out-of-date)
version of mtd-utils.

This patch ensures that getting mtd-utils source from git gets the head
from Linux MTD.
====================================================================== 

---------------------------------------------------------------------- 
 mjd - 10-03-08 09:42  
---------------------------------------------------------------------- 
diff -x config -u -r
buildroot-mtcba-g1-pristine/package/mtd/mtd-utils.git/mtd.mk
buildroot-mtcba-g1/package/mtd/mtd-utils.git/mtd.mk
---
buildroot-mtcba-g1-pristine/package/mtd/mtd-utils.git/mtd.mk	2008-08-03
14:11:27.000000000 +1000
+++ buildroot-mtcba-g1/package/mtd/mtd-utils.git/mtd.mk	2008-09-30
17:45:07.000000000 +1000
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+MTD_VERSION:=HEAD
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz

MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION) 

---------------------------------------------------------------------- 
 bernhardf - 10-03-08 10:01  
---------------------------------------------------------------------- 
may i suggest you add a
config BR2_PACKAGE_MTD_UTILS_GIT_REVISION
  string "git revision"
  default "HEAD" if !BR2_avr
  default "the_previous_hash" if BR2_avr32
  help
    Here you can enter the git revision you want to use.
    Usually this will be "HEAD", but if you could add some other
    hash here.

Just a thought.. 

---------------------------------------------------------------------- 
 mjd - 10-03-08 16:47  
---------------------------------------------------------------------- 
Hi bernhardf, I like that idea.  However my config.in-fu is not yet good
enough to do what you suggested.  If you want to do it, could you (or
someone else) write it and try it out please? 

---------------------------------------------------------------------- 
 mjd - 10-03-08 16:49  
---------------------------------------------------------------------- 
Guys, there may be a problem with using mtd-util from HEAD.  Please give me
a little time to work out what's happening with that code. 

---------------------------------------------------------------------- 
 egtvedt - 10-06-08 22:00  
---------------------------------------------------------------------- 
There is also no need to special handle AVR32. AVR32 works fine with the
latest release of MTD. 

---------------------------------------------------------------------- 
 mjd - 10-07-08 00:07  
---------------------------------------------------------------------- 
I'm not sure why yet, but at the moment, I can build "mtd-host", but I
can't build "mtd".

mtd-utils-HEAD has a file called "fec.c".  This file is trying to use
bcopy and bzero.  It also has macros to work out whether it has to fake
the existence of bcopy and bzero.

The compile warnings and link errors I get are that there's a mismatch
between the definitions of those internals, and what's in fec.c.

Does anyone else have this problem?  Does fec.c compile for your target? 

---------------------------------------------------------------------- 
 hmoffatt - 10-07-08 06:17  
---------------------------------------------------------------------- 
I think that using HEAD by default is not a good idea. I did this
originally.

Problem is that it'll download head once, but nothing will cause it to
download head again (unless you remove the .tar.gz from the sources
directory). AND you don't know what version you have either if you want
to rebuild later.

Also, the patches won't necessarily apply to a later version.

A configuration option would be an improvement though it doesn't solve
the patch problem.

I think it really needs manual intervention, which is how it came to be
how it is now. 

---------------------------------------------------------------------- 
 hmoffatt - 10-07-08 06:20  
---------------------------------------------------------------------- 
Re: HEAD not compiling in fec.c, this is why the package shouldn't just
track HEAD :)

Better to patch fec.c to use memcopy/memset instead of bcopy/bzero I
think; the latter are only enabled if configured that way in uclibc, and
even then I've had problems in the past.

So by all means submit a patch which makes a recent revision compile but
please don't use the HEAD symbolic name. Even better if you can use a
tagged released version rather than a commit id. 

---------------------------------------------------------------------- 
 mjd - 10-07-08 06:38  
---------------------------------------------------------------------- 
All good points, but if the menu says "git", but it gives you a certain
non-HEAD snapshot, it violates the "principle of least surprise".  And I
was certainly surprised to find out the "git" version was several months
old.  

(How did I find out it wasn't HEAD?  I wanted features in the latest
upstream version that were missing in the buildroot one, and wasted
several days making mods to the out-of-date one that I then had to port to
the latest version)

If I select "mtd-utils from git", it pretty much sets the expectation of a
moving target.  If you can't afford the moving target, don't choose the git
version! :-)

As a way forward, if we don't make the "git" choice use the HEAD, can we
update the menus to say the date of the version we've endorsed, instead of
saying "git"?  (That's what the "git" option at the moment effectively
does)?  After all, when "git" is selected, it doesn't even use git! :-)



For better or worse, we already have the mechanisms to support different
patches for different versions of MTD.  If I provide a version that DOES
update itself when upstream mtd-utils changes, is that ok?

 

---------------------------------------------------------------------- 
 hmoffatt - 10-07-08 06:46  
---------------------------------------------------------------------- 
Fair points. I think I had it track HEAD initially but ran into those two
problems I mentioned, specifically that
1. it wouldn't download updated versions, and
2. it's difficult to manage patches.

Item 1 could be solved by using git to check out the source (and then
you'd probably have to do it every time you ran make, which would be
slow), rather than HTTP. I didn't feel like writing a package for GIT
itself just to solve this.
If there's some way to get a daily snapshot via HTTP that might be an
improvement.

Item 2 is harder. Any given patch might be needed for a range of versions
only. Later versions may not compile without patches.

I think item 2 means that you really have to add new versions by hand, but
I'm happy to be proven wrong.

I'm happy for us to change the naming/Config.in etc to advertise that this
is not the latest from GIT but a particular GIT snapshot. Patch gratefully
accepted or else I'll look at it myself later in the week.

 

---------------------------------------------------------------------- 
 mjd - 10-07-08 17:10  
---------------------------------------------------------------------- 
HEAD should be a synonym for some version accessible via those long digest
hex string thingys, for example, I'm sure the present value of
fcb52ccc99679460640386c297023f852b108f68 was once accessible via HEAD.

If we had some way of looking up (via HTTP interface) what the current
HEAD was (in terms of its equivalent digest value) we could compare that
to the version stamp of when we first retrieved the source.  If it
differed, we could retrieve the difference and apply it as a patch,
updating that local version stamp.

Yeah I know, a bit grotty.  

Is it possible to have both?  That is, we rename what is currently "git"
to become just another dated snapshot, and "git" becomes HEAD? 

---------------------------------------------------------------------- 
 mjd - 10-07-08 17:54  
---------------------------------------------------------------------- 
Reported fec.c/bcopy problem to upstream:

  http://lists.infradead.org/pipermail/linux-mtd/2008-October/023173.html 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-03-08 09:40  mjd            New Issue                                    
10-03-08 09:40  mjd            Status                   new => assigned     
10-03-08 09:40  mjd            Assigned To               => buildroot       
10-03-08 09:40  mjd            File Added: mtd-utils-git-from-head-1.diff       
            
10-03-08 09:42  mjd            Note Added: 0012684                          
10-03-08 10:01  bernhardf      Note Added: 0012694                          
10-03-08 16:47  mjd            Note Added: 0012714                          
10-03-08 16:49  mjd            Note Added: 0012724                          
10-06-08 22:00  egtvedt        Note Added: 0012904                          
10-07-08 00:07  mjd            Note Added: 0012914                          
10-07-08 06:17  hmoffatt       Note Added: 0012984                          
10-07-08 06:20  hmoffatt       Note Added: 0012994                          
10-07-08 06:36  mjd            Note Added: 0013004                          
10-07-08 06:38  mjd            Note Edited: 0013004                         
10-07-08 06:46  hmoffatt       Note Added: 0013014                          
10-07-08 06:46  hmoffatt       Note Edited: 0013014                         
10-07-08 17:10  mjd            Note Added: 0013024                          
10-07-08 17:54  mjd            Note Added: 0013034                          
======================================================================
