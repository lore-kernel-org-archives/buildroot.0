From: Sam Voss <sam.voss@gmail.com>
Date: Sun, 23 Aug 2020 21:42:42 -0500
Subject: [Buildroot] [PATCH 1/1] package/ripgrep: fix debug build
In-Reply-To: <20200823193928.GJ8728@scaer>
References: <20200822182237.1834735-1-fontaine.fabrice@gmail.com>
 <20200823193928.GJ8728@scaer>
Message-ID: <CAK714x+7APiq_GA37-C3bt5dF8UQEjrGkxpoHnNqAs3j5O9_og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Fabrice,

On Sun, Aug 23, 2020 at 2:39 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Fabrice, All,
>
> Question for a cargo expert! See below!
>
> On 2020-08-22 20:22 +0200, Fabrice Fontaine spake thusly:
> > There is no --debug mode for cargo resulting in the following build
> > failure since the addition of this package with commit
> > 4b0d1ef6ac00c5170a3fb9d15d06b3d3172e0c97:

This also seems to be visible in the manual, in the cargo-based
package section. The example manual text will need to be updated to
avoid this issue for new packages.

> >
> > error: Unknown flag: '--debug'
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/58e74bb056ec65680ecebaa559aa14bdebbf5c85
> >  - http://autobuild.buildroot.org/results/28c6364a89a6044d5a036614f7a6e59815efb770
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/ripgrep/ripgrep.mk | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> > index 832c076f26..ac9038945c 100644
> > --- a/package/ripgrep/ripgrep.mk
> > +++ b/package/ripgrep/ripgrep.mk
> > @@ -11,12 +11,11 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
> >
> >  RIPGREP_DEPENDENCIES = host-rustc
> >  RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
> > -RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
> >
> >  RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_MODE)
> >
> >  RIPGREP_CARGO_OPTS = \
> > -     --$(RIPGREP_CARGO_MODE) \
> > +     --release \
>
> Wouldn't we need to pass --release only when in non-debug builds, i.e:
>
>     $(if $(BR2_ENABLE_DEBUG),,--release)

This seems more than reasonable, however as this patch is likely
coming in before the cargo-restructuring[1] patchset, so we should
make sure it also works its way back into those patches.

FWIW I agree it should leave the debug/release logic, so that it's
possible to enable the debug symbols (most notably not build the
'release' profile instead of the default 'dev' profile[2]). I think
for now we should just "set nothing" in the debug case and let the
"dev" profile take over, and someday somebody may wish to make it more
robust by setting the correct[3] debug flags when appropriate.

Thanks for looking at this!

Sam

1: https://patchwork.ozlabs.org/project/buildroot/patch/20200220160119.3407-1-patrick.havelange at essensium.com/
2: https://doc.rust-lang.org/cargo/reference/profiles.html#release
3: https://doc.rust-lang.org/cargo/reference/profiles.html#debug
