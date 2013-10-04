From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 4 Oct 2013 16:08:34 +0200
Subject: [Buildroot] [PATCH 3 of 5] legal-info: split license texts for
	host and target
In-Reply-To: <e6a358594ba5b49cdf7e.1380892352@argentina>
References: <patchbomb.1380892349@argentina>
 <e6a358594ba5b49cdf7e.1380892352@argentina>
Message-ID: <CAAXf6LV-Ora02Fxb=pqMn5TNpeBe9k1mJQfJYFUDzc1GqNPM+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 4, 2013 at 3:12 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  Makefile               |   8 +++++---
>  package/pkg-generic.mk |   2 +-
>  package/pkg-utils.mk   |  16 ++++++++--------
>  3 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -109,10 +109,12 @@ HOST_DIR:=$(BASE_DIR)/host
>
>  LEGAL_INFO_DIR=$(BASE_DIR)/legal-info
>  REDIST_SOURCES_DIR=$(LEGAL_INFO_DIR)/sources
> -LICENSE_FILES_DIR=$(LEGAL_INFO_DIR)/licenses
> +LICENSE_FILES_DIR_TARGET=$(LEGAL_INFO_DIR)/licenses
> +LICENSE_FILES_DIR_HOST=$(LEGAL_INFO_DIR)/host-licenses
>  LEGAL_MANIFEST_CSV_TARGET=$(LEGAL_INFO_DIR)/manifest.csv
>  LEGAL_MANIFEST_CSV_HOST=$(LEGAL_INFO_DIR)/host-manifest.csv
> -LEGAL_LICENSES_TXT=$(LEGAL_INFO_DIR)/licenses.txt
> +LEGAL_LICENSES_TXT_TARGET=$(LEGAL_INFO_DIR)/licenses.txt
> +LEGAL_LICENSES_TXT_HOST=$(LEGAL_INFO_DIR)/host-licenses.txt
>  LEGAL_WARNINGS=$(LEGAL_INFO_DIR)/.warnings
>  LEGAL_REPORT=$(LEGAL_INFO_DIR)/README
>
> @@ -588,7 +590,7 @@ legal-info-clean:
>
>  legal-info-prepare: $(LEGAL_INFO_DIR)
>         @$(call MESSAGE,"Collecting legal info")
> -       @$(call legal-license-file,buildroot,COPYING,COPYING)
> +       @$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
>         @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,TARGET)
>         @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,HOST)
>         @$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved,HOST)
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -508,7 +508,7 @@ else
>  # Other packages
>  # Save license files if defined
>  ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
> -       @$(call legal-license-nofiles,$$($(2)_RAWNAME))
> +       @$(call legal-license-nofiles,$$($(2)_RAWNAME),$(call UPPERCASE,$(5)))
>         @$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
>  else
>         @$(foreach F,$$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F),$(call UPPERCASE,$(5)))$$(sep))

This $(call UPPERCASE,$(5)) extra parameter accidentally ended up in
the first patch of this series.
I will fix that, when I investigated the problem with that patch
(double dollar sign). (or if someone else knows what the problem is,
please let me know).

Best regards,
Thomas
