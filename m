From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 7 Mar 2019 16:30:17 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/optee-client: depends on
 thread support
In-Reply-To: <87a7i63ekj.fsf@tarshish>
References: <17603738bfac0de04a1de57a562dbde2a572d926.1551944208.git.etienne.carriere@linaro.org>
 <1551970132-9377-1-git-send-email-etienne.carriere@linaro.org>
 <87a7i63ekj.fsf@tarshish>
Message-ID: <CAN5uoS-stkbaojLa0E=x1sP48_Xtc3kEe=wGm=bQB+r3chFaZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 7 Mar 2019 at 16:10, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Etienne,
>
> On Thu, Mar 07 2019, Etienne Carriere wrote:
>
> > BR2_PACKAGE_OPTEE_CLIENT depends on BR2_TOOLCHAIN_HAS_THREADS.
> > Library teec uses pthread support to protect clients state
> > management. This change declares this dependency in the package.
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
> > Changes v1 -> v2:
> >   - No change. v2 appends changes to this change to propagate the optee-client
> >     dependency on threads to packages dependent on optee-client.
>
> All patches in this series should be squashed into a single
> patch. Otherwise the build is broken between patch #1 and others. This
> hurts the so called bisectability of git history.

Ok. So I'll squash them.

>
> In addition, this patch (and others) are missing update to dependencies
> comments to account for the added dependency.

Oh yes! I forgot to update those comment.
Thanks.

By the way, this change will conflict with pending
http://patchwork.ozlabs.org/patch/1050302/ and its 3 related
companions.
I should maybe setup a series for the whole.

Thanks for the feedback.
Regards,
etienne

>
> baruch
>
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
> >       help
> >         Enable the OP-TEE client package that brings non-secure
> >         client application resources for OP-TEE support. OP-TEE
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
