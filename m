From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Apr 2013 10:05:12 +0200
Subject: [Buildroot] [PATCH v5 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <CAJxxZ0PoEysfHc23PHfqkVktvoGiQoDBNd+-z3PTOL40=Zfwhg@mail.gmail.com>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-6-git-send-email-sonic.adi@gmail.com>
 <20130416232925.759eb9df@skate>
 <CAJxxZ0PoEysfHc23PHfqkVktvoGiQoDBNd+-z3PTOL40=Zfwhg@mail.gmail.com>
Message-ID: <20130417100512.5433f4c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Wed, 17 Apr 2013 15:50:01 +0800, Sonic Zhang wrote:

> This is intended. When option BINFMT_FLAT_SHARED is selected option
> BR2_BFIN_INSTALL_FLAT_SHARED should always be set to y. While other
> BINFMT is selected, BR2_BFIN_INSTALL_FLAT_SHARED is optional for
> developer to decide.

Ok, I see, makes sense. But then, why don't we have the same for FDPIC?
Also, I think I'd prefer something like:

# When the FDPIC binary format is used, we force the installation
# of the corresponding libraries. When a different binary format is
# used, we offer the option of installing the FDPIC shared libraries
# (typically in addition to the FLAT shared ones).
config BR2_BFIN_INSTALL_FDPIC_SHARED
	bool "Install FDPIC shared libraries" if !BR2_BINFMT_FDPIC
	default y if BR2_BINFMT_FDPIC
	help
	  ...

# When the FLAT shared binary format is used, we force the installation
# of the corresponding libraries. When a different binary format is
# used, we offer the option of installing the FLAT shared libraries
# (typically in addition to the FDPIC ones).
config BR2_BFIN_INSTALL_FLAT_SHARED
	bool "Install FLAT shared libraries" if !BR2_BINFMT_FLAT_SHARED
	default y if BR2_BINFMT_FLAT_SHARED
	help
	  ...

Would this makes sense?

> >> +ifeq ($(BR2_bfin,y)
> >
> > Do you actually test the patches you're posting?
> 
> Yes, but when I prepare patches for upstream, I apply to a different
> branch, and sometimes make typo error.

Ok. But then at some point we'll want to apply your patches, so they
should be working :-) (Though I understand during the review process
you want to make quick iterations, that's fine, but ultimately, we'll
want working patches).

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
