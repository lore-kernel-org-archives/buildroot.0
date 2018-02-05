From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 5 Feb 2018 16:34:51 +0100
Subject: [Buildroot] [PATCH v2 03/13] download: put most of the infra in
 dl-wrapper
In-Reply-To: <20171025201003.16105-4-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
 <20171025201003.16105-4-ps.report@gmx.net>
Message-ID: <0cd40090-7ca9-8e11-fc3f-92e300d40473@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 25/10/2017 22:09, Peter Seiderer wrote:
> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> The goal here is to simplify the infrastructure by putting most of the
> code in the dl-wrapper as it's easier to implement and to read.
> 
> Most of the function where common already, this patch finalizes it by
              ^ functions were

> making the pkg-download.mk pass all the parameters needed to the
> dl-wrapper which in turns will pass everything to every backend.
> 
> The backend will then cherry-pick what it needs from these arguments
> and act accordingly.
> 
> It eases the transition to the addition of a sub directory per package
> in the DL_DIR, and later on, a git cache.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

[...]

> -################################################################################
> -# DOWNLOAD -- Download helper. Will try to download source from:
> -# 1) BR2_PRIMARY_SITE if enabled
> -# 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
> -# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
> -#
> -# Argument 1 is the source location
> -#
> -# E.G. use like this:
> -# $(call DOWNLOAD,$(FOO_SITE))
> -#
> -# For PRIMARY and BACKUP site, any ? in the URL is replaced by %3F. A ? in
> -# the URL is used to separate query arguments, but the PRIMARY and BACKUP
> -# sites serve just plain files.
> -################################################################################
> -
> -define DOWNLOAD
> -	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),DOWNLOAD)
> -endef
> -
> -define DOWNLOAD_INNER
> -	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(2);) \
> -	if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
> -		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
> -			file) $(call $(3)_LOCALFILES,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
> -			scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
> -			*) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(subst ?,%3F,$(2)),$(2)) && exit ;; \

[...]

> diff --git a/support/download/cp b/support/download/file
> similarity index 90%
> rename from support/download/cp
> rename to support/download/file
> index 52fe2de83d..a3e616a181 100755

[...]

> -_wget ${verbose} "${@}" -O "'${output}'" "'${url}'"
> +# Replace every '?' with '%3F' in the filename; only for the PRIMARY and BACKUP
> +# mirror
> +[ -n "${encode}" ] && filename=${filename//\?/%3F}
> +
> +_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"

I suggest to retain the original comment above, which is clearer.

For the rest:

[Tested with wget, git, hg, svn, bzr]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
-- 
Luca
