From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 7 Mar 2019 18:22:55 +0100
Subject: [Buildroot] [PATCH v3] package/optee-*: packages depend on
 thread support
In-Reply-To: <878sxq38vp.fsf@tarshish>
References: <17603738bfac0de04a1de57a562dbde2a572d926.1551944208.git.etienne.carriere@linaro.org>
 <1551973528-5130-1-git-send-email-etienne.carriere@linaro.org>
 <878sxq38vp.fsf@tarshish>
Message-ID: <CAN5uoS_fr7xN4Yj5oSfiMDn_vMdJKWiQPcG8Y6=Uh2QzmhLztQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 7 Mar 2019 at 18:13, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Etienne,
>
> Almost there.
>
> On Thu, Mar 07 2019, Etienne Carriere wrote:
>
> > BR2_PACKAGE_OPTEE_CLIENT depends on BR2_TOOLCHAIN_HAS_THREADS.
> > Library teec uses pthread support to protect clients state
> > management.
> >
> > This change declares this dependency in package optee-client and
> > updates dependent packages accordingly: optee-benchmark,
> > optee-client, optee-examples and optee-test.
> >
> > Fixes [1] and [2] where config selected an toolchain without thread
> > support and build failed with trace like:
> >
> >   CMake Error at /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
> >     Could NOT find Threads (missing: Threads_FOUND)
> >   Call Stack (most recent call first):
> >     /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:377 (_FPHSA_FAILURE_MESSAGE)
> >     /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindThreads.cmake:212 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
> >     libteec/CMakeLists.txt:8 (find_package)
> >
> > [1] http://autobuild.buildroot.net/results/ed6ffe2197da4f3a970bd3c5522291236396cc8e
> > [2] http://autobuild.buildroot.net/results/406f90048db097580b626ef889823132f8676ba1
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
> > Changes v2 -> v3:
> >   - Squash v2 series into a single patch.
> >   - Update config comment for unmet dependencies.
> >
> > Changes v1 -> v2:
> >   - No change. v2 appends changes to this change to propagate the optee-client
> >     dependency on threads to packages dependent on optee-client.
> >
> > ---
> >  package/optee-benchmark/Config.in | 4 +++-
> >  package/optee-client/Config.in    | 4 +++-
> >  package/optee-examples/Config.in  | 4 +++-
> >  package/optee-test/Config.in      | 4 +++-
> >  4 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
> > index 0e36549..0023ac6 100644
> > --- a/package/optee-benchmark/Config.in
> > +++ b/package/optee-benchmark/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_OPTEE_BENCHMARK
> >       bool "optee-benchmark"
> >       depends on !BR2_STATIC_LIBS # optee-client
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
> >       select BR2_PACKAGE_OPTEE_CLIENT
> >       select BR2_PACKAGE_LIBYAML
> >       help
> > @@ -11,5 +12,6 @@ config BR2_PACKAGE_OPTEE_BENCHMARK
> >
> >         http://github.com/linaro-swg/optee_benchmark
> >
> > -comment "optee-benchmark needs a toolchain w/ dynamic library"
> > +comment "optee-benchmark needs a toolchain w/ dynamic library and threads"
> >       depends on BR2_STATIC_LIBS
> > +     depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> Multiple depends are ANDed. This is not what you want. We want to
> display the comment when either condition is true. So you need to OR the
> conditions like this:
>
>   depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
>

Damn', looks like i should have better test this PATCH v3.
Thanks. I'll send a v4.

etienne

> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
