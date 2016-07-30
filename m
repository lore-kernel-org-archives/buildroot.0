From: David Raeman <draeman@bbn.com>
Date: Sat, 30 Jul 2016 10:57:34 -0400
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
	HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <20160729211546.GA5857@free.fr>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160728220029.GI5862@free.fr>
 <48B4EC85-773A-4F99-96D4-59577018BAB3@gmail.com>
 <20160729093218.36d66c86@free-electrons.com>
 <CAMKF1sp5YvKanMM_AjPsZqmNOXrJAWsELpEcch+7Wec3MfhVzA@mail.gmail.com>
 <20160729112327.5af5618a@free-electrons.com>
 <CAMKF1spxedbMXzPnDU41nEFZdJ1qfc4Y0UqeQwxDaNmR4cmZHg@mail.gmail.com>
 <004001d1e9d0$5773c7d0$065b5770$@bbn.com> <20160729211546.GA5857@free.fr>
Message-ID: <005f01d1ea72$b4b24b90$1e16e2b0$@bbn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Fri, Jul 29, 2016 at 5:16 PM, Yann E. MORIN wrote:
> U-Boot or Qemu? I thought you needed that for your custom Qemu

The problem was revealed when I added a br2-external package for 
custom Qemu, but I traced the root issue to be with u-boot and how it
is impacted by the include directory added by HOST_CPPFLAGS.

The custom Qemu required me to install libfdt into the host area -
nothing wrong with doing that.  But having libfdt installed in
HOST_DIR causes u-boot to fail, because u-boot was finding libfdt.h 
in HOST_DIR/usr/include prior to searching its own directory for its
local modified copy of that same filename.

> And thus we should revert that patch. Will you send a patch to do the revert,
> please?

Yes I will.  I believe the patch to revert should also back out patch 
2/2 that installed libfdt to HOST_DIR as a part of host-dtc.  As 
mentioned above, if you keep that change and only revert the change to
HOST_CPPFLAGS, then u-boot to fail unless something else is done.  Do
you agree I should revert both changes with this new patch, to ensure
there is no leftover breakage?

> So, I think the best solution would be for U-Boot^WQemu to rename their
> header.

Given the various considerations, I agree this is the lowest-risk
solution.  Keeping in mind that any other package with a local header
file in conflict with a HOST_DIR header file can experience this same
problem.  The root issue is that usage of CPPFLAGS causes packages
to search HOST_DIR/usr/include before they search their local source
directories.

I may be a bit of time before I can submit a new patch to rename the
header file within u-boot.

Cheers,
David
