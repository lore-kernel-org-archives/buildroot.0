From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 4 May 2021 22:06:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: fix build
In-Reply-To: <ef6dff3c-fbbe-a622-02b7-b765248ab231@grinn-global.com>
References: <20210430060545.1243461-1-fontaine.fabrice@gmail.com>
 <ef6dff3c-fbbe-a622-02b7-b765248ab231@grinn-global.com>
Message-ID: <CAPi7W81H2ywfBPpbEp=iZaTwzxgW2efTPU_kyc700EdBuY_R0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le mar. 4 mai 2021 ? 20:32, Bartosz Bilas <b.bilas@grinn-global.com> a ?crit :
>
> Hello Fabrice,
>
> On 30.04.2021 08:05, Fabrice Fontaine wrote:
> > Since bump to version 3.09 in commit
> > 28b4947ed8f53c4edfbf8fef9304dc76480c01ca, build fails on:
> >
> > [100%] Linking CXX shared library libBulletRoboticsGUI.so
> > /home/buildroot/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc64-buildroot-linux-gnu/9.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: cannot find -lBulletExampleBrowserLib
> >
> > Upstream is aware of this issue and recommends to avoid changing any
> > options: https://github.com/bulletphysics/bullet3/issues/3143
> What about this [1] patch? Have you tried that?
Nope, I didn't tried it, there is 4 issues opened in upstream github
related to -lBulletExampleBrowserLib and all of them are closed with
the above answer.
I missed the PR but I assume that upstream will not commit as it is
opened for nearly 4 months.
But feel free to send a v2 of this patch.
>
> [1] https://github.com/bulletphysics/bullet3/pull/3216
>
>
> Best
> Bartek
> >
> > So enable bullet3 and demos apps ...
> >
> > Fixes:
> >   - http://autobuild.buildroot.org/results/1721df8b0859656f7420b0b166d1ca635e5ddc74
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >   package/bullet/bullet.mk | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
> > index 6ed4da859f..de51402ab6 100644
> > --- a/package/bullet/bullet.mk
> > +++ b/package/bullet/bullet.mk
> > @@ -10,11 +10,12 @@ BULLET_INSTALL_STAGING = YES
> >   BULLET_LICENSE = Zlib
> >   BULLET_LICENSE_FILES = LICENSE.txt
> >
> > -# Disable demos apps and unit tests.
> > -# Disable Bullet3 library.
> > +# Disable unit tests.
> > +# Don't disable demos apps and Bullet3 library to avoid a build failure:
> > +# https://github.com/bulletphysics/bullet3/issues/3143
> >   BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF \
> > -     -DBUILD_BULLET2_DEMOS=OFF \
> > -     -DBUILD_BULLET3=OFF
> > +     -DBUILD_BULLET2_DEMOS=ON \
> > +     -DBUILD_BULLET3=ON
> >
> >   # extras needs dlfcn.h and NPTL (pthread_barrier_init)
> >   ifeq ($(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),:y)
Best Regards,

Fabrice
