From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 9 Aug 2018 21:56:39 -0500
Subject: [Buildroot] [PATCH] mmc-utils: Rely on our own _FORTIFY_SOURCE
In-Reply-To: <20180808151709.2f35030c@windsurf>
References: <48287dd12fcef0440cc49ff86343867d6cb8429e.1533656185.git.jan.kundrat@cesnet.cz>
 <20180808151709.2f35030c@windsurf>
Message-ID: <CANQCQpaJpUo1VRNtaRpu0QxiRaMJ5jjn7_FZTyAaeCBBbg1fSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Wed, Aug 8, 2018 at 8:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 7 Aug 2018 17:32:51 +0200, Jan Kundr?t wrote:
> > Upstream always forced _FORTIFY_SOURCE=2. At first, I tried changing
> > their flags to undefine that macro first, but that did not work well.
> > This patch ensures that the package always respects our toolchain
> > settings, even in cases where we are not fortifying the build.
> >
> > This fixes a build failure where the mmc-utils package failed to build
> > with, e.g., BR2_FORTIFY_SOURCE_1:
> >
> >   <command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
> >   <command-line>:0:0: note: this is the location of the previous definition
> >
> > Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
>
> Is this fixing a build issue reported by the autobuilders ? Or only
> with hardening options ? Your commit log is not very verbose in details
> about the configuration/condition under which the build failure happens.

(I haven't directly talked with Jan on this) It looks very similar to
other pkgs him and I looked at where flags were messy in the pkg and
now exposed when a build is done using hardening options, not a
autobuilder.

This isn't related to my hardening fixes patchset (ie those patches
won't fix this issue).  Instead, I'd refactor this patch to move the
AM_CFLAGS "-D_FORTIFY_SOURCE=2" into the CFLAGS ?= .  That should be
an upstream-able change and preserve their intent.

Matt
