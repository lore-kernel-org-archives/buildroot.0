From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 28 Nov 2016 20:37:50 +0100
Subject: [Buildroot] [PATCH for-next 2/3] package/google-breakpad:
 switch to the new git repository
In-Reply-To: <1480263400-29605-2-git-send-email-romain.naour@gmail.com>
References: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
 <1480263400-29605-2-git-send-email-romain.naour@gmail.com>
Message-ID: <ce01d461-48b0-9c04-59df-321670525c55@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 27/11/2016 ? 17:16, Romain Naour a ?crit :
> Google-breakpad moved to a new git repository last year and the old svn
> repository has been deleted. So, the Buildroot archive mirror is used.
> 
> svn: E160013: Unable to connect to a repository at URL 'http://google-breakpad.googlecode.com/svn/trunk'
> svn: E160013: '/svn/trunk' path not found
> --2016-11-27 10:42:34--  http://sources.buildroot.net/google-breakpad-1373.tar.gz
> 
> Swith to the git repository using the git hash corresponding to the
> 1373 svn revision. But there is an issue with the third parties...
> Some of them are not bundled with Google-breakpad or as git submodule.
> Even worst, the google-breakpad source code use #include
> "third_party/lss" directly, so we can't provide missing third parties
> with an external package.
> 
> That's why the linux-syscall-support package was added to Buildroot,
> it provide the missing linux_syscall_support.h file which is must be
> copied to src/third_party/lss/ in the Google-breakpad sources.

Since we want a specific version of linux_syscall_support.h which is required by
Google-breakpad, linux_syscall_support.h may be added by a patch instead of
using an external package (linux-syscall-support) ?
The problem of using a patch is that we have to update it for each
Google-breakpad version bump.

Any suggestion is welcome.

Best regards,
Romain

> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Pascal Huerst <pascal.huerst@gmail.com>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/google-breakpad/Config.in            |  3 ++-
>  package/google-breakpad/google-breakpad.hash |  2 ++
>  package/google-breakpad/google-breakpad.mk   | 25 +++++++++++++++++++++----
>  3 files changed, 25 insertions(+), 5 deletions(-)
>  create mode 100644 package/google-breakpad/google-breakpad.hash
> 
> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
> index c800974..5c3f2e8 100644
> --- a/package/google-breakpad/Config.in
> +++ b/package/google-breakpad/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on (BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC)
>  	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
> +	select BR2_PACKAGE_LINUX_SYSCALL_SUPPORT
>  	help
>  	  Google-Breakpad is a library and tool suite that allows you
>  	  to distribute an application to users with compiler-provided
> @@ -29,7 +30,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
>  	  needed to extract the debugging symbols from target
>  	  binaries.
>  
> -	  http://code.google.com/p/google-breakpad/
> +	  https://chromium.googlesource.com/breakpad/breakpad
>  
>  comment "google-breakpad requires a glibc or uClibc toolchain w/ wchar, thread, C++ enabled"
>  	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
> diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
> new file mode 100644
> index 0000000..b66f43d
> --- /dev/null
> +++ b/package/google-breakpad/google-breakpad.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 25466aac60b83b231ce03d1540b1f8528c02ddaa76b08aed779084b145f07516 google-breakpad-7883a8308274cc37847e4ff3b995a327588fe034.tar.gz
> diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
> index 7a88c76..0805c25 100644
> --- a/package/google-breakpad/google-breakpad.mk
> +++ b/package/google-breakpad/google-breakpad.mk
> @@ -4,16 +4,33 @@
>  #
>  ################################################################################
>  
> -GOOGLE_BREAKPAD_VERSION = 1373
> -GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
> -GOOGLE_BREAKPAD_SITE_METHOD = svn
> +GOOGLE_BREAKPAD_VERSION = 7883a8308274cc37847e4ff3b995a327588fe034
> +GOOGLE_BREAKPAD_SITE = https://chromium.googlesource.com/breakpad/breakpad
> +GOOGLE_BREAKPAD_SITE_METHOD = git
>  GOOGLE_BREAKPAD_CONF_OPTS = --disable-processor --disable-tools
>  # Only a static library is installed
>  GOOGLE_BREAKPAD_INSTALL_TARGET = NO
>  GOOGLE_BREAKPAD_INSTALL_STAGING = YES
>  GOOGLE_BREAKPAD_LICENSE = BSD-3c
>  GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
> -GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
> +GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support
> +
> +HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support 
> +
> +# Avoid using depot-tools to download this file.
> +define HOST_GOOGLE_BREAKPAD_LSS
> +	$(INSTALL) -D -m 0644 \
> +		$(HOST_DIR)/usr/include/linux_syscall_support.h \
> +		$(@D)/src/third_party/lss/linux_syscall_support.h
> +endef
> +HOST_GOOGLE_BREAKPAD_POST_EXTRACT_HOOKS += HOST_GOOGLE_BREAKPAD_LSS
> +
> +define GOOGLE_BREAKPAD_LSS
> +	$(INSTALL) -D -m 0644 \
> +		$(STAGING_DIR)/usr/include/linux_syscall_support.h \
> +		$(@D)/src/third_party/lss/linux_syscall_support.h
> +endef
> +GOOGLE_BREAKPAD_POST_EXTRACT_HOOKS += GOOGLE_BREAKPAD_LSS
>  
>  define GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
>  	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
> 
