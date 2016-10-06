From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 6 Oct 2016 20:59:47 +0200
Subject: [Buildroot] gdb texinfo dependency
In-Reply-To: <CAAXf6LX5+csACE8dRjdL+ue-JYpGbCsHZDjQ=KOuaESuoehgDA@mail.gmail.com>
References: <CAAXf6LUHdDJyUPNcW-vQuZx6RhZxsPrGv69SqRPvRrAy46ropA@mail.gmail.com>
 <20161005172756.77aea89c@free-electrons.com>
 <CAAXf6LUJOwtpDmUg1zxDdBDKnOAnjkafxwuCAVRQP5aMm3zT9g@mail.gmail.com>
 <20161005221619.6a958ba0@free-electrons.com>
 <b6d8768f-9192-6e0a-0299-36584151f4e7@gmail.com>
 <CAAXf6LX5+csACE8dRjdL+ue-JYpGbCsHZDjQ=KOuaESuoehgDA@mail.gmail.com>
Message-ID: <CAAXf6LWaBL_cifwis=3Y1NYLMgt0m1=eOmb99UqGyzgxF7FikQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Seems my mail was a bit cryptic, sorry... see below

On Thu, Oct 6, 2016 at 8:57 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
[..]
>
> I also tested target-gdb now, and the same trick looks fine no.

s/no/too/

>
> I also applied the change on binutils, and it seems to work fine there
> too, but for tarballs as git versions.

s/but/both/

>
> Current patch that I'm using is:
>
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 3a4a661..b578854 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -29,19 +29,8 @@ BINUTILS_LICENSE = GPLv3+, libiberty LGPLv2.1+
>  BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
>
>  ifeq ($(BINUTILS_FROM_GIT),y)
> -BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
> -HOST_BINUTILS_DEPENDENCIES += host-flex host-bison host-texinfo
> -endif
> -
> -# The .info files in the >= 2.26 tarball have an incorrect timestamp,
> -# so binutils tries to re-generate them. In order to avoid the
> -# dependency on host-texinfo, we simply update the timestamps.
> -ifeq ($(BR2_BINUTILS_VERSION_2_26_X)$(BR2_BINUTILS_VERSION_2_27_X),y)
> -define BINUTILS_FIXUP_INFO_TIMESTAMPS
> -    find $(@D) -name '*.info' -exec touch {} \;
> -endef
> -BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
> -HOST_BINUTILS_POST_PATCH_HOOKS += BINUTILS_FIXUP_INFO_TIMESTAMPS
> +BINUTILS_DEPENDENCIES += host-flex host-bison
> +HOST_BINUTILS_DEPENDENCIES += host-flex host-bison
>  endif
>
>  # When binutils sources are fetched from the binutils-gdb repository,
> @@ -68,8 +57,12 @@ endif
>
>  # Don't build documentation. It takes up extra space / build time,
>  # and sometimes needs specific makeinfo versions to work
> -BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
> -HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
> +BINUTILS_CONF_ENV += MAKEINFO=true
> +BINUTILS_MAKE_OPTS += MAKEINFO=true
> +BINUTILS_INSTALL_OPTS += MAKEINFO=true
> +HOST_BINUTILS_CONF_ENV += MAKEINFO=true
> +HOST_BINUTILS_MAKE_OPTS += MAKEINFO=true
> +HOST_BINUTILS_INSTALL_OPTS += MAKEINFO=true
>
>  # gcc bug with Os/O2/O3, PR77311
>  # error: unable to find a register to spill in class 'CCREGS'
> @@ -109,7 +102,7 @@ HOST_BINUTILS_CONF_OPTS = \
>  # binutils run configure script of subdirs at make time, so ensure
>  # our TARGET_CONFIGURE_ARGS are taken into consideration for those
>  define BINUTILS_BUILD_CMDS
> -    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) -C $(@D)
> +    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE)
> $(BINUTILS_MAKE_OPTS) -C $(@D)
>  endef
>
>  # We just want libbfd, libiberty and libopcodes,
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 1c778e9..935e33b 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -37,13 +37,6 @@ endif
>  # also need ncurses.
>  HOST_GDB_DEPENDENCIES = host-expat host-ncurses
>
> -# Starting with gdb 7.10, gdb wants to re-generate its documentation.
> -# We were trying to avoid that by patching the Makefiles, but it wasn't
> -# working in all situations. So, we simply add a dependency on
> -# host-texinfo in all case.
> -GDB_DEPENDENCIES += host-texinfo
> -HOST_GDB_DEPENDENCIES += host-texinfo
> -
>  # Apply the Xtensa specific patches
>  XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
>  ifneq ($(XTENSA_CORE_NAME),)
> @@ -159,6 +152,12 @@ ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
>  GDB_POST_INSTALL_TARGET_HOOKS += GDB_SDK_INSTALL_GDBSERVER
>  endif
>
> +# Disable building documentation
> +GDB_MAKE_OPTS += MAKEINFO=true
> +GDB_INSTALL_OPTS += MAKEINFO=true
> +HOST_GDB_MAKE_OPTS += MAKEINFO=true
> +HOST_GDB_INSTALL_OPTS += MAKEINFO=true
> +
>  # A few notes:
>  #  * --target, because we're doing a cross build rather than a real
>  #    host build.
>
>
>
> Now, I find it kind of ugly to have all these '<PKG>_SOMETHING_OPTS +=
> MAKEINFO=true'.
> What would you say if we add this type of logic for all packages in
> package/pkg-generic.mk ? i.e. add 'MAKEINFO=true' to MAKE_OPTS,
> CONF_ENV, INSTALL_OPTS.
>
> Another question: we could replace 'true' by ':' which is a
> bash-interpreted command that also does nothing. I think Arnout once
> made such a comment (in another context). What do you think?
>
> Thanks,
> Thomas
