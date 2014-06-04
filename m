From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jun 2014 21:59:24 +0200
Subject: [Buildroot] [PATCH V4 2/2] google-breakpad: integration into
 makefile and Config.in
In-Reply-To: <1401881573-12921-3-git-send-email-pascal.huerst@gmail.com>
References: <1401881573-12921-1-git-send-email-pascal.huerst@gmail.com>
 <1401881573-12921-3-git-send-email-pascal.huerst@gmail.com>
Message-ID: <20140604195924.GG3325@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2014-06-04 13:32 +0200, Pascal Huerst spake thusly:
> This adds the symbol generation for google-breakpad to
> the Makefile and adds a list were users can insert libraries
> and binaries that should be symbol-dumped.
> 
> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
> ---
>  Config.in         | 10 ++++++++++
>  Makefile          |  7 +++++++
>  package/Config.in |  1 +
>  3 files changed, 18 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 0799cb7..0849146 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -457,6 +457,16 @@ config BR2_OPTIMIZE_S
>  
>  endchoice
>  
> +config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
> +	string "executables and libraries to be used by google-breakpad"
> +	depends on BR2_PACKAGE_GOOGLE_BREAKPAD
> +	default ""
> +	help
> +	  You may specify a space-seperated list of binaries and libraries

"separated"

> +	  here of which debug symbols should be dumped for google breakpad.
> +	  Debug symbols will be stored as google_breakpad_symbols in: 
> +	  staging/usr/shared/google-breakpad-symbols

Replace 'staging' with '$(STAGING_DIR)'

Also, state that the files should be full paths relative to $(TARGET_DIR)

>  config BR2_ENABLE_SSP
>  	bool "build code with Stack Smashing Protection"
>  	depends on BR2_TOOLCHAIN_HAS_SSP
> diff --git a/Makefile b/Makefile
> index 0b4264a..2650a93 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -553,6 +553,13 @@ endif
>  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
>  	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
>  endif
> +ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
> +	package/google-breakpad/google-breakpad-gen-syms.sh \

As said in my review on your previous patch, you should use EXTRA_ENV
here:

    $(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
        $(TARGET_DIR) $(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))

We do not quote BR2_GOOGLE_BREAKPAD_INCLUDE_FILES since we want to pass
each entry as its own arg on the command line.

Also, maybe name the script just 'gen-syms.sh', it's shorter, so you can
fit more on a line. ;-)

> +		$(STAGING_DIR) \
> +		$(HOST_DIR) \
> +		"$(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))" 
> +endif
> +
>  	rm -rf $(TARGET_DIR)/usr/lib/luarocks
>  	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
>  	if test -d $(TARGET_DIR)/lib/modules; then \
> diff --git a/package/Config.in b/package/Config.in
> index ea94f01..47cb483 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -786,6 +786,7 @@ source "package/fftw/Config.in"
>  source "package/flann/Config.in"
>  source "package/glibmm/Config.in"
>  source "package/gmp/Config.in"
> +source "package/google-breakpad/Config.in"

This should be part of your previous patch. And it should be in
the "Debugging, profiling and benchmark" sub-menu, instead of
"Libraries/Others".

Regards,
Yann E. MORIN.

>  source "package/gsl/Config.in"
>  source "package/gtest/Config.in"
>  source "package/libargtable2/Config.in"
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
