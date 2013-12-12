From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Dec 2013 23:37:23 +0100
Subject: [Buildroot] [PATCH v2] erlang: add option to enable SMP support
In-Reply-To: <1386860987-2721-1-git-send-email-fhunleth@troodon-software.com>
References: <1386860987-2721-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <52AA3AA3.5030200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/13 16:09, Frank Hunleth wrote:
> Erlang builds two emulators depending on whether SMP is supported or
> not. If it is known that the target does not support SMP, turning off
> the SMP emulator saves compile time and reduces the size of the
> installation.
>
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

  Hi Frank,

  A few minor comments.


> ---
> Changes v1 -> v2:
>    - added sign-off
>
>   package/erlang/Config.in | 10 ++++++++++
>   package/erlang/erlang.mk |  4 ++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 27206f3..9edb90b 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -10,6 +10,16 @@ config BR2_PACKAGE_ERLANG
>
>   	  http://www.erlang.org
>
> +config BR2_PACKAGE_ERLANG_SMP
> +	bool "enable SMP support"
> +	depends on BR2_PACKAGE_ERLANG

  Instead of a separate 'depends on' in every sub-option, we prefer one 
'if ... endif' around all the suboptions.

> +	help
> +	  Erlang provides both a UP and an SMP emulator. The UP emulator
> +	  is always built, and this option enables compilation of the SMP
> +	  emulator. The choice of which emulator to use is made at runtime.
> +	  If you do not need SMP support, turning this option off reduces
> +	  compile time and the size of the Erlang installation.
> +
>   config BR2_PACKAGE_ERLANG_MEGACO
>   	bool "install megaco application"
>   	depends on BR2_PACKAGE_ERLANG
> diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
> index 32d18e4..67010a2 100644
> --- a/package/erlang/erlang.mk
> +++ b/package/erlang/erlang.mk
> @@ -43,6 +43,10 @@ ERLANG_CONF_OPT += --enable-shared-zlib
>   ERLANG_DEPENDENCIES += zlib
>   endif
>
> +ifneq ($(BR2_PACKAGE_ERLANG_SMP),y)

  We prefer positive logic, i.e.

ifeq ($(BR2_PACKAGE_ERLANG_SMP),)


  Regards,
  Arnout

> +ERLANG_CONF_OPT += --disable-smp-support
> +endif
> +
>   # Remove source, example, gs and wx files from the target
>   ERLANG_REMOVE_PACKAGES = gs wx
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
