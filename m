From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jun 2013 07:48:17 +0200
Subject: [Buildroot] Unstripped binaries for debugging with gdbserver
In-Reply-To: <CAEvN+1j-GoCE=SXuSSAqhuyYFy4MMAOP5_HNrUXSdN4kHAc6jw@mail.gmail.com>
References: <CAEvN+1j-GoCE=SXuSSAqhuyYFy4MMAOP5_HNrUXSdN4kHAc6jw@mail.gmail.com>
Message-ID: <51C297A1.5000600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/13 06:26, Tzu-Jung Lee wrote:
> Hi Folks,
>
> I'm debugging user programs with gdbserver.
>
> Since binaries are stripped for the target, we need to use the
> unstripped ones somewhere else.
> The sysroot (staging) is the perfect candidate, and all we need to do
> is to 'set sysroot' to staging in the gdb.

  True, but at the moment you can already get close enough by setting 
sysroot and using the executable from the build directory. Libraries 
already are in staging, so it's only the executable itself for which you 
need to find the unstripped binary.

  That said it certainly would be simpler if you wouldn't have to look 
for the executable in the build directory.


> However, this requires the package to be installed in staging as well,
> which is not the current default.
>
> So I'm wondering does it make sense to turn on the "install staging'
> by default when gdbserver is in used.
>
>
> ------------------------------------------------------------------------------
> commit 119ac6d18bca7f03ed70a63cc0f5ff694112bac0
> Author: Tzu-Jung Lee <tjlee@ambarella.com>
> Date:   Thu Jun 20 12:19:53 2013 +0800
>
>      build: install staging if gdbserver is enabled.
>
>      Change-Id: I7644813f06fc1b43744b04279afc84fc8c5efa58
>      Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 288fc94..f6d9297 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -308,7 +308,12 @@ $(2)_REDISTRIBUTE          ?= YES
>
>   $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst
> host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
>
> +#ifdef BR2_PACKAGE_GDB_SERVER
> +$(2)_INSTALL_STAGING           ?= YES
> +#else
>   $(2)_INSTALL_STAGING           ?= NO
> +#endif

  That won't work, because generic packages don't necessarily have their 
INSTALL_STAGING_CMDS set.

> +
>   $(2)_INSTALL_IMAGES            ?= NO
>   $(2)_INSTALL_TARGET            ?= YES
>   $(2)_DIR_PREFIX                        = $(if $(4),$(4),$(TOP_SRCDIR)/package)
> ------------------------------------------------------------------------------
>
> I also found a topic on FOSDEM 2013, which attempts to makes target/ a
> subset of staging/
> Any follow up on this?

  We welcome patches, as usual :-)


  Regards,
  Arnout

>
> ------------------------------------------------------------------------------
> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
>
> Discussion
>
> Copy target before creating images: the idea is to avoid the need for
> creating idempotent scripts in e.g. post-build script. It does make
> sense, because for the user it's a bit more difficult to make scripts
> idempotent. Also it can be a step for hiding the "target" directory.
> And it makes complete sense if we remove the "target" directory
> completely and copy from staging instead.
>
> The compelling reason to make target a subset of staging is that it is
> much easier to do debugging: just "gdb staging/usr/bin/foo" and it
> will have debug symbols and the paths to the source files.
> Single install commands: FOO_INSTALL_CMDS. They get executed twice,
> with DESTDIR set to the correct place (target or staging or host). The
> POST_XXX_INSTALL_HOOKS would still be executed separately. But this
> doesn't yet give us the situation that target and staging are the
> same, but target just has some stuff removed.
> Take it one step at the time: start with FOO_INSTALL_CMDS, we can see
> how far we get.
> Document that post-build script has to be idempotent (with an example).
> ------------------------------------------------------------------------------
>
> Regards,
> Roy
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
