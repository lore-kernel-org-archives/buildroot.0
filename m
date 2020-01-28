From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Jan 2020 10:14:31 +0100
Subject: [Buildroot] host-python-2.7 failure to build _hashlib
In-Reply-To: <CA+h21hr2ReX5zxqmRrM9dq77S-nwqSQvmTQh6N-FLEvoooUfLw@mail.gmail.com>
References: <CA+h21hors57FFbQzm0x2Rd_pABb95-GaxPOPiRQ5ZzB9NgT-Mg@mail.gmail.com>
 <20200127234031.79371041@windsurf>
 <CA+h21hr2ReX5zxqmRrM9dq77S-nwqSQvmTQh6N-FLEvoooUfLw@mail.gmail.com>
Message-ID: <20200128101431.02251042@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vladimir,

On Tue, 28 Jan 2020 01:39:57 +0200
Vladimir Oltean <olteanv@gmail.com> wrote:

> > Because we don't enforce this for host packages. We do enforce it for
> > target packages (i.e a target package cannot be built if its Config.in
> > option is not enabled somehow). But we don't enforce it for host
> > packages.
> >
> > For example, host-pkgconf has a visible Config.in option called
> > BR2_PACKAGE_HOST_PKGCONF. However, almost none of the packages that
> > depend on host-pkgconf have a select BR2_PACKAGE_HOST_PKGCONF.
> >  
> 
> Why not?

That's mainly historical. We used to not have any visible Config.in
option for host packages: host packages were only built as build
dependencies of target packages. But then, we realized that some host
packages were not just mere build dependencies of target packages: they
were useful by themselves. This is the case for flashing tools,
debugging tools, filesystem image creation utilities, and more. So we
started adding Config.in options for host packages.

We have been considering adding Config.in options for all host packages
(some visible, some hidden), but adding all those "select" was
considered too much of a burden compared to the benefit.

We had some discussion about this at a previous Buildroot Developers
meeting, after FOSDEM 2019. See the notes of the discussion:
https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019#.22Config.in.host.22_for_all_host_packages.

> > > - The Makefile doesn't complain that they don't (usually it does, when
> > > packages add _DEPENDENCIES that are absent from Config.in)  
> >
> > See above: only for target packages.
> >  
> > > When I enable BR2_PACKAGE_HOST_PYTHON and BR2_PACKAGE_HOST_PYTHON_SSL
> > > in .config, I am able to carry on with the build.
> > >
> > > Can somebody please explain what is going on?
> > > I am not a proficient Python user either, by the way.  
> >
> > I don't really understand why your host-python package fails to build.
> > Could you share the entire build log of the host-python package ?
> >  
> 
> So it looks like the mailing list didn't like my log pasted in here.
> Let's try Github gists:
> https://gist.github.com/vladimiroltean/4d6b1441b0dbe64dc8e2f9d1ce336e42

We're not explicitly disabling building the hashlib module when
building host-python, and hashlib needs OpenSSL, but apparently the
OpenSSL of your system is not compatible with Python 2.x.

Could you try the following change ?

diff --git a/package/python/python.mk b/package/python/python.mk
index 41a981e3d3..cd79be78f6 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -33,7 +33,8 @@ HOST_PYTHON_CONF_OPTS += \
        --disable-test-modules \
        --disable-bz2 \
        --disable-ossaudiodev \
-       --disable-pyo-build
+       --disable-pyo-build \
+       --disable-hashlib
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
