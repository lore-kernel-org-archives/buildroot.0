From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Sep 2012 05:38:51 +0200
Subject: [Buildroot] [UNSURE]Re:  [PATCH 01/13] perl: new package v6
In-Reply-To: <CAB0FRsu9fyH_9+QtLgbXrTMA=zqmR1io5vCO6cEYFQfwgtNcxw@mail.gmail.com>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <20120920215636.6d86b7b5@skate>
 <CAB0FRsu9fyH_9+QtLgbXrTMA=zqmR1io5vCO6cEYFQfwgtNcxw@mail.gmail.com>
Message-ID: <20120922053851.25e90b1e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Fri, 21 Sep 2012 23:29:57 +0200, Fran?ois Perrad wrote:

> > Please explain in more details what this means, and whether this
> > patch has a chance of being upstream or not.
> >
> > Also, it seems to imply that the build process of Perl would require
> > Qemu. Or, Qemu is not amongst the requirements of Buildroot, and
> > there is no host-qemu package in the dependencies of your package
> > (and we don't have a host-qemu package). Yann E. Morin has posted a
> > target package for qemu a while ago, but it hasn't been merged so
> > far.
> >
> > That said, even so it is certainly possible to create a host-qemu
> > package, I am a bit annoyed to see the build process of a package
> > requiring qemu. Is there really no other way? I guess it uses qemu
> > to run a bunch of tests on the target system. Is there no way to
> > provide pre-defined values for those tests, on a per-architecture
> > basis, rather than running those test applications in Qemu?
> >
> 
> Qemu is not used for test, but for the configure and build step.
> Perl is 'bootstrapped' by miniperl (a perl without any extension
> module), during the build process, miniperl is running via qemu (user
> mode).
> 
> Perl doesn't use the "standard" autotools, Perl has a limited support
> for cross-compiling
> where the target executables are running on a real target through a
> ssh connection.
> The use of qemu (user mode) removes the need of a real target and the
> ssh connection.
> 
> BR is shipped with 12 configs/qemu_*_defconfig files,
> many users have already run 'apt-get install qemu-kvm
> qemu-kvm-extras'.
> 
> A host-qemu package (with the latest version) could be nice in the
> future.

I understand the need for Qemu in the Perl context (even though I
generally don't understand why they can't bring normal
cross-compilation support in the Perl build system), but the solution
you're proposing cannot be accepted as is. We need to either:

 * Make qemu a hard requirement to run Buildroot, and in that case, add
   a check for it in support/dependencies/dependencies.sh. Since it is
   such an unusual dependency, we may special case it, and add it as a
   dependency only if the Perl package is selected, a bit like we
   already do for the version control tools (that are only requested as
   dependencies if at least one package needing a given version control
   tool is selected)

 * Add a host-qemu package. We can quite certainly find a commonality
   here with Yann's work on Qemu.

At the moment, your package will break on auto-builders, because they
don't necessarily have Qemu installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
