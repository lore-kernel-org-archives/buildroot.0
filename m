From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2020 21:35:15 +0100
Subject: [Buildroot] [PATCH v3] package/trace-cmd: bump to version 2.9.1
In-Reply-To: <20201103155335.212037-1-nolange79@gmail.com>
References: <20201103155335.212037-1-nolange79@gmail.com>
Message-ID: <1a359277-1c75-f5eb-2998-5c79d837c7ea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Norbert,

On 03/11/2020 16:53, Norbert Lange wrote:
> Drop upstreamed patch.
> 
> Remove now unneeded option -fcommon.
> 
> Rearrange the CFLAGS, dont know if the
> _LARGEFILE64_SOURCE filter is still needed.
> 
> use install_cmd target for installation,
> which also installs bash-completion files.
> 
> Directory structure changed, in the future the all target
> might build kernelshark. so specify the *cmd targets.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1->v2
> *   specify prefix to /usr
> v2->v3
> *   also specify etcdir, used for bash_completion
> ---
>  ...0001-trace-listen-add-missing-header.patch | 38 -------------------
>  package/trace-cmd/trace-cmd.hash              |  6 +--
>  package/trace-cmd/trace-cmd.mk                | 26 ++++++-------
>  3 files changed, 16 insertions(+), 54 deletions(-)
>  delete mode 100644 package/trace-cmd/0001-trace-listen-add-missing-header.patch
> 

[snip]
> diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
> index c6447f34d4..d1e7f2dbb2 100644
> --- a/package/trace-cmd/trace-cmd.hash
> +++ b/package/trace-cmd/trace-cmd.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0  trace-cmd-trace-cmd-v2.7.tar.gz
> -sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> -sha256 70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
> +sha256  9404fc3cf540ea795304608068c9db6cdb38b90584c7f3c43249785913d54b38  trace-cmd-v2.9.1.tar.gz

 Would be nice to mention in the commit message that the spaces change.

> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING

 The hash of COPYING has changed. That's because the license files are now in
LICENSES/. Can you update things accordingly?

> +sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB

 This one hasn't changed, but probably it's better to refer to the new location
as well.

> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index dfca6a170d..5ad1f65c4a 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -TRACE_CMD_VERSION = trace-cmd-v2.7
> -TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
> -TRACE_CMD_SITE_METHOD = git
> +TRACE_CMD_VERSION = 2.9.1
> +TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
> +TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git/snapshot

 Would be nice to mention this in the commit message as well.

>  TRACE_CMD_INSTALL_STAGING = YES
>  TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
>  TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
> @@ -17,12 +17,14 @@ ifeq ($(BR2_PACKAGE_AUDIT),y)
>  TRACE_CMD_DEPENDENCIES += audit
>  endif
>  
> +TRACE_CMD_MAKE_OPTS = prefix=/usr etcdir=/etc
> +
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  TRACE_CMD_DEPENDENCIES += python host-swig
> -TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python
> +TRACE_CMD_MAKE_OPTS += PYTHON_VERS=python
>  else ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  TRACE_CMD_DEPENDENCIES += python3 host-swig
> -TRACE_CMD_MAKE_OPTS = PYTHON_VERS=python3
> +TRACE_CMD_MAKE_OPTS += PYTHON_VERS=python3
>  else
>  TRACE_CMD_MAKE_OPTS += NO_PYTHON=1
>  endif
> @@ -37,17 +39,15 @@ TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
>  TRACE_CMD_CPPFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CPPFLAGS))
>  
>  define TRACE_CMD_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="$(TRACE_CMD_CFLAGS)" \
> -		CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \
> -		$(TRACE_CMD_MAKE_OPTS) \
> -		-C $(@D) all
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TRACE_CMD_CFLAGS)" \
> +	CPPFLAGS="$(TRACE_CMD_CPPFLAGS)" \

 Can you explain in the commit message why these are passed in the environment
now instead of on the command line?

 Regards,
 Arnout

> +		$(MAKE) $(TRACE_CMD_MAKE_OPTS) \
> +			-C $(@D) trace-cmd
>  endef
>  
>  define TRACE_CMD_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D -m 0755 $(@D)/trace-cmd $(TARGET_DIR)/usr/bin/trace-cmd
> -	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/trace-cmd/plugins
> -	$(INSTALL) -D -m 0755 $(@D)/plugin_*.so $(TARGET_DIR)/usr/lib/trace-cmd/plugins
> +	DESTDIR=$(TARGET_DIR) $(MAKE) $(TRACE_CMD_MAKE_OPTS) -C $(@D) install_cmd
>  endef
>  
>  $(eval $(generic-package))
> 
