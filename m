From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Tue, 17 Dec 2013 11:47:20 -0600
Subject: [Buildroot] [ PATCH v4 16/20] busybox: add option to install
 individual binaries
In-Reply-To: <20131215171059.767cfd8b@skate>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>	<1386872840-22051-17-git-send-email-clshotwe@rockwellcollins.com>
 <52AA4069.3000707@mind.be> <20131215171059.767cfd8b@skate>
Message-ID: <OFE239C534.33A2684C-ON86257C44.0060F30B-86257C44.0061B352@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 12/15/2013 
10:10:59 AM:

> > >
> > > +config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
> > > +   bool "Individual binaries"
> > 
> >   This really lacks some help text, even I had no idea what it meant
> > at first. I guess the text from busybox can just be reused - though
> > for SELinux there's obviously a different reason.
> 
> In fact, the patches from me in this series were not really meant to be
> sent to the list. They are proof-of-concept patches that I did to help
> Clayton, but some more work was needed before they could be submit for
> real.

I apologize for just sending these out without any context or much of a 
second review.
I will get them cleaned up a little bit and resubmit them.
 
> >          If your CPU architecture doesn't allow for sharing
> > text/rodata sections of running binaries, but allows for runtime
> > dynamic libraries, this option will allow you to reduce memory
> > footprint when you have many different applets running at once.
> > 
> >          If your CPU architecture allows for sharing text/rodata,
> >          having single binary is more optimal.
> > 
> >          Each applet will be a tiny program, dynamically linked
> >          against libbusybox.so.N.N.N.
> > 
> >          You need to have a working dynamic linker.
> 
> In the context of SELinux, it's because SELinux can only apply
> different security policies to the various applets if they use
> different binaries.
> 
> >   That last sentence makes me think that we're missing a depends on 
> > !BR2_PREFER_STATIC here.
> 
> Indeed.
> 
> Also, I am not sure we want to show this option in the top-level
> package menuconfig. So, we can either:
> 
>  * Have a sub-menu for Busybox customization options
>  * Make this behavior automatic whenever SELinux support is enabled,
>    and only in this case
> 
> > > +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> > > +define BUSYBOX_PERMISSIONS
> > > +/usr/share/udhcpc/default.script f 755  0 0 - - - - -
> > 
> >   Isn't setuid root needed anymore for /bin/login? Same for passwd,
> > su, probably others...
> 
> Most likely yes. I have been able to log into the system with this
> patch, though.

I will come up with a base list of applications that need suid and add
it to the patch.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
