From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Mar 2012 00:28:21 +0200
Subject: [Buildroot] select and depends on for libraries
Message-ID: <20120327002821.5b701e8e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We typically use "select" to mark at the Kconfig level the dependencies
between a package and its libraries. However, when such a dependency
has some "depends on" dependencies, they must be replicated at the
level of all packages that are selecting this dependency, i.e:

config FOO
	bool

config PACKAGE_A
	depends on FOO

config PACKAGE_B
	select PACKAGE_A
	depends on FOO # we must have this dependency

I now have the case of libffi. libffi cannot be built for various
architectures, for example Blackfin (see
http://autobuild.buildroot.org/results/3db2d6c1e77b2c6460bd8187588a3590a4329aaf/build-end.log).
libffi being inherently architecture-specific, adding support for new
architectures is not a two-lines fix. So, BR2_PACKAGE_LIBFFI should
"depends on !BR2_bfin".

Unfortunately, libglib2 depends on libffi. So libglib2 would also have
to carry the "depends on !BR2_bfin". And also the ~30 packages that
"select BR2_PACKAGE_LIBGLIB2". And the absolutely enormous number of
packages that "select BR2_PACKAGE_LIBGLIB2", either directly or
indirectly.

Do we really want to do this?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
