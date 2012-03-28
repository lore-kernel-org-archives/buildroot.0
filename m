From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Mar 2012 23:01:40 +0200
Subject: [Buildroot] select and depends on for libraries
In-Reply-To: <20120327002821.5b701e8e@skate>
References: <20120327002821.5b701e8e@skate>
Message-ID: <201203282301.43724.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 27 March 2012 00:28:21 Thomas Petazzoni wrote:
> Hello,
> 
> We typically use "select" to mark at the Kconfig level the dependencies
> between a package and its libraries. However, when such a dependency
> has some "depends on" dependencies, they must be replicated at the
> level of all packages that are selecting this dependency, i.e:
> 
> config FOO
> 	bool
> 
> config PACKAGE_A
> 	depends on FOO
> 
> config PACKAGE_B
> 	select PACKAGE_A
> 	depends on FOO # we must have this dependency
> 
> I now have the case of libffi. libffi cannot be built for various
> architectures, for example Blackfin (see
> http://autobuild.buildroot.org/results/3db2d6c1e77b2c6460bd8187588a3590a4329aaf/build-end.log).
> libffi being inherently architecture-specific, adding support for new
> architectures is not a two-lines fix. So, BR2_PACKAGE_LIBFFI should
> "depends on !BR2_bfin".
> 
> Unfortunately, libglib2 depends on libffi. So libglib2 would also have
> to carry the "depends on !BR2_bfin". And also the ~30 packages that
> "select BR2_PACKAGE_LIBGLIB2". And the absolutely enormous number of
> packages that "select BR2_PACKAGE_LIBGLIB2", either directly or
> indirectly.
> 
> Do we really want to do this?

 We don't really want to do this, but what's the alternative?

- Fix Kconfig to proporly handle mixed select/depend.  But that implies to 
either fork the kernel's Kconfig completely, or to upstream it.

- Don't use 'select', ever.  But than we have to modify even more packages,
and it's much less convenient to use.

- Treat libglib2 as one of the 'big features' like the toolchain options,
but that doesn't really change the problem (all dependents still have to
be updated to add a comment).

- Generate the Config.in files from some meta-format, so that the
generator can take care of depends propagation.  Definitely more work
than modifying Kconfig itself :-)


 I don't see a good solution :-(



 A workaround is the following:

- remove the 'depends on !BR2_bfin' from libffi;

- add the following to libffi.mk:
ifeq ($(BR2_bfin),y)
$(error libffi does not support Blackfin)
endif

- in the autobuild scripts, detect this type of error and ignore it.



 On the longer term I'm afraid it will boil down to fixing Kconfig.
But I guess that's hard, otherwise it would have been done already.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
