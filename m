From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 6 Jun 2020 13:20:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/edid-decode: use
 TARGET_CONFIGURE_OPTS
In-Reply-To: <20200606091928.1351706-1-fontaine.fabrice@gmail.com>
References: <20200606091928.1351706-1-fontaine.fabrice@gmail.com>
Message-ID: <20200606132043.1e796306@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat,  6 Jun 2020 11:19:27 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Do not use CXX to save the "$(TARGET_CXX) $(TARGET_CXXFLAGS)
> $(TARGET_LDFLAGS)" tuple and instead use TARGET_CONFIGURE_OPTS to pass
> variables using the "standard" variables
>
> LDFLAGS is supported since
> https://git.linuxtv.org/edid-decode.git/commit/?id=0a454bcbba5e172c64236811ed98c161689372f1
>
> CFLAGS is supported since
> https://git.linuxtv.org/edid-decode.git/commit/?id=b202b675e38578b33494fc45c2869917e66ba22d
>
> edid-decode did not switch CFLAGS to CXXFLAGS in
> https://git.linuxtv.org/edid-decode.git/commit/Makefile?id=e00579c128ced87a69df29a01caaaf0cd4a4c8cc
> so use CFLAGS to pass TARGET_CXXFLAGS
>
> Fixes:
>  - http://autobuild.buildroot.org/results/71e4a50542c4551797f1d0404d27244612b427d7
>

Just from code-review (did not yet test your patch), this patch does not change
the resulting used compile/link flags and is only in preparation of the next
patch? And as a standalone one does not fix the build failure?

Regards,
Peter


> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/edid-decode/edid-decode.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
> index 8fe1e2712a..c41a9f2a76 100644
> --- a/package/edid-decode/edid-decode.mk
> +++ b/package/edid-decode/edid-decode.mk
> @@ -10,12 +10,13 @@ EDID_DECODE_LICENSE = MIT
>  EDID_DECODE_LICENSE_FILES = LICENSE
>
>  define EDID_DECODE_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		CXX="$(TARGET_CXX) $(TARGET_CXXFLAGS) $(TARGET_LDFLAGS)"
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		CFLAGS="$(TARGET_CXXFLAGS)"
>  endef
>
>  define EDID_DECODE_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		DESTDIR="$(TARGET_DIR)" install
>  endef
>
>  $(eval $(generic-package))
