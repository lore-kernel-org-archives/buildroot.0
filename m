From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 23 Jan 2011 14:30:22 +0100
Subject: [Buildroot] [PATCH v2 4/4] cdrkit: convert to CMAKETARGETS
	infrastructure
In-Reply-To: <1295124808-5649-5-git-send-email-bjorn.forsman@gmail.com>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
	<1295124808-5649-5-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <AANLkTi=XYYi_M7W1_NAdnV+WW9iFftEZ5+uYL3CCtoym@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


2011/1/15 Bj?rn Forsman <bjorn.forsman@gmail.com>

> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  package/cdrkit/cdrkit.mk |   65
> ++++++---------------------------------------
>  1 files changed, 9 insertions(+), 56 deletions(-)
>
> diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
> index a0ce9cb..0e97cc1 100644
> --- a/package/cdrkit/cdrkit.mk
> +++ b/package/cdrkit/cdrkit.mk
> @@ -11,61 +11,14 @@ else
>  CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=0
>  endif
>
> -# CMake doesn't support having the --sysroot option directly in the
> -# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
> -CDRKIT_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
> -CDRKIT_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
> -CDRKIT_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
> -CDRKIT_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX))
> $(TARGET_CXXFLAGS)
> +CDRKIT_CONF_OPT += $(CMAKE_ENDIAN_OPT)
>
> -define CDRKIT_CONFIGURE_CMDS
> - -mkdir $(@D)/build
> - (cd $(@D)/build ; \
> -       $(HOST_DIR)/usr/bin/cmake .. \
> -               -Wno-dev \
> -               -DCMAKE_SYSTEM_NAME:STRING="Linux" \
> -               -DCMAKE_C_COMPILER:FILEPATH="$(CDRKIT_TARGET_CC)" \
> -               -DCMAKE_CXX_COMPILER:FILEPATH="$(CDRKIT_TARGET_CXX)" \
> -               -DCMAKE_C_FLAGS:STRING="$(CDRKIT_TARGET_CFLAGS)" \
> -               -DCMAKE_CXX_FLAGS:STRING="$(CDRKIT_TARGET_CXXFLAGS)" \
> -               -DCMAKE_EXE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
> -               -DCMAKE_MODULE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
> -               -DCMAKE_SHARED_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
> -               -DCMAKE_FIND_ROOT_PATH:PATH="$(STAGING_DIR)" \
> -               -DCMAKE_INSTALL_PREFIX:PATH="$(TARGET_DIR)/usr" \
> -               $(CMAKE_ENDIAN_OPT) \
> - )
> -endef
> -
> -define CDRKIT_BUILD_CMDS
> - $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build
> -endef
> -
> -define CDRKIT_INSTALL_TARGET_CMDS
> - $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build install
> -endef
> -
> -define HOST_CDRKIT_CONFIGURE_CMDS
> - -mkdir $(@D)/build
> - (cd $(@D)/build ; \
> -       $(HOST_DIR)/usr/bin/cmake .. \
> -               -Wno-dev \
> -               -DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
> -               -DCMAKE_EXE_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
> -               -DCMAKE_MODULE_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
> -               -DCMAKE_SHARED_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
> -               -DCMAKE_INSTALL_PREFIX:STRING="$(HOST_DIR)/usr" \
> - )
> -endef
> -
> -define HOST_CDRKIT_BUILD_CMDS
> - $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build
> -endef
> -
> -define HOST_CDRKIT_INSTALL_CMDS
> - $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build  install
> -endef
> -
> -$(eval $(call GENTARGETS,package,cdrkit))
> -$(eval $(call GENTARGETS,package,cdrkit,host))
> +## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
> +## some extra flags so it finds needed libs and headers.
> +CDRKIT_CONF_OPT += -DCMAKE_REQUIRED_INCLUDES="$(STAGING_DIR)/usr/include"
> +CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
> +HOST_CDRKIT_CONF_OPT +=
> -DCMAKE_REQUIRED_INCLUDES="$(HOST_DIR)/usr/include"
> +HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
>
any specific reasons to remove defined variables' type?


>
> +$(eval $(call CMAKETARGETS,package,cdrkit))
> +$(eval $(call CMAKETARGETS,package,cdrkit,host))
> --
> 1.7.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


sounds good.

Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110123/d6a1ce49/attachment.html>
