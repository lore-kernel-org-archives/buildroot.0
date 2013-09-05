From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Thu, 5 Sep 2013 08:18:51 -0500
Subject: [Buildroot] [PATCH 02/17] libselinux: new package
In-Reply-To: <20130905095129.7396d46c@skate>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>	<1378336196-27403-3-git-send-email-clshotwe@rockwellcollins.com>
 <20130905095129.7396d46c@skate>
Message-ID: <OF77692896.95B79E1F-ON86257BDD.00474F46-86257BDD.004923B8@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/05/2013 
02:51:29 AM:

> >  menu "Security"
> >  source "package/libsepol/Config.in"
> > +source "package/libselinux/Config.in"
> >  endmenu
> 
> Same comment as previous package: libselinux is a library, so it should
> be under Target packages -> Libraries.

Agree

> > +config BR2_PACKAGE_LIBSELINUX
> > +   bool "libselinux"
> > +   depends on BR2_LINUX_KERNEL
> 
> Hum, can you clarify why a dependency on the kernel is needed here?

Probably shouldn't be an explicit one, though SELinux will not work 
outside of Linux.  I will go ahead and remove this dependency.

> > +config BR2_PACKAGE_LIBSELINUX_PYTHON_BINDINGS
> > +   select BR2_PACKAGE_PYTHON
> 
> Here I am not sure whether we should have:
> 
>  (1) An option that selects BR2_PACKAGE_PYTHON (as you did)
> 
>  (2) An option that depends on BR2_PACKAGE_PYTHON
> 
>  (3) No option at all, and have the package automatically enable Python
>      bindings when BR2_PACKAGE_PYTHON is enabled.
> 
> What do the others think?

I added this option because the policycoreutils package contains utilities 
that rely on the python bindings from the libselinux and sepolgen 
packages.  What I can do is remove the option and have the bindings for 
libselinux and sepolgen depend on BR2_PACKAGE_PYTHON. I can then change 
policycoreutils select BR2_PACKAGE_PYTHON which would enable the other 
two.  This would also allow the bindings to be generated any time Python 
support is enabled.
 
> Then you should select BR2_PACKAGE_LIBSEPOL and BR2_PACKAGE_PCRE in
> your Config.in file.

Can do.

> > +HOST_LIBSELINUX_DEPENDENCIES = host-python host-libsepol host-
> swig host-pcre
> 
> So for the host variant, the Python bindings are always enabled? Is
> there a reason for that?

This was just a easier way than checking to see if host python is being 
installed.  Should I break this out and if so, what should I check to see 
if the host version is being installed?

The same DESTDIR comments from my previous email apply to this package 
also.  I will pull the generic changes into all of my patches and resubmit 
them if that works for you.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130905/15910dc8/attachment-0001.html>
