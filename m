From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:16:18 +0100
Subject: [Buildroot] [PATCH] libselinux: set PREFIX to generate proper
 .pc file
In-Reply-To: <20180106145249.3090-1-marcus.folkesson@gmail.com>
References: <20180106145249.3090-1-marcus.folkesson@gmail.com>
Message-ID: <20180107151618.62c734e2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for continuing the work on this topic!

On Sat,  6 Jan 2018 15:52:49 +0100, Marcus Folkesson wrote:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libselinux/libselinux.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index 8ac8000de5..bf33da7f75 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -43,17 +43,19 @@ LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
>  # dependencies are broken and result in file truncation errors at link
>  # time if the Python bindings are built through the same make
>  # invocation as the rest of the library.
> +# DESTDIR is needed during the compile to compute library and header paths.
>  define LIBSELINUX_BUILD_PYTHON_BINDINGS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) swigify pywrap
>  endef
>  endif # python || python3
>  
> +# DESTDIR is needed during the compile to compute library and header paths.
>  define LIBSELINUX_BUILD_CMDS
>  	# DESTDIR is needed during the compile to compute library and
>  	# header paths.
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
> +		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) PREFIX=/usr all
>  	$(LIBSELINUX_BUILD_PYTHON_BINDINGS)
>  endef

How can this work without passing PREFIX=/usr also at install time ?
(Same question for libsemanage and libsepol).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
