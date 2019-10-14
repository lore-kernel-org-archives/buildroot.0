From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 22:58:03 +0200
Subject: [Buildroot] Linux kernel configuration changes and out of tree
 module builds
In-Reply-To: <CAAhKrJ0GObte8z-NSqyUHwJY-0A1rbyrL-F5pW9G7LO_gyz3hQ@mail.gmail.com>
References: <CAAhKrJ0GObte8z-NSqyUHwJY-0A1rbyrL-F5pW9G7LO_gyz3hQ@mail.gmail.com>
Message-ID: <20191014225803.0b1765cc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dan,

On Mon, 14 Oct 2019 14:00:09 -0600
Dan Walkes <danwalkes@trellis-logic.com> wrote:

> First, thank you for your work in putting together this very useful
> tool and associated thorough and well written documentation.

And thanks to you for using it ! :-)

> I managed to confuse myself recently [1] regarding how dependencies
> work in relation to kernel module builds and I'd like to confirm that
> I now actually understand the implementation.
> 
> I had assumed listing "linux" as a dependency for my kernel module
> would mean that the linux kernel would end up as a target "normal
> prerequisite" dependency relationship in gnu make parlance [2] and
> would force a rebuild of my kernel module when the linux kernel was
> rebuilt due to, for instance, a configuration change.
> 
> However, based on threads like [3], I think it would be more accurate
> to think of buildroot FOO_DEPENDENCIES as order only prerequisites
> from a gnu make perspective.  In other words, changing the
> configuration of a FOO_DEPENDENCIES dependency and forcing a rebuild
> of that dependency would not force a rebuild of foo.  The
> FOO_DEPENDENCIES strictly exists to ensure packages are built in the
> correct order from clean build or when a package is added.
> 
> I also assume there's no way to add a dependency to a package which
> would force rebuild when a FOO_DEPENDENCIES package is rebuilt (a
> "normal prerequisite" dependency in gnu make parlance).
> 
> My first question is whether I've correctly understood the
> implementation in buildroot with my statements above.

You have absolutely correctly understood how it works, and the
guarantees Buildroot provides.

Say you have some application "bar" that uses some library "libfoo", so
BAR_DEPENDENCIES contains "libfoo". And libfoo has some sub-options to
tweak its configuration.

Then, if you have already done a build of libfoo and bar, the next time
you will change the sub-options of libfoo, Buildroot will neither
rebuild libfoo, nor rebuild bar. The stamp files in libfoo and bar
build folders are there, so from the perspective of Buildroot, they
have been built.

> Assuming I have an accurate understanding, my next question is whether
> I've missed this documentation somewhere.  I don't see this case
> specifically called out in the "Understanding when a full rebuild is
> necessary" section [4].  The LIBFOO_DEPENDENCIES documentation in the
> "generic-package reference" [5] is accurate in describing the
> dependencies and only mentions order, however it does not mention that
> dependency package changes will not force a rebuild.  This might
> confuse anyone who makes the incorrect assumptions I did.  I also
> don't see this mentioned in the "Infrastructure for packages building
> kernel modules" [6] section.
> 
> If all of the above is accurate, I'd suggest this additional content
> or something like it in the full-rebuild section of the manual [4]:
> 
> * When a FOO_DEPENDENCIES package is rebuilt, the package foo is not
> automatically rebuilt.  For example, a linux kernel module which
> depends on linux will not be automatically rebuilt when the kernel
> configuration changes.  For this reason it may be safer to use a full
> rebuild when modifying linux kernel configuration.

Correct, but I would perhaps not use the example of the Linux kernel
here. Even though it was the situation that got you into realizing
this, it applies to any other package, and using Linux as an example
may be confusing, because it's a very specific and complicated package,
while this statement really applies to all packages.

Also, it's not only about a FOO_DEPENDENCIES package being rebuilt, but
also being removed. In the above example, let's assume libfoo was an
optional dependency of bar. You do a first build with libfoo and bar
enabled: bar is built with libfoo support, and is linked against it.
Now, you change the Buildroot configuration, disable libfoo and run
"make". There is nothing that will rebuild "bar".

> I'd also suggest the second sentence below in the generic package
> reference for LIBFOO_DEPENDENCIES [5]:
> 
> These dependencies are guaranteed to be compiled and installed before
> the configuration of the current package starts.  *However,
> modifications to configuration of these dependencies will not force a
> rebuild of the current package.*

Correct.

> Finally, I'd suggest a mention in the "Infrastructure for packages
> building kernel modules" section [6] with the second sentence below:
> 
> The dependency on linux is automatically added, so it is not needed to
> specify it in FOO_DEPENDENCIES.  *Since FOO_DEPENDENCIES does not
> automatically rebuild kernel modules when the kernel configuration
> changes, you should either manually rebuild your kernel module or
> perform a full rebuild.*

Right, though as said above, I'm not sure we need to repeat this
specifically for the case of kernel modules, it really applies to all
packages.

> I'm happy to submit a documentation patch using this text or any
> variation of it, or feel free to incorporate yourself if it's easier.
> Of course, please ignore altogether if I'm still fundamentally
> misunderstanding how buildroot dependencies work.  In that case I'd
> especially appreciate a pointer to steer me in the right direction.

Please submit documentation patches! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
