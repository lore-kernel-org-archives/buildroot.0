From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2011 10:46:38 +0100
Subject: [Buildroot] Pre-RFC: clean integration of unclean packages
Message-ID: <201112051046.38674.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi all,

 [Please keep me in CC]

 I mentioned a couple of months ago that I was trying to integrate TI's SDK's for accessing the accelerator hardware on DaVinci and OMAP platforms.  I had given up on that but now I picked it up again.

 I did make some progress already.  The most important step is that I found tarballs or svn repositories for all the packages that I need, so we can avoid executing a binary installer.

 A second problem is that TI uses a horrible self-cooked build system. It makes assumptions about file locations that are difficult to satisfy.  In addition, some packages don't even have a Makefile.  And finally, they generate libraries with names like 'cmem.a470MV' instead of the usual 'libcmem.a'.  To overcome all this, I wrote a custom 'Makefile.ti' that is used by buildroot instead of the packages' Makefiles.  Does everybody agree that this is a good idea, or does someone have a better suggestion?

 A third problem is that some packages depend on 'xdctools'.  This is a system to ease integration of embedded components into Eclipse.  One small part of it is a header file that defines some standard types (basically stdint.h and stdbool.h but with different names).  The whole xdctools package is a source tree of about half a gig, but for buildroot we just need this one 'std.h' file out of it...  So I decided to copy that file directly into buildroot.  Does everybody agree that this is a good idea, or does someone have a better suggestion?

 Finally, a fourth problem is that some packages assume they can directly access other packages' source trees.  To be precise: in the source code, you'll see things like #include <ti/sdo/ce/osal/Memory.h>; the Makefile adds a -I<other-src-tree> to the CFLAGS.  Now, I consider it a Bad Thing to rely on the presence of another source directory, so as a solution I just install all the header files in the staging tree.  Does everybody agree that this is a good idea, or does someone have a better suggestion?


 Thank you for your feedback!  And hopefully you'll see a first RFC for the TI libraries in a week or two.

 Regards,
 Arnout


 PS I haven't had time to keep up with the BR mailling list lately (I'm 250 messages behind at the moment), so please keep me in CC.

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111205/8aa95db3/attachment.html>
