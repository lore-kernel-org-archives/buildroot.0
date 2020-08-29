From: Christian Stewart <christian@paral.in>
Date: Sat, 29 Aug 2020 10:32:12 -0700
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
In-Reply-To: <20200829145955.6aedeae6@windsurf.home>
References: <20200813213220.260112-1-christian@paral.in>
 <20200829145955.6aedeae6@windsurf.home>
Message-ID: <CA+h8R2od7W+QcUVLcdLFiKbaG8voDAbOBvEQDe3rnQF9uAtiyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Replies to both your emails below:

On Sat, Aug 29, 2020 at 6:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> So instead, I did a number of preparation patches in the different Go
> packages to set the GOMOD variable, then had the patch switching the
> infrastructure to go.mod, and then patched again the packages to drop
> anything that was no longer needed (such as <pkg>_WORKSPACE
> definitions).

OK, noted, along with the other adjustments.

> > +$(2)_GOMOD ?= $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
> > +
> > +# Correctly configure the go.mod and go.sum files for the module system.
> > +# Note: Go is configured to use the "vendor" dir and not make network calls.
> > +define $(2)_APPLY_EXTRACT_GOMOD
> > +     if [ -f $$($(2)_PKGDIR)/go.mod ]; then \
> > +             cp $$($(2)_PKGDIR)/go.mod $$(@D)/go.mod; \
> > +             if [ -f $$(@D)/go.sum ]; then \
> > +                     rm $$(@D)/go.sum; \
> > +             fi; \
> > +     fi; \
>
> There are no packages so far that provide their go.mod in their package
> directory, so I dropped this.
>
> > +     if [ -f $$($(2)_PKGDIR)/go.sum ]; then \
> > +             cp $$($(2)_PKGDIR)/go.sum $$(@D)/go.sum; \
> > +     fi
>
> There are no packages so far that provide their go.sum in their package
> directory, so I dropped this.
>
> > +     if [ ! -f $$(@D)/go.mod ] && [ -n "$$($(2)_GOMOD)" ]; then \
>
> The $(2)_GOMOD variable cannot be empty, so this second part of the
> test was not needed, I dropped it.

GOMOD was not required before. If the go.mod exists (which happens in
many cases) then you can infer what GOMOD is from the first line of
the file. So GOMOD absolutely can be empty and was in some of my
buildroot_ext packages.

As you're now using it as part of the build targets, requiring it to
be set is, I guess, fine.

The mechanism to copy in a go.mod file and/or a go.sum file is used in
some of my buildroot_ext packages. It's used in many Gentoo packages
as well, iirc. However, as the Buildroot mainline currently does not
use the Go compiler to download any dependencies (instead relying on a
"vendor" dir to exist in the source repository), this doesn't make any
difference yet in Buildroot.

> Overall, the series looks like this:
>
> 7c3e3cbcf215c56c378a912a6a6ca40edc61d7ad package/go: add a HOST_GO_HOST_ENV variable
> 557282a9c046547daade72fe18e233006716d0b2 package/go: introduce HOST_GO_COMMON_ENV
> 7a89fa07ee2813a515da91d884ce5920e1ba1887 package/go: pass CFLAGS/CXXFLAGS/LDFLAGS in HOST_GO_TARGET_ENV
> 1a17e4ae996c4c6727a29f049892be5ae57d7e89 package/go: re-integrate GO_COMMON_ENV into HOST_GO_COMMON_ENV
> 0d26fb58b79c6412c49287923e562ea6c8d950e0 package/go: drop GO_TARGET_ENV / GO_HOST_ENV
> 01c5e0ed72007433160d858a8c06cc84eafc120c package/docker-containerd: define <pkg>_GOMOD variable
> edb06ecf3b378f191d5ba36ba872d8a627b2eb53 package/docker-engine: define <pkg>_GOMOD variable
> b80bcd7ffa5a815334ead9c99c6b938c4d6b5a7b package/docker-cli: define <pkg>_GOMOD variable
> 7afd262da0e2a8fee0ebd33049619346de660cb5 package/go: implement go modules integration
> 302bb3347cff943977042b0bf53194c797c9a41b package/runc: drop <pkg>_WORKSPACE variable
> a7ed0ae6cca1b86f03b81d461ae18fbac28df262 package/docker-containerd: drop <pkg>_WORKSPACE variable
> cfcf745e10f354c419e305f3ac334764becdeff9 package/docker-engine: drop <pkg>_SRC_SUBDIR variable
> 913fac5bb1c9e38bd38637ea0271a1c513529a67 package/docker-proxy: drop <pkg>_WORKSPACE variable
> 92584815bace88b0c0548d7ab7796854c92aaa99 package/mender-artifact: drop custom GOFLAGS
> a289fc8b69b71a4ab0585e23e2004c01db821e2e docs/manual/adding-packages-golang.txt: update following go.mod integration

Thank you for the work to review, split, & cleanup, the attention to
detail in Buildroot is on the highest level.

> > +     GOPATH="$(HOST_GO_GOPATH)" \
>
> Are you sure this GOPATH is needed ? We're supposed to move away from
> GOPATH, but you're adding a new GOPATH location here, and in a build
> that has all our Go packages enabled, this
> $(HOST_DIR)/usr/share/go-path location doesn't even exist.
>
> Could you clarify ?

Currently the Go compiler will use $GOPATH/pkg/{mod,sumdb} for the Go
modules cache. It probably did not create any in the mainline
Buildroot builds because there is no Go module activity in use yet
(all vendor based). However, a valid GOPATH does need to be set so
that the Go compiler can use it for the "pkg" cache dir if necessary.

So, GOPATH, while not used for lookups of packages under the "src" dir
anymore, is still used for a few other directories for Go.

There is a new variable in newer versions of Go to control this
separately from GOPATH, so we can add that and eventually fully remove
GOPATH (but not yet).

GOMODCACHE="$GOPATH/pkg/mod"

Best regards,
Christian Stewart
