From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Dec 2013 16:45:19 +0200
Subject: [Buildroot] [PATCH] erlang: add option to enable SMP support
In-Reply-To: <1386856902-23162-1-git-send-email-fhunleth@troodon-software.com>
References: <1386856902-23162-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20131212144519.GM1217@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

On Thu, Dec 12, 2013 at 09:01:42AM -0500, Frank Hunleth wrote:
> Erlang builds two emulators depending on whether SMP is supported or
> not. If it is known that the target does not support SMP, turning off
> the SMP emulator saves compile time and reduces the size of the
> installation.

Missing sign-off.

Is there an option on only build (or at least install) the SMP version?

baruch

> ---
>  package/erlang/Config.in | 10 ++++++++++
>  package/erlang/erlang.mk |  4 ++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 27206f3..9edb90b 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -10,6 +10,16 @@ config BR2_PACKAGE_ERLANG
>  
>  	  http://www.erlang.org
>  
> +config BR2_PACKAGE_ERLANG_SMP
> +	bool "enable SMP support"
> +	depends on BR2_PACKAGE_ERLANG
> +	help
> +	  Erlang provides both a UP and an SMP emulator. The UP emulator
> +	  is always built, and this option enables compilation of the SMP
> +	  emulator. The choice of which emulator to use is made at runtime.
> +	  If you do not need SMP support, turning this option off reduces
> +	  compile time and the size of the Erlang installation.
> +
>  config BR2_PACKAGE_ERLANG_MEGACO
>  	bool "install megaco application"
>  	depends on BR2_PACKAGE_ERLANG
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index 32d18e4..67010a2 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -43,6 +43,10 @@ ERLANG_CONF_OPT += --enable-shared-zlib
>  ERLANG_DEPENDENCIES += zlib
>  endif
>  
> +ifneq ($(BR2_PACKAGE_ERLANG_SMP),y)
> +ERLANG_CONF_OPT += --disable-smp-support
> +endif
> +
>  # Remove source, example, gs and wx files from the target
>  ERLANG_REMOVE_PACKAGES = gs wx

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
