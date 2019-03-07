From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 7 Mar 2019 11:02:10 +0100
Subject: [Buildroot] [PATCH] package/optee-client: depends on thread
 support
In-Reply-To: <87k1hb2fiy.fsf@tarshish>
References: <17603738bfac0de04a1de57a562dbde2a572d926.1551944208.git.etienne.carriere@linaro.org>
 <87k1hb2fiy.fsf@tarshish>
Message-ID: <CAN5uoS9DLMGb6ngeR7RpqXSDsXfC4UpEH_FTkRQdoum4TbGdig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,


On Thu, 7 Mar 2019 at 10:35, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Etienne,
>
> On Thu, Mar 07 2019, Etienne Carriere wrote:
> > BR2_PACKAGE_OPTEE_CLIENT depends on BR2_TOOLCHAIN_HAS_THREADS.
> > Library teec uses pthread support to protect clients state
> > management. This change declares this dependency in the package.
> >
> > Fixes [1] that set an toolchain without thread support and failed
> > to build with trace:
> >
> >   CMake Error at /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
> >     Could NOT find Threads (missing: Threads_FOUND)
> >   Call Stack (most recent call first):
> >     /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:377 (_FPHSA_FAILURE_MESSAGE)
> >     /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindThreads.cmake:212 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
> >     libteec/CMakeLists.txt:8 (find_package)
> >
> > [1] https://autobuild.buildroot.net/results/ed6ffe2197da4f3a970bd3c5522291236396cc8e
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
> >  package/optee-client/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
> > index db0b7b7..1379201 100644
> > --- a/package/optee-client/Config.in
> > +++ b/package/optee-client/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_OPTEE_CLIENT
> >       bool "optee-client"
> >       depends on !BR2_STATIC_LIBS
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
>
> You need to propagate this added dependencies to packages that select
> optee-client recursively. These are currently optee-test and
> optee-benchmark.
>
> You should also update the dependencies commit below, and in all other
> packages you update.

Ok thanks a lot, I will send a v2 series.

etienne

>
> baruch
>
> >       help
> >         Enable the OP-TEE client package that brings non-secure
> >         client application resources for OP-TEE support. OP-TEE
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
