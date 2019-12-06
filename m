From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2019 21:53:22 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <0425a272-d1d6-ba63-2788-a3cc02a32ae0@mind.be>
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
 <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
 <CAAXf6LU=3iCa5Sg4c6jgvT5dS5U6z-_h=oKK1CpQ7mbj37-o0Q@mail.gmail.com>
 <20191206105712.56765a03@windsurf>
 <CAAXf6LU3+uNVLKCK-P6iinaQ7-0FhuAWyJB_3fHfF-roFCd6zA@mail.gmail.com>
 <0425a272-d1d6-ba63-2788-a3cc02a32ae0@mind.be>
Message-ID: <CAAXf6LXzABqbB6M_YoHxMnJEgCq2k+PaQZRQ6=E1j=rs_XU+pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El vie., 6 dic. 2019 a las 12:31, Arnout Vandecappelle
(<arnout@mind.be>) escribi?:
>
>
>
> On 06/12/2019 11:16, Thomas De Schampheleire wrote:
> > El vie., 6 dic. 2019 a las 10:57, Thomas Petazzoni
> > (<thomas.petazzoni@bootlin.com>) escribi?:
> >>
> >> On Fri, 6 Dec 2019 10:54:13 +0100
> >> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> >>
> >>> Needless to say, I am opposed to moving the meson file back from the
> >>> target-finalize step :-)
> >>> I think most of the reasoning was already mentioned in that commit,
> >>> but it seems I did not explain that we actually have HOST_DIR mounted
> >>> read-only on subsequent 'make' commands after the initial make,
> >>> exactly to verify that no-one is changing directories they shouldn't
> >>> be changing. After all, a 'make' after the initial make will only
> >>> normally do the target-finalize step.
> >>
> >> No, it will do staging-finalize as well. I don't think we provide the
> >> guarantee that HOST_DIR is unchanged/read-only between each "make"
> >> invocation, and I'm not sure why we would want to provide this
> >> guarantee.
> >
> > The fact that staging-finalize is triggered from target-finalize is
> > also a problem in my use case, and I have cleared it in our local copy
> > (moving its action to another place). I think we talked about that
> > earlier too.
> >
> > I think Yann suggested me to look into the sdk in this context. I need
> > to check it in more detail soon, to see whether it can really solve
> > this friction we have between our current needs and changes upstream.
> >
> > To recap our use case: we make an initial Buildroot build, package it,
> > then in other machines but on the same virtual path (mounted to the
> > same location inside a docker container) extract it. Then,
> > applications are built outside of Buildroot, but stored to a copy of
> > the output/target directory. Then a subsequent 'make' is run to let
> > Buildroot package everything into an initramfs, setting TARGET_DIR to
> > the copy.
>
>  SDK is not going to work for that last bit.
>
>  The problem is that overall, Buildroot doesn't have a great story for
> rebuilding things from a partial build. To be honest, I think you're better off
> not using Buildroot to package the initramfs, but just make a simple script that
> you run in fakeroot:
>
> tar -x rootfs.tar
> rsync custom packages
> cpio ...
>
>
>  That is, assuming that the custom packages don't need to do things like adding
> users etc. But if they're built outside of buildroot, that's not going to work
> anyway.

Aside from the initramfs creation, we also rely on the other stuff
happening in target-finalize, like stripping of objects,
rootfs-overlays, post-build scripts, ... Duplicating this logic is not
ideal.

But perhaps I could solve my use case by making the dependency of
target-finalize on host-finalize and staging-finalize optional,
steerable via a variable. Then I could use the default flow for the
initial build, and pass the steer-variable to cut the dependency on
the subsequent make. I'd need to try it to make sure it fits what I
need.
This modification may or may not be acceptable for upstreaming, but
probably is easier than trying to force you in keeping
staging-finalize and host-finalize empty.

Best regards,
Thomas
