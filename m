From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2009 00:36:12 +0100
Subject: [Buildroot] [2010.02] Package infrastructure ready
Message-ID: <20091129003612.0dd95e2b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've now completed the work I wanted to do on the new package
infrastructures, and consider it ready for inclusion into the next
version of Buildroot, 2010.02. I'm therefore asking people to review
the patches and give their opinion and comments.

Unless there are comments, I don't plan to make any further change
before officially sending these patches, right after the 2009.11
release.

The code is available at :
 http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=package-infrastructure

The documentation has been updated accordingly. I've put online the
corresponding version :
 http://free-electrons.com/~thomas/buildroot.html#add_packages

There are a few points on which I'd like to have your input:

 * The macro for the generic package infrastructure is named
   PKGTARGETS, and for the autotools infrastructure, the macro is named
   AUTOTARGETS. I don't particularly like this naming, but what's your
   opinion ? Do you have other proposals ? Wouldn't something like
   make-generic-package and make-autotools-package be more explicit ?
   Too long ?

 * The generic infrastructure is in package/Makefile.package.in. Maybe
   I should put it into package/Makefile.generic.in. What's your
   opinion ?

 * I have a more complicated point about how the directory containing
   the source code is referenced from the actions listed in the
   PKG_xxxx_CMDS variables.

   We can use $(@D), which is the directory that contains the stamp
   file, so it is the directory that has been extracted by the tarball.
   $(@D) is short and works well in most situations.

   The situation where $(@D) doesn't work is when the
   configure/Makefile stuff is in fact in a subdirectory of the tarball
   (and not in the root directory). In this case, the package should
   define PKG_SUBDIR = foo, and the package infrastructure will define
   PKG_SRCDIR. Therefore, the package should use $$($$(PKG)_SRCDIR)
   (double quoting needed otherwise the variable is evaluated before it
   is defined). I find this rather ugly.

   Therefore, my proposal is :

    * In the generic infrastructure, to let the .mk developer handle
      this problem. He has to use $(@D) or $(@D)/something.

    * In the autotools infrastructure, keep the PKG_SUBDIR mechanism we
      add, so that the $$($$(PKG)_SRCDIR) trick is hidden in
      Makefile.autotools.in.

Thanks for your input,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
