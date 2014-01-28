From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 21:58:25 +0100
Subject: [Buildroot] [PATCH] manual/faq: add section about why no binary
 packages
In-Reply-To: <20140106132638.39cd986c@skate>
References: <1388954663-5692-1-git-send-email-yann.morin.1998@free.fr>
 <1388954663-5692-2-git-send-email-yann.morin.1998@free.fr>
 <20140106051625.GD7812@tarshish> <20140106132638.39cd986c@skate>
Message-ID: <20140128215825.4c66e431@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Jan 2014 13:26:38 +0800, Thomas Petazzoni wrote:

> I would go even further, and explain why tracking what files each
> package installs is by far not sufficient to support binary packages.
> Several people have showed up throughout the project history, willing
> to add support binary packages by assuming that simply tracking which
> files "make install" installs will be sufficient. But that's forgetting
> all the optional dependencies problems, and various other things.
> 
> We had a write-up about this in some report of a past Buildroot
> Developers Meeting, with some good arguments. Would be nice to dig that
> up and summarize these arguments in the doc.

The report at
http://lists.busybox.net/pipermail/buildroot/2011-November/047229.html
has the details I was referring to. I'm copy/pasting them here:

===

Package management
------------------

On the feature that is often discussed on the Buildroot list, and
which was on the agenda for this meeting was the general topic of
"package management". To summarize, the idea would be to add some
tracking of which Buildroot package installs what files, with the
goals of :

 * Being able to remove files installed by a package when this package
   gets unselected from the menuconfig ;

 * Ultimately, be able to generate binary packages (ipk or other
   format) that can be installed on the target without re-generating a
   new root filesystem image.

In general, most people think it is easy to do: just track which
package installed what and remove it when the package is
unselected. However, it is much more complicated than that:

 * It is not only about the target/ directory, but also the sysroot in
   host/usr/<tuple>/sysroot and the host directory itself. All files
   installed in those directories by various packages must be tracked.

 * When a package is removed, it is not sufficient to remove just the
   files it installed. One must also remove all its reverse
   dependencies (i.e packages relying on it) and rebuild all those
   packages. For example, package A depends optionally on the OpenSSL
   library. Both are selected, and Buildroot is built. Package A is
   built with crypto support using OpenSSL. Later on, OpenSSL gets
   unselected from the configuration, but package A remains (since
   OpenSSL is an optional dependency, this is possible). If you just
   remove the OpenSSL files, then the files installed by package A are
   broken: they use a library that is no longer present on the
   target. Technically, it is possible to do this (the prototype that
   Lionel Landwerlin and Thomas Petazzoni have worked on started to do
   this), but it is difficult and adds a fair bit of complexity.

 * In addition to the previous problem, there is the case where the
   optional dependency is not even known to Buildroot. For example,
   package A in version 1.0 never used OpenSSL, but in version 2.0 it
   automatically uses OpenSSL if available. If the Buildroot .mk file
   hasn't been updated to take this into account, then package A will
   not be part of the reverse dependencies of OpenSSL and will not be
   removed and rebuilt when OpenSSL is removed. For sure, the .mk file
   of package A should be fixed to mention this optional dependency,
   but in the mean time, you can have non-reproducible behaviors.

 * The whole idea is also to allow changes in the menuconfig to be
   applied on the output directory without having to rebuild
   everything from scratch. However, this is very difficult to achieve
   in a reliable way: what happens when the suboptions of a package
   are changed (we would have to detect this, and rebuild the package
   from scratch and potentially all its reverse dependencies), what
   happens if toolchain options are changed, etc. At the moment, what
   Buildroot does is clear and simple so its behaviour is very
   reliable and it is easy to support users. If we start telling users
   that the configuration changes done in menuconfig are applied after
   the next make, then it has to work correctly and properly in all
   situations, and not have some bizarre corner cases. We fear bug
   reports like "I have enabled package A, B and C, then ran make,
   then disabled package C and enabled package D and ran make, then
   re-enabled package C and enabled package E and then there is a
   build failure". Or worse "I did some configuration, then built,
   then did some changes, built, some more changes, built, some more
   changes, built, and now it fails, but I don't remember all the
   changes I did and in which order". This will be impossible to
   support.

For all these reasons, the conclusion of the Buildroot Developer Day
was that adding tracking of installed files to remove them when the
package is unselected is something that is very hard to achieve
reliably and will add a lot of complexity.

In the morning, we had some discussion with Robert Schwebel about how
PTXdist does package management. They only do it for files installed
in the target filesystem. So for example the libraries/headers are
never removed from their sysroot, so you quickly end up with
inconsistencies. This is something we would like to avoid in
Buildroot, because it creates confusing behaviors in our
opinion. Esben from OE-lite also said that package management is very
difficult to do reliably and that it would add a lot of complexity to
a currently relatively simple Buildroot.

Buildroot focus is on simplicity and building relatively small
systems, and this is definitely something we want to preserve. Moving
away from this principle would make Buildroot more similar to existing
more complicated build systems and therefore less interesting.

For the time being, we'd prefer not to add such mechanisms in
Buildroot and keep its behavior as simple and easy to understand as it
is today. We think it's better to focus on other features than trying
to implement something that will never be completely reliable and will
add a very significant complexity to Buildroot.

===

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
