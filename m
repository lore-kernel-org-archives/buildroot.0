From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 6 Mar 2018 01:56:34 +0000
Subject: [Buildroot] [PATCH 2/3] package/skeleton-systemd: invert
 factory logic
In-Reply-To: <cd9e7fa23e9e4da9ccf59598d68413ba13cb00d3.1520183159.git.yann.morin.1998@free.fr>
References: <cover.1520183159.git.yann.morin.1998@free.fr>
 <cd9e7fa23e9e4da9ccf59598d68413ba13cb00d3.1520183159.git.yann.morin.1998@free.fr>
Message-ID: <1520301393.25567.314.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-03-04 at 18:06 +0100, Yann E. MORIN wrote:
> Currently, we handle the factory by redirectoring /var with a symlink at
> build time, and with some trickery during the filesystem generation,
> depending on whether we need to remount the filesystem read-write or
> not.
> 
> However, this is causing wquite some pain with latest systemd, now that
> they have moved their dbus socket to /run instead of /var/run.
> 
> As such, trying to play tricks with /var/run as a symlink is difficult,
> because at times it is in .usr/share/factory/var/run (during build) and
> then it is in /var/run (at runtime). So a relative symlink is not
> possible. But an absolute symlink is not possible either, because we are
> installing out-pf-tree.

The symlink does work ok if the patches to fix it are applied.  Both
the build time ${TARGET_DIR}/var/run and run time /var/run work.

However...

> We fix all this mess by making /var a real directory from the onset, so
> that we can use the runtime-expected layout even during the build.
> 
> Then, during filesystem generation, we move /var away to the factory,
> and populate it as we used to do. This still requires a post-fs hook to
> restore /var after the filesystem generation.

I think this a better way.  It was I was alluding to on IRC as a system
that wasn't tied to work-arounds for specific directories in var.  But
I was troubled by...

> This leaves a situation that, should the filesystem generation fails,
> /var will be left in an inconsistent state. But that is not worse than
> what we already had anyway.

I wondered if there was a way to get fakeroot to also "fake" the
movement of the files in addition to modification of owner and group,
but it appears there is not.  I do not think it would be impossible for
fakeroot to gain this ability.
