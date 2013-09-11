From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Sep 2013 09:17:00 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
Message-ID: <20130911091700.0b24df41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

First of all, thanks for the feedback.

On Tue, 10 Sep 2013 20:32:32 -0500, rjbarnet at rockwellcollins.com wrote:

> Thank you so much for this patchset as it address the biggest issue that
> my company currently has with buildroot and will help us become a much 
> bigger
> contributer to buildroot since we can move to a model that is conducive to
> contributing changes back up to buildroot.

Glad to hear this!

> > Following the e-mail from Ryan Barnett entitled "[RFC] New feature to
> > handle a custom board folder", I finally took a bit of time to
> > implement how I think the support for externally stored Buildroot
> > customization should be done.
> 
> After getting feedback from Arnout my idea of how this shifted towards 
> the model that you've implemented here in this patchset. However, without
> intimate knowledge of top-level make structure/kconfig, I didn't quite
> visualize this implementation.
> 
> With  the Buildroot mailing list I did not see this patchset until this
> morning so you can disregard my thoughts about my second revision of how 
> to approach this problem even though I was starting to gravitate towards
> this approach. However, my reasoning of why I would like to push for some
> thing like this still stand.

Ok. Note that after I posted my patches, I had a discussion with Yann
Morin on IRC and he was skeptical about it, for two reasons:

 (1) Almost all of what BR2_EXTERNAL allows is possible today with the
     current Buildroot. For board level stuff, nothing forces you to
     store it in board/<foo>/ within the Buildroot tree: all of the
     configuration options in Buildroot can use
     $(TOPDIR)/../company/<foo>/ to reference a kernel configuration
     file, or a root filesystem overlay.

     For packages, the 'local.mk' file is already automatically
     included in Buildroot if it exists. So you can create such a file
     and put a "include $(TOPDIR)/../company/external.mk' line in it.
     This external.mk will include all the makefiles of the external
     packages. Since Config.in can't be integrated as easily, one
     solution would be to hardcode BR2_PACKAGE_FOOBAR=y directly within
     external.mk to have it always enabled.

     So, it's already possible today, but I believe the current
     situation is (a) not very easy to use, and (b) not visible enough.
     (b) could be solved by more documentation, but I believe
     BR2_EXTERNAL does not make Buildroot more complicated and solves
     (a) quite nicely.

 (2) Yann's feeling was that by giving a too easy solution to keep
     things out of tree would discourage BR users from contributing
     their new packages upstream, since they can keep it outside of the
     tree nicely. While I certainly admit it can be the case, your
     introduction to this e-mail interestingly points exactly the
     opposite :-)

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
