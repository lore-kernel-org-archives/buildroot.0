From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 09:09:15 +0100
Subject: [Buildroot] Analysis of build results for 2016-11-23
In-Reply-To: <20161125002248.GA3200@tungsten.ozlabs.ibm.com>
References: <20161124073011.C2C1620BD5@mail.free-electrons.com>
 <20161124094429.4152c19b@free-electrons.com>
 <20161125002248.GA3200@tungsten.ozlabs.ibm.com>
Message-ID: <20161125090915.34071222@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Nov 2016 11:22:48 +1100, Sam Bobroff wrote:

> > >    powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/314446eb6824277187ce3e2a7285226d67f731f5  
> > 
> > checking for perfmon/pfmlib.h... no
> > configure: error: pfmlib.h not found; may be provided by libpfm devel or papi devel package
> > 
> > Sam: we currently have:
> > 
> > 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
> >         # libpfm4 is needed on PowerPC, and requires thread support
> >         depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc
> > 
> > Perhaps we need to also select libpfm4 on powerpc64 (and le) ?  
> 

> It looks like we do. I tried a build of oprofile on powerpc64le and
> it fails as above unless pfmlib is present. It will almost certainly
> be the same on powerpc64. Would you like me to send a patch?

Yes, please. Note that you also need to update the line:

	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc

Indeed: on PowerPC/PowerPC64 pfmlib is *required* and pfmlib needs NPTL
thread support, so we must have a BR2_TOOLCHAIN_HAS_THREADS_NPTL
dependency on PowerPC/PowerPC64, but not on other architectures. Since
this might be growing a bit long in terms of architectures to list, I
would suggest to introduce a hidden Config.in boolean:

# oprofile requires the libpfm4 dependency on a number of architectures
config BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
	config
	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le

(of course I have no idea if powerpc64le is supported, you would have
to check).

And then, in the BR2_PACKAGE_OPROFILE option, do something like:

	select BR2_PACKAGE_LIBPFM4 if BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
