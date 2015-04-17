From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Fri, 17 Apr 2015 08:58:44 -0400 (EDT)
Subject: [Buildroot] a philosophical question about Config.in and "comment"
	directives
Message-ID: <alpine.LFD.2.11.1504170840320.7665@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  mostly a pedantic question about Config.in file aesthetics, but
consider this one, ripped straight from the code base:

  config BR2_PACKAGE_A10DISP
        bool "a10disp"
        depends on BR2_arm
        depends on BR2_LINUX_KERNEL
        help
          Program to change the display mode of Allwinner ARM SOCs running
          the linux-sunxi kernel (and not the mainline kernel.)

          http://github.com/hglm/a10disp

  comment "a10disp needs a Linux kernel to be built"
        depends on BR2_arm
        depends on !BR2_LINUX_KERNEL

  yes, i can see what the above does ... first, it depends on arm to
even be processed. furthermore, it depends on the selection of a
linux kernel, otherwise the comment kicks in to warn the user that
that option requires a kernel. so far, fine. but here's the rub.

  as i see it, there are two levels of "dependency" for this option.
first, there's the dependency on arch being arm, and you can see that
the dependency line

   depends on BR2_arm

appears in *both* the config and comment directives. so without that,
you see *nothing* about that selection -- not the choice, nor the
comment warning you about it.

  OTOH, there is the dependency on a kernel, for which this file
*will* generate a comment stating that, if you want this selection,
you'll need a kernel. in *that* case, the user is being politely
notified that, while this selection is not currently available,
they're "close", and they can see it if only they select a kernel.

  from my perspective, those are two different levels of dependency.
the dependency on arch being arm should be treated as wrapping the
*entire* config file. i mean, you'd never generate a comment stating,
"this option requires you to have selected arch = arm" -- that would
be just silly. but telling someone they need a kernel to configure
this option *does* make sense.

  to distinguish between these two "levels" of dependency, i think it
would be far clearer to rewrite a file like that as:

  if BR2_arm

  config BR2_PACKAGE_A10DISP
        bool "a10disp"
        depends on BR2_LINUX_KERNEL
        help
          Program to change the display mode of Allwinner ARM SOCs running
          the linux-sunxi kernel (and not the mainline kernel.)

          http://github.com/hglm/a10disp

  comment "a10disp needs a Linux kernel to be built"
        depends on !BR2_LINUX_KERNEL

  endif

that layout makes it far clearer that the entire option depends on
arm or you see *nothing* and, further, internally, the dependencies
in the comment list *only* those dependencies that the user will be
warned that they need if they want this selection.

  i just think having the dependency line

  depends on BR2_arm

in both the config and comment directives is unnecessary duplication,
and that that kind of dependency should be moved up to encompass the
entire Config.in file, however that's best done.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
