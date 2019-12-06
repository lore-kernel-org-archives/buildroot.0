From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2019 11:16:45 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <20191206105712.56765a03@windsurf>
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
 <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
 <CAAXf6LU=3iCa5Sg4c6jgvT5dS5U6z-_h=oKK1CpQ7mbj37-o0Q@mail.gmail.com>
 <20191206105712.56765a03@windsurf>
Message-ID: <CAAXf6LU3+uNVLKCK-P6iinaQ7-0FhuAWyJB_3fHfF-roFCd6zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El vie., 6 dic. 2019 a las 10:57, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> On Fri, 6 Dec 2019 10:54:13 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > Needless to say, I am opposed to moving the meson file back from the
> > target-finalize step :-)
> > I think most of the reasoning was already mentioned in that commit,
> > but it seems I did not explain that we actually have HOST_DIR mounted
> > read-only on subsequent 'make' commands after the initial make,
> > exactly to verify that no-one is changing directories they shouldn't
> > be changing. After all, a 'make' after the initial make will only
> > normally do the target-finalize step.
>
> No, it will do staging-finalize as well. I don't think we provide the
> guarantee that HOST_DIR is unchanged/read-only between each "make"
> invocation, and I'm not sure why we would want to provide this
> guarantee.

The fact that staging-finalize is triggered from target-finalize is
also a problem in my use case, and I have cleared it in our local copy
(moving its action to another place). I think we talked about that
earlier too.

I think Yann suggested me to look into the sdk in this context. I need
to check it in more detail soon, to see whether it can really solve
this friction we have between our current needs and changes upstream.

To recap our use case: we make an initial Buildroot build, package it,
then in other machines but on the same virtual path (mounted to the
same location inside a docker container) extract it. Then,
applications are built outside of Buildroot, but stored to a copy of
the output/target directory. Then a subsequent 'make' is run to let
Buildroot package everything into an initramfs, setting TARGET_DIR to
the copy. During all these subsequent builds, the host directory and
some others are kept read-only to prevent corruption of that 'cache'.

Best regards,
Thomas
