From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2020 18:22:04 +0100
Subject: [Buildroot] [PATCH v4,
 2/3] package/gobject-introspection: export cc in g-ir-scanner
In-Reply-To: <20200312194632.3787015-2-aduskett@gmail.com>
References: <20200312194632.3787015-1-aduskett@gmail.com>
 <20200312194632.3787015-2-aduskett@gmail.com>
Message-ID: <20200314172204.GP705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-12 12:46 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Without this export, the host variant of g-ir-scanner will call the host
> gcc for linking.
> 
> For autotools packages, this is not an issue as they use
> Makefile.introspection, which will export the cross-cc, however for meson,
> this is not the case, and linking errors occur when meson packages generate
> .gir and .typelib files.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v3:
>   - Use relative paths. (Yann)
> 
>  package/gobject-introspection/g-ir-scanner.in          | 2 ++
>  package/gobject-introspection/gobject-introspection.mk | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
> index 9f97497b7e..d5847ad063 100644
> --- a/package/gobject-introspection/g-ir-scanner.in
> +++ b/package/gobject-introspection/g-ir-scanner.in
> @@ -1,6 +1,8 @@
>  #!/usr/bin/env bash
>  
>  export GI_SCANNER_DISABLE_CACHE=1
> +export CC="$(dirname "${0}")/../../../../bin/@BASENAME_TARGET_CC@"
> +

HHhmmm. I remember that I said I wanted the wrapper to still be
rrrelocatable. But it is in staging (sysroot) while the compiler is in
host dir, so you added that many .././/.. needed to got from there to
there.

But look at the line below: we already have HOST_DIR:

>  ${HOST_DIR}/bin/g-ir-scanner \
   ^^^^^^^^^^^

So, just:

    export CC="${HOSTTT_DIR}/bin/@BASENAME_TARGET_CC@"

Or did we miss something?

Regards,
Yann E. MORIN.

>  --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
>  --use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index 9043390857..a508957904 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -104,6 +104,8 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>  		$(INSTALL) -D -m 755 \
>  			$(GOBJECT_INTROSPECTION_PKGDIR)/$(w).in $(STAGING_DIR)/usr/bin/$(w)
>  	)
> +	$(SED) "s%@BASENAME_TARGET_CC@%$(notdir $(TARGET_CC))%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
> +
>  	# Gobject-introspection installs Makefile.introspection in
>  	# $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
>  	# build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
> -- 
> 2.24.1
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
