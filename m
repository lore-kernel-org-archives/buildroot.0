From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 20:16:23 +0200
Subject: [Buildroot] [PATCH 02/12] package: enhance infrastructure to
 support source dir override
In-Reply-To: <CAAXf6LU0J60ycOfqtgUcy2K4ejVCk71oQiJ6YiWzOxfse8w__Q@mail.gmail.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <fed6cc77c0e18aa06a3fc1e3b9bfd9db70b98d23.1311141087.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LU0J60ycOfqtgUcy2K4ejVCk71oQiJ6YiWzOxfse8w__Q@mail.gmail.com>
Message-ID: <20110720201623.6093dff9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for the feedback!

Le Wed, 20 Jul 2011 08:42:36 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> In one project package .mk file I added, I added support for an
> external source directory myself. The external source was under
> revision control. Because originally the build was made in that source
> directory, the 'status' command of the version control system would
> show a bunch of files created by the build system. You'd have to
> update the ignore file to add all these build objects (some of which
> don't follow a pattern like *.o).
> There was another problem with the in-tree building: you couldn't use
> the same source dir from two buildroot trees, as the configuration may
> be different and there would be continuous rebuilding necessary.
> 
> When you say 'out-of-tree builds [..] wouldn't work well in a generic
> way for GENTARGETS', you mean that not all packages support this? What
> are the typical problems that arise?

Try with any random package that does not use autotools or CMake do not
out-of-tree build. Even a simple package such as zlib does not build
out-of-tree, even in native compilation. Basically, all packages that
are supported with the GENTARGETS infrastructure use some sort of
custom/home-made build system, and 99% of the time, this build system
does not support out-of-tree build.

> I think it would be a very good improvement if we could decouple the
> source from the build directory.

It would, but I don't see a good way of implementing this without
fighting with hundreds of upstream projects to get their build system
fixed.

> One workaround is to copy the source directory to output/build and
> do 'in-tree' building there. Ideally
> this would only be done for packages that have problems with
> out-of-tree building (and even more ideally these packages would be
> fixed). The disadvantages of this are obviously the extra time that it
> takes to make the copy, but also that it becomes more difficult to
> detect any changes in the original sources: when do you have to
> recopy?

Yes, I don't see this how this can work. The "source dir override"
feature is precisely here to help when Buildroot is used during
development, when you are hacking on your kernel, on a library or an
application. And in this case, you want a simple "make foobar-rebuild"
in Buildroot to rebuild the "foobar" package, without having to do
anything else.

> This brings me to the following point: for non-local packages, the
> whole package compilation process is restarted if a change in the
> source is detected (i.e. when the tarball is newer than the stamp
> files). How does this go about now?

Unless I missed something, I think the statement you are making is not
true. The dependencies between the various steps in the package build
process are expressed using phony targets, so I don't think changing
the tarball is going to re-trigger the build process of a particular
package.

When it comes to packages whose source directory has been overridden by
this new feature, it's up to the user to do "make foobar-rebuild".
Buildroot cannot guess which packages have changed, and redoing the
make + make install steps for all packages just in case would be
horribly slow.

> As far as I can see in the current patch, there is no such detection.
> If the original sources are changed, the developer has to force
> recompilation of the package (e.g. with the upcoming xxx-reconfigure
> targets). Is that correct, or is there another way?

This is correct, and I don't see another way of doing this. We could of
course add a new variable like BR_FORCED_PACKAGES, in which you could
list the packages that you want to be rebuilt+reinstall at every make
invocation. But this has a really nasty semantic, and I'd prefer not to
implement something like this.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
