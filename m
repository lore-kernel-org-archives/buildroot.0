From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Fri, 7 Dec 2018 11:08:12 -0700
Subject: [Buildroot] [PATCH 1/1] core/sdk: don't mangle symlinks with
 '.' or '..' at start
In-Reply-To: <20181207113055.GG2561@scaer>
References: <20181207035052.316-1-JoelsonCarl@gmail.com>
 <20181207113055.GG2561@scaer>
Message-ID: <CA+1k=2aNtT59ZjhP_ZiUM6xC52xVCpB=rRWLf02L_LuFB=SRNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2018 at 4:31 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:

<snip>

> > ---
> >  Makefile | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 37df98520e..668c3e09e0 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -591,6 +591,7 @@ prepare-sdk: world
> >       echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> >
> >  BR2_SDK_PREFIX ?= $(GNU_TARGET_NAME)_sdk-buildroot
> > +HOST_DIR_NO_LEAD_SLASH=$(shell echo $(HOST_DIR) | tail -c +2)
> >  .PHONY: sdk
> >  sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
> >       @$(call MESSAGE,"Generating SDK tarball")
> > @@ -598,8 +599,8 @@ sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
> >       $(Q)mkdir -p $(BINARIES_DIR)
> >       $(TAR) czf "$(BINARIES_DIR)/$(BR2_SDK_PREFIX).tar.gz" \
> >               --owner=0 --group=0 --numeric-owner \
> > -             --transform='s#^\.#$(BR2_SDK_PREFIX)#' \
> > -             -C $(HOST_DIR) "."
> > +             --transform='s#^$(HOST_DIR_NO_LEAD_SLASH)#$(BR2_SDK_PREFIX)#' \
> > +             --transform='s#^$(HOST_DIR)#$(BR2_SDK_PREFIX)#' $(HOST_DIR)
>
> Well, I am not too fond of this new HOST_DIR_NO_LEAD_SLASH variable,
> since it is used in a single location. And calling to the shell is not
> nice either.
>
> What about replaciong that with just:
>
>     $(patsubst /%,%,$(HOST_DIR))
>

I didn't read the documentation on patsubst close enough and didn't
realize you could make it replace only the first occurrence.  That
suggestion works and I'll use it.

> Now, this fixup is not enough, in fact, because thisleaves symlinks to
> absolute paths borked, e.g.:
>
>     /path/to/host/bin/foo -> /path/to/host/bin/bar
>
> is turned into:
>
>     /path/to/new/host/bin/foo -> sdkprefix/bin/bar
>
> which obviously is incorrect.
>
> So we need more work in this area, and the first thing we should do is
> to transform absolute symlinks into relative ones, to be done in the
> prepare-sdk rule, I suppose...

Symlinks with an absolute path is not a case I had considered.
I will work this further and submit a v2 patch.  Thanks!
