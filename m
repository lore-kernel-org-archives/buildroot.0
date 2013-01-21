From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 18:26:06 +0100
Subject: [Buildroot] [RFC v1] Prototype implementation of per-package
 out oftree build
In-Reply-To: <EE5E77B503DE9A478B63A89AAD2585EDB66A3B@vpane.excalyptech.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <EE5E77B503DE9A478B63A89AAD2585EDB66A3B@vpane.excalyptech.com>
Message-ID: <20130121182606.59bec339@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Przemyslaw Wrzos,

On Mon, 21 Jan 2013 15:24:32 +1100, Przemyslaw Wrzos wrote:

> This looks fairly similar to what I was proposing so I'm personally
> all for it. Here are a few of my thoughts about it:

Yes, indeed it looks similar, but I had already started working on this
prototype some time ago, and I had the feeling that it was already a
bit more complete (support in the autotools and cmake infrastructure
for out of tree build, etc.).

> * There's one more feature which I think would complete the Linux
> out-of-tree build support for me, and that is the ability to specify
> the <PKG>_OVERRIDE_SRCDIR value via the configuration. I've attached
> a patch for how this might look.

In general, I am not really favorable. You want it for Linux, but then
the next guy will want it for Qt, the other guy for X.org server, the
other guy for OpenSSH, etc. And then we have gazillions of
configuration options to customize the source directory... while we
have the much more generic OVERRIDE_SRCDIR mechanism. I really would
like to avoid the profusion of such configuration options.

That said, for packages like Linux, U-Boot or Barebox, we already give
the possibility of building from a custom Git tree or a custom tarball
location, so we could decide that those packages are "special", and we
could therefore add the "custom source directory location" option to
them.

But I really want to put a limit to the type of packages on which we
add such options, because I don't want to see this being added more or
less randomly to each and every package in Buildroot.

> * I like the idea making the source tree read-only to keep the build
> honest but I think this removes one of the major benefits of having a
> source tree in the first place, that is being able to modify and play
> around with it. This leads to the <pkg>-rebuild not making sense as
> you point out. I think it might be best to simply not enforce this
> restriction (even if it means some packages could abuse that).

Indeed, as I pointed in my introduction e-mail, having the source
directory read-only has some drawbacks. However, since the source
directory is shared between the host build and target build of a given
package, ensuring that the configuration/build steps of the package do
not mess with the source code is quite important. Otherwise, we could
see cases of pollution of the host build into the target build or vice
versa.

> * Do we need a source directory when a package doesn't support
> out-of-tree building? The downside is additional disk space though
> that might not be that serious of a concern and it might just come
> down to a choice of aesthetics I suppose.

The idea with this out-of-tree support is to make the "overriden
packages" more "normal". So if you add another special case for
packages that don't support out of tree build, the entire goal is a bit
lost.

For example, will you tell users that if they want to do a quick
and dirty modification of a package source code, they should go in
$(O)/src/foo-1.0 if foo supports out of tree build or
$(O)/build/foo-1.0 if foo doesn't? Seems really not logical.

In general, I have the feeling that the biggest packages use a
reasonable build system, and therefore are capable of doing out of tree
build.

> * As far as <pkg>-dirclean goes, I would say remove both build and
> source directories. If we only remove the build directory it will in
> effect not be all that different to <pkg>-clean. The only other real
> option would be to have a separate source directory for each target
> variant.

The problem is that if you have a package that gets build for the host
and the target, you have:

	output/src/foo-1.0
	output/build/foo-1.0
	output/build/host-foo-1.0

Then, you do:

	make foo-dirclean

So, output/src/foo-1.0 and output/build/foo-1.0 are removed, but
output/build/host-foo-1.0 remains. So we have the build directory for a
given package but no longer the corresponding source directory. Doesn't
seem to be really nice. No?

Thanks a lot for your very interesting feedback on this, good to see
that the discussion is starting!

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
