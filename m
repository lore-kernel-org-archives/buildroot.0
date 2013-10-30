From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2013 18:25:35 +0100
Subject: [Buildroot] [Bug 6632] CMake use host pkg-config
In-Reply-To: <20131030102915.8FD369BC3D@busybox.osuosl.org>
References: <bug-6632-163@https.bugs.busybox.net/>
 <20131030102915.8FD369BC3D@busybox.osuosl.org>
Message-ID: <5271410F.2070402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Thomas,

On 30/10/13 11:29, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=6632
>
> --- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 10:29:15 UTC ---
> What about something like:
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 0e08722..70014b5 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -62,7 +62,7 @@ ifeq ($(5),target)
>   define $(2)_CONFIGURE_CMDS
>          (cd $$($$(PKG)_BUILDDIR) && \
>          rm -f CMakeCache.txt && \
> -       $$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +       $(TARGET_MAKE_ENV) $$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake
> $$($$(PKG)_SRCDIR) \

  Maybe we should generalize this, and export the elements of 
TARGET_MAKE_ENV for all target goals:

ifeq ($(5),target)
$$($(2)_TARGET_INSTALL_TARGET):         export PATH=$(TARGET_PATH)
$$($(2)_TARGET_INSTALL_STAGING):        export PATH=$(TARGET_PATH)
$$($(2)_TARGET_INSTALL_IMAGES):         export PATH=$(TARGET_PATH)
$$($(2)_TARGET_INSTALL_HOST):           export PATH=$(TARGET_PATH)
$$($(2)_TARGET_BUILD):                  export PATH=$(TARGET_PATH)
$$($(2)_TARGET_CONFIGURE):              export PATH=$(TARGET_PATH)
$$($(2)_TARGET_RSYNC):                  export PATH=$(TARGET_PATH)
$$($(2)_TARGET_RSYNC_SOURCE):           export PATH=$(TARGET_PATH)
$$($(2)_TARGET_PATCH):                  export PATH=$(TARGET_PATH)
$$($(2)_TARGET_EXTRACT):                export PATH=$(TARGET_PATH)
$$($(2)_TARGET_SOURCE):                 export PATH=$(TARGET_PATH)
$$($(2)_TARGET_UNINSTALL):              export PATH=$(TARGET_PATH)
$$($(2)_TARGET_CLEAN):                  export PATH=$(TARGET_PATH)
$$($(2)_TARGET_DIRCLEAN):               export PATH=$(TARGET_PATH)
endif

  And so on for all the other variables. Unfortunately you need a 
separate line for each variable, you can't do something like 'export 
$(TARGET_MAKE_ENV)' on the right-hand side.

  Anyway, it's just an idea, cause it's quite a big change that will 
probably break some things.

  Regards,
  Arnout


>
> -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>                  -DCMAKE_INSTALL_PREFIX="/usr" \
>                  $$($$(PKG)_CONF_OPT) \
> @@ -74,7 +74,7 @@ else
>   define $(2)_CONFIGURE_CMDS
>          (cd $$($$(PKG)_BUILDDIR) && \
>          rm -f CMakeCache.txt && \
> -       $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +       $(HOST_MAKE_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>                  -DCMAKE_INSTALL_SO_NO_EXE=0 \
>                  -DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>                  -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
