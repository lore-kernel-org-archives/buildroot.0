From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jun 2014 23:26:02 +0200
Subject: [Buildroot] [PATCH 1 of 3 v3] infra: support buildroot being
 located in /usr
In-Reply-To: <f9dbe1c9d761945aaf97.1403362907@localhost>
References: <patchbomb.1403362906@localhost>
 <f9dbe1c9d761945aaf97.1403362907@localhost>
Message-ID: <53AB3E6A.3010005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/06/14 17:01, Thomas De Schampheleire wrote:
> pkg-generic and pkg-autotools both perform sed replacements of /usr to
> $(STAGING_DIR)/usr, in .pc and .la files respectively. However, if buildroot
> itself is located in /usr, then STAGING_DIR also starts with /usr, and naive
> replacements of '/usr' can result in paths of the form:
>     /usr/buildroot/.../sysroot/usr/buildroot/.../sysroot/...
> 
> This patch makes the replacements more careful, by first replacing the known
> paths BASE_DIR and STAGING_DIR to tokens, then performing the actual
> replacement, and finally replacing the tokens with the corresponding paths.
> 
> Additionally it removes the unnecessary making of a backup copy in
> pkg-autotools.
> 
> Partially fixes bug #5750 (https://bugs.busybox.net/show_bug.cgi?id=5750)
> 
> Partially-based-on-a-patch-from: Ben Stoltz <benstoltz@gmail.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Still...

> 
> ---
> v3: remove redundant replacement s/$(STAGING_DIR)/@STAGING_DIR@/ (Arnout)
> v2: s/Jeremy Kerr/Ben Stoltz/
> 
>  package/pkg-autotools.mk |  7 +++++--
>  package/pkg-generic.mk   |  9 ++++++---
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff -r a59338f65a46 -r f9dbe1c9d761 package/pkg-autotools.mk
> --- a/package/pkg-autotools.mk	Wed Jun 18 20:22:00 2014 +0400
> +++ b/package/pkg-autotools.mk	Sat Jun 21 11:08:31 2014 +0200
> @@ -268,8 +268,11 @@
>  define $(2)_INSTALL_STAGING_CMDS
>  	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
>  	for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
> -		cp -f $$$$i $$$$i~; \
> -		$$(SED) "s:\(['= ]\)/usr:\\1$$(STAGING_DIR)/usr:g" $$$$i; \
> +		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
> +			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
> +			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \

 There is in fact no reason to do this in two steps, except that it looks a bit
more symmetric. Is there? Anyway, I'm OK with how it is now, it looks pretty.

 BTW, now that you've reduced the body of the loop to a single statement, you
can actually avoid the $$$$ hell by using xargs instead of for.


> +			-e "s:@BASE_DIR@:$$(BASE_DIR):g" \
> +			$$$$i; \

 Perhaps there should be an explanatory comment of what happens here (before the
define):

# Most autotools packages install libtool .la files alongside any installed
# libraries. These .la files sometimes refer to paths relative to the sysroot,
# which libtool will interpret as absolute paths to host libraries instead of
# the target libraries. Since we configure with --prefix=/usr, such absolute
# paths start with /usr. So we add $(STAGING_DIR) in front of any path that
# starts with /usr.
# To protect against the case that the output directory itself is under /usr,
# we first substitute away any occurences of the output directory to @BASE_DIR at .


>  	done
>  endef
>  endif
> diff -r a59338f65a46 -r f9dbe1c9d761 package/pkg-generic.mk
> --- a/package/pkg-generic.mk	Wed Jun 18 20:22:00 2014 +0400
> +++ b/package/pkg-generic.mk	Sat Jun 21 11:08:31 2014 +0200
> @@ -201,9 +201,12 @@
>  	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
>  	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
>  		$(call MESSAGE,"Fixing package configuration files") ;\
> -			$(SED)  "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
> -				-e "s,-I/usr/,-I$(STAGING_DIR)/usr/,g" \
> -				-e "s,-L/usr/,-L$(STAGING_DIR)/usr/,g" \
> +			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
> +				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
> +				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
> +				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
> +				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
> +				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
>  				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\

 This one is sufficiently self-explanatory, so no additional comment is needed IMHO.

 The @STAGING_DIR@ is still redundant, though :-)

 Regards,
 Arnout


>  	fi
>  	$(Q)touch $@
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
