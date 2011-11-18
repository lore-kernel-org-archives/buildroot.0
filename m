From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2011 08:05:00 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <CAAXf6LVzQpbdCJ3yaQsSREAoNUTjhGLGTgm3izj19m6Z2HJFYg@mail.gmail.com>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <20111116190306.6e9596a0@skate>
 <CAAXf6LW_qTUwtbdC+QjYnUAd1w5gZ4H55-6+G1Gnt3NV-s4F5w@mail.gmail.com>
 <201111172123.05834.arnout@mind.be> <20111117224211.0e793a0b@skate>
 <CAAXf6LVzQpbdCJ3yaQsSREAoNUTjhGLGTgm3izj19m6Z2HJFYg@mail.gmail.com>
Message-ID: <20111118080500.213b42b0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 18 Nov 2011 07:53:22 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Ok, so an attempt to summarize the discussion so far:

Good idea.

> - most patches should live in package/foo and have a filename of the form:
> <pkg>-<seqnum>-<description>.patch

Agreed.

> - for packages that have multiple versions at once in buildroot,
> patches go into package/foo/foo-version, but have the same filename:
> <pkg>-<seqnum>-<description>.patch

I would name the directory package/<foo>/<version> instead of
package/<foo>/<foo>-<version>, because repeating <foo> is useless.

> - support for <pkg>-<version>-<description>.patch is removed, and all
> existing such patches are renamed/moved according to the rules above.

Agreed.

I also would like to see removed:

 * Support for *.patch.$(ARCH). But that requires some work to get rid
   of the current 4 arch-specific patches that we have for liboil, fbv,
   libmad and jamvm.

 * Support for host-*.patch (which are applied only to the host
   variant). We have only one such patch in the tree (for libgtk2) and
   with a bit of effort, we could make it generic enough so that it
   works on both host and target.

> Some remaining questions:
> * what if a package has multiple versions, and a certain patch applies
> to both versions. Should there be one copy of the patch in
> package/foo, or should the patch be duplicated in
> package/foo/foo-version1 and package/foo/foo-version2 ?

Duplicated.

> * how many digits should the sequence number have? I now that
> git-format-patch uses 4 digits (0001) but really isn't necessary for
> buildroot since the number of patches we'll have for each package is
> limited. A package with 99 patches would already be extraneous, so I'd
> say 01 (2 digits) is enough.
> This may seem like a detail, but discussing this should keep things
> consistent throughout the future.

Agreed that 2 digits is enough.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
