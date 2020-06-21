From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 10:45:40 +0200
Subject: [Buildroot] [RFC v9 01/10] cpe-info: new make target
In-Reply-To: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200621084540.GZ2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-06-16 12:03 -0500, Matt Weber spake thusly:
> Similar to make legal-info, produce a csv delimited file containing
> all selected packages CPE identification.
> 
> By default, support the pkg infra defining a set of CPE_ID_* defaults
> using the package name for the vendor and name as most CPE IDs seem
> to align with that assumption. Plus initially, use the pkg version as
> the CPE ID's version field.

So, as I understand it, the CPE info for host packages will also be
stored in the generated file, but it will be a partial list.

For example, if a host package has a Config.in option (e.g. aespipe,
with BR2_PACKAGE_HOST_AESPIPE=y), then it will be listed in PACKAGES,
and so will be present in the CPE manifest.

But on the other hand, a host package that has no Config.in option but
is oart of the dependency chain of a package (e.g. host-pkgconf) will
not be listed in PACKAGES, and thus will not appear in the manifest.

This is a bit awkward I think.

As far as I understand it, the CPE info is (mostly|only) usefull to
then query the CVE list applicable to that CPE.

As such, this is (mostly|only) relevant to the target packages, I would
think, no? Thus, host pakcages should be filtered out.

If we are however interested by the CPE info for host packages, probably
that should go to a separate manifest, like for the legal-info, no?

Also, see an issue, below...

> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
[--SNIP--]
> @@ -864,6 +865,19 @@ legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all
>  		mv .legal-info.sha256 legal-info.sha256)
>  	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
>  
> +.PHONY: cpe-info-clean
> +cpe-info-clean:
> +	@rm -f $(CPE_MANIFEST_CSV)

This must also be removed on 'make clean'.

> +.PHONY: cpe-info-prepare
> +cpe-info-prepare:
> +	@$(call MESSAGE,"Gathering CPE info")
> +	@$(call cpe-manifest,CPE ID,CVE PATCHED,PACKAGE,VERSION,SOURCE SITE)
> +
> +.PHONY: cpe-info
> +cpe-info: cpe-info-clean cpe-info-prepare $(foreach p,$(PACKAGES),$(p)-cpe-info)

I think this depednecy is incorrect. Indeed, you reallt want that
cpe-info-clean be run before cpe-info-prepare, so I think you'll need
these dependencies:

    cpe-info-prepare: cpe-info-clean
    cpe-info: cpe-info-prepare
    cpe-info: $(foreach p,$(filter-out host-%,$(PACKAGES)),$(p)-cpe-info)

(Yes, I see you modeled your dependencies on the legal-info ones, but I
think they are broken.)

[--SNIP--]
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index d88a14ab0f..9818eda12d 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -223,3 +223,11 @@ legal-deps = \
>          $(filter-out $(if $(1:host-%=),host-%),\
>              $(call non-virtual-deps,\
>                  $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
> +
> +#
> +# cpe-info helper functions
> +#
> +
> +define cpe-manifest # cpe, pkg name, version, url
> +	echo '"$(1)","$(2)","$(3)","$(4)"' >>$(CPE_MANIFEST_CSV)
> +endef

If (and *if*) we need the CPE info for host packages, then we could
change this helper to redirect to the appropriate manifest, a bit like
is done for legal-info.

But I'm not sure we want it (at least not now).

Regards,
Yann E. MORIN.

> -- 
> 2.17.1
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
