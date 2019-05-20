From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 May 2019 20:26:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: Fix linking of
 shared/static libs with static libs
In-Reply-To: <20190518215637.2ea2ea51@windsurf>
References: <20190514184245.92222-1-aduskett@gmail.com>
 <20190518215637.2ea2ea51@windsurf>
Message-ID: <20190520202615.37fbd048@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam, Thomas,

On Sat, 18 May 2019 21:56:37 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> +Peter Seiderer in Cc. Peter, if you could review the below patch, it
> would be nice.
>
> On Tue, 14 May 2019 14:42:45 -0400
> aduskett at gmail.com wrote:
>
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > From https://github.com/mesonbuild/meson/pull/3939:
> >
> > This commit contains the following fixes:
> >
> >   1. When a shared library A does link_with: to static library B, the
> >      parts of B used by A will be added to A, and so we don't need to
> >      return B in A.get_dependencies() for targets that link to A. This
> >      already is the behaviour when a shared library A does link_whole:
> >      on B.
> >
> >   2. In situation (1), when generating a pkg-config file for A, we must
> >      also not add B to Libs.private for A. This already is the behaviour
> >      when a shared library A does link_whole: on B.
> >
> >   3. When a static library A does link_whole: to static library B, we
> >      must add the objects in B to A.
> >
> >   4. When a static library A does link_with: to static library B, and
> >      B is not installed (which makes it an internal static library), we
> >      must add the objects in B to A, otherwise nothing can use A.
> >
> >   5. In situation (4), when generating a pkg-config file for A, we must
> >      also not add B to Libs.private for A.
> >
> > Without this patch, static builds of libglib2 and gstreamer using the
> > meson build system will not compile and link properly.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I can confirm the patch fixes the gstreamer static build/static libs
problem (see [1])....

But as it is a (not yet) upstream committed bugfix, maybe it is better to
wait for a upstream committ and/or next meson version bump?

On the other side the gstreamer folks where bored with waiting for the
meson fix to be accepted and committed an workaround for the problem
already (see [2])...

Conclusion: Take the patch in case there is already a buildroot
in-tree package which needs the fix (or commit the patch with
in series with a in-tree user), otherwise wait for meson
upstream...

For the gstreamer-convert-to-meson series I can backport the
gstreamer workaround...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2019-May/249282.html
[2] https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=b19de413b94d228b1460b0899f9b41b2b5233943

>
> Adam: is this for next or master ? Since libglib2 and gstreamer in
> master are still using autotools, I would suppose this patch is for
> next. Could you confirm ?
>
> Thanks,
>
> Thomas
