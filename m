From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 09:32:43 +0200
Subject: [Buildroot] [PATCH] package/pflash: new package
In-Reply-To: <CACPK8XeOj5AyLk6iNZZ2-0ouc2O5W30YRfpZTLAQ=nPxEPZ1cw@mail.gmail.com>
References: <1469426487-19558-1-git-send-email-joel@jms.id.au>
 <20160726000756.560aa52e@free-electrons.com>
 <CACPK8XeOj5AyLk6iNZZ2-0ouc2O5W30YRfpZTLAQ=nPxEPZ1cw@mail.gmail.com>
Message-ID: <20160726093243.757a4842@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 11:57:17 +0930, Joel Stanley wrote:

> >> diff --git a/package/pflash/Config.in b/package/pflash/Config.in
> >> new file mode 100644
> >> index 000000000000..315989724088
> >> --- /dev/null
> >> +++ b/package/pflash/Config.in
> >> @@ -0,0 +1,6 @@
> >> +config BR2_PACKAGE_PFLASH
> >> +     bool "pflash"
> >> +     depends on BR2_arm || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64  
> >
> > Is there something that makes it inherently usable only on those
> > architectures?  
> 
> Yeah, the 'libflash' library selects different backends depending on it's

OK. But then it makes sense only for pflash itself, and not skitool as
the whole I suppose?

> > So skiboot is a much much larger repository, with lots of other things,
> > and you're building just the external/pflash subdirectory of it.
> >
> > Are you sure we'll never want to have a package for other things in the
> > skiboot repository?  
> 
> We might want to package other tools in the future.
> 
> How should I change the packaging of pflash?

A top-level BR2_PACKAGE_SKITOOL option, with a package called skitool.
And then a sub-option BR2_PACKAGE_SKITOOL_PFLASH, which enables the
build/installation of pflash.

BR2_PACKAGE_SKITOOL can "select" BR2_PACKAGE_SKITOOL_PFLASH to make
sure the package at least installs one thing.

> > Also, we prefer the -C option and its argument to be part of the build
> > and install commands themselves.  
> 
> Even though we would be replicating them for every invocation of make?
> I think it's better placed in a variable so changes can be made in one
> place.

We generally repeat the -C $(@D) in the different invocations, yes. Not
sure it's ideal, but that's how we typically do it in most packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
