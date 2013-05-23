From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 13:12:51 +0200
Subject: [Buildroot] Design issue with the out-of-tree support
Message-ID: <20130523131251.2ffc509f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've restarted the work on supporting the per-package out-of-tree
support, and I stumbled across a problem about which I'd like to seek
the community opinion.

Currently, the "autoreconf" is executed as a pre-configure hook, i.e it
is part of the configure step, and this is wrong when you move to
out-of-tree build per packages.

When you do out-of-tree build per package, for each package, you have:

 * A source tree, output/src/<name>-<version>/
 * A target build tree, output/build/<name>-<version>/
 * Optionally, a host build tree, output/build/host-<name>-<version>/

Running the configure script is something that should be done in the
build tree, so it's really part of the steps that should be executed
once for the target build, once for the host build.

However, running autoreconf is something that should be done in the
source tree. It's part of the "patching" process of the package, more
than its configuration step.

So, in my out-of-tree branch, I've moved the autoreconf step as a
post-patch hook rather than a pre-configure hook.

The problem is that dependencies of a package are only prepared before
its configure step is executed. This means that host-autoconf,
host-automake and host-libtool are not yet available at the "patch"
step, so we can't autoreconf yet.

You could tell me: let's move the package dependencies as a dependency
of the patch step rather than the configure step. Yes, you could tell
me that. But it would break the RTAI integration that we have in
Buildroot, which relies on the assumption that the patch step of a
given package can be executed without its dependencies being pulled in.
See a473a616d27e46951a23d90249a31b08006098bf (package: change ordering
of steps).

So, what I've done in my prototype of out-of-tree support is something
like this:

$(1)-patch:	$(filter host-autoconf host-automake host-libtool,$$($(2)_DEPENDENCIES)
		...

$(1)-configure:	$$($(2)_DEPENDENCIES)

The idea is that if the package needs host-autoconf, or host-automake
or host-libtool in its dependencies, then we pull these dependencies
before the "patch" step, and all other dependencies are pulled before
the "configure" step.

This works for most packages, but not all! Some packages, for their
autoreconf step, need more than host-autoconf, host-automake or
host-libtool. They might require host-pkgconf or host-gettext, to
install some .m4 macro files that are needed to make the autoreconf
work. So in fact, discriminating between dependencies that should be
pulled in before the "patch" step and the dependencies that can wait
until the "configure" step is not simple.

Do you see solutions to this?

I see several possibilities:

 * In all packages, split in two variables the dependencies needed at
   autoreconf time from the dependencies needed at configure time. But
   this seems horrible and difficult to maintain and understand for
   users.

 * Make $(1)-patch depend on all dependencies. This will break RTAI, so
   we can exclude 'linux' for the list of $(1)-patch dependencies. So
   something like:

   $(1)-patch: $(filter-out linux,$$($(2)_DEPENDENCIES))
		...

   $(1)-configure: $(filter linux,$$($(2)_DEPENDENCIES))
		...

 * Make autoreconf a step on its own, instead of being either a
   pre-patch hook or a post-patch hook. This may also allow to do
   something like a 'make <pkg>-reautoreconf' target, like we have
   'make <pkg>-reconfigure' and 'make <pkg>-rebuild'. Then, this
   autoreconf step would be the one that has:

   $(1)-autoreconf: $$($(2)_DEPENDENCIES)

   which would work ok, since the RTAI/Linux integration depends on
   rtai-patch, which wouldn't pull the dependencies of the rtai package.

   However, I am not yet sure how to insert this step into the package
   logic, since this step is specific to autotools package, and
   therefore would normally not belong to the pkg-generic.mk
   infrastructure.

 * Find a different solution for RTAI, so that we can pull the
   dependencies before the "patch" step.

Here is a quick explanation for the RTAI issue, to refresh your minds
if needed:

 RTAI is delivered as a tarball, which has a configure script to build
 its userspace libraries, so it is a autotools package, see
 package/rtai/.

 This tarball also contains the kernel patches that must be applied.

 In order for the kernel to be built, we need these patches to be
 available, so the package/rtai package must be extracted and patched.
 This explains why you have LINUX_DEPENDENCIES += rtai-patch in
 linux/linux-ext-rtai.mk.

 And on the other hand, the 'rtai' package itself can't be
 configured/built *before* the Linux kernel has been built, because it
 builds kernel modules, and to build kernel modules, you need an
 already built kernel tree (and remember, to build the kernel, we must
 first apply the RTAI patches).

Ideas?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
