From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 21:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/ripgrep: fix debug build
In-Reply-To: <20200822182237.1834735-1-fontaine.fabrice@gmail.com>
References: <20200822182237.1834735-1-fontaine.fabrice@gmail.com>
Message-ID: <20200823193928.GJ8728@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

Question for a cargo expert! See below!

On 2020-08-22 20:22 +0200, Fabrice Fontaine spake thusly:
> There is no --debug mode for cargo resulting in the following build
> failure since the addition of this package with commit
> 4b0d1ef6ac00c5170a3fb9d15d06b3d3172e0c97:
> 
> error: Unknown flag: '--debug'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/58e74bb056ec65680ecebaa559aa14bdebbf5c85
>  - http://autobuild.buildroot.org/results/28c6364a89a6044d5a036614f7a6e59815efb770
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ripgrep/ripgrep.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> index 832c076f26..ac9038945c 100644
> --- a/package/ripgrep/ripgrep.mk
> +++ b/package/ripgrep/ripgrep.mk
> @@ -11,12 +11,11 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
>  
>  RIPGREP_DEPENDENCIES = host-rustc
>  RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
> -RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
>  
>  RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_MODE)
>  
>  RIPGREP_CARGO_OPTS = \
> -	--$(RIPGREP_CARGO_MODE) \
> +	--release \

Wouldn't we need to pass --release only when in non-debug builds, i.e:

    $(if $(BR2_ENABLE_DEBUG),,--release)

Regards,
Yann E. MORIN.

>  	--target=$(RUSTC_TARGET_NAME) \
>  	--manifest-path=$(@D)/Cargo.toml
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
