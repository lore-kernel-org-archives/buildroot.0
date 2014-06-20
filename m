From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jun 2014 01:14:26 +0200
Subject: [Buildroot] [PATCH 2 of 3 v2] qt5: support buildroot being
 located in /usr
In-Reply-To: <6e90b5d192055fdb9550.1403291465@localhost>
References: <patchbomb.1403291463@localhost>
 <6e90b5d192055fdb9550.1403291465@localhost>
Message-ID: <53A4C052.1050105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/14 21:11, Thomas De Schampheleire wrote:
> qt5 performs sed replacements of /usr to $(STAGING_DIR)/usr in .la files.
> However, if buildroot itself is located in /usr, then STAGING_DIR also
> starts with /usr, and naive replacements of '/usr' can result in paths of
> the form:
>     /usr/buildroot/.../sysroot/usr/buildroot/.../sysroot/...
> 
> This patch makes the replacements more careful, by first replacing the known
> paths BASE_DIR and STAGING_DIR to tokens, then performing the actual
> replacement, and finally replacing the tokens with the corresponding paths.
> 
> Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v2: no changes
> 
>  package/qt5/qt5.mk |  7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff -r 2969a1777632 -r 6e90b5d19205 package/qt5/qt5.mk
> --- a/package/qt5/qt5.mk	Fri Jun 20 21:09:35 2014 +0200
> +++ b/package/qt5/qt5.mk	Thu Jun 19 21:16:12 2014 +0200
> @@ -5,7 +5,12 @@
>  
>  define QT5_LA_PRL_FILES_FIXUP
>  	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
> -		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$i; \
> +		$(SED)  "s:$(BASE_DIR):@BASE_DIR@:g" \
> +			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
> +			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
> +			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
> +			-e "s:@BASE_DIR@:$(BASE_DIR):g" \
> +			$$i ; \

 Now that I see the two patches next to each other: why is this hook needed?
It's already done by the generic staging-install target, no? ThomasP carries the
blame for this, so putting him in Cc...


 Regards,
 Arnout


>  		$(SED) "/^dependency_libs=/s%-L/usr/lib %%g" $$i ; \
>  	done
>  	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.prl"); do \
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
