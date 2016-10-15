From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 11:20:47 +0200
Subject: [Buildroot] [PATCH 2/2] core/legal-info: don't generate big
 file with all license texts
In-Reply-To: <52e41b4a3aab9e9d50ace8aee2501becc5080bb8.1476519329.git.yann.morin.1998@free.fr>
References: <cover.1476519329.git.yann.morin.1998@free.fr>
 <52e41b4a3aab9e9d50ace8aee2501becc5080bb8.1476519329.git.yann.morin.1998@free.fr>
Message-ID: <bab3863f-e1dc-e519-7007-7e39607fc362@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 10:15, Yann E. MORIN wrote:
> By aggregating all the license files into a single big text-only file
> means we have no way to use license files that are binary blobs (e.g.
> pdf, rtf...).
> 
> Just do not generate that big file; if the user still wants it, it is
> very easy to create it afterwards.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  Makefile               |  2 --
>  package/pkg-generic.mk |  1 -
>  package/pkg-utils.mk   | 12 ------------
>  3 files changed, 15 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5e4daef..74b831e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -195,8 +195,6 @@ LICENSE_FILES_DIR_TARGET = $(LEGAL_INFO_DIR)/licenses
>  LICENSE_FILES_DIR_HOST = $(LEGAL_INFO_DIR)/host-licenses
>  LEGAL_MANIFEST_CSV_TARGET = $(LEGAL_INFO_DIR)/manifest.csv
>  LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
> -LEGAL_LICENSES_TXT_TARGET = $(LEGAL_INFO_DIR)/licenses.txt
> -LEGAL_LICENSES_TXT_HOST = $(LEGAL_INFO_DIR)/host-licenses.txt
>  LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
>  LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
>  
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 92cc565..12ae86f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -807,7 +807,6 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  # is that the license still applies to the files distributed as part
>  # of the rootfs, even if the sources are not themselves redistributed.
>  ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
> -	@$$(call legal-license-nofiles,$$($(2)_RAW_BASE_NAME),$$(call UPPERCASE,$(4)))
>  	@$$(call legal-warning-pkg,$$($(2)_RAW_BASE_NAME),cannot save license ($(2)_LICENSE_FILES not defined))
>  else
>  	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAW_BASE_NAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 28db481..c5d4080 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -75,19 +75,7 @@ define legal-manifest # pkg, version, license, license-files, source, url, {HOST
>  	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
>  endef
>  
> -define legal-license-header # pkg, license-file, {HOST|TARGET}
> -	printf "$(LEGAL_INFO_SEPARATOR)\n\t$(1):\
> -		$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n\n" >>$(LEGAL_LICENSES_TXT_$(3))
> -endef
> -
> -define legal-license-nofiles # pkg, {HOST|TARGET}
> -	$(call legal-license-header,$(1),unknown license file(s),$(2))
> -endef
> -
>  define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
> -	$(call legal-license-header,$(1),$(2) file,$(4)) && \
> -	cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
> -	echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
>  	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
>  	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
>  endef
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
