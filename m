From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 21:19:10 +0100
Subject: [Buildroot] [RFCv3 07/15] package/pkg-generic: handle host-tar
 as an extract dependency
In-Reply-To: <20171202150606.GC2988@scaer>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-8-thomas.petazzoni@free-electrons.com>
 <20171202150606.GC2988@scaer>
Message-ID: <20171202211910.7f2a7b96@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Dec 2017 16:06:06 +0100, Yann E. MORIN wrote:

> > To achieve that, check-host-tar.mk fills in the  
> 
> s/$/ variable/

ACK, will fix.

> > The BR2_TAR_HOST_DEPENDENCY is added to all packages, except host-tar
> > itself (obviously) and host-skeleton, because we depend on
> > host-skeleton to install host-tar properly in HOST_DIR.  
> 
> As we discussed on IRC, there is also the case for the tar filesystem,
> which may require host-tar.
> 
> Granted, it is very very unlikely that we end up with no package that
> require host-tar, but still...

Yes, I agree, the tar filesystem should depend on
$(BR2_TAR_HOST_DEPENDENCY) as well. I'll fix that.

> > +ifeq ($(filter host-tar host-skeleton,$(1)),)
> > +$(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
> > +endif  
> 
> So, even packages that are available as a zip file will get the
> dependency on host-tar?

Yes. Like host-xz/host-lzip, my series does not attempt to switch to
more fine-grained dependencies, it only intends to move to proper
package dependencies. Using more fine-grained dependencies is left for
future work.

> >  ifeq (,$(call suitable-host-package,tar,$(TAR)))
> > -DEPENDENCIES_HOST_PREREQ += host-tar
> >  TAR = $(HOST_DIR)/bin/tar
> > +BR2_TAR_HOST_DEPENDENCY += host-tar  
> 
> Why assign-append here, instead of simply assign?

Good point, will fix.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
