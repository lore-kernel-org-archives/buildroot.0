From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 15:58:27 +0200
Subject: [Buildroot] [PATCH 3/3] coreutils: add TODO note about
 stripping the installed binaries
In-Reply-To: <871vnxugef.fsf@macbook.be.48ers.dk>
References: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<385e9e4ea5d66bb6d7189f818f6b28c3df32f277.1249045363.git.thomas.petazzoni@free-electrons.com>
	<871vnxugef.fsf@macbook.be.48ers.dk>
Message-ID: <20090731155827.71a41bd7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 31 Jul 2009 15:32:40 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> We should actually rework the strip stuff as it doesn't make much
> sense to both do strip at package install time and just before
> generating the file systems.
> 
> We would probably simplify stuff a bit to always use install /
> install-exec and only strip at the end if wanted.

Same thing for the installation of headers or documentation. We have
different cases :

 * Some packages do make install into the staging dir, and then
   carefully copy only what's needed to the target dir (excluding
   documentation and headers) ;

 * Some packages do make install into the target dir, then cleanup
   what's not needed, sometimes looking at BR2_HAVE_DEVFILS and
   BR2_HAVE_DOCUMENTATION, sometimes not ;

 * Some packages do make install into the target dir, and don't cleanup
   anything, waiting for the final global cleanup of the root
   filesystem done by target-finalize in the main Makefile.

I don't have a particularly strong opinion on this and the strip case.
Intuitively, I would say I find the solution of letting each package
handle its stripping and its installation properly to be the cleanest
solution (i.e no global final cleanup).

I know at least of one corner case that would defeat the global
stripping approach: binaries developed in OCaml. See
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=256900. Admittedly,
that's a corner case and I don't think we really care about it, but
that's a known drawback of the global approach: it's not possible to
make fine-grained exceptions (but is it a problem ? not sure).

Another advantage of the per-package approach is that simply doing
"make install" to the target space is sometimes too heavy for some
packages, that install some utility/test/config/sample applications
that we don't want on the target. Using a per-package approach would
probably encourage people to be more careful about what they install in
the target space.

To conclude: I think I have a preference for the per-package approach,
but I wouldn't complain too much if the global approach only is the one
we go with :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
