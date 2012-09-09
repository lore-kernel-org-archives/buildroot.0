From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2012 01:40:45 +0200
Subject: [Buildroot] [PATCH 0/7] Introduce the _AVAILABLE mechanism
Message-ID: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series is an RFC for how to handle the _AVAILABLE symbol
in packages.

See this thread for the original proposal:
    http://lists.busybox.net/pipermail/buildroot/2012-August/057144.html

In this series, all packages are converted to use the _AVAILABLE symbol.
My reasoning behind this is that:

 1. all packages use the same mechanism, so they are consistent with
    each others
 2. modifying a package (ie. adding new dependencies) is easy, and does
    not require tracking down all dependant packages
 3. the dependencies of the comments "foo requires bar" are automatically
    updated in this case (although that's minor, and the comment themselves
    need updating)
 4. with the new script in patch 2, it's dirt-easy to add a new package
    using the _AVAILABLE mechanism

On the other hand, Arnout pointed out that only packages with depenencies on
toolchain features should be converted, and in cascade, packages that depend
on those, leaving alone packages that do not have any depednency at all (if
I understood correctly):
    http://lists.busybox.net/pipermail/buildroot/2012-August/058040.html

Of course, no need to say I'm in favor of modifying all packages, if at least
only for points 1&2 above. ;-) Of course, I understand Arnout's concerns about
keeping simplicity and not adding cruft where it is not needed. This post is
to request comments on this new deeply-impacting change.

So, back to the series as it is posted:

  - patch 1 updates the documentation to account for the _AVAILABLE
    mechanism. Because it can be tedious to review the changes in the
    documentation, I've temporarily put up a pre-rendered version on-line:
    http://ymorin.is-a-geek.org/download/tmp/br/pkg_avail/manual/manual.html

  - patch 2 introduces a new support/script/pkg-new script that asks a few
    questions to the user, and accordingly creates skeleton files for
    Config.in and foo.pkg. The doc is updated to document that script, and
    the pre-rendered version linked above contains that.

  - patch 3 adds a new support/scripts/pkg-avail script that does the dirty
    job of converting packages to the _AVAILABLE mechanism, and creates the
    next three patches:

  - patch 4 introduces the _AVAILABLE symbol for all packages, moves each
    package's 'depend on' to that new symbol, and for each package, adds a
    'depends on' on that new _AVAILABLE symbol. This is technically a no-op,
    dependencies are just moved to an intermediate symbol, but the _AVAILABLE
    symbol is not used by any other package;

  - patch 5 transforms all 'depends on' on a package into a 'depends on' the
    corresponding _AVAILABLE symbol, and for each such 'depends on', adds a
    select to the package's main symbol on the corresponding packages main
    symbols;

  - patch 6 checks that each 'select' on a package is guarded by a 'depends
    on' on the corresponding _AVAILABLE symbol;

  - patch 7 finally removes the now-useless support/scripts/pkg-avail,
    introduced in patch 3.


To be noted, the changes in patch 4 to 6 are purely mechanical, and will need
more review and manual tweaks before that series can be applied. Most notably,
having the gettext rework series [0] applied first would eliminate a large
class of corner-cases (eg. cases like: "select PKG_FOO if BLA"). Also, some
packages have 'select' on other package's options, and that needs to be
manually reviewed, as it's not easy to distinguish a package's option symbol
from a package symbol (eg. BR2_PACKAGE_UTIL_LINUX_MOUNT: is it a package named
'util-linux-mount', or is it the option 'mount' of a package named
'util-linux'?)

Again, this series is an _RFC_ on the _AVAILABLE mechanism, so the first
question we must answer is:

    Do we even want this mechanism in buildroot at all?

Then, and only then, can we decide what to do, and how far to push it.

Enjoy! ;-)

Regards,
Yann E. MORIN.
