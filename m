From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 15 Feb 2021 10:18:16 +0100
Subject: [Buildroot] [PATCHv2 3/7] package/pkg-cmake.mk: determine
 CMAKE_BUILD_TYPE depending on BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210213155627.tzvlickemz5apzpt@falbala.internal.home.lespocky.de>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-4-patrickdepinguin@gmail.com>
 <20210213155627.tzvlickemz5apzpt@falbala.internal.home.lespocky.de>
Message-ID: <CAAXf6LWNLS25CWAopPi9JsW9WZT+uwqJ=k5ipXLs_JtqBUTp5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex,

El s?b, 13 feb 2021 a las 16:56, Alexander Dahl (<post@lespocky.de>) escribi?:
>
> Hei hei,
>
> disclaimer: I'm no heavy buildroot user, but I have some experience
> with CMake and embedded builds for real world products built with a
> competing build system.
>
> On Fri, Feb 12, 2021 at 02:54:46PM +0100, Thomas De Schampheleire wrote:
> > The CMAKE_BUILD_TYPE is currently set as 'Debug' in case BR2_ENABLE_DEBUG is
> > set, and as 'Release' in other cases. However, while the description of
> > BR2_ENABLE_DEBUG is to enable debug symbols (no runtime impact), the 'Debug'
> > build type in CMake can actually have runtime impact. For one, because it
> > does not set -DNDEBUG like is done for 'Release', but also because packages
> > may do custom things based on it.
>
> For that description I would consider "RelWithDebInfo" the correct
> option.

It was also my original thought, but the references below did not like
that direction.

>
> > The question of which CMAKE_BUILD_TYPE Buildroot should set, be it 'Debug',
> > 'Release', 'RelWithDebInfo' or others, has come up several times in the
> > past. See some references below:
> >
> > - July 2016: switch from Debug to RelWithDebInfo:
> >   https://git.buildroot.org/buildroot/commit/?id=4b0120183404913f7f7788ef4f0f6b51498ef363
> >
> > - October 2016: switch from RelWithDebInfo back to Debug:
> >   https://git.buildroot.org/buildroot/commit/?id=104bb29e0490bfb487e2e665448dd3ca07fcc2b5
> >   and changes to make sure Buildroot's flags are respected:
> >   https://git.buildroot.org/buildroot/commit/?id=12494ef48f893684d0800e7f6fe39a2ceaed0451
> >
> > - August 2017: bug #10246 - "BR2_ENABLE_DEBUG does not have the expected
> >   effect for cmake packages"
> >   https://bugs.busybox.net/show_bug.cgi?id=10246
> >
> > - August 2017: mail thread following bug #10246:
> >   http://lists.busybox.net/pipermail/buildroot/2017-August/200778.html
> >
> > In the last mail thread, Samuel Martin confirmed that the 'Release' build
> > type could be used in all cases, because Buildroot is actually making sure
> > that the optimization flags are those determined by Buildroot, not the
> > defaults of cmake, thanks to commit 12494ef48f.
> > But Arnout Vandecappelle objected to using always 'Release', stating that
> > users may actually want the extra assertions.
> >
> > With the introduction of BR2_ENABLE_RUNTIME_DEBUG, Buildroot can now cater
> > for all cases:
> >
> > - use CMAKE_BUILD_TYPE=Release by default. This makes sure that there is no
> >   unexpected performance degradation triggered by enabling BR2_ENABLE_DEBUG.
> >
> > - users can optionally enable BR2_ENABLE_RUNTIME_DEBUG if they want runtime
> >   debug info like assertions, at the risk of introducing performance
> >   degradation. In this case, we switch to CMAKE_BUILD_TYPE=Debug.
>
> Why? What we want for devices in the field: no performance penalty,
> but being able to analyze core dumps or even use gdb/gdbserver (which
> is not ideal if you have optimization _and_ debug flags on at the same
> time, but better than nothing).

Buildroot already has BR2_ENABLE_DEBUG, which sets the '-g' flag
during compilation. This is done even regardless of the
CMAKE_BUILD_TYPE.
Originally, I would just have set 'Release' unconditionally (which is
basically 'RelWithDebInfo' since we also pass '-g' when
BR2_ENABLE_DEBUG is set).

But given the prior discussion, it seems there are people who desire
to have runtime assertions enabled. So instead of trying to force one
way or another, I propose a second option BR2_ENABLE_RUNTIME_DEBUG to
make that choice.

>
> Since you can have all the debug symbols detached (in general, don't
> know if buildroot allows this), you don't need to copy them to the
> target and we store it with our release builds and can access them
> later for debugging.

Debugging symbols are anyway stripped from target builds. They will
still be present in the 'staging' directory. So this is in a way
'detached' even though they are not really in a separate file.

Best regards,
Thomas
