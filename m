From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Apr 2015 23:53:35 +0200
Subject: [Buildroot] [PATCH] package/ccache: add universal wrapper script
In-Reply-To: <CABbD_XBp_Soe_PP7ew0VE7u2RMGuXHtZP_a6GtqASEz7=3QcQg@mail.gmail.com>
References: <1430309142-36242-1-git-send-email-kaszak@gmail.com>
 <CANxTyt6qTC5cWRU1hz4eqJqV6YsUbaVKxA8FuYwkuWq2+-TbTw@mail.gmail.com>
 <CABbD_XBp_Soe_PP7ew0VE7u2RMGuXHtZP_a6GtqASEz7=3QcQg@mail.gmail.com>
Message-ID: <5542A45F.50309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/30/15 20:17, K?roly Kasza wrote:
> Hi Danomi,
> 
>     > +       grep
>     "BR2_ARCH\|BR2_TOOLCHAIN\|BR2_GCC\|BR2_BINUTILS\|BR2_UCLIBC\|BR2_GLIBC\|BR2_EGLIBC"
>     $(BR2_CONFIG) | \
>     > +       grep -v "#" | md5sum > $(HOST_DIR)/ccache_toolchain.config.hash
> 
>     Does the list used for grep need these as well, as they influence the
>     ext-toolchain-wrapper.c?
> 
>     * BR2_TARGET_OPTIMIZATION
>     * BR2_SOFT_FLOAT
> 
> 
> This patch don't really calculates with ext-toolchain-wrapper.c, but it's a good
> question if these config options should be factored in, I am not sure. If these
> are passed at compilation time to the target compiler (by the wrapper binary),
> then theoretically ccache gets them and calculates them in, as ccache is not
> influenced by the wrapper (mtime turned off) - so we don't need them in the hash
> file.

 The wrapper adds these values, and ccache calls the wrapper. So if these values
change, ccache won't notice it (at least if the wrapper is used).

 The list of affected options is actually a lot longer I'm afraid. I think this
is the full list of options affecting the compiler. Some of these are Config.in
options, some of these are options calculated in the makefiles, but all of them
are available to make.

Options that affect the build of the compiler (internal toolchain):
BR2_GCC_TARGET_ARCH
BR2_GCC_TARGET_ABI
BR2_GCC_TARGET_CPU
BR2_GCC_TARGET_CPU_REVISION
BR2_GCC_TARGET_FPU
BR2_GCC_TARGET_FLOAT_ABI
BR2_GCC_TARGET_MODE
BR2_EXTRA_GCC_CONFIG_OPTIONS
BR2_SOFT_FLOAT
BR2_PTHREADS_*
BR2_TOOLCHAIN_BUILDROOT_LIBC
BR2_TOOLCHAIN_BUILDROOT_WCHAR
BR2_GCC_ENABLE_TLS
BR2_GCC_ENABLE_LTO
BR2_GCC_ENABLE_GRAPHITE
BR2_GCC_ENABLE_OPENMP (probably not needed, only affects headers/libraries)
BR2_GCC_ENABLE_LIBMUDFLAP (probably not needed, only affects headers/libraries)
GCC_VERSION
The contents of package/gcc/$(GCC_VERSION)/*
The contents of $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
			$(BR2_XTENSA_CORE_NAME)).tar
The contents of package/gcc/gcc.mk (although that may be too conservative)
The contents of package/gcc/gcc-final.mk (although that may be too conservative)

 Note that the libc options are not relevant, since they will affect only
libraries and header files. ccache doesn't deal with libraries, and ccache will
still fingerprint header files.

 A simpler way of getting the correct fingerprint would be to look at
HOST_GCC_FINAL_CONF_OPTS, after removing all occurences of $(HOST_DIR) and
$(TARGET_DIR) from it. It's slightly too conservative since some unimportant
options (e.g. BR2_INSTALL_LIBSTDCPP) still appear in there, but on the other
hand it's more future safe since any option that affects the compiler will
appear in it.


Options that affect external toolchains:
The BR2_GCC_TARGET_* options mentioned above
BR2_TARGET_OPTIMIZATION
BR2_SOFT_FLOAT
The contents of $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
The contents of $(BR2_TOOLCHAIN_EXTERNAL_PATH) (if preinstalled)

 As it happens, all of the flags that affect the toolchain wrapper are already
in TOOLCHAIN_EXTERNAL_CFLAGS.


 So I think the easiest solution is to calculate the ccache hash in two places:

- In HOST_GCC_FINAL_POST_PATCH_HOOKS, calculate a hash of the contents of $(@D)
and $(subst $(HOST_DIR),@,$(HOST_GCC_FINAL_CONF_OPTS))

- In TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER, calculate a hash of
$(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) or of $(BR2_TOOLCHAIN_EXTERNAL_PATH) and
$(TOOLCHAIN_EXTERNAL_CFLAGS)


 Obviously, this needs a bit of experimentation to see if it really works.

 Regards,
 Arnout


> If the target compiler binary changes based on their values, then they should be
> calculated in - I think this doesn't happen, as the external binaries won't be
> changed.
> Opinions?
> 
> (It's not a be a big deal to add them also into the grep line, but if we
> restrict the hash too much, then it won't match the cache hits even when it
> should. If we don't restrict it enough, it may generate false cache hits and
> through that corrupted binaries.)
> 
> BR
> Karoly
> 
> 
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
