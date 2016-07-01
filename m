From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 1 Jul 2016 16:25:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] efivar: force shared libgcc for Nios
 II
In-Reply-To: <20160628192520.3831-1-nunes.erico@gmail.com>
References: <20160628192520.3831-1-nunes.erico@gmail.com>
Message-ID: <61e696d7-7988-a8c8-2fc7-3558c8a6e2c4@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico,

Le 28/06/2016 ? 21:25, Erico Nunes a ?crit :
> efivar for Nios II also has to be linked with shared libgcc to avoid an
> error due to FDE encoding in static libgcc when linking libefiboot.so.

It seems the very same issue than for grantlee package which build with
--fatal-warnings. This flag is added by gcc.specs file on non static build. See [1]

Usually we recommend to remove Werror or --fatal-warnings flags if it produce
warnings with some toolchains.

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=20173

Best regards,
Romain

> 
> Fixes:
> http://autobuild.buildroot.net/results/0c9/0c90e3e7ad41d21dd832f6f266af35fc19185170/
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - simplified ifeq muliple arch logic (suggested by Thomas Petazzoni)
> ---
>  package/efivar/efivar.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
> index de48bc9..d3ca79b 100644
> --- a/package/efivar/efivar.mk
> +++ b/package/efivar/efivar.mk
> @@ -21,9 +21,9 @@ EFIVAR_MAKE_OPTS = \
>  	BINTARGETS=efivar \
>  	LDFLAGS="$(TARGET_LDFLAGS) -fPIC"
>  
> -# Explicitly linking with shared libgcc is required on MicroBlaze,
> +# Explicitly linking with shared libgcc is required on MicroBlaze and Nios II,
>  # otherwise it fails due to FDE encoding in static libgcc.
> -ifeq ($(BR2_microblaze),y)
> +ifeq ($(BR2_microblaze)$(BR2_nios2),y)
>  EFIVAR_MAKE_OPTS += SOFLAGS="-shared -shared-libgcc"
>  endif
>  
> 
